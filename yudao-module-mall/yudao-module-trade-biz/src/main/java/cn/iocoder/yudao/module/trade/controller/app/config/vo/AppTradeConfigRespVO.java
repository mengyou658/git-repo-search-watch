package cn.iocoder.yudao.module.trade.controller.app.config.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Schema(description = "用户 App - 交易配置 Response VO")
@Data
public class AppTradeConfigRespVO {

    @Schema(description = "分销海报地址数组", requiredMode = Schema.RequiredMode.REQUIRED)
    private List<String> brokeragePosterUrls;

    @Schema(description = "佣金冻结时间（天）", requiredMode = Schema.RequiredMode.REQUIRED, example = "10")
    private Integer brokerageFrozenDays;

    @Schema(description = "佣金提现最小金额，单位：分", requiredMode = Schema.RequiredMode.REQUIRED, example = "100")
    private Integer brokerageWithdrawMinPrice;

    // TODO @疯狂：如果是 list，要不加个 s，复数；
    @Schema(description = "提现方式", requiredMode = Schema.RequiredMode.REQUIRED, example = "[1, 2]")
    private List<Integer> brokerageWithdrawType;

}
