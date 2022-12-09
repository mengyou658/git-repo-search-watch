package cn.iocoder.yudao.module.system.controller.admin.permission.vo.menu;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Schema(title = "管理后台 - 菜单精简信息 Response VO")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuSimpleRespVO {

    @Schema(title = "菜单编号", required = true, example = "1024")
    private Long id;

    @Schema(title = "菜单名称", required = true, example = "芋道")
    private String name;

    @Schema(title = "父菜单 ID", required = true, example = "1024")
    private Long parentId;

    @Schema(title = "类型", required = true, example = "1", description = "参见 MenuTypeEnum 枚举类")
    private Integer type;

}
