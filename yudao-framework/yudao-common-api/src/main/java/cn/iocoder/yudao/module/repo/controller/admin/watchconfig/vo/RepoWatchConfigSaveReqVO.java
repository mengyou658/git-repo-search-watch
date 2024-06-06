package cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Schema(description = "管理后台 - 参数配置新增/修改 Request VO")
@Data
public class RepoWatchConfigSaveReqVO {

    @Schema(description = "参数主键", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    private Integer id;

    @Schema(description = "参数键名", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "参数键名不能为空")
    private String configKey;

    @Schema(description = "参数键值", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "参数键值不能为空")
    private String value;

    @Schema(description = "是否删除", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "是否删除不能为空")
    private Boolean deleted;

    /**
     * ---------------额外数据---------------
     */
}
