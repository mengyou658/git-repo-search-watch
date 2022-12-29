package cn.iocoder.yudao.module.product.controller.admin.spu.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.time.LocalDateTime;

@ApiModel("管理后台 - 商品 SPU Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ProductSpuRespVO extends ProductSpuBaseVO {

    @ApiModelProperty(value = "主键", required = true, example = "1")
    private Long id;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    // ========== SKU 相关字段 =========

    @ApiModelProperty(value = "库存", required = true, example = "true")
    private Integer totalStock;

    @ApiModelProperty(value = " 最小价格，单位使用：分", required = true, example = "1024")
    private Integer minPrice;

    @ApiModelProperty(value = "最大价格，单位使用：分", required = true, example = "1024")
    private Integer maxPrice;

    @ApiModelProperty(value = "商品销量", example = "1024")
    private Integer salesCount;

    // ========== 统计相关字段 =========

    @ApiModelProperty(value = "点击量", example = "1024")
    private Integer clickCount;
}
