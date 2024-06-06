package com.yun.products.core2020.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author Zheng Jie
 * @date 2019-6-4 13:52:30
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Query {

    /**
     * 字段名称，尽量使用
     * @return
     */
    String[] propName() default {};

    /**
     *  请使用propName和like类型
     * @return
     */
    @Deprecated
    String blurry() default "";
    String separator() default "";
    Type type() default Type.EQ;

    enum Type {
        // jie 2019/6/4 相等
        EQ
        // Dong ZhaoYang 2017/8/7 大于等于
        , GT
        // Dong ZhaoYang 2017/8/7 小于等于
        , LT
        , GE
        // Dong ZhaoYang 2017/8/7 小于等于
        , LE
        // Dong ZhaoYang 2017/8/7 中模糊查询
        , LIKE
        ,NOT_LIKE
        // Dong ZhaoYang 2017/8/7 左模糊查询
        , LIKE_LEFT
        // Dong ZhaoYang 2017/8/7 右模糊查询
        , LIKE_RIGHT
        // jie 2019/6/4 包含
        , IN
        ,NOT_IN
        // 不等于
        , NE
        // between
        ,BETWEEN
        // 不为空
        , IS_NOT_NULL
        // 为空
        ,IS_NULL
        // 不为空
        , IS_NOT_NULL_AND_NOT_EMPTY
        // 为空
        ,IS_NULL_OR_EMPTY
    }

}

