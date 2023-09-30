package cn.iocoder.yudao.module.pay.controller.app.wallet.vo.recharge;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.Min;

@Schema(description = "用户 APP - 创建钱包充值 Request VO")
@Data
public class AppPayWalletRechargeCreateReqVO {

    @Schema(description = "支付金额", requiredMode = Schema.RequiredMode.REQUIRED, example = "1000")
//    @NotNull(message = "支付金额不能为空")
    @Min(value = 1,  message = "支付金额必须大于零")
    private Integer payPrice;

    // TODO @jason：这个是不是后端计算出来呀？不然前端可以直接搞了。。。
    // TOTO 那是不是搞一个充值模板
    @Schema(description = "钱包赠送金额", requiredMode = Schema.RequiredMode.REQUIRED, example = "1000")
//    @NotNull(message = "钱包赠送金额不能为空")
//    @DecimalMin(value = "0",  message = "钱包赠送金额必须大于等于零")
    private Integer bonusPrice = 0;

    @Schema(description = "充值套餐编号", example = "1024")
    private Long packageId;

    // TODO @jason：可以改成 payPrice 和 packageId 两个至少一个不为空；

}
