package com.yun.products.core2020.model;

import com.yun.products.core2020.annotations.BindEntity;
import lombok.Data;

@Data
public class QueryParam {

    private String queryJoinGroup = BindEntity.QueryGroup.DEFAULT;

}
