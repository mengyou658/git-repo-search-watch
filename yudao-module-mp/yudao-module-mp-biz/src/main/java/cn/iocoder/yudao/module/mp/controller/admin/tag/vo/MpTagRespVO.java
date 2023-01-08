package cn.iocoder.yudao.module.mp.controller.admin.tag.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.Date;

@ApiModel("管理后台 - 公众号标签 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class MpTagRespVO extends MpTagBaseVO {

    @ApiModelProperty(value = "编号", required = true, example = "1024")
    private Long id;

    @ApiModelProperty(value = "此标签下粉丝数量", required = true, example = "0")
    private Integer count;

    @ApiModelProperty(value = "创建时间", required = true)
    private Date createTime;

}
