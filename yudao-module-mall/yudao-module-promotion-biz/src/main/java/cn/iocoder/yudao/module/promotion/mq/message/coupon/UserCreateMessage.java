package cn.iocoder.yudao.module.promotion.mq.message.coupon;

import cn.iocoder.yudao.framework.mq.core.stream.AbstractStreamMessage;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 会员用户创建消息
 *
 * @author owen
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserCreateMessage extends AbstractStreamMessage {

    /**
     * 用户编号
     */
    @NotNull(message = "用户编号不能为空")
    private Long userId;

    @Override
    public String getStreamKey() {
        return "member.user.create";
    }

}
