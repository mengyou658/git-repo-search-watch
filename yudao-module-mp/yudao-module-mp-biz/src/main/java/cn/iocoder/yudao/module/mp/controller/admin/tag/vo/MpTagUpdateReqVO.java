package cn.iocoder.yudao.module.mp.controller.admin.tag.vo;

import lombok.*;
import io.swagger.annotations.*;

import javax.validation.constraints.*;

@ApiModel("管理后台 - 公众号标签更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class MpTagUpdateReqVO extends MpTagBaseVO {

    @ApiModelProperty(value = "编号", required = true)
    @NotNull(message = "编号不能为空")
    private Long id;

}
