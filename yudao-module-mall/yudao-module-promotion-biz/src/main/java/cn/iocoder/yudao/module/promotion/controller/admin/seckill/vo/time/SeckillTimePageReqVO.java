package cn.iocoder.yudao.module.promotion.controller.admin.seckill.vo.time;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalTime;

@ApiModel("管理后台 - 秒杀时段分页 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class SeckillTimePageReqVO extends PageParam {

    @ApiModelProperty(value = "秒杀时段名称", example = "上午场")
    private String name;

    @ApiModelProperty(value = "开始时间点", example = "16:30:40")
    @DateTimeFormat(pattern = "HH:mm:ss")
    private LocalTime startTime;

    @ApiModelProperty(value = "结束时间点", example = "16:30:40")
    @DateTimeFormat(pattern = "HH:mm:ss")
    private LocalTime endTime;

}
