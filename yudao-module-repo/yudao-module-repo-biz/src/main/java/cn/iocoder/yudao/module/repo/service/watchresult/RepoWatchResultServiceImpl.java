package cn.iocoder.yudao.module.repo.service.watchresult;

import cn.hutool.core.collection.CollUtil;
import cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.excel.core.excel.ExcelImport;
import cn.iocoder.yudao.framework.mybatis.core.util.MyBatisUtils;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultBaseVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultRespVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultSaveReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.dal.mysql.watchresult.RepoWatchResultMapper;
import cn.iocoder.yudao.module.repo.service.RepoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tangzc.mpe.bind.Binder;
import com.yun.products.core2020.utils.QueryHelperMybatisPlus;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static cn.iocoder.yudao.module.repo.enums.ErrorCodeConstants.WATCH_RESULT_IMPORT_FAIL;
import static cn.iocoder.yudao.module.repo.enums.ErrorCodeConstants.WATCH_RESULT_NOT_EXISTS;

/**
 * 仓库监控结果 Service 实现类
 *
 * @author yunchao
 */
@Service
@Validated
@Slf4j
public class RepoWatchResultServiceImpl extends ServiceImpl<RepoWatchResultMapper, RepoWatchResultDO> implements RepoWatchResultService {

    @Resource
    private RepoWatchResultMapper repoWatchResultMapper;

    @Resource(name = "repoGithubServiceImpl")
    private RepoService repoGithubService;

    @Override
    public Long createWatchResult(RepoWatchResultSaveReqVO createReqVO) {
        // 插入
        RepoWatchResultDO watchResult = BeanUtils.toBean(createReqVO, RepoWatchResultDO.class);
        repoWatchResultMapper.insert(watchResult);
        // 返回
        return watchResult.getId();
    }

    @Override
    public void updateWatchResult(RepoWatchResultSaveReqVO updateReqVO) {
        // 校验存在
        this.validateWatchResultExists(updateReqVO.getId());
        // 更新
        RepoWatchResultDO updateObj = BeanUtils.toBean(updateReqVO, RepoWatchResultDO.class);
        repoWatchResultMapper.updateById(updateObj);
    }

    @Override
    public void updateWatchResultStatus(RepoWatchResultDO updateReqVO) {
        // 校验存在
        this.validateWatchResultExists(updateReqVO.getId());
        // 更新
        repoWatchResultMapper.updateById(updateReqVO);
    }

    @Override
    public void deleteWatchResult(List<Long> ids) {
        if (CollUtil.isNotEmpty(ids)) {
            // 删除
            for (Long id : ids) {
                RepoWatchResultDO watchResult = getWatchResult(id);
                if (null != watchResult) {
                    RepoWatchTaskDO task = watchResult.getTask();
                    if (null != task) {
                        Integer repoType = task.getRepoType();
                        if (repoType == 0) {
                            repoGithubService.removeGitClone(watchResult, task);
                        } else {
                            // TODO 其他类型
                            log.error("deleteWatchResult 暂不支持该类型 {}", repoType);
                        }
                    }
                }
                repoWatchResultMapper.deleteBatchIds(ids);
            }
        }
    }

    private void validateWatchResultExists(Long id) {
        if (repoWatchResultMapper.selectById(id) == null) {
            throw ServiceExceptionUtil.exception(WATCH_RESULT_NOT_EXISTS);
        }
    }

    @Override
    public RepoWatchResultDO getWatchResult(Long id) {
        RepoWatchResultDO res = repoWatchResultMapper.selectById(id);
        Binder.bind(res);
        return res;
    }

    @Override
    public List<RepoWatchResultDO> getWatchResultList(RepoWatchResultPageReqVO reqVO) {
        QueryWrapper<RepoWatchResultDO> query = (QueryWrapper<RepoWatchResultDO>) QueryHelperMybatisPlus.buildQuery(reqVO, RepoWatchResultDO.class);
        List<RepoWatchResultDO> res = repoWatchResultMapper.selectList(query);
        Binder.bind(res);
        return res;
    }

    @Override
    public PageResult<RepoWatchResultDO> getWatchResultPage(RepoWatchResultPageReqVO pageReqVO) {
        return getWatchResultPage(pageReqVO, true);
    }

    @Override
    public PageResult<RepoWatchResultDO> getWatchResultPage(RepoWatchResultPageReqVO pageReqVO, Boolean withBindRel) {
        IPage<RepoWatchResultDO> page = MyBatisUtils.buildPage(pageReqVO);
        QueryWrapper<RepoWatchResultDO> query = (QueryWrapper<RepoWatchResultDO>) QueryHelperMybatisPlus.buildQuery(pageReqVO, RepoWatchResultDO.class);
        query.orderByDesc(RepoWatchResultBaseVO.Fields.updateTime).orderByDesc(RepoWatchResultBaseVO.Fields.createTime);
        IPage<RepoWatchResultDO> mpPage = repoWatchResultMapper.selectPage(page, query);
        // 转换返回
        List<RepoWatchResultDO> res = mpPage.getRecords();
        if (null != withBindRel && withBindRel) {
            Binder.bind(res);
        }
        return new PageResult<>(res, mpPage.getTotal());
    }

    /**
     * 导入数据
     * @param file 导入的数据文件
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     */
    @Transactional(readOnly=false)
    @Override
    public String importData(MultipartFile file, Boolean isUpdateSupport) {
        if (file == null){
            throw ServiceExceptionUtil.exception(WATCH_RESULT_IMPORT_FAIL, "文件为空");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        try {
            ExcelImport ei = new ExcelImport(file, 2, 0);
            List<RepoWatchResultRespVO> list = ei.getDataList(RepoWatchResultRespVO.class);
            if (CollUtil.isNotEmpty(list)) {
                List<RepoWatchResultDO> dos = BeanUtils.toBean(list, RepoWatchResultDO.class);
                String failMsg = "";
                for (RepoWatchResultDO data : dos) {
                    try {
                        // TODO 这里实现具体导入逻辑
                        repoWatchResultMapper.insert(data);
                        successNum++;
                        successMsg.append("<br/>" + successNum + "、导入成功");
                    } catch (Exception e) {
                        failureNum++;
                        String msg = "<br/>" + failureNum + "、导入失败：";
                        msg += e.getMessage();
                        failureMsg.append(msg);
                        log.error(msg, e);
                    }
                }
            } else {
                failureNum++;
                failureMsg.append("数据模板解析失败（请使用导入界面的下载模板填写数据导入）或者模板数据为空");
            }
        } catch (Exception e) {
            failureNum += 1;
            failureMsg.append(e.getMessage());
            log.error(e.getMessage(), e);
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw ServiceExceptionUtil.exception(WATCH_RESULT_IMPORT_FAIL, failureMsg);
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

}
