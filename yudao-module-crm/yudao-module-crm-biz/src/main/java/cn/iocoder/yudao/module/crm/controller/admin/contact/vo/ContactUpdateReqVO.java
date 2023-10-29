package cn.iocoder.yudao.module.crm.controller.admin.contact.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.Set;

@Schema(description = "管理后台 - crm联系人更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ContactUpdateReqVO extends ContactBaseVO {

    @Schema(description = "主键", example = "23210")
    private Long id;

    @Schema(description = "只读权限的用户编号数组")
    private Set<Long> roUserIds;

    @Schema(description = "读写权限的用户编号数组")
    private Set<Long> rwUserIds;

}
