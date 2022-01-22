package cn.iocoder.yudao.adminserver.modules.bpm.controller.task.vo.task;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotEmpty;

@ApiModel("不通过流程任务的 Request VO")
@Data
public class BpmTaskRejectReqVO {

    @ApiModelProperty(value = "任务编号", required = true, example = "1024")
    @NotEmpty(message = "任务编号不能为空")
    private String id;

    @ApiModelProperty(value = "审批意见", required = true, example = "不错不错！")
    @NotEmpty(message = "审批意见不能为空")
    private String comment;

}
