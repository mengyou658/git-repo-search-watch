package com.yun.products.core2020.mybatisplus.wrapper;

import lombok.Data;

@Data
public class JoinInfo {

    /**
     * left, right, inner
     */
    private String joinType;

    protected String selectSegment;
    protected String onSegment;
    protected String extraWhere;


}
