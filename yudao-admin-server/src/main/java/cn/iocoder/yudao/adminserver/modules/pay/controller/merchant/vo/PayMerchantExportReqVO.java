package cn.iocoder.yudao.adminserver.modules.pay.controller.merchant.vo;

import lombok.*;
import java.util.*;
import io.swagger.annotations.*;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@ApiModel(value = "支付商户信息 Excel 导出 Request VO", description = "参数和 PayMerchantPageReqVO 是一致的")
@Data
public class PayMerchantExportReqVO {

    @ApiModelProperty(value = "商户号")
    private String no;

    @ApiModelProperty(value = "商户全称")
    private String name;

    @ApiModelProperty(value = "商户简称")
    private String shortName;

    @ApiModelProperty(value = "开启状态")
    private Integer status;

    @ApiModelProperty(value = "备注")
    private String remark;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @ApiModelProperty(value = "开始创建时间")
    private Date beginCreateTime;

    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    @ApiModelProperty(value = "结束创建时间")
    private Date endCreateTime;

}
