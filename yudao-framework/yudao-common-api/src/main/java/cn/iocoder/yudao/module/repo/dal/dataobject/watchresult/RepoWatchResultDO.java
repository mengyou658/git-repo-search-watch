package cn.iocoder.yudao.module.repo.dal.dataobject.watchresult;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tangzc.mpe.bind.metadata.annotation.BindEntity;
import com.tangzc.mpe.bind.metadata.annotation.JoinCondition;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
 * 仓库监控结果 DO
 *
 * @author yunchao
 */
@TableName(value = "repo_watch_result", autoResultMap = true)
@KeySequence("repo_watch_result_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RepoWatchResultDO extends BaseDO {

    /**
     * ID
     */
    @TableId

    private Long id;
    /**
     * 任务ID：外键repo_watch_task.id.name.one2many.left
     */
    @TableField("task_id")

    private Long taskId;
    /**
     * 仓库ID
     */

    private String repoId;
    /**
     * 仓库URL
     */

    private String repoUrl;
    /**
     * 仓库SSHURL
     */

    private String repoSshUrl;
    /**
     * 仓库开发语言
     */

    private String repoLang;
    /**
     * 仓库名称
     */

    private String repoName;
    /**
     * 仓库描述
     */

    private String repoDesc;
    /**
     * 仓库本地克隆
     */

    private String repoLocalClone;

    /**
     * ---------------额外数据---------------
     */
    /**
     * 任务ID：外键repo_watch_task.id.name.one2many.left
     */
    @BindEntity(conditions = @JoinCondition(selfField = "taskId", joinField = "id"), selectFields = {"id", "name", "repoType", "cloneType", "type"})
    @TableField(exist = false)
    // @EntityMapping(thisField = "taskId", joinField = "id", select = {RepoWatchTaskBaseVO.Fields.id, RepoWatchTaskBaseVO.Fields.name})
    private RepoWatchTaskDO task;

}
