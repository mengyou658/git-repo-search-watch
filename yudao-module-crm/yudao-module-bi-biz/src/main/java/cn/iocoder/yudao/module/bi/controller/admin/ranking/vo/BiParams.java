package cn.iocoder.yudao.module.bi.controller.admin.ranking.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

// TODO @anhaohao：这个类的命名，还是保持和其它一致使用 ReqVO 结尾；例如说，CrmStatisticsCommonParamReqVO
/**
 * @author anhaohao
 * bi参数
 */
@EqualsAndHashCode(callSuper = true)
@Schema(description = "bi查询相关参数")
@Data
public class BiParams extends PageParam {

    @Schema(description = "部门ID")
    private Long deptId;

    @Schema(description = "用户ID")
    private Long userId;

    @Schema(description = "用户IDs")
    private List<Long> userIds;

    // TODO @anhaohao：这个字段，可以融合到 startTime、endTime 里去，交给前端计算哈；
    @Schema(description = "类型")
    private String type;

    // TODO @anhaohao：还是使用 LocalDateTime
    @Schema(description = "开始时间")
    private String startTime;

    @Schema(description = "结束时间")
    private String endTime;

    // TODO @anhaohao：这个字段，是不是直接只基于 deptId 和 userId 来判断即可哈？
    @Schema(description = "0 部门 1员工")
    private Integer isUser = 1;

}
