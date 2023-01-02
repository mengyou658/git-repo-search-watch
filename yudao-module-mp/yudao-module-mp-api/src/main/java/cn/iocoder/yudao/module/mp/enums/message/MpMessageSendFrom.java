package cn.iocoder.yudao.module.mp.enums.message;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 微信公众号消息的发送来源
 *
 * @author 芋道源码
 */
@Getter
@AllArgsConstructor
public enum MpMessageSendFrom {

    USER_TO_MP(1, "用户发送给公众号"),
    MP_TO_USER(2, "公众号发给用户"),
    ;

    /**
     * 来源
     */
    private final Integer from;
    /**
     * 来源的名字
     */
    private final String name;

}
