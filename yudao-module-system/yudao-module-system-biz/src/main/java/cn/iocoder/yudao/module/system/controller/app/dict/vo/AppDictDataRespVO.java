package cn.iocoder.yudao.module.system.controller.app.dict.vo;

import cn.iocoder.yudao.module.system.controller.admin.dict.vo.data.DictDataBaseVO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Schema(description = "用户 App - 字典数据信息 Response VO")
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class AppDictDataRespVO extends DictDataBaseVO {

    // TODO @疯狂：app 的接口，不集成 admin 接口的 vo 哈；看看是不是只返回必要的字段，类似 remark、sort 不好返回的哈；

    @Schema(description = "字典数据编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "1024")
    private Long id;

}
