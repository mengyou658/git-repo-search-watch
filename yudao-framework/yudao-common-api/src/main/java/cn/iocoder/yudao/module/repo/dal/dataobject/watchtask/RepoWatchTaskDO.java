package cn.iocoder.yudao.module.repo.dal.dataobject.watchtask;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
 * 仓库监控任务 DO
 *
 * @author yunchao
 */
@TableName(value = "repo_watch_task", autoResultMap = true)
@KeySequence("repo_watch_task_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RepoWatchTaskDO extends BaseDO {

    /**
     * ID
     */
    @TableId

    private Long id;
    /**
     * 名称
     */

    private String name;
    /**
     * 仓库类型：0=GitHub，1=Gitee
     *
     * 枚举 {TODO repo_watch_task_repo_type 对应的类}
     */

    private Integer repoType;
    /**
     * 克隆类型：0=本地，1=阿里云Codeup
     *
     * 枚举 {TODO repo_watch_task_clone_type 对应的类}
     */

    private Integer cloneType;
    /**
     * 类型：0=搜索，1=趋势
     *
     * 枚举 {TODO repo_watch_task_type 对应的类}
     */

    private Integer type;
    /**
     * 状态：0=启用，1=禁用
     *
     * 枚举 {TODO repo_watch_task_status 对应的类}
     */

    private Integer status;
    /**
     * 运行状态：0=空闲中，1=运行中
     *
     * 枚举 {TODO repo_watch_task_work_status 对应的类}
     */

    private Integer workStatus;
    /**
     * 关键词
     */

    private String keywords;
    /**
     * 开发语言：Go=Go,Rust=Rust,Javascript=Javascript,Vue=Vue,Uniapp=Uniapp
     *
     * 枚举 {TODO repo_watch_task_keyword_lang 对应的类}
     */

    private String keywordLang;
    /**
     * 排除关键词
     */

    private String keywordNegative;
    /**
     * 仓库搜索数据限制
     */

    private Integer repoLimit;
    /**
     * 是否克隆仓库
     *
     * 枚举 {TODO repo_watch_task_repo_clone_flag 对应的类}
     */

    private Integer repoCloneFlag;
    /**
     * 仓库克隆路径
     */

    private String repoClonePath;

    /**
     * ---------------额外数据---------------
     */

}
