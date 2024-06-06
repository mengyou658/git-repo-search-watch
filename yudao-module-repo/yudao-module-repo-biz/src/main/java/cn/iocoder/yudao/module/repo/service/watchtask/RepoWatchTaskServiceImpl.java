package cn.iocoder.yudao.module.repo.service.watchtask;

import cn.hutool.core.collection.CollUtil;
import cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.excel.core.excel.ExcelImport;
import cn.iocoder.yudao.framework.mybatis.core.util.MyBatisUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskBaseVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskRespVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskSaveReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.dal.mysql.watchtask.RepoWatchTaskMapper;
import cn.iocoder.yudao.module.repo.service.watchresult.RepoWatchResultService;
import cn.iocoder.yudao.module.system.api.dict.DictDataApi;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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
import java.util.stream.Stream;

import static cn.iocoder.yudao.module.repo.enums.ErrorCodeConstants.WATCH_TASK_IMPORT_FAIL;
import static cn.iocoder.yudao.module.repo.enums.ErrorCodeConstants.WATCH_TASK_LIMIT;
import static cn.iocoder.yudao.module.repo.enums.ErrorCodeConstants.WATCH_TASK_NOT_EXISTS;

/**
 * 仓库监控任务 Service 实现类
 *
 * @author yunchao
 */
@Service
@Validated
@Slf4j
public class RepoWatchTaskServiceImpl extends ServiceImpl<RepoWatchTaskMapper, RepoWatchTaskDO> implements RepoWatchTaskService {

    @Resource
    private RepoWatchTaskMapper repoWatchTaskMapper;

    @Resource
    private RepoWatchResultService repoWatchResultService;

    @Resource
    private DictDataApi dictDataApi;

    @Override
    public Long createWatchTask(RepoWatchTaskSaveReqVO createReqVO) {
        // 插入
        RepoWatchTaskDO watchTask = BeanUtils.toBean(createReqVO, RepoWatchTaskDO.class);

        // 这里限制非admin用户只能生成1数据
        Long creator = SecurityFrameworkUtils.getLoginUserId();
        if (creator != 1) {
            Long count = repoWatchTaskMapper.selectCount(new LambdaQueryWrapper<RepoWatchTaskDO>()
                    .eq(RepoWatchTaskDO::getCreator, creator)
            );
            if (null != count && count > 1) {
                throw ServiceExceptionUtil.exception(WATCH_TASK_LIMIT);
            }
        }
        repoWatchTaskMapper.insert(watchTask);
        dictDataApi.createDictData("repo_watch_task_keywords", watchTask.getKeywords());
        dictDataApi.createDictData("repo_watch_task_keyword_lang", watchTask.getKeywordLang());
        dictDataApi.createDictData("repo_watch_task_keyword_negative", watchTask.getKeywordNegative());
        // 返回
        return watchTask.getId();
    }

    @Override
    public void updateWatchTask(RepoWatchTaskSaveReqVO updateReqVO) {
        // 校验存在
        this.validateWatchTaskExists(updateReqVO.getId());
        // 更新
        RepoWatchTaskDO updateObj = BeanUtils.toBean(updateReqVO, RepoWatchTaskDO.class);
        repoWatchTaskMapper.updateById(updateObj);
        dictDataApi.createDictData("repo_watch_task_keywords", updateObj.getKeywords());
        dictDataApi.createDictData("repo_watch_task_keyword_lang", updateObj.getKeywordLang());
        dictDataApi.createDictData("repo_watch_task_keyword_negative", updateObj.getKeywordNegative());
    }

    @Override
    public void updateWatchTaskStatus(RepoWatchTaskDO updateReqVO) {
        // 校验存在
        this.validateWatchTaskExists(updateReqVO.getId());
        // 更新
        repoWatchTaskMapper.updateById(updateReqVO);
    }

    @Override
    public void deleteWatchTask(List<Long> ids) {
        if (CollUtil.isNotEmpty(ids)) {
            // 删除
            RepoWatchResultPageReqVO reqVO = new RepoWatchResultPageReqVO();
            reqVO.setTaskIds(ids);
            List<RepoWatchResultDO> watchResultList = repoWatchResultService.getWatchResultList(reqVO);
            List<Long> resultIds = watchResultList.stream().map(RepoWatchResultDO::getId).toList();
            repoWatchResultService.deleteWatchResult(resultIds);
            repoWatchTaskMapper.deleteBatchIds(ids);
        }
    }

    private void validateWatchTaskExists(Long id) {
        if (repoWatchTaskMapper.selectById(id) == null) {
            throw ServiceExceptionUtil.exception(WATCH_TASK_NOT_EXISTS);
        }
    }

    @Override
    public RepoWatchTaskDO getWatchTask(Long id) {
        RepoWatchTaskDO res = repoWatchTaskMapper.selectById(id);
        Binder.bind(res);
        return res;
    }

    @Override
    public List<RepoWatchTaskDO> getWatchTaskList(RepoWatchTaskPageReqVO reqVO) {
        QueryWrapper<RepoWatchTaskDO> query = (QueryWrapper<RepoWatchTaskDO>) QueryHelperMybatisPlus.buildQuery(reqVO, RepoWatchTaskDO.class);
        List<RepoWatchTaskDO> res = repoWatchTaskMapper.selectList(query);
        Binder.bind(res);
        return res;
    }

    @Override
    public PageResult<RepoWatchTaskDO> getWatchTaskPage(RepoWatchTaskPageReqVO pageReqVO) {
        return getWatchTaskPage(pageReqVO, true);
    }

    @Override
    public PageResult<RepoWatchTaskDO> getWatchTaskPage(RepoWatchTaskPageReqVO pageReqVO, Boolean withBindRel) {
        IPage<RepoWatchTaskDO> page = MyBatisUtils.buildPage(pageReqVO);
        QueryWrapper<RepoWatchTaskDO> query = (QueryWrapper<RepoWatchTaskDO>) QueryHelperMybatisPlus.buildQuery(pageReqVO, RepoWatchTaskDO.class);
        query.orderByDesc(RepoWatchTaskBaseVO.Fields.updateTime).orderByDesc(RepoWatchTaskBaseVO.Fields.createTime);
        IPage<RepoWatchTaskDO> mpPage = repoWatchTaskMapper.selectPage(page, query);
        // 转换返回
        List<RepoWatchTaskDO> res = mpPage.getRecords();
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
            throw ServiceExceptionUtil.exception(WATCH_TASK_IMPORT_FAIL, "文件为空");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        try {
            ExcelImport ei = new ExcelImport(file, 2, 0);
            List<RepoWatchTaskRespVO> list = ei.getDataList(RepoWatchTaskRespVO.class);
            if (CollUtil.isNotEmpty(list)) {
                List<RepoWatchTaskDO> dos = BeanUtils.toBean(list, RepoWatchTaskDO.class);
                String failMsg = "";
                for (RepoWatchTaskDO data : dos) {
                    try {
                        // TODO 这里实现具体导入逻辑
                        repoWatchTaskMapper.insert(data);
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
            throw ServiceExceptionUtil.exception(WATCH_TASK_IMPORT_FAIL, failureMsg);
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

}
