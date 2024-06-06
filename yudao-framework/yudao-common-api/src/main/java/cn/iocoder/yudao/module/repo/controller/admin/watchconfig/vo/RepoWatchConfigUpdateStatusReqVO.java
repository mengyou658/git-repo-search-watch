package cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.ToString;

@Schema(description = "管理后台 - 参数配置更新状态 Request VO")
@Data
@ToString(callSuper = true)
public class RepoWatchConfigUpdateStatusReqVO {

    @Schema(description = "参数主键", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    @NotNull(message = "参数主键不能为空")
    private Integer id;

    @Schema(description = "是否删除", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean deleted;

    /**
     * ---------------额外数据---------------
     */

}
