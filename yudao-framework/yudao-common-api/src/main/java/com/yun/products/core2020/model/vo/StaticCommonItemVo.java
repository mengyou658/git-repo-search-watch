package com.yun.products.core2020.model.vo;

import lombok.Data;

@Data
public class StaticCommonItemVo {

    private String title;

    private String icon;

    private Double count;

    public StaticCommonItemVo(String title, Double count) {
        this.title = title;
        this.count = count;
    }

    public StaticCommonItemVo(String title, Double count, String icon) {
        this.title = title;
        this.count = count;
        this.icon = icon;
    }

}
