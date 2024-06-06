package cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo;

import cn.iocoder.yudao.framework.excel.core.excel.annotation.ExcelField;
import cn.iocoder.yudao.framework.excel.core.excel.annotation.ExcelFields;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskRespVO;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 仓库监控结果 Response VO")
@Data
@ExcelIgnoreUnannotated
public class RepoWatchResultRespVO {

    @Schema(description = "ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    @ExcelProperty("ID")
    private Long id;

    @Schema(description = "任务ID：外键repo_watch_task.id.name.one2many.left", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    @ExcelProperty("任务ID")
    private Long taskId;

    @Schema(description = "仓库ID", example = "9999")
    @ExcelProperty("仓库ID")
    private String repoId;

    @Schema(description = "仓库URL", example = "https://www.anfunqi.com")
    @ExcelProperty("仓库URL")
    private String repoUrl;

    @Schema(description = "仓库SSHURL", example = "https://www.anfunqi.com")
    @ExcelProperty("仓库SSHURL")
    private String repoSshUrl;

    @Schema(description = "仓库开发语言")
    @ExcelProperty("仓库开发语言")
    private String repoLang;

    @Schema(description = "仓库名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "张三")
    @ExcelProperty("仓库名称")
    private String repoName;

    @Schema(description = "仓库描述")
    @ExcelProperty("仓库描述")
    private String repoDesc;

    @Schema(description = "仓库本地克隆")
    @ExcelProperty("仓库本地克隆")
    private String repoLocalClone;

    @Schema(description = "创建时间", requiredMode = Schema.RequiredMode.REQUIRED)
    @ExcelProperty("创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime createTime;

    @Schema(description = "更新时间", requiredMode = Schema.RequiredMode.REQUIRED)
    @ExcelProperty("更新时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime updateTime;


    @ExcelFields({
        @ExcelField(title="ID", attrName="id", align= ExcelField.Align.CENTER, sort=0),
        @ExcelField(title="任务ID", attrName="taskId", align= ExcelField.Align.CENTER, sort=30),
        @ExcelField(title="仓库ID", attrName="repoId", align= ExcelField.Align.CENTER, sort=60),
        @ExcelField(title="仓库URL", attrName="repoUrl", align= ExcelField.Align.CENTER, sort=90),
            @ExcelField(title = "仓库SSHURL", attrName = "repoSshUrl", align = ExcelField.Align.CENTER, sort = 120),
            @ExcelField(title = "仓库开发语言", attrName = "repoLang", align = ExcelField.Align.CENTER, sort = 150),
            @ExcelField(title = "仓库名称", attrName = "repoName", align = ExcelField.Align.CENTER, sort = 180),
            @ExcelField(title = "仓库描述", attrName = "repoDesc", align = ExcelField.Align.CENTER, sort = 210),
            @ExcelField(title = "仓库本地克隆", attrName = "repoLocalClone", align = ExcelField.Align.CENTER, sort = 240),
            @ExcelField(title = "创建时间", attrName = "createTime", type = ExcelField.Type.EXPORT, dataFormat = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND, align = ExcelField.Align.CENTER, sort = 270),
            @ExcelField(title = "更新时间", attrName = "updateTime", type = ExcelField.Type.EXPORT, dataFormat = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND, align = ExcelField.Align.CENTER, sort = 300),
            @ExcelField(title = "创建者", attrName = "creator", align = ExcelField.Align.CENTER, sort = 330),
            @ExcelField(title = "更新者", attrName = "updater", align = ExcelField.Align.CENTER, sort = 360),
    })
    private void importExcel() {

    }

    /**
    * ---------------额外数据---------------
    */

    @Schema(description = "任务ID：外键repo_watch_task.id.name.one2many.left")
    private RepoWatchTaskRespVO task;

}
