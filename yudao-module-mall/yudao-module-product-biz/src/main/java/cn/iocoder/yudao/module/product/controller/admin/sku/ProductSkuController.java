package cn.iocoder.yudao.module.product.controller.admin.sku;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.product.controller.admin.sku.vo.ProductSkuCreateOrUpdateReqVO;
import cn.iocoder.yudao.module.product.controller.admin.sku.vo.ProductSkuPageReqVO;
import cn.iocoder.yudao.module.product.controller.admin.sku.vo.ProductSkuRespVO;
import cn.iocoder.yudao.module.product.controller.admin.sku.vo.ProductSkuUpdateReqVO;
import cn.iocoder.yudao.module.product.convert.sku.ProductSkuConvert;
import cn.iocoder.yudao.module.product.dal.dataobject.sku.ProductSkuDO;
import cn.iocoder.yudao.module.product.service.sku.ProductSkuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Api(tags = "管理后台 - 商品 sku")
@RestController
@RequestMapping("/product/sku")
@Validated
public class ProductSkuController {

    @Resource
    private ProductSkuService ProductSkuService;

    @PostMapping("/create")
    @ApiOperation("创建商品sku")
    @PreAuthorize("@ss.hasPermission('product:sku:create')")
    public CommonResult<Long> createSku(@Valid @RequestBody ProductSkuCreateOrUpdateReqVO createReqVO) {
        return success(ProductSkuService.createSku(createReqVO));
    }

    @PutMapping("/update")
    @ApiOperation("更新商品sku")
    @PreAuthorize("@ss.hasPermission('product:sku:update')")
    public CommonResult<Boolean> updateSku(@Valid @RequestBody ProductSkuUpdateReqVO updateReqVO) {
        ProductSkuService.updateSku(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @ApiOperation("删除商品sku")
    @ApiImplicitParam(name = "id", value = "编号", required = true, dataTypeClass = Long.class)
    @PreAuthorize("@ss.hasPermission('product:sku:delete')")
    public CommonResult<Boolean> deleteSku(@RequestParam("id") Long id) {
        ProductSkuService.deleteSku(id);
        return success(true);
    }

    @GetMapping("/get")
    @ApiOperation("获得商品sku")
    @ApiImplicitParam(name = "id", value = "编号", required = true, example = "1024", dataTypeClass = Long.class)
    @PreAuthorize("@ss.hasPermission('product:sku:query')")
    public CommonResult<ProductSkuRespVO> getSku(@RequestParam("id") Long id) {
        ProductSkuDO sku = ProductSkuService.getSku(id);
        return success(ProductSkuConvert.INSTANCE.convert(sku));
    }

    @GetMapping("/list")
    @ApiOperation("获得商品sku列表")
    @ApiImplicitParam(name = "ids", value = "编号列表", required = true, example = "1024,2048", dataTypeClass = List.class)
    @PreAuthorize("@ss.hasPermission('product:sku:query')")
    public CommonResult<List<ProductSkuRespVO>> getSkuList(@RequestParam("ids") Collection<Long> ids) {
        List<ProductSkuDO> list = ProductSkuService.getSkuList(ids);
        return success(ProductSkuConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @ApiOperation("获得商品sku分页")
    @PreAuthorize("@ss.hasPermission('product:sku:query')")
    public CommonResult<PageResult<ProductSkuRespVO>> getSkuPage(@Valid ProductSkuPageReqVO pageVO) {
        PageResult<ProductSkuDO> pageResult = ProductSkuService.getSkuPage(pageVO);
        return success(ProductSkuConvert.INSTANCE.convertPage(pageResult));
    }

}
