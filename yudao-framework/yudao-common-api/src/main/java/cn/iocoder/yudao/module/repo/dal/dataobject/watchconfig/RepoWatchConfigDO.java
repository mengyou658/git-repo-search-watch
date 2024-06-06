package cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig;

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
 * 参数配置 DO
 *
 * @author yunchao
 */
@TableName(value = "repo_watch_config", autoResultMap = true)
@KeySequence("repo_watch_config_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RepoWatchConfigDO extends BaseDO {

    /**
     * 参数主键
     */
    @TableId

    private Integer id;
    /**
     * 参数键名
     */

    private String configKey;
    /**
     * 参数键值
     */

    private String value;

    /**
     * ---------------额外数据---------------
     */

}
