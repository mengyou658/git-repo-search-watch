package cn.iocoder.yudao.module.crm.dal.mysql.customer;

import cn.hutool.core.date.LocalDateTimeUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.MPJLambdaWrapperX;
import cn.iocoder.yudao.module.crm.controller.admin.backlog.vo.CrmTodayCustomerPageReqVO;
import cn.iocoder.yudao.module.crm.controller.admin.customer.vo.CrmCustomerPageReqVO;
import cn.iocoder.yudao.module.crm.dal.dataobject.customer.CrmCustomerDO;
import cn.iocoder.yudao.module.crm.dal.dataobject.customer.CrmCustomerPoolConfigDO;
import cn.iocoder.yudao.module.crm.enums.common.CrmBizTypeEnum;
import cn.iocoder.yudao.module.crm.util.CrmQueryWrapperUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.lang.Nullable;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

/**
 * 客户 Mapper
 *
 * @author Wanwan
 */
@Mapper
public interface CrmCustomerMapper extends BaseMapperX<CrmCustomerDO> {

    default Long selectCountByLockStatusAndOwnerUserId(Boolean lockStatus, Long ownerUserId) {
        return selectCount(new LambdaUpdateWrapper<CrmCustomerDO>()
                .eq(CrmCustomerDO::getLockStatus, lockStatus)
                .eq(CrmCustomerDO::getOwnerUserId, ownerUserId));
    }

    default Long selectCountByDealStatusAndOwnerUserId(@Nullable Boolean dealStatus, Long ownerUserId) {
        return selectCount(new LambdaQueryWrapperX<CrmCustomerDO>()
                .eqIfPresent(CrmCustomerDO::getDealStatus, dealStatus)
                .eq(CrmCustomerDO::getOwnerUserId, ownerUserId));
    }

    default int updateOwnerUserIdById(Long id, Long ownerUserId) {
        return update(new LambdaUpdateWrapper<CrmCustomerDO>()
                .eq(CrmCustomerDO::getId, id)
                .set(CrmCustomerDO::getOwnerUserId, ownerUserId));
    }

    default PageResult<CrmCustomerDO> selectPage(CrmCustomerPageReqVO pageReqVO, Long userId) {
        MPJLambdaWrapperX<CrmCustomerDO> query = new MPJLambdaWrapperX<>();
        // 拼接数据权限的查询条件
        CrmQueryWrapperUtils.appendPermissionCondition(query, CrmBizTypeEnum.CRM_CUSTOMER.getType(),
                CrmCustomerDO::getId, userId, pageReqVO.getSceneType(), pageReqVO.getPool());
        // 拼接自身的查询条件
        query.selectAll(CrmCustomerDO.class)
                .likeIfPresent(CrmCustomerDO::getName, pageReqVO.getName())
                .eqIfPresent(CrmCustomerDO::getMobile, pageReqVO.getMobile())
                .eqIfPresent(CrmCustomerDO::getIndustryId, pageReqVO.getIndustryId())
                .eqIfPresent(CrmCustomerDO::getLevel, pageReqVO.getLevel())
                .eqIfPresent(CrmCustomerDO::getSource, pageReqVO.getSource());
        return selectJoinPage(pageReqVO, CrmCustomerDO.class, query);
    }

    default List<CrmCustomerDO> selectBatchIds(Collection<Long> ids, Long userId) {
        MPJLambdaWrapperX<CrmCustomerDO> query = new MPJLambdaWrapperX<>();
        // 拼接数据权限的查询条件
        CrmQueryWrapperUtils.appendPermissionCondition(query, CrmBizTypeEnum.CRM_CUSTOMER.getType(), ids, userId);
        // 拼接自身的查询条件
        query.selectAll(CrmCustomerDO.class).in(CrmCustomerDO::getId, ids).orderByDesc(CrmCustomerDO::getId);
        return selectJoinList(CrmCustomerDO.class, query);
    }

