package cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.yun.products.core2020.annotations.Query;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.List;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;


@Schema(description = "管理后台 - 仓库监控结果分页 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class RepoWatchResultPageReqVO extends PageParam {

    @Schema(description = "模糊查询")
    @Query(propName = {RepoWatchResultBaseVO.Fields.repoLang, RepoWatchResultBaseVO.Fields.repoName, RepoWatchResultBaseVO.Fields.repoDesc}, type = Query.Type.LIKE)
    private String query;

    @Query(propName = RepoWatchResultBaseVO.Fields.id, type = Query.Type.EQ)
    @Schema(description = "ID", example = "9999")
    private Long id;

    @Query(propName = RepoWatchResultBaseVO.Fields.taskId, type = Query.Type.EQ)
    @Schema(description = "任务ID：外键repo_watch_task.id.name.one2many.left", example = "9999")
    private Long taskId;

    @Query(propName = RepoWatchResultBaseVO.Fields.taskId, type = Query.Type.IN)
    private List<Long> taskIds;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoId, type = Query.Type.EQ)
    @Schema(description = "仓库ID", example = "9999")
    private String repoId;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoUrl, type = Query.Type.LIKE)
    @Schema(description = "仓库URL", example = "https://www.anfunqi.com")
    private String repoUrl;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoSshUrl, type = Query.Type.LIKE)
    @Schema(description = "仓库SSHURL", example = "https://www.anfunqi.com")
    private String repoSshUrl;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoLang, type = Query.Type.LIKE)
    @Schema(description = "仓库开发语言")
    private String repoLang;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoLang, type = Query.Type.IS_NULL_OR_EMPTY)
    private Boolean repoLangEmpty;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoName, type = Query.Type.LIKE)
    @Schema(description = "仓库名称", example = "张三")
    private String repoName;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoDesc, type = Query.Type.LIKE)
    @Schema(description = "仓库描述")
    private String repoDesc;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoDesc, type = Query.Type.IS_NULL_OR_EMPTY)
    private Boolean repoDescEmpty;

    @Query(propName = RepoWatchResultBaseVO.Fields.repoLocalClone, type = Query.Type.LIKE)
    @Schema(description = "仓库本地克隆")
    private String repoLocalClone;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @Query(propName = RepoWatchResultBaseVO.Fields.createTime, type = Query.Type.BETWEEN)
    @Schema(description = "创建时间")
    private LocalDateTime[] createTime;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @JsonFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @Query(propName = RepoWatchResultBaseVO.Fields.updateTime, type = Query.Type.BETWEEN)
    @Schema(description = "更新时间")
    private LocalDateTime[] updateTime;

    @Query(propName = RepoWatchResultBaseVO.Fields.creator, type = Query.Type.LIKE)
    @Schema(description = "创建者")
    private String creator;

    @Query(propName = RepoWatchResultBaseVO.Fields.updater, type = Query.Type.LIKE)
    @Schema(description = "更新者")
    private String updater;

    /**
    * ---------------额外数据---------------
    */

}
