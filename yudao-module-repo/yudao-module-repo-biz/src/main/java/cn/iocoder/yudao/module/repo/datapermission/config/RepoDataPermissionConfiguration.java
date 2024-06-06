package cn.iocoder.yudao.module.repo.datapermission.config;

import cn.iocoder.yudao.framework.datapermission.core.rule.dept.DeptDataPermissionRuleCustomizer;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig.RepoWatchConfigDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * system 模块的数据权限 Configuration
 *
 * @author 芋道源码
 */
@Configuration(proxyBeanMethods = false)
public class RepoDataPermissionConfiguration {

    @Bean
    public DeptDataPermissionRuleCustomizer repoDataPermissionRuleCustomizer() {
        return rule -> {
            // user
            rule.addUserColumn(RepoWatchTaskDO.class, "creator");
            rule.addUserColumn(RepoWatchResultDO.class, "creator");
            rule.addUserColumn(RepoWatchConfigDO.class, "creator");
        };
    }

}
