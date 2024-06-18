package cn.iocoder.yudao.module.repo.service.watchconfig;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.excel.core.excel.ExcelImport;
import cn.iocoder.yudao.framework.mybatis.core.util.MyBatisUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.repo.controller.admin.RepoConfigVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigRespVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigSaveReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigSaveSimpleReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig.RepoWatchConfigDO;
import cn.iocoder.yudao.module.repo.dal.mysql.watchconfig.RepoWatchConfigMapper;
import com.alibaba.fastjson.JSON;
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

import java.util.ArrayList;
import java.util.List;

import static cn.iocoder.yudao.module.repo.enums.ErrorCodeConstants.WATCH_CONFIG_IMPORT_FAIL;
import static cn.iocoder.yudao.module.repo.enums.ErrorCodeConstants.WATCH_CONFIG_NOT_EXISTS;

/**
 * 参数配置 Service 实现类
 *
 * @author yunchao
 */
@Service
@Validated
@Slf4j
public class RepoWatchConfigServiceImpl extends ServiceImpl<RepoWatchConfigMapper, RepoWatchConfigDO> implements RepoWatchConfigService {

    @Resource
    private RepoWatchConfigMapper repoWatchConfigMapper;

    @Override
    public Integer createWatchConfig(RepoWatchConfigSaveReqVO createReqVO) {
        // 插入
        RepoWatchConfigDO watchConfig = BeanUtils.toBean(createReqVO, RepoWatchConfigDO.class);
        repoWatchConfigMapper.insert(watchConfig);
        // 返回
        return watchConfig.getId();
    }

    @Override
    public void updateWatchConfig(RepoWatchConfigSaveReqVO updateReqVO) {
        // 校验存在
        this.validateWatchConfigExists(updateReqVO.getId());
        // 更新
        RepoWatchConfigDO updateObj = BeanUtils.toBean(updateReqVO, RepoWatchConfigDO.class);
        repoWatchConfigMapper.updateById(updateObj);
    }

    @Override
    public void updateWatchConfigStatus(RepoWatchConfigDO updateReqVO) {
        // 校验存在
        this.validateWatchConfigExists(updateReqVO.getId());
        // 更新
        repoWatchConfigMapper.updateById(updateReqVO);
    }

    @Override
    public void deleteWatchConfig(List<Integer> ids) {
        if (CollUtil.isNotEmpty(ids)) {
            // 删除
            repoWatchConfigMapper.deleteBatchIds(ids);
        }
    }

    private void validateWatchConfigExists(Integer id) {
        if (repoWatchConfigMapper.selectById(id) == null) {
            throw ServiceExceptionUtil.exception(WATCH_CONFIG_NOT_EXISTS);
        }
    }

    @Override
    public RepoWatchConfigDO getWatchConfig(Integer id) {
        RepoWatchConfigDO res = repoWatchConfigMapper.selectById(id);
        Binder.bind(res);
        return res;
    }

    @Override
    public List<RepoWatchConfigDO> getWatchConfigList(RepoWatchConfigPageReqVO reqVO) {
        QueryWrapper<RepoWatchConfigDO> query = (QueryWrapper<RepoWatchConfigDO>) QueryHelperMybatisPlus.buildQuery(reqVO, RepoWatchConfigDO.class);
        List<RepoWatchConfigDO> res = repoWatchConfigMapper.selectList(query);
        Binder.bind(res);
        return res;
    }

    @Override
    public PageResult<RepoWatchConfigDO> getWatchConfigPage(RepoWatchConfigPageReqVO pageReqVO) {
        return getWatchConfigPage(pageReqVO, true);
    }

    @Override
    public PageResult<RepoWatchConfigDO> getWatchConfigPage(RepoWatchConfigPageReqVO pageReqVO, Boolean withBindRel) {
        IPage<RepoWatchConfigDO> page = MyBatisUtils.buildPage(pageReqVO);
        QueryWrapper<RepoWatchConfigDO> query = (QueryWrapper<RepoWatchConfigDO>) QueryHelperMybatisPlus.buildQuery(pageReqVO, RepoWatchConfigDO.class);
        IPage<RepoWatchConfigDO> mpPage = repoWatchConfigMapper.selectPage(page, query);
        // 转换返回
        List<RepoWatchConfigDO> res = mpPage.getRecords();
        if (null != withBindRel && withBindRel) {
            Binder.bind(res);
        }
        return new PageResult<>(res, mpPage.getTotal());
    }

    /**
     * 导入数据
     *
     * @param file            导入的数据文件
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     */
    @Transactional(readOnly = false)
    @Override
    public String importData(MultipartFile file, Boolean isUpdateSupport) {
        if (file == null) {
            throw ServiceExceptionUtil.exception(WATCH_CONFIG_IMPORT_FAIL, "文件为空");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        try {
            ExcelImport ei = new ExcelImport(file, 2, 0);
            List<RepoWatchConfigRespVO> list = ei.getDataList(RepoWatchConfigRespVO.class);
            if (CollUtil.isNotEmpty(list)) {
                List<RepoWatchConfigDO> dos = BeanUtils.toBean(list, RepoWatchConfigDO.class);
                String failMsg = "";
                for (RepoWatchConfigDO data : dos) {
                    try {
                        // TODO 这里实现具体导入逻辑
                        repoWatchConfigMapper.insert(data);
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
            throw ServiceExceptionUtil.exception(WATCH_CONFIG_IMPORT_FAIL, failureMsg);
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    @Override
    public RepoWatchConfigDO getConfigByKey(String key, Long loginUserId) {
        return repoWatchConfigMapper.selectByKey(key, loginUserId);
    }


    @Override
    public Long saveConfig(RepoWatchConfigSaveSimpleReqVO createReqVO) {
        if (StrUtil.isNotBlank(createReqVO.getKey())) {
            Long loginUserId = SecurityFrameworkUtils.getLoginUserId();
            RepoWatchConfigDO config = getConfigByKey(createReqVO.getKey(), loginUserId);
            if (null != config) {
                config.setValue(createReqVO.getValue());
                repoWatchConfigMapper.updateById(config);
            } else {
                RepoWatchConfigDO configDO = new RepoWatchConfigDO();
                configDO.setConfigKey(createReqVO.getKey());
                configDO.setValue(createReqVO.getValue());
                repoWatchConfigMapper.insert(configDO);
            }
        }
        return 0L;
    }

    @Override
    public RepoConfigVO getRepoConfig(String creator) {
        RepoConfigVO defaultVal = new RepoConfigVO();
        defaultVal.setChromeExePath("C:\\Users\\Administrator\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe");
        defaultVal.setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36");
        defaultVal.setLocalClonePath("F:\\github-repo-clone");
        defaultVal.setAliyunCloneAk("");
        defaultVal.setAliyunCloneSk("");
        defaultVal.setAliyunCloneOrganizationId("");
        defaultVal.setAliyunCloneNamespaceId(0L);
        ArrayList<RepoConfigVO.RepoConfig> repoConfigs = new ArrayList<>();
        RepoConfigVO.RepoConfig e = new RepoConfigVO.RepoConfig();
        e.setRepoType(0);
        e.setUsername("");
        e.setPassword("");
        repoConfigs.add(e);
        defaultVal.setRepoConfigs(repoConfigs);

        RepoWatchConfigDO configByKey = getConfigByKey("repo.config", Long.parseLong(creator));
        return configByKey != null && configByKey.getValue() != null ? JSON.parseObject(configByKey.getValue(), RepoConfigVO.class) : defaultVal;
    }

}
