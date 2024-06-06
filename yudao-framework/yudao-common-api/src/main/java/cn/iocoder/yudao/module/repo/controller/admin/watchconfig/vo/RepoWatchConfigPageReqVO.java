package cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yun.products.core2020.annotations.Query;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;


@Schema(description = "管理后台 - 参数配置分页 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class RepoWatchConfigPageReqVO extends PageParam {

    @Schema(description = "模糊查询")
    // @Query(propName = {"name", "id"}, type = Query.Type.LIKE)
    private String query;

    @Query(propName = RepoWatchConfigBaseVO.Fields.id, type = Query.Type.EQ)
    @Schema(description = "参数主键", example = "9999")
    private Integer id;

    @Query(propName = RepoWatchConfigBaseVO.Fields.configKey, type = Query.Type.LIKE)
    @Schema(description = "参数键名")
    private String configKey;

    @Query(propName = RepoWatchConfigBaseVO.Fields.value, type = Query.Type.LIKE)
    @Schema(description = "参数键值")
    private String value;

    @Query(propName = RepoWatchConfigBaseVO.Fields.creator, type = Query.Type.LIKE)
    @Schema(description = "创建者")
    private String creator;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @Query(propName = RepoWatchConfigBaseVO.Fields.createTime, type = Query.Type.BETWEEN)
    @Schema(description = "创建时间")
    private LocalDateTime[] createTime;

    @Query(propName = RepoWatchConfigBaseVO.Fields.updater, type = Query.Type.LIKE)
    @Schema(description = "更新者")
    private String updater;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @Query(propName = RepoWatchConfigBaseVO.Fields.updateTime, type = Query.Type.BETWEEN)
    @Schema(description = "更新时间")
    private LocalDateTime[] updateTime;

    /**
     * ---------------额外数据---------------
     */

}
