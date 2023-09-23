package cn.iocoder.yudao.module.trade.service.order;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.iocoder.yudao.framework.common.core.KeyValue;
import cn.iocoder.yudao.framework.common.enums.TerminalEnum;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.member.api.address.AddressApi;
import cn.iocoder.yudao.module.member.api.address.dto.AddressRespDTO;
import cn.iocoder.yudao.module.member.api.level.MemberLevelApi;
import cn.iocoder.yudao.module.member.api.point.MemberPointApi;
import cn.iocoder.yudao.module.member.api.user.MemberUserApi;
import cn.iocoder.yudao.module.member.api.user.dto.MemberUserRespDTO;
import cn.iocoder.yudao.module.member.enums.MemberExperienceBizTypeEnum;
import cn.iocoder.yudao.module.member.enums.point.MemberPointBizTypeEnum;
import cn.iocoder.yudao.module.pay.api.order.PayOrderApi;
import cn.iocoder.yudao.module.pay.api.order.dto.PayOrderCreateReqDTO;
import cn.iocoder.yudao.module.pay.api.order.dto.PayOrderRespDTO;
import cn.iocoder.yudao.module.pay.enums.order.PayOrderStatusEnum;
import cn.iocoder.yudao.module.product.api.comment.ProductCommentApi;
import cn.iocoder.yudao.module.product.api.comment.dto.ProductCommentCreateReqDTO;
import cn.iocoder.yudao.module.product.api.sku.ProductSkuApi;
import cn.iocoder.yudao.module.product.api.spu.ProductSpuApi;
import cn.iocoder.yudao.module.promotion.api.bargain.BargainRecordApi;
import cn.iocoder.yudao.module.promotion.api.combination.CombinationRecordApi;
import cn.iocoder.yudao.module.promotion.api.coupon.CouponApi;
import cn.iocoder.yudao.module.promotion.api.coupon.dto.CouponUseReqDTO;
import cn.iocoder.yudao.module.trade.controller.admin.order.vo.TradeOrderDeliveryReqVO;
import cn.iocoder.yudao.module.trade.controller.admin.order.vo.TradeOrderRemarkReqVO;
import cn.iocoder.yudao.module.trade.controller.admin.order.vo.TradeOrderUpdateAddressReqVO;
import cn.iocoder.yudao.module.trade.controller.admin.order.vo.TradeOrderUpdatePriceReqVO;
import cn.iocoder.yudao.module.trade.controller.app.order.vo.AppTradeOrderCreateReqVO;
import cn.iocoder.yudao.module.trade.controller.app.order.vo.AppTradeOrderSettlementReqVO;
import cn.iocoder.yudao.module.trade.controller.app.order.vo.AppTradeOrderSettlementRespVO;
import cn.iocoder.yudao.module.trade.controller.app.order.vo.item.AppTradeOrderItemCommentCreateReqVO;
import cn.iocoder.yudao.module.trade.convert.order.TradeOrderConvert;
import cn.iocoder.yudao.module.trade.dal.dataobject.cart.CartDO;
import cn.iocoder.yudao.module.trade.dal.dataobject.order.TradeOrderDO;
import cn.iocoder.yudao.module.trade.dal.dataobject.order.TradeOrderItemDO;
import cn.iocoder.yudao.module.trade.dal.mysql.order.TradeOrderItemMapper;
import cn.iocoder.yudao.module.trade.dal.mysql.order.TradeOrderMapper;
import cn.iocoder.yudao.module.trade.dal.redis.no.TradeOrderNoRedisDAO;
import cn.iocoder.yudao.module.trade.enums.brokerage.BrokerageRecordBizTypeEnum;
import cn.iocoder.yudao.module.trade.enums.delivery.DeliveryTypeEnum;
import cn.iocoder.yudao.module.trade.enums.order.*;
import cn.iocoder.yudao.module.trade.framework.order.config.TradeOrderProperties;
import cn.iocoder.yudao.module.trade.framework.order.core.annotations.TradeOrderLog;
import cn.iocoder.yudao.module.trade.service.brokerage.BrokerageRecordService;
import cn.iocoder.yudao.module.trade.service.brokerage.bo.BrokerageAddReqBO;
import cn.iocoder.yudao.module.trade.service.cart.CartService;
import cn.iocoder.yudao.module.trade.service.delivery.DeliveryExpressService;
import cn.iocoder.yudao.module.trade.service.message.TradeMessageService;
import cn.iocoder.yudao.module.trade.service.message.bo.TradeOrderMessageWhenDeliveryOrderReqBO;
import cn.iocoder.yudao.module.trade.service.order.bo.TradeBeforeOrderCreateReqBO;
import cn.iocoder.yudao.module.trade.service.order.handler.TradeOrderHandler;
import cn.iocoder.yudao.module.trade.service.price.TradePriceService;
import cn.iocoder.yudao.module.trade.service.price.bo.TradePriceCalculateReqBO;
import cn.iocoder.yudao.module.trade.service.price.bo.TradePriceCalculateRespBO;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.*;
import static cn.iocoder.yudao.module.trade.enums.ErrorCodeConstants.*;

