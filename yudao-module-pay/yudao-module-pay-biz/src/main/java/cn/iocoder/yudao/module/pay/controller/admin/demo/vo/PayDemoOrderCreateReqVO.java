package cn.iocoder.yudao.module.pay.controller.admin.demo.vo;

import lombok.*;
import io.swagger.v3.oas.annotations.media.Schema;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Schema(description = "管理后台 - 示例订单创建 Request VO")
@Data
public class PayDemoOrderCreateReqVO {

    @Schema(description = "商品编号", required = true, example = "17682")
    @NotNull(message = "商品编号不能为空")
    private Long spuId;

}
