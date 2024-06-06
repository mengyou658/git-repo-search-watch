package cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo;

import lombok.Data;

/**
 * 仓库监控任务 Base VO，提供给添加、修改、详细的子 VO 使用
 * 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
 */
@Data
public class RepoWatchTaskBaseVO {
    public interface Fields {
        String id = "id";
        String name = "name";
        String repoType = "repo_type";
        String cloneType = "clone_type";
        String type = "type";
        String status = "status";
        String workStatus = "work_status";
        String keywords = "keywords";
        String keywordLang = "keyword_lang";
        String keywordNegative = "keyword_negative";
        String repoLimit = "repo_limit";
        String repoCloneFlag = "repo_clone_flag";
        String repoClonePath = "repo_clone_path";
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
