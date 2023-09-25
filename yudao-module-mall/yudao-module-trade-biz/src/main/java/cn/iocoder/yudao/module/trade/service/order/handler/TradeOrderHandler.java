package cn.iocoder.yudao.module.trade.service.order.handler;

import cn.iocoder.yudao.module.trade.service.order.bo.TradeAfterOrderCreateReqBO;
import cn.iocoder.yudao.module.trade.service.order.bo.TradeBeforeOrderCreateReqBO;

/**
 * 订单活动特殊逻辑处理器 handler 接口
 *
 * @author HUIHUI
 */
public interface TradeOrderHandler {

    /**
     * 订单创建前
     *
     * @param reqBO 请求
     */
    void beforeOrderCreate(TradeBeforeOrderCreateReqBO reqBO);

    /**
     * 订单创建后
     *
     * @param reqBO 请求
     */
    void afterOrderCreate(TradeAfterOrderCreateReqBO reqBO);

    // TODO @puhui999：这个搞成订单取消
    /**
     * 回滚
     */
    void rollback();

    // TODO @puhui999：再搞个订单项取消哈

}
