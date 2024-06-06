package cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo;

import lombok.Data;

/**
 * 仓库监控结果 Base VO，提供给添加、修改、详细的子 VO 使用
 * 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
 */
@Data
public class RepoWatchResultBaseVO {
    public interface Fields {
        String id = "id";
        String taskId = "task_id";
        String repoId = "repo_id";
        String repoUrl = "repo_url";
        String repoSshUrl = "repo_ssh_url";
        String repoLang = "repo_lang";
        String repoName = "repo_name";
        String repoDesc = "repo_desc";
        String repoLocalClone = "repo_local_clone";
        String createTime = "create_time";
        String updateTime = "update_time";
        String creator = "creator";
        String updater = "updater";
        String deleted = "deleted";
    }

    /**
    * ---------------额外数据---------------
    */

}
