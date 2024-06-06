package cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo;

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


@Schema(description = "管理后台 - 仓库监控任务分页 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class RepoWatchTaskPageReqVO extends PageParam {

    @Schema(description = "模糊查询")
    // @Query(propName = {"name", "id"}, type = Query.Type.LIKE)
    private String query;

    @Query(propName = RepoWatchTaskBaseVO.Fields.id, type = Query.Type.EQ)
    @Schema(description = "ID", example = "9999")
    private Long id;

    @Query(propName = RepoWatchTaskBaseVO.Fields.name, type = Query.Type.LIKE)
    @Schema(description = "名称", example = "张三")
    private String name;

    @Query(propName = RepoWatchTaskBaseVO.Fields.repoType, type = Query.Type.EQ)
    @Schema(description = "仓库类型：0=GitHub，1=Gitee", example = "1")
    private Integer repoType;

    @Query(propName = RepoWatchTaskBaseVO.Fields.cloneType, type = Query.Type.EQ)
    @Schema(description = "克隆类型：0=本地，1=阿里云Codeup", example = "1")
    private Integer cloneType;

    @Query(propName = RepoWatchTaskBaseVO.Fields.type, type = Query.Type.EQ)
    @Schema(description = "类型：0=搜索，1=趋势", example = "1")
    private Integer type;

    @Query(propName = RepoWatchTaskBaseVO.Fields.status, type = Query.Type.EQ)
    @Schema(description = "状态：0=启用，1=禁用", example = "1")
    private Integer status;

    @Query(propName = RepoWatchTaskBaseVO.Fields.workStatus, type = Query.Type.EQ)
    @Schema(description = "运行状态：0=空闲中，1=运行中", example = "1")
    private Integer workStatus;

    @Query(propName = RepoWatchTaskBaseVO.Fields.keywords, type = Query.Type.LIKE)
    @Schema(description = "关键词")
    private String keywords;

    @Query(propName = RepoWatchTaskBaseVO.Fields.keywordLang, type = Query.Type.LIKE)
    @Schema(description = "开发语言：Go=Go,Rust=Rust,Javascript=Javascript,Vue=Vue,Uniapp=Uniapp")
    private String keywordLang;

    @Query(propName = RepoWatchTaskBaseVO.Fields.keywordNegative, type = Query.Type.LIKE)
    @Schema(description = "排除关键词")
    private String keywordNegative;

    @Query(propName = RepoWatchTaskBaseVO.Fields.repoLimit, type = Query.Type.EQ)
    @Schema(description = "仓库搜索数据限制")
    private Integer repoLimit;

    @Query(propName = RepoWatchTaskBaseVO.Fields.repoCloneFlag, type = Query.Type.EQ)
    @Schema(description = "是否克隆仓库")
    private Integer repoCloneFlag;

    @Query(propName = RepoWatchTaskBaseVO.Fields.repoClonePath, type = Query.Type.LIKE)
    @Schema(description = "仓库克隆路径")
    private String repoClonePath;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @Query(propName = RepoWatchTaskBaseVO.Fields.createTime, type = Query.Type.BETWEEN)
    @Schema(description = "创建时间")
    private LocalDateTime[] createTime;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @Query(propName = RepoWatchTaskBaseVO.Fields.updateTime, type = Query.Type.BETWEEN)
    @Schema(description = "更新时间")
    private LocalDateTime[] updateTime;

    @Query(propName = RepoWatchTaskBaseVO.Fields.creator, type = Query.Type.LIKE)
    @Schema(description = "创建者")
    private String creator;

    @Query(propName = RepoWatchTaskBaseVO.Fields.updater, type = Query.Type.LIKE)
    @Schema(description = "更新者")
    private String updater;

    /**
    * ---------------额外数据---------------
    */

}
