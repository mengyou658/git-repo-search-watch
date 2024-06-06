package cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo;

import cn.iocoder.yudao.framework.excel.core.annotations.DictFormat;
import cn.iocoder.yudao.framework.excel.core.convert.DictConvert;
import cn.iocoder.yudao.framework.excel.core.excel.annotation.ExcelField;
import cn.iocoder.yudao.framework.excel.core.excel.annotation.ExcelFields;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 仓库监控任务 Response VO")
@Data
@ExcelIgnoreUnannotated
public class RepoWatchTaskRespVO {

    @Schema(description = "ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    @ExcelProperty("ID")
    private Long id;

    @Schema(description = "名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "张三")
    @ExcelProperty("名称")
    private String name;

    @Schema(description = "仓库类型：0=GitHub，1=Gitee", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @ExcelProperty(value = "仓库类型", converter = DictConvert.class)
    @DictFormat("repo_watch_task_repo_type") // TODO 代码优化：建议设置到对应的 DictTypeConstants 枚举类中
    private Integer repoType;

    @Schema(description = "克隆类型：0=本地，1=阿里云Codeup", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @ExcelProperty(value = "克隆类型", converter = DictConvert.class)
    @DictFormat("repo_watch_task_clone_type") // TODO 代码优化：建议设置到对应的 DictTypeConstants 枚举类中
    private Integer cloneType;

    @Schema(description = "类型：0=搜索，1=趋势", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @ExcelProperty(value = "类型", converter = DictConvert.class)
    @DictFormat("repo_watch_task_type") // TODO 代码优化：建议设置到对应的 DictTypeConstants 枚举类中
    private Integer type;

    @Schema(description = "状态：0=启用，1=禁用", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @ExcelProperty(value = "状态", converter = DictConvert.class)
    @DictFormat("repo_watch_task_status") // TODO 代码优化：建议设置到对应的 DictTypeConstants 枚举类中
    private Integer status;

    @Schema(description = "运行状态：0=空闲中，1=运行中", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    @ExcelProperty(value = "运行状态", converter = DictConvert.class)
    @DictFormat("repo_watch_task_work_status") // TODO 代码优化：建议设置到对应的 DictTypeConstants 枚举类中
    private Integer workStatus;

    @Schema(description = "关键词", requiredMode = Schema.RequiredMode.REQUIRED)
    @ExcelProperty("关键词")
    private String keywords;

    @Schema(description = "开发语言：Go=Go,Rust=Rust,Javascript=Javascript,Vue=Vue,Uniapp=Uniapp")
    @ExcelProperty(value = "开发语言", converter = DictConvert.class)
    @DictFormat("repo_watch_task_keyword_lang") // TODO 代码优化：建议设置到对应的 DictTypeConstants 枚举类中
    private String keywordLang;

    @Schema(description = "排除关键词")
    @ExcelProperty("排除关键词")
    private String keywordNegative;

    @Schema(description = "仓库搜索数据限制")
    @ExcelProperty("仓库搜索数据限制")
    private Integer repoLimit;

    @Schema(description = "是否克隆仓库")
    @ExcelProperty(value = "是否克隆仓库", converter = DictConvert.class)
    @DictFormat("repo_watch_task_repo_clone_flag") // TODO 代码优化：建议设置到对应的 DictTypeConstants 枚举类中
    private Integer repoCloneFlag;

    @Schema(description = "仓库克隆路径")
    @ExcelProperty("仓库克隆路径")
    private String repoClonePath;

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
        @ExcelField(title="名称", attrName="name", align= ExcelField.Align.CENTER, sort=30),
            @ExcelField(title = "仓库类型", attrName = "repoType", align = ExcelField.Align.CENTER, dictType = "repo_watch_task_repo_type", sort = 60),
            @ExcelField(title = "克隆类型", attrName = "cloneType", align = ExcelField.Align.CENTER, dictType = "repo_watch_task_clone_type", sort = 90),
            @ExcelField(title = "类型", attrName = "type", align = ExcelField.Align.CENTER, dictType = "repo_watch_task_type", sort = 120),
            @ExcelField(title = "状态", attrName = "status", align = ExcelField.Align.CENTER, dictType = "repo_watch_task_status", sort = 150),
            @ExcelField(title = "运行状态", attrName = "workStatus", align = ExcelField.Align.CENTER, dictType = "repo_watch_task_work_status", sort = 180),
            @ExcelField(title = "关键词", attrName = "keywords", align = ExcelField.Align.CENTER, sort = 210),
            @ExcelField(title = "开发语言", attrName = "keywordLang", align = ExcelField.Align.CENTER, dictType = "repo_watch_task_keyword_lang", sort = 240),
            @ExcelField(title = "排除关键词", attrName = "keywordNegative", align = ExcelField.Align.CENTER, sort = 270),
            @ExcelField(title = "仓库搜索数据限制", attrName = "repoLimit", align = ExcelField.Align.CENTER, sort = 300),
            @ExcelField(title = "是否克隆仓库", attrName = "repoCloneFlag", align = ExcelField.Align.CENTER, dictType = "repo_watch_task_repo_clone_flag", sort = 330),
            @ExcelField(title = "仓库克隆路径", attrName = "repoClonePath", align = ExcelField.Align.CENTER, sort = 360),
            @ExcelField(title = "创建时间", attrName = "createTime", type = ExcelField.Type.EXPORT, dataFormat = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND, align = ExcelField.Align.CENTER, sort = 390),
            @ExcelField(title = "更新时间", attrName = "updateTime", type = ExcelField.Type.EXPORT, dataFormat = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND, align = ExcelField.Align.CENTER, sort = 420),
            @ExcelField(title = "创建者", attrName = "creator", align = ExcelField.Align.CENTER, sort = 450),
            @ExcelField(title = "更新者", attrName = "updater", align = ExcelField.Align.CENTER, sort = 480),
    })
    private void importExcel() {

    }

    /**
    * ---------------额外数据---------------
    */


}
