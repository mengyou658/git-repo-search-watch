package com.yun.products.core2020.model;


import com.yun.products.core2020.annotations.BindEntity;
import lombok.Builder;
import lombok.Data;

import java.lang.reflect.Field;

@Data
@Builder
public class BindEntityInfo {

    private BindEntity bindEntity;

    private Field field;

    private String group;
}
