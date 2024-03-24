package cn.iocoder.yudao.module.crm.controller.admin.statistics.vo.customer.analyze;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema(description = "管理后台 - CRM 客户行业分析 VO")
@Data
public class CrmStatisticCustomerIndustryRespVO {

    @Schema(description = "客户行业ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "2")
    private Integer industryId;
    @Schema(description = "客户行业名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "2")
    private String industryName;

    @Schema(description = "客户个数", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Integer customerCount;

    @Schema(description = "成交个数", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Integer dealCount;

    @Schema(description = "行业占比(%)", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Double industryPortion;

    @Schema(description = "成交占比(%)", requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
    private Double dealPortion;

}
