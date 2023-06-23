package cn.iocoder.yudao.module.product.controller.app.comment;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.product.controller.app.comment.vo.AppCommentPageReqVO;
import cn.iocoder.yudao.module.product.controller.app.comment.vo.AppCommentStatisticsRespVO;
import cn.iocoder.yudao.module.product.controller.app.comment.vo.AppProductCommentRespVO;
import cn.iocoder.yudao.module.product.controller.app.property.vo.value.AppProductPropertyValueDetailRespVO;
import cn.iocoder.yudao.module.product.convert.comment.ProductCommentConvert;
import cn.iocoder.yudao.module.product.dal.dataobject.comment.ProductCommentDO;
import cn.iocoder.yudao.module.product.dal.dataobject.sku.ProductSkuDO;
import cn.iocoder.yudao.module.product.service.comment.ProductCommentService;
import cn.iocoder.yudao.module.product.service.sku.ProductSkuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.context.annotation.Lazy;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "用户 APP - 商品评价")
@RestController
@RequestMapping("/product/comment")
@Validated
public class AppProductCommentController {

    @Resource
    private ProductCommentService productCommentService;

    @Resource
    @Lazy
    private ProductSkuService productSkuService;

    @GetMapping("/list")
    @Operation(summary = "获得最近的 n 条商品评价")
    @Parameters({
            @Parameter(name = "spuId", description = "商品 SPU 编号", required = true, example = "1024"),
            @Parameter(name = "count", description = "数量", required = true, example = "10")
    })
    public CommonResult<List<AppProductCommentRespVO>> getCommentList(@RequestParam("spuId") Long spuId,
                                                                      @RequestParam(value = "count", defaultValue = "10") Integer count) {
        return success(productCommentService.getCommentList(spuId, count));

    }

    @GetMapping("/page")
    @Operation(summary = "获得商品评价分页")
    public CommonResult<PageResult<AppProductCommentRespVO>> getCommentPage(@Valid AppCommentPageReqVO pageVO) {
        PageResult<AppProductCommentRespVO> page = productCommentService.getCommentPage(pageVO, Boolean.TRUE);
        Set<Long> skuIds = page.getList().stream().map(AppProductCommentRespVO::getSkuId).collect(Collectors.toSet());
        List<ProductSkuDO> skuList = productSkuService.getSkuList(skuIds);
        Map<Long, ProductSkuDO> skuDOMap = new HashMap<>(skuIds.size());
        if (CollUtil.isNotEmpty(skuList)) {
            skuDOMap.putAll(skuList.stream().collect(Collectors.toMap(ProductSkuDO::getId, c -> c)));
        }
        page.getList().forEach(item -> {
            // 判断用户是否选择匿名
            if (ObjectUtil.equal(item.getAnonymous(), true)) {
                item.setUserNickname(ProductCommentDO.NICKNAME_ANONYMOUS);
            }
            ProductSkuDO productSkuDO = skuDOMap.get(item.getSkuId());
            if (productSkuDO != null) {
                List<AppProductPropertyValueDetailRespVO> skuProperties = ProductCommentConvert.INSTANCE.convertList01(productSkuDO.getProperties());
                item.setSkuProperties(skuProperties);
            }
        });
        return success(page);
    }

    @GetMapping("/getCommentStatistics")
    @Operation(summary = "获得商品的评价统计")
    public CommonResult<AppCommentStatisticsRespVO> getCommentStatistics(@Valid @RequestParam("spuId") Long spuId) {
        return success(productCommentService.getCommentStatistics(spuId, Boolean.TRUE));
    }

}
