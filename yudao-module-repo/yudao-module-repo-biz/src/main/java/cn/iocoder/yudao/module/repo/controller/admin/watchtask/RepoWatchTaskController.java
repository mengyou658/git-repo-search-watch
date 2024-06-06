package cn.iocoder.yudao.module.repo.controller.admin.watchtask;

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
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.*;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.*;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.service.watchtask.RepoWatchTaskService;
import org.springframework.web.multipart.MultipartFile;

@Tag(name = "管理后台 - 仓库监控任务")
@RestController
@RequestMapping("/repo/watchTask")
@Validated
@Slf4j
public class RepoWatchTaskController {

    @Resource
    private RepoWatchTaskService repoWatchTaskService;

    @PostMapping("/create")
    @Operation(summary = "创建仓库监控任务")
    @PreAuthorize("@ss.hasPermission('repo:watch-task:create')")
    public CommonResult<Long> createWatchTask(@Valid @RequestBody RepoWatchTaskSaveReqVO createReqVO) {
        return success(repoWatchTaskService.createWatchTask(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新仓库监控任务")
    @PreAuthorize("@ss.hasPermission('repo:watch-task:update')")
    public CommonResult<Boolean> updateWatchTask(@Valid @RequestBody RepoWatchTaskSaveReqVO updateReqVO) {
        repoWatchTaskService.updateWatchTask(updateReqVO);
        return success(true);
    }

    @PutMapping("/update-status")
    @Operation(summary ="更新仓库监控任务状态")
        @PreAuthorize("@ss.hasPermission('repo:watch-task:update')")
    public CommonResult<Boolean> updateWatchTaskStatus(@Valid @RequestBody RepoWatchTaskUpdateStatusReqVO updateReqVO) {
        RepoWatchTaskDO updateObj = BeanUtils.toBean(updateReqVO, RepoWatchTaskDO.class);
        repoWatchTaskService.updateWatchTaskStatus(updateObj);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除仓库监控任务")
    @Parameter(name = "ids", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('repo:watch-task:delete')")
    public CommonResult<Boolean> deleteWatchTask(@RequestBody List<Long> ids) {
        repoWatchTaskService.deleteWatchTask(ids);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得仓库监控任务")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    //@PreAuthorize("@ss.hasPermission('repo:watch-task:query')")
    public CommonResult<RepoWatchTaskRespVO> getWatchTask(@RequestParam("id") Long id) {
        RepoWatchTaskDO watchTask = repoWatchTaskService.getWatchTask(id);
        return success(BeanUtils.toBean(watchTask, RepoWatchTaskRespVO.class));
    }

    @GetMapping("/page")
    @Operation(summary = "获得仓库监控任务分页")
    @PreAuthorize("@ss.hasPermission('repo:watch-task:query')")
    public CommonResult<PageResult<RepoWatchTaskRespVO>> getWatchTaskPage(@Valid RepoWatchTaskPageReqVO reqVO) {
        PageResult<RepoWatchTaskDO> pageResult = repoWatchTaskService.getWatchTaskPage(reqVO);
        return success(BeanUtils.toBean(pageResult, RepoWatchTaskRespVO.class));
    }

    @GetMapping("/page-simple")
    @Operation(summary = "获得仓库监控任务分页")
    public CommonResult<PageResult<RepoWatchTaskRespVO>> getWatchTaskPageSimple(@Valid RepoWatchTaskPageReqVO reqVO) {
        return getWatchTaskPage(reqVO);
    }

    @GetMapping("/list")
    @Operation(summary = "获得仓库监控任务列表")
    @PreAuthorize("@ss.hasPermission('repo:watch-task:query')")
    public CommonResult<List<RepoWatchTaskRespVO>> getWatchTaskList(@Valid RepoWatchTaskPageReqVO reqVO) {
        List<RepoWatchTaskDO> list = repoWatchTaskService.getWatchTaskList(reqVO);
        return success(BeanUtils.toBean(list, RepoWatchTaskRespVO.class));
    }

    @GetMapping("/list-simple")
    @Operation(summary = "获得仓库监控任务列表")
    public CommonResult<List<RepoWatchTaskRespVO>> getWatchTaskListSimple(@Valid RepoWatchTaskPageReqVO reqVO) {
        return getWatchTaskList(reqVO);
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出仓库监控任务 Excel")
    @PreAuthorize("@ss.hasPermission('repo:watch-task:export')")
    @ApiAccessLog(operateType = EXPORT)
    public void exportWatchTaskExcel(@Valid RepoWatchTaskPageReqVO reqVO,
              HttpServletResponse response) throws IOException {
        reqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<RepoWatchTaskDO> list = repoWatchTaskService.getWatchTaskList(reqVO);
        // 导出 Excel
        ExcelUtils.write(response, "仓库监控任务.xls", "数据", RepoWatchTaskRespVO.class,
                        BeanUtils.toBean(list, RepoWatchTaskRespVO.class));
    }

    /**
     * 导出数据
     */
    @Operation(summary ="导出仓库监控任务 Excel")
    @GetMapping(value = "exportData")
    @PreAuthorize("@ss.hasPermission('repo:watch-task:export')")
    @ApiAccessLog(operateType = EXPORT)
    public void exportData(RepoWatchTaskPageReqVO reqVO, Boolean isAll, String ctrlPermi, HttpServletResponse response) {
        reqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<RepoWatchTaskDO> list = repoWatchTaskService.getWatchTaskList(reqVO);
        // 导出 Excel
        List<RepoWatchTaskRespVO> datas = BeanUtils.toBean(list, RepoWatchTaskRespVO.class);
        String fileName = "仓库监控任务" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
        try (ExcelExport ee = new ExcelExport("仓库监控任务", RepoWatchTaskRespVO.class)) {
            ee.setDataList(datas).write(response, fileName);
        }
    }

    /**
     * 下载导入数据模板
     */
    @Operation(summary ="导出仓库监控任务Excel模板")
    @GetMapping(value = "importTemplate")
    public void importTemplate(HttpServletResponse response) {
        // 导出 Excel
        List<RepoWatchTaskRespVO> datas = new ArrayList<>(0);
        String fileName = "仓库监控任务模板.xlsx";
        try (ExcelExport ee = new ExcelExport("仓库监控任务", RepoWatchTaskRespVO.class)) {
            ee.setDataList(datas).write(response, fileName);
        }
    }

    /**
     * 导入数据
     */
    @Operation(summary ="导入仓库监控任务 Excel")
    @PreAuthorize("@ss.hasPermission('repo:watch-task:import')")
    @PostMapping(value = "importData")
    @ApiAccessLog(operateType = IMPORT)
    public CommonResult<String> importData(MultipartFile file, Boolean updateSupport) {
        try {
            boolean isUpdateSupport = updateSupport != null && updateSupport;
            String message = repoWatchTaskService.importData(file, isUpdateSupport);
            return success(message, null);
        } catch (Exception ex) {
            return success(ex.getMessage(), null);
        }
    }

}