/**
 * 交易订单【写】Service 实现类
 *
 * @author LeeYan9
 * @since 2022-08-26
 */
@Service
@Slf4j
public class TradeOrderUpdateServiceImpl implements TradeOrderUpdateService {

    @Resource
    private TradeOrderMapper tradeOrderMapper;
    @Resource
    private TradeOrderItemMapper tradeOrderItemMapper;
    @Resource
    private TradeOrderNoRedisDAO orderNoRedisDAO;

    @Resource
    private List<TradeOrderHandler> tradeOrderHandlers;

    @Resource
    private CartService cartService;
    @Resource
    private TradePriceService tradePriceService;
    @Resource
    private DeliveryExpressService deliveryExpressService;
    @Resource
    private TradeMessageService tradeMessageService;

    @Resource
    private ProductSpuApi productSpuApi;
    @Resource
    private ProductSkuApi productSkuApi;
    @Resource
    private PayOrderApi payOrderApi;
    @Resource
    private AddressApi addressApi;
    @Resource
    private CouponApi couponApi;
    @Resource
    private CombinationRecordApi combinationRecordApi;
    @Resource
    private BargainRecordApi bargainRecordApi;
    @Resource
    private MemberUserApi memberUserApi;
    @Resource
    private MemberLevelApi memberLevelApi;
    @Resource
    private MemberPointApi memberPointApi;
    @Resource
    private BrokerageRecordService brokerageRecordService;
    @Resource
    private ProductCommentApi productCommentApi;

    @Resource
    private TradeOrderProperties tradeOrderProperties;

    // =================== Order ===================

    @Override
    public AppTradeOrderSettlementRespVO settlementOrder(Long userId, AppTradeOrderSettlementReqVO settlementReqVO) {
        // 1. 获得收货地址
        AddressRespDTO address = getAddress(userId, settlementReqVO.getAddressId());
        if (address != null) {
            settlementReqVO.setAddressId(address.getId());
        }

        // 2. 计算价格
        TradePriceCalculateRespBO calculateRespBO = calculatePrice(userId, settlementReqVO);

        // 3. 拼接返回
        return TradeOrderConvert.INSTANCE.convert(calculateRespBO, address);
    }

    /**
     * 获得用户地址
     *
     * @param userId    用户编号
     * @param addressId 地址编号
     * @return 地址
     */
    private AddressRespDTO getAddress(Long userId, Long addressId) {
        if (addressId != null) {
            return addressApi.getAddress(addressId, userId);
        }
        return addressApi.getDefaultAddress(userId);
    }

