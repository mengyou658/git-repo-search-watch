package cn.iocoder.yudao.module.trade.controller.app.order.vo;

import cn.iocoder.yudao.module.trade.controller.app.order.vo.item.AppTradeOrderItemRespVO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Schema(description = "用户 App - 订单交易的明细 Response VO")
@Data
public class AppTradeOrderDetailRespVO {

    // ========== 订单基本信息 ==========

    @Schema(description = "订单编号", required = true, example = "1024")
    private Long id;

    @Schema(description = "订单流水号", required = true, example = "1146347329394184195")
    private String no;

    @Schema(description = "下单时间", required = true)
    private Date createTime;

    @Schema(description = "用户备注", required = true, example = "你猜")
    private String userRemark;

    @Schema(description = "订单状态", required = true, example = "1")
    private Integer status;

    @Schema(description = "购买的商品数量", required = true, example = "10")
    private Integer productCount;

    @Schema(description = "订单完成时间")
    private LocalDateTime finishTime;

    @Schema(description = "订单取消时间")
    private LocalDateTime cancelTime;

    @Schema(description = "是否评价", required = true, example = "true")
    private Boolean commentStatus;

    // ========== 价格 + 支付基本信息 ==========

    @Schema(description = "是否已支付", required = true, example = "true")
    private Boolean payed;

    @Schema(description = "支付订单编号", required = true, example = "1024")
    private Long payOrderId;

    @Schema(description = "付款时间")
    private LocalDateTime payTime;

    @Schema(description = "付款超时时间", required = true)
    private LocalDateTime payExpireTime;

    @Schema(description = "支付渠道", required = true, example = "wx_lite_pay")
    private String payChannelCode;

    @Schema(description = "商品原价（总）", required = true, example = "1000")
    private Integer totalPrice;

    @Schema(description = "订单优惠（总）", required = true, example = "100")
    private Integer discountPrice;

    @Schema(description = "运费金额", required = true, example = "100")
    private Integer deliveryPrice;

    @Schema(description = "订单调价（总）", required = true, example = "100")
    private Integer adjustPrice;

    @Schema(description = "应付金额（总）", required = true, example = "1000")
    private Integer payPrice;

    // ========== 收件 + 物流基本信息 ==========

    @Schema(description = "配送方式", required = true, example = "1")
    private Integer deliveryType;

    @Schema(description = "发货物流单号", example = "1024")
    private String logisticsNo;

    @Schema(description = "发货时间")
    private LocalDateTime deliveryTime;

    @Schema(description = "收货时间")
    private LocalDateTime receiveTime;

    @Schema(description = "收件人名称", required = true, example = "张三")
    private String receiverName;

    @Schema(description = "收件人手机", required = true, example = "13800138000")
    private String receiverMobile;

    @Schema(description = "收件人地区编号", required = true, example = "110000")
    private Integer receiverAreaId;

    @Schema(description = "收件人地区名字", required = true, example = "上海 上海市 普陀区")
    private String receiverAreaName;

    @Schema(description = "收件人详细地址", required = true, example = "中关村大街 1 号")
    private String receiverDetailAddress;

    // ========== 售后基本信息 ==========

    // ========== 营销基本信息 ==========

    @Schema(description = "优惠劵编号", example = "1024")
    private Long couponId;

    @Schema(description = "优惠劵减免金额", required = true, example = "100")
    private Integer couponPrice;

    @Schema(description = "积分抵扣的金额", required = true, example = "100")
    private Integer pointPrice;

    /**
     * 订单项数组
     */
    private List<AppTradeOrderItemRespVO> items;

}
