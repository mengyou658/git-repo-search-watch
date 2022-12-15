package cn.iocoder.yudao.module.product.convert.spu;

import cn.hutool.core.collection.CollUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.product.api.spu.dto.ProductSpuRespDTO;
import cn.iocoder.yudao.module.product.controller.admin.spu.vo.*;
import cn.iocoder.yudao.module.product.controller.app.property.vo.value.AppProductPropertyValueDetailRespVO;
import cn.iocoder.yudao.module.product.controller.app.spu.vo.AppProductSpuPageReqVO;
import cn.iocoder.yudao.module.product.controller.app.spu.vo.AppSpuDetailRespVO;
import cn.iocoder.yudao.module.product.controller.app.spu.vo.AppSpuPageItemRespVO;
import cn.iocoder.yudao.module.product.dal.dataobject.sku.ProductSkuDO;
import cn.iocoder.yudao.module.product.dal.dataobject.spu.ProductSpuDO;
import cn.iocoder.yudao.module.product.service.property.bo.ProductPropertyValueDetailRespBO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static cn.hutool.core.util.ObjectUtil.defaultIfNull;
import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.convertMap;

/**
 * 商品 SPU Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface ProductSpuConvert {

    ProductSpuConvert INSTANCE = Mappers.getMapper(ProductSpuConvert.class);

    ProductSpuDO convert(ProductSpuCreateReqVO bean);

    ProductSpuDO convert(ProductSpuUpdateReqVO bean);

    List<ProductSpuDO> convertList(List<ProductSpuDO> list);

    PageResult<ProductSpuRespVO> convertPage(PageResult<ProductSpuDO> page);

    ProductSpuPageReqVO convert(AppProductSpuPageReqVO bean);

    List<ProductSpuRespDTO> convertList2(List<ProductSpuDO> list);

    List<ProductSpuSimpleRespVO> convertList02(List<ProductSpuDO> list);

    default AppSpuDetailRespVO convert(ProductSpuDO spu, List<ProductSkuDO> skus,
                                       List<ProductPropertyValueDetailRespBO> propertyValues) {
        AppSpuDetailRespVO spuVO = convert02(spu)
                .setSalesCount(spu.getSalesCount() + defaultIfNull(spu.getVirtualSalesCount(), 0));
        spuVO.setSkus(convertList03(skus));
        // 处理商品属性
        Map<Long, ProductPropertyValueDetailRespBO> propertyValueMap = convertMap(propertyValues, ProductPropertyValueDetailRespBO::getValueId);
        for (int i = 0; i < skus.size(); i++) {
            List<ProductSkuDO.Property> properties = skus.get(i).getProperties();
            if (CollUtil.isEmpty(properties)) {
                continue;
            }
            AppSpuDetailRespVO.Sku sku = spuVO.getSkus().get(i);
            sku.setProperties(new ArrayList<>(properties.size()));
            // 遍历每个 properties，设置到 AppSpuDetailRespVO.Sku 中
            properties.forEach(property -> {
                ProductPropertyValueDetailRespBO propertyValue = propertyValueMap.get(property.getValueId());
                if (propertyValue == null) {
                    return;
                }
                sku.getProperties().add(convert03(propertyValue));
            });
        }
        return spuVO;
    }
    AppSpuDetailRespVO convert02(ProductSpuDO spu);
    List<AppSpuDetailRespVO.Sku> convertList03(List<ProductSkuDO> skus);
    AppProductPropertyValueDetailRespVO convert03(ProductPropertyValueDetailRespBO propertyValue);

    PageResult<AppSpuPageItemRespVO> convertPage02(PageResult<ProductSpuDO> page);

}
