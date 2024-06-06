package cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo;

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

@Schema(description = "管理后台 - 参数配置 Response VO")
@Data
@ExcelIgnoreUnannotated
public class RepoWatchConfigRespVO {

    @Schema(description = "参数主键", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
    @ExcelProperty("参数主键")
    private Integer id;

    @Schema(description = "参数键名", requiredMode = Schema.RequiredMode.REQUIRED)
    @ExcelProperty("参数键名")
    private String configKey;

    @Schema(description = "参数键值", requiredMode = Schema.RequiredMode.REQUIRED)
    @ExcelProperty("参数键值")
    private String value;

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
            @ExcelField(title = "参数主键", attrName = "id", align = ExcelField.Align.CENTER, sort = 0),
            @ExcelField(title = "参数键名", attrName = "configKey", align = ExcelField.Align.CENTER, sort = 30),
            @ExcelField(title = "参数键值", attrName = "value", align = ExcelField.Align.CENTER, sort = 60),
            @ExcelField(title = "创建者", attrName = "creator", align = ExcelField.Align.CENTER, sort = 90),
            @ExcelField(title = "创建时间", attrName = "createTime", type = ExcelField.Type.EXPORT, dataFormat = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND, align = ExcelField.Align.CENTER, sort = 120),
            @ExcelField(title = "更新者", attrName = "updater", align = ExcelField.Align.CENTER, sort = 150),
            @ExcelField(title = "更新时间", attrName = "updateTime", type = ExcelField.Type.EXPORT, dataFormat = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND, align = ExcelField.Align.CENTER, sort = 180),
    })
    private void importExcel() {

    }

    /**
     * ---------------额外数据---------------
     */


}
