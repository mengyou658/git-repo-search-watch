package cn.iocoder.yudao.module.trade.controller.admin.order.vo;

import cn.iocoder.yudao.framework.common.validation.InEnum;
import cn.iocoder.yudao.module.trade.enums.delivery.DeliveryTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Schema(description = "管理后台 - 订单发货 Request VO")
@Data
public class TradeOrderDeliveryReqVO {

    @Schema(description = "订单编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "1024")
    @NotNull(message = "订单编号不能为空")
    private Long id;

    // TODO @puhui999：可以去掉 type；如果无需发货，则 logisticsId 传递 0；logisticsNo 传递空串
    @Schema(description = "发货类型", requiredMode = Schema.RequiredMode.REQUIRED, example = "0")
    @InEnum(DeliveryTypeEnum.class)
    @NotNull(message = "发货类型不能为空")
    private Integer type;

    @Schema(description = "发货物流公司编号", example = "1")
    @NotNull(message = "发货物流公司不能为空")
    private Long logisticsId;

    @Schema(description = "发货物流单号", example = "SF123456789")
    @NotEmpty(message = "发货物流单号不能为空")
    private String logisticsNo;

}
