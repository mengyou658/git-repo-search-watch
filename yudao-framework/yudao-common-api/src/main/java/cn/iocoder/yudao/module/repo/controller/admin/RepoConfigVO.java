package cn.iocoder.yudao.module.repo.controller.admin;

import lombok.Data;

import java.util.List;

@Data
public class RepoConfigVO {

    private List<RepoConfig> repoConfigs;

    private String localClonePath;

    private String aliyunCloneAk;

    private String aliyunCloneSk;

    private String aliyunCloneOrganizationId;

    private Long aliyunCloneNamespaceId;

    private String chromeExePath;

    private String userAgent;

    @Data
    public static class RepoConfig {

        /**
         * 仓库类型：0=GitHub，1=Gitee
         * repo_watch_task_repo_type
         */
        private Integer repoType = 0;

        private String username;

        private String password;
    }

}
