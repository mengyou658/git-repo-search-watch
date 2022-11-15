package cn.iocoder.yudao.module.trade.service.order;

import cn.iocoder.yudao.module.trade.controller.app.order.vo.AppTradeOrderCreateReqVO;
import cn.iocoder.yudao.module.trade.dal.dataobject.order.TradeOrderDO;
import cn.iocoder.yudao.module.trade.dal.dataobject.order.TradeOrderItemDO;

/**
 * 交易订单 Service 接口
 *
 * @author LeeYan9
 * @since 2022-08-26
 */
public interface TradeOrderService {

    /**
     * 创建交易订单
     *
     * @param userId 登录用户
     * @param userIp 用户 IP 地址
     * @param createReqVO 创建交易订单请求模型
     * @return 交易订单的编号
     */
    Long createOrder(Long userId, String userIp, AppTradeOrderCreateReqVO createReqVO);

    /**
     * 获得指定用户，指定的交易订单项
     *
     * @param userId 用户编号
     * @param itemId 交易订单项编号
     * @return 交易订单项
     */
    TradeOrderItemDO getOrderItem(Long userId, Long itemId);

    /**
     * 获得指定用户，指定的交易订单
     *
     * @param userId 用户编号
     * @param orderId 交易订单编号
     * @return 交易订单
     */
    TradeOrderDO getOrder(Long userId, Long orderId);

}