    /**
     * 待办事项 - 今日需联系客户
     *
     * @param pageReqVO 分页请求参数
     * @param userId    当前用户ID
     * @return 分页结果
     */
    default PageResult<CrmCustomerDO> selectTodayCustomerPage(CrmTodayCustomerPageReqVO pageReqVO, Long userId) {
        MPJLambdaWrapperX<CrmCustomerDO> query = new MPJLambdaWrapperX<>();
        // 拼接数据权限的查询条件
        CrmQueryWrapperUtils.appendPermissionCondition(query, CrmBizTypeEnum.CRM_CUSTOMER.getType(),
                CrmCustomerDO::getId, userId, pageReqVO.getSceneType(), null);

        // 拼接自身的查询条件
        query.selectAll(CrmCustomerDO.class);
        if (pageReqVO.getContactStatus() != null) {
            LocalDateTime beginOfToday = LocalDateTimeUtil.beginOfDay(LocalDateTime.now());
            LocalDateTime endOfToday = LocalDateTimeUtil.endOfDay(LocalDateTime.now());
            if (pageReqVO.getContactStatus().equals(CrmTodayCustomerPageReqVO.CONTACT_TODAY)) { // 今天需联系
                query.between(CrmCustomerDO::getContactNextTime, beginOfToday, endOfToday);
            } else if (pageReqVO.getContactStatus().equals(CrmTodayCustomerPageReqVO.CONTACT_EXPIRED)) { // 已逾期
                query.lt(CrmCustomerDO::getContactNextTime, beginOfToday);
            } else if (pageReqVO.getContactStatus().equals(CrmTodayCustomerPageReqVO.CONTACT_ALREADY)) { // 已联系
                query.between(CrmCustomerDO::getContactLastTime, beginOfToday, endOfToday);
            } else {
                throw new IllegalArgumentException("未知联系状态：" + pageReqVO.getContactStatus());
            }
        }
        return selectJoinPage(pageReqVO, CrmCustomerDO.class, query);
    }

    default List<CrmCustomerDO> selectListByLockStatusAndOwnerUserIdNotNull(Boolean lockStatus) {
        return selectList(new LambdaQueryWrapper<CrmCustomerDO>()
                .eq(CrmCustomerDO::getLockStatus, lockStatus)
                // TODO @puhui999：not null 可以转化成大于 0
                .isNotNull(CrmCustomerDO::getOwnerUserId));
    }

    default PageResult<CrmCustomerDO> selectPutInPoolRemindCustomerPage(CrmCustomerPageReqVO pageReqVO,
                                                                        CrmCustomerPoolConfigDO poolConfigDO,
                                                                        Long userId) {
        MPJLambdaWrapperX<CrmCustomerDO> query = new MPJLambdaWrapperX<>();
        // 拼接数据权限的查询条件
        CrmQueryWrapperUtils.appendPermissionCondition(query, CrmBizTypeEnum.CRM_CUSTOMER.getType(),
                CrmCustomerDO::getId, userId, pageReqVO.getSceneType(), null);

        // 拼接自身的查询条件
        query.selectAll(CrmCustomerDO.class);

        // 未跟进放入公海天数
        final Integer contactExpireDays = poolConfigDO.getContactExpireDays();
        // 未成交放入公海天数
        final Integer dealExpireDays = poolConfigDO.getDealExpireDays();
        // 提前提醒天数
        final Integer notifyDays = poolConfigDO.getNotifyDays();

        // 未成交提醒日期区间
        // dealExpireDays 开始提醒
        LocalDateTime startDealRemindDate = LocalDateTimeUtil.beginOfDay(LocalDateTime.now())
                .minusDays(dealExpireDays);
        // dealExpireDays - notifyDays 结束提醒
        LocalDateTime endDealRemindDate = LocalDateTimeUtil.endOfDay(LocalDateTime.now())
                .minusDays(Math.max(dealExpireDays - notifyDays, 0));

        // 未跟进提醒日期区间
        // contactExpireDays 开始提醒
        LocalDateTime startContactRemindDate = LocalDateTimeUtil.beginOfDay(LocalDateTime.now())
                .minusDays(contactExpireDays);
        // contactExpireDays - notifyDays 结束提醒
        LocalDateTime endContactRemindDate = LocalDateTimeUtil.endOfDay(LocalDateTime.now())
                .minusDays(Math.max(contactExpireDays - notifyDays, 0));

        query
                // 1.1 未成交放入公海提醒
                .eq(CrmCustomerDO::getDealStatus, false)
                .between(CrmCustomerDO::getCreateTime, startDealRemindDate, endDealRemindDate)
                .or()
                // 1.2 未跟进放入公海提醒
                // 1.2.1 ContactLastTime 为空
                .isNull(CrmCustomerDO::getContactLastTime)
                .between(CrmCustomerDO::getCreateTime, startContactRemindDate, endContactRemindDate)
                .or()
                // 1.2.2 ContactLastTime 不为空
                .between(CrmCustomerDO::getContactLastTime, startContactRemindDate, endContactRemindDate)
        ;

        return selectJoinPage(pageReqVO, CrmCustomerDO.class, query);
    }

}
