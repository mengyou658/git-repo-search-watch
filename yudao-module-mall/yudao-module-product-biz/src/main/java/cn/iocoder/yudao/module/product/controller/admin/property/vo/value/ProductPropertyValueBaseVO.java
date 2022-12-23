package cn.iocoder.yudao.module.product.controller.admin.property.vo.value;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
* 规格值 Base VO，提供给添加、修改、详细的子 VO 使用
* 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
*/
@Data
public class ProductPropertyValueBaseVO {

    @ApiModelProperty(value = "规格编号", required = true, example = "1024")
    @NotNull(message = "规格编号不能为空")
    private Long propertyId;

    @ApiModelProperty(value = "规格值名字", required = true, example = "红色")
    @NotEmpty(message = "规格值名字不能为空")
    private String name;

    @ApiModelProperty(value = "状态", required = true, example = "1", notes = "参见 CommonStatusEnum 枚举")
    @NotNull(message = "状态不能为空")
    private Integer status;

    @ApiModelProperty(value = "备注", example = "颜色")
    private String remark;

}
