package cn.iocoder.yudao.framework.desensitize.core.regex.annotation;

import cn.iocoder.yudao.framework.desensitize.core.base.annotation.Desensitize;
import cn.iocoder.yudao.framework.desensitize.core.regex.handler.EmailDesensitizationHandler;
import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 邮箱
 */
@Documented
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@JacksonAnnotationsInside
@Desensitize(desensitizationBy = EmailDesensitizationHandler.class)
public @interface EmailDesensitize {
    /**
     * 匹配的正则表达式
     */
    String regex() default  "(^.)[^@]*(@.*$)";

    /**
     * 替换规则，邮箱;比如：example@gmail.com脱敏之后为e****@gmail.com
     */
    String replacer() default "$1****$2";
}
