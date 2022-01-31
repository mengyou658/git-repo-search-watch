package cn.iocoder.yudao.adminserver.modules.bpm.controller.definition.vo.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel("流程表单精简 Response VO")
@Data
public class BpmFormSimpleRespVO {

    @ApiModelProperty(value = "表单编号", required = true, example = "1024")
    private Long id;

    @ApiModelProperty(value = "表单名称", required = true, example = "芋道")
    private String name;

}
