package cn.iocoder.yudao.module.bpm.enums.task;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 流程任务 -- comment类型枚举
 */
@Getter
@AllArgsConstructor
public enum BpmCommentTypeEnum {

    APPROVE(1, "通过", ""),
    REJECT(2, "不通过", ""),
    CANCEL(3, "已取消", ""),
    BACK(4, "退回", ""),
    DELEGATE(5, "委派", ""),
    ADD_SIGN(6, "加签", "[{}]{}给了[{}]，理由为：{}"),
    SUB_SIGN(7, "减签", "[{}]操作了【减签】,审批人[{}]的任务被取消"),
    ;

    /**
     * 操作类型
     */
    private final Integer type;
    // TODO @海：desc 可以改成 name；相当于操作名；
    /**
     * 操作名字
     */
    private final String desc;
    // TODO @海：直接改成 comment 哈；简单一点；
    /**
     * 操作描述
     */
    private final String templateComment;

}
