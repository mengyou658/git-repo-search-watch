package cn.iocoder.yudao.module.repo.controller.admin.watchresult;

import org.springframework.web.bind.annotation.*;
import jakarta.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.Operation;

import jakarta.validation.constraints.*;
import jakarta.validation.*;
import jakarta.servlet.http.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.*;
import java.time.LocalDateTime;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;

import java.io.IOException;
import lombok.extern.slf4j.Slf4j;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;

import cn.iocoder.yudao.framework.apilog.core.annotation.ApiAccessLog;
import static cn.iocoder.yudao.framework.apilog.core.enums.OperateTypeEnum.*;
import cn.iocoder.yudao.framework.common.util.lang.DateUtils;
import cn.iocoder.yudao.framework.excel.core.excel.ExcelExport;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.*;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.*;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.service.watchresult.RepoWatchResultService;
import org.springframework.web.multipart.MultipartFile;

@Tag(name = "管理后台 - 仓库监控结果")
@RestController
@RequestMapping("/repo/watchResult")
@Validated
@Slf4j
public class RepoWatchResultController {

    @Resource
    private RepoWatchResultService repoWatchResultService;

    @PostMapping("/create")
    @Operation(summary = "创建仓库监控结果")
    @PreAuthorize("@ss.hasPermission('repo:watch-result:create')")
    public CommonResult<Long> createWatchResult(@Valid @RequestBody RepoWatchResultSaveReqVO createReqVO) {
        return success(repoWatchResultService.createWatchResult(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新仓库监控结果")
    @PreAuthorize("@ss.hasPermission('repo:watch-result:update')")
    public CommonResult<Boolean> updateWatchResult(@Valid @RequestBody RepoWatchResultSaveReqVO updateReqVO) {
        repoWatchResultService.updateWatchResult(updateReqVO);
        return success(true);
    }

    @PutMapping("/update-status")
    @Operation(summary ="更新仓库监控结果状态")
        @PreAuthorize("@ss.hasPermission('repo:watch-result:update')")
    public CommonResult<Boolean> updateWatchResultStatus(@Valid @RequestBody RepoWatchResultUpdateStatusReqVO updateReqVO) {
        RepoWatchResultDO updateObj = BeanUtils.toBean(updateReqVO, RepoWatchResultDO.class);
        repoWatchResultService.updateWatchResultStatus(updateObj);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除仓库监控结果")
    @Parameter(name = "ids", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('repo:watch-result:delete')")
    public CommonResult<Boolean> deleteWatchResult(@RequestBody List<Long> ids) {
        repoWatchResultService.deleteWatchResult(ids);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得仓库监控结果")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    //@PreAuthorize("@ss.hasPermission('repo:watch-result:query')")
    public CommonResult<RepoWatchResultRespVO> getWatchResult(@RequestParam("id") Long id) {
        RepoWatchResultDO watchResult = repoWatchResultService.getWatchResult(id);
        return success(BeanUtils.toBean(watchResult, RepoWatchResultRespVO.class));
    }

    @GetMapping("/page")
    @Operation(summary = "获得仓库监控结果分页")
    @PreAuthorize("@ss.hasPermission('repo:watch-result:query')")
    public CommonResult<PageResult<RepoWatchResultRespVO>> getWatchResultPage(@Valid RepoWatchResultPageReqVO reqVO) {
        PageResult<RepoWatchResultDO> pageResult = repoWatchResultService.getWatchResultPage(reqVO);
        return success(BeanUtils.toBean(pageResult, RepoWatchResultRespVO.class));
    }

    @GetMapping("/page-simple")
    @Operation(summary = "获得仓库监控结果分页")
    public CommonResult<PageResult<RepoWatchResultRespVO>> getWatchResultPageSimple(@Valid RepoWatchResultPageReqVO reqVO) {
        return getWatchResultPage(reqVO);
    }

    @GetMapping("/list")
    @Operation(summary = "获得仓库监控结果列表")
    @PreAuthorize("@ss.hasPermission('repo:watch-result:query')")
    public CommonResult<List<RepoWatchResultRespVO>> getWatchResultList(@Valid RepoWatchResultPageReqVO reqVO) {
        List<RepoWatchResultDO> list = repoWatchResultService.getWatchResultList(reqVO);
        return success(BeanUtils.toBean(list, RepoWatchResultRespVO.class));
    }

    @GetMapping("/list-simple")
    @Operation(summary = "获得仓库监控结果列表")
    public CommonResult<List<RepoWatchResultRespVO>> getWatchResultListSimple(@Valid RepoWatchResultPageReqVO reqVO) {
        return getWatchResultList(reqVO);
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出仓库监控结果 Excel")
    @PreAuthorize("@ss.hasPermission('repo:watch-result:export')")
    @ApiAccessLog(operateType = EXPORT)
    public void exportWatchResultExcel(@Valid RepoWatchResultPageReqVO reqVO,
              HttpServletResponse response) throws IOException {
        reqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<RepoWatchResultDO> list = repoWatchResultService.getWatchResultList(reqVO);
        // 导出 Excel
        ExcelUtils.write(response, "仓库监控结果.xls", "数据", RepoWatchResultRespVO.class,
                        BeanUtils.toBean(list, RepoWatchResultRespVO.class));
    }

    /**
     * 导出数据
     */
    @Operation(summary ="导出仓库监控结果 Excel")
    @GetMapping(value = "exportData")
    @PreAuthorize("@ss.hasPermission('repo:watch-result:export')")
    @ApiAccessLog(operateType = EXPORT)
    public void exportData(RepoWatchResultPageReqVO reqVO, Boolean isAll, String ctrlPermi, HttpServletResponse response) {
        reqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<RepoWatchResultDO> list = repoWatchResultService.getWatchResultList(reqVO);
        // 导出 Excel
        List<RepoWatchResultRespVO> datas = BeanUtils.toBean(list, RepoWatchResultRespVO.class);
        String fileName = "仓库监控结果" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
        try (ExcelExport ee = new ExcelExport("仓库监控结果", RepoWatchResultRespVO.class)) {
            ee.setDataList(datas).write(response, fileName);
        }
    }

    /**
     * 下载导入数据模板
     */
    @Operation(summary ="导出仓库监控结果Excel模板")
    @GetMapping(value = "importTemplate")
    public void importTemplate(HttpServletResponse response) {
        // 导出 Excel
        List<RepoWatchResultRespVO> datas = new ArrayList<>(0);
        String fileName = "仓库监控结果模板.xlsx";
        try (ExcelExport ee = new ExcelExport("仓库监控结果", RepoWatchResultRespVO.class)) {
            ee.setDataList(datas).write(response, fileName);
        }
    }

    /**
     * 导入数据
     */
    @Operation(summary ="导入仓库监控结果 Excel")
    @PreAuthorize("@ss.hasPermission('repo:watch-result:import')")
    @PostMapping(value = "importData")
    @ApiAccessLog(operateType = IMPORT)
    public CommonResult<String> importData(MultipartFile file, Boolean updateSupport) {
        try {
            boolean isUpdateSupport = updateSupport != null && updateSupport;
            String message = repoWatchResultService.importData(file, isUpdateSupport);
            return success(message, null);
        } catch (Exception ex) {
            return success(ex.getMessage(), null);
        }
    }

}
