package cn.iocoder.yudao.adminserver.modules.bpm.controller.definition.vo.rule;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import java.util.Set;

@ApiModel("流程任务分配规则的更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class BpmTaskAssignRuleUpdateReqVO extends BpmTaskAssignRuleBaseVO {

    @ApiModelProperty(value = "任务分配规则的编号", required = true, example = "1024")
    @NotNull(message = "任务分配规则的编号不能为空")
    private Long id;

}
