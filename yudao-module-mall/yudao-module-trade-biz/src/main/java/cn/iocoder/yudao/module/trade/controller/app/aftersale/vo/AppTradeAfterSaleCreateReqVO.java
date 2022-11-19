package cn.iocoder.yudao.module.trade.controller.app.aftersale.vo;

import cn.iocoder.yudao.framework.common.validation.InEnum;
import cn.iocoder.yudao.module.trade.enums.aftersale.TradeAfterSaleWayEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;

@ApiModel("用户 App - 交易售后创建 Request VO")
@Data
public class AppTradeAfterSaleCreateReqVO {

    @ApiModelProperty(name = "订单项编号", required = true, example = "1024")
    @NotNull(message = "订单项编号不能为空")
    private Long orderItemId;

    @ApiModelProperty(name = "售后方式", required = true, example = "1", notes = "对应 TradeAfterSaleWayEnum 枚举")
    @NotNull(message = "售后方式不能为空")
    @InEnum(value = TradeAfterSaleWayEnum.class, message = "售后方式必须是 {value}")
    private Integer way;

    @ApiModelProperty(name = "退款金额", required = true, example = "100", notes = "单位：分")
    @NotNull(message = "退款金额不能为空")
    @Min(value = 1, message = "退款金额必须大于 0")
    private Integer refundPrice;

    @ApiModelProperty(name = "申请原因", required = true, example = "1", notes = "使用数据字典枚举，对应 trade_refund_apply_reason 类型")
    @NotNull(message = "申请原因不能为空")
    private String applyReason;

    @ApiModelProperty(name = "补充描述", example = "商品质量不好")
    private String applyDescription;

    @ApiModelProperty(name = "补充凭证图片", example = "https://www.iocoder.cn/1.png, https://www.iocoder.cn/2.png")
    private List<String> applyPicUrls;

}
