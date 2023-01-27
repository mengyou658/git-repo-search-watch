package cn.iocoder.yudao.module.product.controller.admin.property.vo.property;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.ToString;

@ApiModel("管理后台 - 属性项 List Request VO")
@Data
@ToString(callSuper = true)
public class ProductPropertyListReqVO {

    @ApiModelProperty(value = "名称", example = "颜色")
    private String name;

}
