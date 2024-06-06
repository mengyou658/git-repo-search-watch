package cn.iocoder.yudao.module.repo.service.watchconfig;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.infra.controller.admin.config.vo.ConfigSaveSimpleReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigSaveReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigSaveSimpleReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig.RepoWatchConfigDO;
import com.baomidou.mybatisplus.extension.service.IService;
import jakarta.validation.Valid;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 参数配置 Service 接口
 *
 * @author yunchao
 */
public interface RepoWatchConfigService extends IService<RepoWatchConfigDO> {

    /**
     * 创建参数配置
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Integer createWatchConfig(@Valid RepoWatchConfigSaveReqVO createReqVO);

    /**
     * 更新参数配置
     *
     * @param updateReqVO 更新信息
     */
    void updateWatchConfig(@Valid RepoWatchConfigSaveReqVO updateReqVO);

    /**
     * 更新参数配置状态
     *
     * @param updateReqVO 更新状态
     */
    void updateWatchConfigStatus(RepoWatchConfigDO updateReqVO);

    /**
     * 删除参数配置
     *
     * @param ids 编号
     */
    void deleteWatchConfig(List<Integer> ids);

    /**
     * 获得参数配置
     *
     * @param id 编号
     * @return 参数配置
     */
    RepoWatchConfigDO getWatchConfig(Integer id);

    /**
     * 获得参数配置列表
     *
     * @param reqVO 查询条件
     * @return 参数配置列表
     */
    List<RepoWatchConfigDO> getWatchConfigList(RepoWatchConfigPageReqVO reqVO);

    /**
     * 获得参数配置分页
     *
     * @param pageReqVO 分页查询
     * @return 参数配置分页
     */
    PageResult<RepoWatchConfigDO> getWatchConfigPage(RepoWatchConfigPageReqVO pageReqVO);

    PageResult<RepoWatchConfigDO> getWatchConfigPage(RepoWatchConfigPageReqVO pageReqVO, Boolean withBindRel);

    /**
     * 用于 Excel导入参数配置
     *
     * @param file MultipartFile
     * @return 导入结果
     */
    @Transactional(readOnly = false)
    String importData(MultipartFile file, Boolean isUpdateSupport);


    RepoWatchConfigDO getConfigByKey(String key, Long loginUserId);

    Long saveConfig(RepoWatchConfigSaveSimpleReqVO createReqVO);
}
