package cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.ToString;

@Schema(description = "管理后台 - 仓库监控任务更新状态 Request VO")
@Data
@ToString(callSuper = true)
public class RepoWatchTaskUpdateStatusReqVO {

        @Schema(description = "ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
        @NotNull(message = "ID不能为空")
        private Long id;

        @Schema(description = "仓库类型：0=GitHub，1=Gitee", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
        private Integer repoType;

        @Schema(description = "克隆类型：0=本地，1=阿里云Codeup", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
        private Integer cloneType;

        @Schema(description = "类型：0=搜索，1=趋势", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
        private Integer type;

        @Schema(description = "状态：0=启用，1=禁用", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
        private Integer status;

        @Schema(description = "运行状态：0=空闲中，1=运行中", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
        private Integer workStatus;

        @Schema(description = "开发语言：Go=Go,Rust=Rust,Javascript=Javascript,Vue=Vue,Uniapp=Uniapp")
        private String keywordLang;

        @Schema(description = "排除关键词")
        private String keywordNegative;

        @Schema(description = "是否克隆仓库")
        private Integer repoCloneFlag;


        /**
        * ---------------额外数据---------------
        */

}
