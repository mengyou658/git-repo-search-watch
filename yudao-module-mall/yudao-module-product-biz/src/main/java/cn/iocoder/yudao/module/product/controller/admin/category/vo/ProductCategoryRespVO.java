package cn.iocoder.yudao.module.product.controller.admin.category.vo;

import lombok.*;

import java.time.LocalDateTime;
import io.swagger.annotations.*;

@ApiModel("管理后台 - 商品分类 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ProductCategoryRespVO extends ProductCategoryBaseVO {

    @ApiModelProperty(value = "分类编号", required = true, example = "2")
    private Long id;

    @ApiModelProperty(value = "创建时间", required = true)
    private LocalDateTime createTime;

}
