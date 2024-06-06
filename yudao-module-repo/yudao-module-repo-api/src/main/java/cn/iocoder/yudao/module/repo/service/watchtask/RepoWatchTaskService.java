package cn.iocoder.yudao.module.repo.service.watchtask;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskSaveReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import com.baomidou.mybatisplus.extension.service.IService;
import jakarta.validation.Valid;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 仓库监控任务 Service 接口
 *
 * @author yunchao
 */
public interface RepoWatchTaskService extends IService<RepoWatchTaskDO> {

    /**
     * 创建仓库监控任务
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createWatchTask(@Valid RepoWatchTaskSaveReqVO createReqVO);

    /**
     * 更新仓库监控任务
     *
     * @param updateReqVO 更新信息
     */
    void updateWatchTask(@Valid RepoWatchTaskSaveReqVO updateReqVO);

    /**
     * 更新仓库监控任务状态
     *
     * @param updateReqVO 更新状态
     */
    void updateWatchTaskStatus(RepoWatchTaskDO updateReqVO);

    /**
     * 删除仓库监控任务
     *
     * @param ids 编号
     */
    void deleteWatchTask(List<Long> ids);

    /**
     * 获得仓库监控任务
     *
     * @param id 编号
     * @return 仓库监控任务
     */
    RepoWatchTaskDO getWatchTask(Long id);

    /**
     * 获得仓库监控任务列表
     *
     * @param reqVO 查询条件
     * @return 仓库监控任务列表
     */
    List<RepoWatchTaskDO> getWatchTaskList(RepoWatchTaskPageReqVO reqVO);

    /**
     * 获得仓库监控任务分页
     *
     * @param pageReqVO 分页查询
     * @return 仓库监控任务分页
     */
    PageResult<RepoWatchTaskDO> getWatchTaskPage(RepoWatchTaskPageReqVO pageReqVO);
    PageResult<RepoWatchTaskDO> getWatchTaskPage(RepoWatchTaskPageReqVO pageReqVO, Boolean withBindRel);

    /**
    * 用于 Excel导入仓库监控任务
    *
    * @param file MultipartFile
    * @return 导入结果
    */
    @Transactional(readOnly=false)
    String importData(MultipartFile file, Boolean isUpdateSupport);

}
