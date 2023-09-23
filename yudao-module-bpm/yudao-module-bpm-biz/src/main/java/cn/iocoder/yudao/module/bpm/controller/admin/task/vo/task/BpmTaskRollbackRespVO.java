package cn.iocoder.yudao.module.bpm.controller.admin.task.vo.task;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 *
 */
@Schema(description = "管理后台 - 流程任务的 可回退的节点 Response VO")
@Data
public class BpmTaskRollbackRespVO {

    @Schema(description = "任务定义的标识", requiredMode = Schema.RequiredMode.REQUIRED, example = "Activity_one")
    private String taskDefinitionKey;

    @Schema(description = "任务名词", requiredMode = Schema.RequiredMode.REQUIRED, example = "经理审批")
    private String name;
}
