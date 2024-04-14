package cn.iocoder.yudao.module.crm.dal.mysql.business;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.MPJLambdaWrapperX;
import cn.iocoder.yudao.module.crm.controller.admin.business.vo.business.CrmBusinessPageReqVO;
import cn.iocoder.yudao.module.crm.dal.dataobject.business.CrmBusinessDO;
import cn.iocoder.yudao.module.crm.enums.common.CrmBizTypeEnum;
import cn.iocoder.yudao.module.crm.util.CrmPermissionUtils;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

/**
 * 商机 Mapper
 *
 * @author ljlleo
 */
@Mapper
public interface CrmBusinessMapper extends BaseMapperX<CrmBusinessDO> {

    default int updateOwnerUserIdById(Long id, Long ownerUserId) {
        return update(new LambdaUpdateWrapper<CrmBusinessDO>()
                .eq(CrmBusinessDO::getId, id)
                .set(CrmBusinessDO::getOwnerUserId, ownerUserId));
    }

    default PageResult<CrmBusinessDO> selectPageByCustomerId(CrmBusinessPageReqVO pageReqVO) {
        return selectPage(pageReqVO, new LambdaQueryWrapperX<CrmBusinessDO>()
                .eq(CrmBusinessDO::getCustomerId, pageReqVO.getCustomerId()) // 指定客户编号
                .likeIfPresent(CrmBusinessDO::getName, pageReqVO.getName())
                .orderByDesc(CrmBusinessDO::getId));
    }

    default PageResult<CrmBusinessDO> selectPageByContactId(CrmBusinessPageReqVO pageReqVO, Collection<Long> businessIds) {
        return selectPage(pageReqVO, new LambdaQueryWrapperX<CrmBusinessDO>()
                .in(CrmBusinessDO::getId, businessIds) // 指定商机编号
                .likeIfPresent(CrmBusinessDO::getName, pageReqVO.getName())
                .orderByDesc(CrmBusinessDO::getId));
    }

    default PageResult<CrmBusinessDO> selectPage(CrmBusinessPageReqVO pageReqVO, Long userId) {
        MPJLambdaWrapperX<CrmBusinessDO> query = new MPJLambdaWrapperX<>();
        // 拼接数据权限的查询条件
        CrmPermissionUtils.appendPermissionCondition(query, CrmBizTypeEnum.CRM_BUSINESS.getType(),
                CrmBusinessDO::getId, userId, pageReqVO.getSceneType(), Boolean.FALSE);
        // 拼接自身的查询条件
        query.selectAll(CrmBusinessDO.class)
                .likeIfPresent(CrmBusinessDO::getName, pageReqVO.getName())
                .orderByDesc(CrmBusinessDO::getId);
        return selectJoinPage(pageReqVO, CrmBusinessDO.class, query);
    }

    default Long selectCountByStatusTypeId(Long statusTypeId) {
        return selectCount(CrmBusinessDO::getStatusTypeId, statusTypeId);
    }

    default List<CrmBusinessDO> selectListByCustomerIdOwnerUserId(Long customerId, Long ownerUserId) {
        return selectList(new LambdaQueryWrapperX<CrmBusinessDO>()
                .eq(CrmBusinessDO::getCustomerId, customerId)
                .eq(CrmBusinessDO::getOwnerUserId, ownerUserId));
    }

    default Long selectCountByOwnerUserIdsAndEndStatus(Collection<Long> ownerUserIds, LocalDateTime[] times, Integer endStatus) {
        return selectCount(new LambdaQueryWrapperX<CrmBusinessDO>()
                .in(CrmBusinessDO::getOwnerUserId, ownerUserIds)
                .eqIfPresent(CrmBusinessDO::getEndStatus, endStatus)
                .betweenIfPresent(CrmBusinessDO::getCreateTime, times));
    }

    // TODO @puhui999：这个可以优化下，通过统计 sql，不通过内存计算；
    default List<CrmBusinessDO> selectListByOwnerUserIdsAndEndStatusNotNull(Collection<Long> ownerUserIds, LocalDateTime[] times) {
        return selectList(new LambdaQueryWrapperX<CrmBusinessDO>()
                .in(CrmBusinessDO::getOwnerUserId, ownerUserIds)
                .betweenIfPresent(CrmBusinessDO::getCreateTime, times)
                .isNotNull(CrmBusinessDO::getEndStatus));
    }

    // TODO @puhui999：这个可以优化下，通过统计 sql，不通过内存计算；
    default List<CrmBusinessDO> selectListByOwnerUserIdsAndDate(Collection<Long> ownerUserIds, LocalDateTime[] times) {
        return selectList(new LambdaQueryWrapperX<CrmBusinessDO>()
                .in(CrmBusinessDO::getOwnerUserId, ownerUserIds)
                .betweenIfPresent(CrmBusinessDO::getCreateTime, times));
    }

    default PageResult<CrmBusinessDO> selectPage(Collection<Long> ownerUserIds, LocalDateTime[] times, Integer pageNo, Integer pageSize) {
        return selectPage(new PageParam().setPageNo(pageNo).setPageSize(pageSize), new LambdaQueryWrapperX<CrmBusinessDO>()
                .in(CrmBusinessDO::getOwnerUserId, ownerUserIds)
                .betweenIfPresent(CrmBusinessDO::getCreateTime, times));
    }

}
