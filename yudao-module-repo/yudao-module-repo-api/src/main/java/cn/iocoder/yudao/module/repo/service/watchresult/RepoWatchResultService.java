package cn.iocoder.yudao.module.repo.service.watchresult;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.*;
import java.time.LocalDateTime;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

import jakarta.validation.*;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.*;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;

/**
 * 仓库监控结果 Service 接口
 *
 * @author yunchao
 */
public interface RepoWatchResultService extends IService<RepoWatchResultDO> {

    /**
     * 创建仓库监控结果
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createWatchResult(@Valid RepoWatchResultSaveReqVO createReqVO);

    /**
     * 更新仓库监控结果
     *
     * @param updateReqVO 更新信息
     */
    void updateWatchResult(@Valid RepoWatchResultSaveReqVO updateReqVO);

    /**
     * 更新仓库监控结果状态
     *
     * @param updateReqVO 更新状态
     */
    void updateWatchResultStatus(RepoWatchResultDO updateReqVO);

    /**
     * 删除仓库监控结果
     *
     * @param ids 编号
     */
    void deleteWatchResult(List<Long> ids);

    /**
     * 获得仓库监控结果
     *
     * @param id 编号
     * @return 仓库监控结果
     */
    RepoWatchResultDO getWatchResult(Long id);

    /**
     * 获得仓库监控结果列表
     *
     * @param reqVO 查询条件
     * @return 仓库监控结果列表
     */
    List<RepoWatchResultDO> getWatchResultList(RepoWatchResultPageReqVO reqVO);

    /**
     * 获得仓库监控结果分页
     *
     * @param pageReqVO 分页查询
     * @return 仓库监控结果分页
     */
    PageResult<RepoWatchResultDO> getWatchResultPage(RepoWatchResultPageReqVO pageReqVO);
    PageResult<RepoWatchResultDO> getWatchResultPage(RepoWatchResultPageReqVO pageReqVO, Boolean withBindRel);

    /**
    * 用于 Excel导入仓库监控结果
    *
    * @param file MultipartFile
    * @return 导入结果
    */
    @Transactional(readOnly=false)
    String importData(MultipartFile file, Boolean isUpdateSupport);
}
