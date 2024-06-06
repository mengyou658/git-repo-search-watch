package com.yun.products.core2020.model;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.Data;

@Data
public class QueryDto<T> {

    private QueryWrapper<T> ew;

    private StringBuffer selectBody;

    private StringBuffer fromBody;

}
