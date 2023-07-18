package cn.iocoder.yudao.module.pay.dal.mysql.order;

import cn.iocoder.yudao.module.pay.controller.admin.order.vo.PayOrderExportReqVO;
import cn.iocoder.yudao.module.pay.controller.admin.order.vo.PayOrderPageReqVO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.QueryWrapperX;
import cn.iocoder.yudao.module.pay.dal.dataobject.order.PayOrderDO;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;
import java.util.List;

@Mapper
public interface PayOrderMapper extends BaseMapperX<PayOrderDO> {

    default PageResult<PayOrderDO> selectPage(PayOrderPageReqVO reqVO) {
        return selectPage(reqVO, new QueryWrapperX<PayOrderDO>()
                .eqIfPresent("app_id", reqVO.getAppId())
                .eqIfPresent("channel_id", reqVO.getChannelId())
                .eqIfPresent("channel_code", reqVO.getChannelCode())
                .likeIfPresent("merchant_order_id", reqVO.getMerchantOrderId())
                .eqIfPresent("notify_status", reqVO.getNotifyStatus())
                .eqIfPresent("status", reqVO.getStatus())
                .eqIfPresent("refund_status", reqVO.getRefundStatus())
                .likeIfPresent("channel_order_no", reqVO.getChannelOrderNo())
                .betweenIfPresent("create_time", reqVO.getCreateTime())
                .orderByDesc("id"));
    }

    default List<PayOrderDO> selectList(PayOrderExportReqVO reqVO) {
        return selectList(new QueryWrapperX<PayOrderDO>()
                .eqIfPresent("app_id", reqVO.getAppId())
                .eqIfPresent("channel_id", reqVO.getChannelId())
                .eqIfPresent("channel_code", reqVO.getChannelCode())
                .likeIfPresent("merchant_order_id", reqVO.getMerchantOrderId())
                .eqIfPresent("notify_status", reqVO.getNotifyStatus())
                .eqIfPresent("status", reqVO.getStatus())
                .eqIfPresent("refund_status", reqVO.getRefundStatus())
                .likeIfPresent("channel_order_no", reqVO.getChannelOrderNo())
                .betweenIfPresent("create_time", reqVO.getCreateTime())
                .orderByDesc("id"));
    }

    default Long selectCountByAppId(Long appId) {
        return selectCount(PayOrderDO::getAppId, appId);
    }

    default PayOrderDO selectByAppIdAndMerchantOrderId(Long appId, String merchantOrderId) {
        return selectOne(new QueryWrapper<PayOrderDO>().eq("app_id", appId)
                .eq("merchant_order_id", merchantOrderId));
    }

    default int updateByIdAndStatus(Long id, Integer status, PayOrderDO update) {
        return update(update, new QueryWrapper<PayOrderDO>()
                .eq("id", id).eq("status", status));
    }

}
