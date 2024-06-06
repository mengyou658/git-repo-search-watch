package cn.iocoder.yudao.module.repo.controller.admin.watchconfig;

import cn.iocoder.yudao.framework.apilog.core.annotation.ApiAccessLog;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.lang.DateUtils;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.excel.core.excel.ExcelExport;
import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.infra.controller.admin.config.vo.ConfigSaveSimpleReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigRespVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigSaveReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigSaveSimpleReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigUpdateStatusReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig.RepoWatchConfigDO;
import cn.iocoder.yudao.module.repo.service.watchconfig.RepoWatchConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static cn.iocoder.yudao.framework.apilog.core.enums.OperateTypeEnum.EXPORT;
import static cn.iocoder.yudao.framework.apilog.core.enums.OperateTypeEnum.IMPORT;
import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - 参数配置")
@RestController
@RequestMapping("/repo/watchConfig")
@Validated
@Slf4j
public class RepoWatchConfigController {

    @Resource
    private RepoWatchConfigService repoWatchConfigService;

    @PostMapping("/create")
    @Operation(summary = "创建参数配置")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:create')")
    public CommonResult<Integer> createWatchConfig(@Valid @RequestBody RepoWatchConfigSaveReqVO createReqVO) {
        return success(repoWatchConfigService.createWatchConfig(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新参数配置")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:update')")
    public CommonResult<Boolean> updateWatchConfig(@Valid @RequestBody RepoWatchConfigSaveReqVO updateReqVO) {
        repoWatchConfigService.updateWatchConfig(updateReqVO);
        return success(true);
    }

    @PutMapping("/update-status")
    @Operation(summary = "更新参数配置状态")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:update')")
    public CommonResult<Boolean> updateWatchConfigStatus(@Valid @RequestBody RepoWatchConfigUpdateStatusReqVO updateReqVO) {
        RepoWatchConfigDO updateObj = BeanUtils.toBean(updateReqVO, RepoWatchConfigDO.class);
        repoWatchConfigService.updateWatchConfigStatus(updateObj);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除参数配置")
    @Parameter(name = "ids", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('repo:watch-config:delete')")
    public CommonResult<Boolean> deleteWatchConfig(@RequestBody List<Integer> ids) {
        repoWatchConfigService.deleteWatchConfig(ids);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得参数配置")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    //@PreAuthorize("@ss.hasPermission('repo:watch-config:query')")
    public CommonResult<RepoWatchConfigRespVO> getWatchConfig(@RequestParam("id") Integer id) {
        RepoWatchConfigDO watchConfig = repoWatchConfigService.getWatchConfig(id);
        return success(BeanUtils.toBean(watchConfig, RepoWatchConfigRespVO.class));
    }

    @GetMapping("/page")
    @Operation(summary = "获得参数配置分页")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:query')")
    public CommonResult<PageResult<RepoWatchConfigRespVO>> getWatchConfigPage(@Valid RepoWatchConfigPageReqVO reqVO) {
        PageResult<RepoWatchConfigDO> pageResult = repoWatchConfigService.getWatchConfigPage(reqVO);
        return success(BeanUtils.toBean(pageResult, RepoWatchConfigRespVO.class));
    }

    @GetMapping("/page-simple")
    @Operation(summary = "获得参数配置分页")
    public CommonResult<PageResult<RepoWatchConfigRespVO>> getWatchConfigPageSimple(@Valid RepoWatchConfigPageReqVO reqVO) {
        return getWatchConfigPage(reqVO);
    }

    @GetMapping("/list")
    @Operation(summary = "获得参数配置列表")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:query')")
    public CommonResult<List<RepoWatchConfigRespVO>> getWatchConfigList(@Valid RepoWatchConfigPageReqVO reqVO) {
        List<RepoWatchConfigDO> list = repoWatchConfigService.getWatchConfigList(reqVO);
        return success(BeanUtils.toBean(list, RepoWatchConfigRespVO.class));
    }

    @GetMapping("/list-simple")
    @Operation(summary = "获得参数配置列表")
    public CommonResult<List<RepoWatchConfigRespVO>> getWatchConfigListSimple(@Valid RepoWatchConfigPageReqVO reqVO) {
        return getWatchConfigList(reqVO);
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出参数配置 Excel")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:export')")
    @ApiAccessLog(operateType = EXPORT)
    public void exportWatchConfigExcel(@Valid RepoWatchConfigPageReqVO reqVO,
                                       HttpServletResponse response) throws IOException {
        reqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<RepoWatchConfigDO> list = repoWatchConfigService.getWatchConfigList(reqVO);
        // 导出 Excel
        ExcelUtils.write(response, "参数配置.xls", "数据", RepoWatchConfigRespVO.class,
                BeanUtils.toBean(list, RepoWatchConfigRespVO.class));
    }

    /**
     * 导出数据
     */
    @Operation(summary = "导出参数配置 Excel")
    @GetMapping(value = "exportData")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:export')")
    @ApiAccessLog(operateType = EXPORT)
    public void exportData(RepoWatchConfigPageReqVO reqVO, Boolean isAll, String ctrlPermi, HttpServletResponse response) {
        reqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<RepoWatchConfigDO> list = repoWatchConfigService.getWatchConfigList(reqVO);
        // 导出 Excel
        List<RepoWatchConfigRespVO> datas = BeanUtils.toBean(list, RepoWatchConfigRespVO.class);
        String fileName = "参数配置" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
        try (ExcelExport ee = new ExcelExport("参数配置", RepoWatchConfigRespVO.class)) {
            ee.setDataList(datas).write(response, fileName);
        }
    }

    /**
     * 下载导入数据模板
     */
    @Operation(summary = "导出参数配置Excel模板")
    @GetMapping(value = "importTemplate")
    public void importTemplate(HttpServletResponse response) {
        // 导出 Excel
        List<RepoWatchConfigRespVO> datas = new ArrayList<>(0);
        String fileName = "参数配置模板.xlsx";
        try (ExcelExport ee = new ExcelExport("参数配置", RepoWatchConfigRespVO.class)) {
            ee.setDataList(datas).write(response, fileName);
        }
    }

    /**
     * 导入数据
     */
    @Operation(summary = "导入参数配置 Excel")
    @PreAuthorize("@ss.hasPermission('repo:watch-config:import')")
    @PostMapping(value = "importData")
    @ApiAccessLog(operateType = IMPORT)
    public CommonResult<String> importData(MultipartFile file, Boolean updateSupport) {
        try {
            boolean isUpdateSupport = updateSupport != null && updateSupport;
            String message = repoWatchConfigService.importData(file, isUpdateSupport);
            return success(message, null);
        } catch (Exception ex) {
            return success(ex.getMessage(), null);
        }
    }

    @GetMapping(value = "/get-value-by-key")
    @Operation(summary = "根据参数键名查询参数值", description = "不可见的配置，不允许返回给前端")
    @Parameter(name = "key", description = "参数键", required = true, example = "yunai.biz.username")
    public CommonResult<String> getConfigKey(@RequestParam("key") String key) {
        Long loginUserId = SecurityFrameworkUtils.getLoginUserId();
        RepoWatchConfigDO config = repoWatchConfigService.getConfigByKey(key, loginUserId);
        if (config == null) {
            return success(null);
        }
        return success(config.getValue());
    }

    @PostMapping("/save")
    @Operation(summary = "创建或更新参数配置")
    public CommonResult<Long> saveConfig(@Valid @RequestBody RepoWatchConfigSaveSimpleReqVO createReqVO) {
        return success(repoWatchConfigService.saveConfig(createReqVO));
    }

}
