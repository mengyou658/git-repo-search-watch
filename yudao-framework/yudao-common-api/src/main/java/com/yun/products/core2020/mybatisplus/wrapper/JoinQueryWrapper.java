package com.yun.products.core2020.mybatisplus.wrapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.Data;

@Data
public class JoinQueryWrapper<T> extends QueryWrapper<T> {

    /**
     * select 片段
     */
    protected String sqlSelectJoin;

    /**
     * from 片段
     */
    protected String sqlFromJoin;

    /**
     * 附加查询条件
     */
    protected String extraWhere;

    // 原始查询条件
    protected Object extraParam;

    @Override
    public void clear() {
        super.clear();
        sqlSelectJoin = null;
        sqlFromJoin = null;
        extraWhere = null;
        extraParam = null;
    }


}