    /**
     * 计算订单价格
     *
     * @param userId          用户编号
     * @param settlementReqVO 结算信息
     * @return 订单价格
     */
    private TradePriceCalculateRespBO calculatePrice(Long userId, AppTradeOrderSettlementReqVO settlementReqVO) {
        // 1. 如果来自购物车，则获得购物车的商品
        List<CartDO> cartList = cartService.getCartList(userId,
                convertSet(settlementReqVO.getItems(), AppTradeOrderSettlementReqVO.Item::getCartId));

        // 2. 计算价格
        TradePriceCalculateReqBO calculateReqBO = TradeOrderConvert.INSTANCE.convert(userId, settlementReqVO, cartList);
        calculateReqBO.getItems().forEach(item -> Assert.isTrue(item.getSelected(), // 防御性编程，保证都是选中的
                "商品({}) 未设置为选中", item.getSkuId()));
        return tradePriceService.calculatePrice(calculateReqBO);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @TradeOrderLog(operateType = TradeOrderOperateTypeEnum.MEMBER_CREATE)
    public TradeOrderDO createOrder(Long userId, String userIp, AppTradeOrderCreateReqVO createReqVO) {
        // 0. 价格计算
        TradePriceCalculateRespBO calculateRespBO = calculatePrice(userId, createReqVO);

        // 1. 订单创建前的逻辑
        beforeCreateTradeOrder(userId, createReqVO, calculateRespBO);

        // 2.1 插入 TradeOrderDO 订单
        TradeOrderDO order = createTradeOrder(userId, userIp, createReqVO, calculateRespBO);
        // 2.2 插入 TradeOrderItemDO 订单项
        List<TradeOrderItemDO> orderItems = createTradeOrderItems(order, calculateRespBO);

        // 3. 订单创建后的逻辑
        afterCreateTradeOrder(userId, createReqVO, order, orderItems, calculateRespBO);
        return order;
    }

    // TODO @puhui999：订单超时，自动取消；

    private TradeOrderDO createTradeOrder(Long userId, String clientIp, AppTradeOrderCreateReqVO createReqVO,
                                          TradePriceCalculateRespBO calculateRespBO) {
        TradeOrderDO order = TradeOrderConvert.INSTANCE.convert(userId, clientIp, createReqVO, calculateRespBO);
        order.setType(calculateRespBO.getType());
        order.setNo(orderNoRedisDAO.generate(TradeOrderNoRedisDAO.TRADE_ORDER_NO_PREFIX));
        order.setStatus(TradeOrderStatusEnum.UNPAID.getStatus());
        order.setRefundStatus(TradeOrderRefundStatusEnum.NONE.getStatus());
        order.setProductCount(getSumValue(calculateRespBO.getItems(), TradePriceCalculateRespBO.OrderItem::getCount, Integer::sum));
        order.setTerminal(TerminalEnum.H5.getTerminal()); // todo 数据来源?
        // 支付 + 退款信息
        order.setAdjustPrice(0).setPayStatus(false);
        order.setRefundStatus(TradeOrderRefundStatusEnum.NONE.getStatus()).setRefundPrice(0);
        // 物流信息
        order.setDeliveryType(createReqVO.getDeliveryType());
        if (Objects.equals(createReqVO.getDeliveryType(), DeliveryTypeEnum.EXPRESS.getType())) {
            AddressRespDTO address = addressApi.getAddress(createReqVO.getAddressId(), userId);
            Assert.notNull(address, "地址({}) 不能为空", createReqVO.getAddressId()); // 价格计算时，已经计算
            order.setReceiverName(address.getName()).setReceiverMobile(address.getMobile())
                    .setReceiverAreaId(address.getAreaId()).setReceiverDetailAddress(address.getDetailAddress());
        } else if (Objects.equals(createReqVO.getDeliveryType(), DeliveryTypeEnum.PICK_UP.getType())) {
            order.setReceiverName(createReqVO.getReceiverName()).setReceiverMobile(createReqVO.getReceiverMobile());
            order.setPickUpVerifyCode(RandomUtil.randomNumbers(8)); // 随机一个核销码，长度为 8 位
        }
        tradeOrderMapper.insert(order);
        return order;
    }

    private List<TradeOrderItemDO> createTradeOrderItems(TradeOrderDO tradeOrderDO,
                                                         TradePriceCalculateRespBO calculateRespBO) {
        List<TradeOrderItemDO> orderItems = TradeOrderConvert.INSTANCE.convertList(tradeOrderDO, calculateRespBO);
        tradeOrderItemMapper.insertBatch(orderItems);
        return orderItems;
    }

    /**
     * 订单创建前，执行前置逻辑
     *
     * @param userId          用户编号
     * @param createReqVO     创建订单请求
     * @param calculateRespBO 订单价格计算结果
     */
    private void beforeCreateTradeOrder(Long userId, AppTradeOrderCreateReqVO createReqVO,
                                        TradePriceCalculateRespBO calculateRespBO) {
        // 1. 执行订单创建前置处理器
        TradeBeforeOrderCreateReqBO beforeOrderCreateReqBO = TradeOrderConvert.INSTANCE.convert(createReqVO);
        beforeOrderCreateReqBO.setOrderType(calculateRespBO.getType());
        beforeOrderCreateReqBO.setUserId(userId);
        beforeOrderCreateReqBO.setCount(getSumValue(createReqVO.getItems(), AppTradeOrderSettlementReqVO.Item::getCount, Integer::sum));
        // TODO @puhui999：这里有个纠结点；handler 的定义是只处理指定类型的订单的拓展逻辑；还是通用的 handler，类似可以处理优惠劵等等
        tradeOrderHandlers.forEach(handler -> handler.beforeOrderCreate(beforeOrderCreateReqBO));

        // 2. 下单时扣减商品库存
        productSkuApi.updateSkuStock(TradeOrderConvert.INSTANCE.convertNegative(createReqVO.getItems()));
    }

    /**
     * 订单创建后，执行后置逻辑
     * <p>
     * 例如说：优惠劵的扣减、积分的扣减、支付单的创建等等
     *
     * @param userId          用户编号
     * @param createReqVO     创建订单请求
     * @param order           交易订单
     * @param calculateRespBO 订单价格计算结果
     */
    private void afterCreateTradeOrder(Long userId, AppTradeOrderCreateReqVO createReqVO,
                                       TradeOrderDO order, List<TradeOrderItemDO> orderItems,
                                       TradePriceCalculateRespBO calculateRespBO) {
        // 1. 执行订单创建后置处理器
        // TODO @puhui999：从通用性来说，应该不用 orderItems.get(0)
        tradeOrderHandlers.forEach(handler -> handler.afterOrderCreate(
                TradeOrderConvert.INSTANCE.convert(userId, createReqVO, order, orderItems.get(0))));

        // 2. 有使用优惠券时更新
        // 不在前置扣减的原因，是因为优惠劵要记录使用的订单号
        if (createReqVO.getCouponId() != null) {
            couponApi.useCoupon(new CouponUseReqDTO().setId(createReqVO.getCouponId()).setUserId(userId)
                    .setOrderId(order.getId()));
        }

        // 3. 扣减积分（抵扣）
        // 不在前置扣减的原因，是因为积分扣减时，需要记录关联业务
        reduceUserPoint(order.getUserId(), order.getUsePoint(), MemberPointBizTypeEnum.ORDER_USE, order.getId());

        // 4. 删除购物车商品
        Set<Long> cartIds = convertSet(createReqVO.getItems(), AppTradeOrderSettlementReqVO.Item::getCartId);
        if (CollUtil.isNotEmpty(cartIds)) {
            cartService.deleteCart(userId, cartIds);
        }

        // 5. 生成预支付
        createPayOrder(order, orderItems, calculateRespBO);

        // TODO @LeeYan9: 是可以思考下, 订单的营销优惠记录, 应该记录在哪里, 微信讨论起来!
    }

    private void createPayOrder(TradeOrderDO order, List<TradeOrderItemDO> orderItems,
                                TradePriceCalculateRespBO calculateRespBO) {
        // 创建支付单，用于后续的支付
        PayOrderCreateReqDTO payOrderCreateReqDTO = TradeOrderConvert.INSTANCE.convert(
                order, orderItems, calculateRespBO, tradeOrderProperties);
        Long payOrderId = payOrderApi.createOrder(payOrderCreateReqDTO);

        // 更新到交易单上
        tradeOrderMapper.updateById(new TradeOrderDO().setId(order.getId()).setPayOrderId(payOrderId));
        order.setPayOrderId(payOrderId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrderPaid(Long id, Long payOrderId) {
        // 校验并获得交易订单（可支付）
        KeyValue<TradeOrderDO, PayOrderRespDTO> orderResult = validateOrderPayable(id, payOrderId);
        TradeOrderDO order = orderResult.getKey();
        PayOrderRespDTO payOrder = orderResult.getValue();

        // 更新 TradeOrderDO 状态为已支付，等待发货
        int updateCount = tradeOrderMapper.updateByIdAndStatus(id, order.getStatus(),
                new TradeOrderDO().setStatus(TradeOrderStatusEnum.UNDELIVERED.getStatus()).setPayStatus(true)
                        .setPayTime(LocalDateTime.now()).setPayChannelCode(payOrder.getChannelCode()));
        if (updateCount == 0) {
            throw exception(ORDER_UPDATE_PAID_STATUS_NOT_UNPAID);
        }
        // 校验活动
        // 1、拼团活动
        // TODO @puhui999：这块也抽象到 handler 里
        if (Objects.equals(TradeOrderTypeEnum.COMBINATION.getType(), order.getType())) {
            // 更新拼团状态 TODO puhui999：订单支付失败或订单支付过期删除这条拼团记录
            combinationRecordApi.updateRecordStatusToInProgress(order.getUserId(), order.getId(), LocalDateTime.now());
        }
        // TODO 芋艿：发送订单变化的消息

        // TODO 芋艿：发送站内信

        // TODO 芋艿：OrderLog

        // 增加用户积分（赠送）
        addUserPoint(order.getUserId(), order.getGivePoint(), MemberPointBizTypeEnum.ORDER_REWARD, order.getId());
        // 增加用户经验
        getSelf().addUserExperienceAsync(order.getUserId(), order.getPayPrice(), order.getId());
        // 增加用户佣金
        getSelf().addBrokerageAsync(order.getUserId(), order.getId());
    }

    /**
     * 校验交易订单满足被支付的条件
     *
     * 1. 交易订单未支付
     * 2. 支付单已支付
     *
     * @param id         交易订单编号
     * @param payOrderId 支付订单编号
     * @return 交易订单
     */
    private KeyValue<TradeOrderDO, PayOrderRespDTO> validateOrderPayable(Long id, Long payOrderId) {
        // 校验订单是否存在
        TradeOrderDO order = validateOrderExists(id);
        // 校验订单未支付
        if (!TradeOrderStatusEnum.isUnpaid(order.getStatus()) || order.getPayStatus()) {
            log.error("[validateOrderPaid][order({}) 不处于待支付状态，请进行处理！order 数据是：{}]",
                    id, JsonUtils.toJsonString(order));
            throw exception(ORDER_UPDATE_PAID_STATUS_NOT_UNPAID);
        }
        // 校验支付订单匹配
        if (ObjectUtil.notEqual(order.getPayOrderId(), payOrderId)) { // 支付单号
            log.error("[validateOrderPaid][order({}) 支付单不匹配({})，请进行处理！order 数据是：{}]",
                    id, payOrderId, JsonUtils.toJsonString(order));
            throw exception(ORDER_UPDATE_PAID_FAIL_PAY_ORDER_ID_ERROR);
        }

        // 校验支付单是否存在
        PayOrderRespDTO payOrder = payOrderApi.getOrder(payOrderId);
        if (payOrder == null) {
            log.error("[validateOrderPaid][order({}) payOrder({}) 不存在，请进行处理！]", id, payOrderId);
            throw exception(ORDER_NOT_FOUND);
        }
        // 校验支付单已支付
        if (!PayOrderStatusEnum.isSuccess(payOrder.getStatus())) {
            log.error("[validateOrderPaid][order({}) payOrder({}) 未支付，请进行处理！payOrder 数据是：{}]",
                    id, payOrderId, JsonUtils.toJsonString(payOrder));
            throw exception(ORDER_UPDATE_PAID_FAIL_PAY_ORDER_STATUS_NOT_SUCCESS);
        }
        // 校验支付金额一致
        if (ObjectUtil.notEqual(payOrder.getPrice(), order.getPayPrice())) {
            log.error("[validateOrderPaid][order({}) payOrder({}) 支付金额不匹配，请进行处理！order 数据是：{}，payOrder 数据是：{}]",
                    id, payOrderId, JsonUtils.toJsonString(order), JsonUtils.toJsonString(payOrder));
            throw exception(ORDER_UPDATE_PAID_FAIL_PAY_PRICE_NOT_MATCH);
        }
        // 校验支付订单匹配（二次）
        if (ObjectUtil.notEqual(payOrder.getMerchantOrderId(), id.toString())) {
            log.error("[validateOrderPaid][order({}) 支付单不匹配({})，请进行处理！payOrder 数据是：{}]",
                    id, payOrderId, JsonUtils.toJsonString(payOrder));
            throw exception(ORDER_UPDATE_PAID_FAIL_PAY_ORDER_ID_ERROR);
        }
        return new KeyValue<>(order, payOrder);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deliveryOrder(TradeOrderDeliveryReqVO deliveryReqVO) {
        // 1.1 校验并获得交易订单（可发货）
        TradeOrderDO order = validateOrderDeliverable(deliveryReqVO.getId());
        // 1.2 校验 deliveryType 是否为快递，是快递才可以发货
        if (ObjectUtil.notEqual(order.getDeliveryType(), DeliveryTypeEnum.EXPRESS.getType())) {
            throw exception(ORDER_DELIVERY_FAIL_DELIVERY_TYPE_NOT_EXPRESS);
        }

        // 2. 更新订单为已发货
        TradeOrderDO updateOrderObj = new TradeOrderDO();
        // 2.1 快递发货
        if (ObjectUtil.notEqual(deliveryReqVO.getLogisticsId(), TradeOrderDO.LOGISTICS_ID_NULL)) {
            deliveryExpressService.validateDeliveryExpress(deliveryReqVO.getLogisticsId());
            updateOrderObj.setLogisticsId(deliveryReqVO.getLogisticsId()).setLogisticsNo(deliveryReqVO.getLogisticsNo());
        } else {
            // 2.2 无需发货
            updateOrderObj.setLogisticsId(0L).setLogisticsNo("");
        }
        // 执行更新
        updateOrderObj.setStatus(TradeOrderStatusEnum.DELIVERED.getStatus()).setDeliveryTime(LocalDateTime.now());
        int updateCount = tradeOrderMapper.updateByIdAndStatus(order.getId(), order.getStatus(), updateOrderObj);
        if (updateCount == 0) {
            throw exception(ORDER_DELIVERY_FAIL_STATUS_NOT_UNDELIVERED);
        }

        // TODO 芋艿：发送订单变化的消息

        // 发送站内信
        tradeMessageService.sendMessageWhenDeliveryOrder(new TradeOrderMessageWhenDeliveryOrderReqBO().setOrderId(order.getId())
                .setUserId(order.getUserId()).setMessage(null));

        // TODO 芋艿：OrderLog
    }

    /**
     * 校验交易订单满足被发货的条件
     *
     * 1. 交易订单未发货
     *
     * @param id 交易订单编号
     * @return 交易订单
     */
    private TradeOrderDO validateOrderDeliverable(Long id) {
        TradeOrderDO order = validateOrderExists(id);
        // 校验订单是否退款
        if (ObjectUtil.notEqual(TradeOrderRefundStatusEnum.NONE.getStatus(), order.getRefundStatus())) {
            throw exception(ORDER_DELIVERY_FAIL_REFUND_STATUS_NOT_NONE);
        }
        // 订单类型：拼团
        if (Objects.equals(TradeOrderTypeEnum.COMBINATION.getType(), order.getType())) {
            // 校验订单拼团是否成功
            if (!combinationRecordApi.isCombinationRecordSuccess(order.getUserId(), order.getId())) {
                throw exception(ORDER_DELIVERY_FAIL_COMBINATION_RECORD_STATUS_NOT_SUCCESS);
            }
        }
        // 订单类类型：砍价
        if (Objects.equals(TradeOrderTypeEnum.BARGAIN.getType(), order.getType())) {
            // 校验订单砍价是否成功
            if (!bargainRecordApi.isBargainRecordSuccess(order.getUserId(), order.getId())) {
                throw exception(ORDER_DELIVERY_FAIL_BARGAIN_RECORD_STATUS_NOT_SUCCESS);
            }
        }
        return order;
    }

    @NotNull
    private TradeOrderDO validateOrderExists(Long id) {
        // 校验订单是否存在
        TradeOrderDO order = tradeOrderMapper.selectById(id);
        if (order == null) {
            throw exception(ORDER_NOT_FOUND);
        }
        return order;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void receiveOrder(Long userId, Long id) {
        // 校验并获得交易订单（可收货）
        TradeOrderDO order = validateOrderReceivable(userId, id);

        // 更新 TradeOrderDO 状态为已完成
        int updateCount = tradeOrderMapper.updateByIdAndStatus(order.getId(), order.getStatus(),
                new TradeOrderDO().setStatus(TradeOrderStatusEnum.COMPLETED.getStatus()).setReceiveTime(LocalDateTime.now()));
        if (updateCount == 0) {
            throw exception(ORDER_RECEIVE_FAIL_STATUS_NOT_DELIVERED);
        }
        // TODO 芋艿：OrderLog

        // TODO 芋艿：lili 发送订单变化的消息

        // TODO 芋艿：lili 发送商品被购买完成的数据

        // TODO 芋艿：销售佣金的记录；

        // TODO 芋艿：获得积分；
    }

    @Override
    public void updateOrderRemark(TradeOrderRemarkReqVO reqVO) {
        // 校验并获得交易订单
        validateOrderExists(reqVO.getId());

        // 更新
        TradeOrderDO order = TradeOrderConvert.INSTANCE.convert(reqVO);
        tradeOrderMapper.updateById(order);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrderPrice(TradeOrderUpdatePriceReqVO reqVO) {
        // 1、校验交易订单
        TradeOrderDO order = validateOrderExists(reqVO.getId());
        if (order.getPayStatus()) {
            throw exception(ORDER_UPDATE_PRICE_FAIL_PAID);
        }
        // 2、校验订单项
        List<TradeOrderItemDO> items = tradeOrderItemMapper.selectListByOrderId(order.getId());
        if (CollUtil.isEmpty(items)) {
            throw exception(ORDER_UPDATE_PRICE_FAIL_NOT_ITEM);
        }
        // 3、校验调价金额是否变化
        if (ObjectUtil.equal(order.getAdjustPrice(), reqVO.getAdjustPrice())) {
            throw exception(ORDER_UPDATE_PRICE_FAIL_EQUAL);
        }

        // 4、更新订单
        TradeOrderDO update = new TradeOrderDO();
        update.setId(order.getId());
        update.setAdjustPrice(reqVO.getAdjustPrice());
        int orderPayPrice = order.getAdjustPrice() != null ? (order.getPayPrice() - order.getAdjustPrice())
                + reqVO.getAdjustPrice() : order.getPayPrice() + reqVO.getAdjustPrice();
        update.setPayPrice(orderPayPrice);
        tradeOrderMapper.updateById(update);
        // TODO @芋艿：改价时，赠送的积分，要不要做改动？？？

        // TODO @puhui999：应该是按照 payPrice 分配；并且要考虑取余问题；payPrice 也要考虑，item 里的
        // TODO：先按 adjustPrice 实现，没明白 payPrice 怎么搞哈哈哈
        // TODO @puhui999：就是对比新老 adjustPrice 的差值，然后计算补充的 adjustPrice 最终值；另外，可以不用区分 items.size 是不是 > 1 哈；应该是一致的逻辑；分摊的逻辑，有点类似 dividePrice 方法噢；
        // 5、更新 TradeOrderItem
        if (items.size() > 1) {
            // TradeOrderItemDO 需要做 adjustPrice 的分摊
            int price = reqVO.getAdjustPrice() / items.size();
            int remainderPrice = reqVO.getAdjustPrice() % items.size();
            List<TradeOrderItemDO> orders = new ArrayList<>();
            for (int i = 0; i < items.size(); i++) {
                // 把平摊后剩余的金额加到第一个订单项
                if (remainderPrice != 0 && i == 0) {
                    orders.add(convertOrderItemPrice(items.get(i), price + remainderPrice));
                }
                orders.add(convertOrderItemPrice(items.get(i), price));
            }
            tradeOrderItemMapper.updateBatch(orders);
        } else {
            TradeOrderItemDO orderItem = items.get(0);
            TradeOrderItemDO updateItem = convertOrderItemPrice(orderItem, reqVO.getAdjustPrice());
            tradeOrderItemMapper.updateById(updateItem);
        }

        // 6、更新支付订单
        payOrderApi.updatePayOrderPrice(order.getPayOrderId(), update.getPayPrice());
    }

    private TradeOrderItemDO convertOrderItemPrice(TradeOrderItemDO orderItem, Integer price) {
        TradeOrderItemDO newOrderItem = new TradeOrderItemDO();
        newOrderItem.setId(orderItem.getId());
        newOrderItem.setAdjustPrice(price);
        int payPrice = orderItem.getAdjustPrice() != null ? (orderItem.getPayPrice() - orderItem.getAdjustPrice())
                + price : orderItem.getPayPrice() + price;
        newOrderItem.setPayPrice(payPrice);
        return newOrderItem;
    }

    @Override
    public void updateOrderAddress(TradeOrderUpdateAddressReqVO reqVO) {
        // 校验交易订单
        validateOrderExists(reqVO.getId());
        // TODO 是否需要校验订单是否发货
        // TODO 发货后是否支持修改收货地址

        // 更新
        TradeOrderDO update = TradeOrderConvert.INSTANCE.convert(reqVO);
        tradeOrderMapper.updateById(update);
    }

    /**
     * 校验交易订单满足可售货的条件
     *
     * 1. 交易订单待收货
     *
     * @param userId 用户编号
     * @param id     交易订单编号
     * @return 交易订单
     */
    private TradeOrderDO validateOrderReceivable(Long userId, Long id) {
        // 校验订单是否存在
        TradeOrderDO order = tradeOrderMapper.selectByIdAndUserId(id, userId);
        if (order == null) {
            throw exception(ORDER_NOT_FOUND);
        }
        // 校验订单是否是待收货状态
        if (!TradeOrderStatusEnum.isDelivered(order.getStatus())) {
            throw exception(ORDER_RECEIVE_FAIL_STATUS_NOT_DELIVERED);
        }
        return order;
    }

    // =================== Order Item ===================

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrderItemAfterSaleStatus(Long id, Integer oldAfterSaleStatus, Integer newAfterSaleStatus,
                                               Long afterSaleId, Integer refundPrice) {
        // 如果退款成功，则 refundPrice 非空
        if (Objects.equals(newAfterSaleStatus, TradeOrderItemAfterSaleStatusEnum.SUCCESS.getStatus())
                && refundPrice == null) {
            throw new IllegalArgumentException(StrUtil.format("id({}) 退款成功，退款金额不能为空", id));
        }
        // 如果退款发起，则 afterSaleId 非空
        if (Objects.equals(newAfterSaleStatus, TradeOrderItemAfterSaleStatusEnum.APPLY.getStatus())
                && afterSaleId == null) {
            throw new IllegalArgumentException(StrUtil.format("id({}) 退款发起，售后单编号不能为空", id));
        }

        // 更新订单项
        int updateCount = tradeOrderItemMapper.updateAfterSaleStatus(id, oldAfterSaleStatus, newAfterSaleStatus, afterSaleId);
        if (updateCount <= 0) {
            throw exception(ORDER_ITEM_UPDATE_AFTER_SALE_STATUS_FAIL);
        }

        // 如果有退款金额，则需要更新订单
        if (refundPrice == null) {
            return;
        }
        // 计算总的退款金额
        TradeOrderItemDO orderItem = tradeOrderItemMapper.selectById(id);
        TradeOrderDO order = tradeOrderMapper.selectById(orderItem.getOrderId());
        Integer orderRefundPrice = order.getRefundPrice() + refundPrice;
        if (isAllOrderItemAfterSaleSuccess(order.getId())) { // 如果都售后成功，则需要取消订单
            tradeOrderMapper.updateById(new TradeOrderDO().setId(order.getId())
                    .setRefundStatus(TradeOrderRefundStatusEnum.ALL.getStatus()).setRefundPrice(orderRefundPrice).setRefundPoint(order.getRefundPoint() + orderItem.getUsePoint())
                    .setCancelType(TradeOrderCancelTypeEnum.AFTER_SALE_CLOSE.getType()).setCancelTime(LocalDateTime.now()));

            // TODO 芋艿：记录订单日志

            // TODO 芋艿：站内信？
        } else { // 如果部分售后，则更新退款金额
            tradeOrderMapper.updateById(new TradeOrderDO().setId(order.getId())
                    .setRefundStatus(TradeOrderRefundStatusEnum.PART.getStatus()).setRefundPrice(orderRefundPrice));
        }

        // 售后成功后，执行数据回滚逻辑
        if (Objects.equals(newAfterSaleStatus, TradeOrderItemAfterSaleStatusEnum.SUCCESS.getStatus())) {
            // 扣减用户积分（赠送的）
            reduceUserPoint(order.getUserId(), orderItem.getGivePoint(), MemberPointBizTypeEnum.AFTER_SALE_DEDUCT_GIVE, afterSaleId);
            // 增加用户积分（返还抵扣）
            addUserPoint(order.getUserId(), orderItem.getUsePoint(), MemberPointBizTypeEnum.AFTER_SALE_REFUND_USED, afterSaleId);
            // 扣减用户经验
            getSelf().reduceUserExperienceAsync(order.getUserId(), orderRefundPrice, afterSaleId);
            // 更新分佣记录为已失效
            getSelf().cancelBrokerageAsync(order.getUserId(), id);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createOrderItemComment(Long userId, AppTradeOrderItemCommentCreateReqVO createReqVO) {
        // 先通过订单项 ID，查询订单项是否存在
        TradeOrderItemDO orderItem = tradeOrderItemMapper.selectByIdAndUserId(createReqVO.getOrderItemId(), userId);
        if (orderItem == null) {
            throw exception(ORDER_ITEM_NOT_FOUND);
        }
        // 校验订单相关状态
        TradeOrderDO order = tradeOrderMapper.selectOrderByIdAndUserId(orderItem.getOrderId(), userId);
        if (order == null) {
            throw exception(ORDER_NOT_FOUND);
        }
        if (ObjectUtil.notEqual(order.getStatus(), TradeOrderStatusEnum.COMPLETED.getStatus())) {
            throw exception(ORDER_COMMENT_FAIL_STATUS_NOT_COMPLETED);
        }
        if (ObjectUtil.notEqual(order.getCommentStatus(), Boolean.FALSE)) {
            throw exception(ORDER_COMMENT_STATUS_NOT_FALSE);
        }

        // 1. 创建评价
        ProductCommentCreateReqDTO productCommentCreateReqDTO = TradeOrderConvert.INSTANCE.convert04(createReqVO, orderItem);
        Long comment = productCommentApi.createComment(productCommentCreateReqDTO);

        // 2. 更新订单项评价状态
        tradeOrderItemMapper.updateById(new TradeOrderItemDO().setId(orderItem.getId()).setCommentStatus(Boolean.TRUE));
        List<TradeOrderItemDO> orderItems = tradeOrderItemMapper.selectListByOrderId(order.getId());
        if (!anyMatch(orderItems, item -> Objects.equals(item.getCommentStatus(), Boolean.FALSE))) {
            tradeOrderMapper.updateById(new TradeOrderDO().setId(order.getId()).setCommentStatus(Boolean.TRUE));
            // TODO 待实现：已完成评价，要不要写一条订单日志？目前 crmeb 会写，有赞可以研究下
        }
        return comment;
    }

    @Override
    public void cancelOrder(Long userId, Long id) {
        // 校验存在
        TradeOrderDO order = tradeOrderMapper.selectOrderByIdAndUserId(id, userId);
        if (order == null) {
            throw exception(ORDER_NOT_FOUND);
        }
        // 校验状态
        if (ObjectUtil.notEqual(order.getStatus(), TradeOrderStatusEnum.UNPAID.getStatus())) {
            throw exception(ORDER_CANCEL_FAIL_STATUS_NOT_UNPAID);
        }

        // 1.更新 TradeOrderDO 状态为已取消
        int updateCount = tradeOrderMapper.updateByIdAndStatus(id, order.getStatus(),
                new TradeOrderDO().setStatus(TradeOrderStatusEnum.CANCELED.getStatus())
                        .setCancelTime(LocalDateTime.now())
                        .setCancelType(TradeOrderCancelTypeEnum.MEMBER_CANCEL.getType()));
        if (updateCount == 0) {
            throw exception(ORDER_CANCEL_FAIL_STATUS_NOT_UNPAID);
        }

        // TODO 活动相关库存回滚需要活动 id，活动 id 怎么获取？app 端能否传过来
        tradeOrderHandlers.forEach(handler -> handler.rollback());

        // 2.回滚库存
        List<TradeOrderItemDO> orderItems = tradeOrderItemMapper.selectListByOrderId(id);
        productSkuApi.updateSkuStock(TradeOrderConvert.INSTANCE.convert(orderItems));

        // 3.回滚优惠券
        couponApi.returnUsedCoupon(order.getCouponId());

        // 4.回滚积分（抵扣的）
        addUserPoint(order.getUserId(), order.getUsePoint(), MemberPointBizTypeEnum.ORDER_CANCEL, order.getId());

        // TODO 芋艿：OrderLog

        // TODO 芋艿：lili 发送订单变化的消息
    }

    /**
     * 判断指定订单的所有订单项，是不是都售后成功
     *
     * @param id 订单编号
     * @return 是否都售后成功
     */
    private boolean isAllOrderItemAfterSaleSuccess(Long id) {
        List<TradeOrderItemDO> orderItems = tradeOrderItemMapper.selectListByOrderId(id);
        return orderItems.stream().allMatch(orderItem -> Objects.equals(orderItem.getAfterSaleStatus(),
                TradeOrderItemAfterSaleStatusEnum.SUCCESS.getStatus()));
    }

    @Async
    protected void addUserExperienceAsync(Long userId, Integer payPrice, Long orderId) {
        int bizType = MemberExperienceBizTypeEnum.ORDER.getType();
        memberLevelApi.addExperience(userId, payPrice, bizType, String.valueOf(orderId));
    }

    @Async
    protected void reduceUserExperienceAsync(Long userId, Integer refundPrice, Long afterSaleId) {
        int bizType = MemberExperienceBizTypeEnum.REFUND.getType();
        memberLevelApi.addExperience(userId, -refundPrice, bizType, String.valueOf(afterSaleId));
    }

    protected void addUserPoint(Long userId, Integer point, MemberPointBizTypeEnum bizType, Long bizId) {
        if (point != null && point > 0) {
            memberPointApi.addPoint(userId, point, bizType.getType(), String.valueOf(bizId));
        }
    }

    protected void reduceUserPoint(Long userId, Integer point, MemberPointBizTypeEnum bizType, Long bizId) {
        if (point != null && point > 0) {
            memberPointApi.reducePoint(userId, point, bizType.getType(), String.valueOf(bizId));
        }
    }

    @Async
    protected void addBrokerageAsync(Long userId, Long orderId) {
        MemberUserRespDTO user = memberUserApi.getUser(userId);
        Assert.notNull(user);

        List<TradeOrderItemDO> orderItems = tradeOrderItemMapper.selectListByOrderId(orderId);
        List<BrokerageAddReqBO> list = convertList(orderItems,
                item -> TradeOrderConvert.INSTANCE.convert(user, item, productSkuApi.getSku(item.getSkuId())));
        brokerageRecordService.addBrokerage(userId, BrokerageRecordBizTypeEnum.ORDER, list);
    }

    @Async
    protected void cancelBrokerageAsync(Long userId, Long orderItemId) {
        brokerageRecordService.cancelBrokerage(userId, BrokerageRecordBizTypeEnum.ORDER, String.valueOf(orderItemId));
    }

    /**
     * 获得自身的代理对象，解决 AOP 生效问题
     *
     * @return 自己
     */
    private TradeOrderUpdateServiceImpl getSelf() {
        return SpringUtil.getBean(getClass());
    }

}
