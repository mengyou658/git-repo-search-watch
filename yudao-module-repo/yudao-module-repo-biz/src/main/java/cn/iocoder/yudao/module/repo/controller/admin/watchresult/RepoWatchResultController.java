package cn.iocoder.yudao.module.repo.controller.admin.watchresult;

import cn.hutool.core.util.CharsetUtil;
import cn.hutool.http.HttpUtil;
import cn.iocoder.yudao.framework.apilog.core.annotation.ApiAccessLog;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.http.HttpUtils;
import cn.iocoder.yudao.framework.common.util.lang.DateUtils;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.excel.core.excel.ExcelExport;
import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;
import cn.iocoder.yudao.module.infra.service.config.ConfigService;
import cn.iocoder.yudao.module.repo.controller.admin.RepoConfigVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultPageReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultRespVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultSaveReqVO;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultUpdateStatusReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig.RepoWatchConfigDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.service.watchconfig.RepoWatchConfigService;
import cn.iocoder.yudao.module.repo.service.watchresult.RepoWatchResultService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.annotation.security.PermitAll;
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

@Tag(name = "管理后台 - 仓库监控结果")
@RestController
@RequestMapping("/repo/watchResult")
@Validated
@Slf4j
public class RepoWatchResultController {

    @Resource
    private RepoWatchResultService repoWatchResultService;

    @Resource
    private RepoWatchConfigService repoWatchConfigService;

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

    /**
     * 导入数据
     */
    @Operation(summary = "github Readme")
    @GetMapping(value = "githubReadme")
    @PermitAll
    public String githubReadme(RepoWatchResultPageReqVO reqVO, HttpServletResponse response) {
//        String url = "https://mirror.ghproxy.com/https://raw.githubusercontent.com/" + reqVO.getRepoName() + "/main/README.md";
//        String url = "https://github.com/" + reqVO.getRepoName() + "/raw/main/README.md";
        RepoWatchResultDO watchResult = repoWatchResultService.getWatchResult(reqVO.getId());
        RepoConfigVO config = repoWatchConfigService.getRepoConfig(watchResult.getCreator());
        String url = "https://raw.githubusercontent.com/" + reqVO.getRepoName() + "/main/README.md";
        try {
            log.debug("githubReadme {}", url);
            return HttpUtils.downloadString(url, 10000, config.getProxyHost(), config.getProxyPort());
//            HttpDownloader.download(url, response.getOutputStream(), true, null);
        } catch (Exception ex) {
            log.error("githubReadme " + ex.getMessage());
            try {
//                url = "https://github.com/" + reqVO.getRepoName() + "/raw/master/README.md";
                url = "https://raw.githubusercontent.com/" + reqVO.getRepoName() + "/master/README.md";
                log.debug("githubReadme {}", url);
                return HttpUtils.downloadString(url, 10000, config.getProxyHost(), config.getProxyPort());
//                HttpDownloader.download(url, response.getOutputStream(), true, null);
            } catch (Exception e) {
                log.error("githubReadme " + e.getMessage());
            }
        }
        return "";
    }

}
