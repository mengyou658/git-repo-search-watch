package cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Schema(description = "管理后台 - 仓库监控结果新增/修改 Request VO")
@Data
public class RepoWatchResultSaveReqVO {

    @Schema(description = "ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    private Long id;

    @Schema(description = "任务ID：外键repo_watch_task.id.name.one2many.left", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    @NotNull(message = "任务ID不能为空")
    private Long taskId;

    @Schema(description = "仓库ID", example = "9999")
    private String repoId;

    @Schema(description = "仓库URL", example = "https://www.anfunqi.com")
    private String repoUrl;

    @Schema(description = "仓库SSHURL", example = "https://www.anfunqi.com")
    private String repoSshUrl;

    @Schema(description = "仓库开发语言")
    private String repoLang;

    @Schema(description = "仓库名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "张三")
    @NotEmpty(message = "仓库名称不能为空")
    private String repoName;

    @Schema(description = "仓库描述")
    private String repoDesc;

    @Schema(description = "仓库本地克隆")
    private String repoLocalClone;

    /**
     * ---------------额外数据---------------
     */
}
