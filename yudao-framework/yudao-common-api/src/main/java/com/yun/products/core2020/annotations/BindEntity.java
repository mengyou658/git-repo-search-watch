package com.yun.products.core2020.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Repeatable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author Zheng Jie
 * @date 2019-6-4 13:52:30
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Repeatable(value = BindEntityList.class)
public @interface BindEntity {
    /***
     * 关联查询对应的Entity类
     * @return
     */
    Class<?> value() ;

    /***
     * 关联查询表别名
     * @return
     */
    String tableAlias();

    /**
     * 用来区分不同的查询，例如两个查询查询的数据字段可能有区别，就写两个
     * @return
     */
    String[] queryJoinGroup() default QueryGroup.DEFAULT;

    /***
     * 绑定字段
     * @return
     */
    String[] queryFields();

    /***
     * JOIN连接条件
     * @return
     */
    String joinCondition() ;

    /***
     * JOIN连接条件
     * @return
     */
    String extraWhere() default "" ;

    /***
     * JOIN连接条件
     * @return
     */
    Join joinType() default Join.LEFT;

    /**
     * @author Zheng Jie
     * 适用于简单连接查询，复杂的请自定义该注解，或者使用sql查询
     */
    enum Join {
        /** jie 2019-6-4 13:18:30 */
        LEFT, RIGHT, INNER
    }

    interface QueryGroup {
        String DEFAULT = "default";
        String DEFAULT_ALL = "defaultAll";
    }

}

