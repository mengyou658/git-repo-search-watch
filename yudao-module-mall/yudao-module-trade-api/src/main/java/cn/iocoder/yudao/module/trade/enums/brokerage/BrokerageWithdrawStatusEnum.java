package cn.iocoder.yudao.module.trade.enums.brokerage;

import cn.iocoder.yudao.framework.common.core.IntArrayValuable;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;

/**
 * 佣金提现状态枚举
 *
 * @author owen
 */
@AllArgsConstructor
@Getter
public enum BrokerageWithdrawStatusEnum implements IntArrayValuable {

    AUDITING(0, "审核中"),
    AUDIT_SUCCESS(10, "审核通过"),
    WITHDRAW_SUCCESS(11, "提现成功"),
    AUDIT_FAIL(20, "审核不通过"),
    WITHDRAW_FAIL(21, "提现失败"),
    ;

    // TODO @疯狂：字典现在枚举在每个模块的 DictTypeConstants 里哈；可以创建一个出来；主要是想，治理每个模块到底有多少个枚举；
    public static final String DICT_TYPE = "BROKERAGE_WITHDRAW_STATUS";

    public static final int[] ARRAYS = Arrays.stream(values()).mapToInt(BrokerageWithdrawStatusEnum::getStatus).toArray();

    /**
     * 状态
     */
    private final Integer status;
    /**
     * 名字
     */
    private final String name;

    @Override
    public int[] array() {
        return ARRAYS;
    }

}
