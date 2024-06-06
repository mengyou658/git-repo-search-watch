package cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo;

import lombok.Data;

/**
 * 参数配置 Base VO，提供给添加、修改、详细的子 VO 使用
 * 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
 */
@Data
public class RepoWatchConfigBaseVO {
    public interface Fields {
        String id = "id";
        String configKey = "config_key";
        String value = "value";
        String creator = "creator";
        String createTime = "create_time";
        String updater = "updater";
        String updateTime = "update_time";
        String deleted = "deleted";
    }

    /**
     * ---------------额外数据---------------
     */

}
