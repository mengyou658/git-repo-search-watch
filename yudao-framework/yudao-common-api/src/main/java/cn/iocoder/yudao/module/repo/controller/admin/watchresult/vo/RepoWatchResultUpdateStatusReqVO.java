package cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.Operation;
import lombok.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.*;
import java.time.LocalDateTime;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;
import org.springframework.format.annotation.NumberFormat;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultBaseVO.Fields;

import jakarta.validation.constraints.*;
import com.yun.products.core2020.annotations.Query;

@Schema(description = "管理后台 - 仓库监控结果更新状态 Request VO")
@Data
@ToString(callSuper = true)
public class RepoWatchResultUpdateStatusReqVO {

        @Schema(description = "ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "9999")
        @NotNull(message = "ID不能为空")
        private Long id;

    /**
    * ---------------额外数据---------------
    */

}
