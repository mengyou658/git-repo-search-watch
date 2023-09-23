package cn.iocoder.yudao.module.bpm.controller.admin.task.vo.task;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotEmpty;

@Schema(description = "管理后台 - 回退流程任务的 Request VO")
@Data
public class BpmTaskRollbackReqVO {

    @Schema(description = "任务编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "1024")
    @NotEmpty(message = "任务编号不能为空")
    private String id;

    @Schema(description = "回退到的任务Key", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @NotEmpty(message = "回退到的任务Key不能为空")
    private String targetDefinitionKey;

    @Schema(description = "回退意见")
    private String reason;

}
