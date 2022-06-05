package cn.iocoder.yudao.module.product.service.sku;

import cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.product.controller.admin.property.vo.ProductPropertyRespVO;
import cn.iocoder.yudao.module.product.controller.admin.propertyvalue.vo.ProductPropertyValueRespVO;
import cn.iocoder.yudao.module.product.controller.admin.sku.vo.*;
import cn.iocoder.yudao.module.product.convert.sku.ProductSkuConvert;
import cn.iocoder.yudao.module.product.dal.dataobject.sku.ProductSkuDO;
import cn.iocoder.yudao.module.product.dal.mysql.sku.ProductSkuMapper;
import cn.iocoder.yudao.module.product.enums.ErrorCodeConstants;
import cn.iocoder.yudao.module.product.service.property.ProductPropertyService;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.product.enums.ErrorCodeConstants.PROPERTY_NOT_EXISTS;
import static cn.iocoder.yudao.module.product.enums.ErrorCodeConstants.SKU_NOT_EXISTS;

/**
 * 商品sku Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class ProductSkuServiceImpl implements ProductSkuService {

    @Resource
    private ProductSkuMapper productSkuMapper;

    @Resource
    private ProductPropertyService productPropertyService;

    @Override
    public Long createSku(ProductSkuCreateReqVO createReqVO) {
        // 插入
        ProductSkuDO sku = ProductSkuConvert.INSTANCE.convert(createReqVO);
        productSkuMapper.insert(sku);
        // 返回
        return sku.getId();
    }

    @Override
    public void updateSku(ProductSkuUpdateReqVO updateReqVO) {
        // 校验存在
        this.validateSkuExists(updateReqVO.getId());
        // 更新
        ProductSkuDO updateObj = ProductSkuConvert.INSTANCE.convert(updateReqVO);
        productSkuMapper.updateById(updateObj);
    }

    @Override
    public void deleteSku(Long id) {
        // 校验存在
        this.validateSkuExists(id);
        // 删除
        productSkuMapper.deleteById(id);
    }

    private void validateSkuExists(Long id) {
        if (productSkuMapper.selectById(id) == null) {
            throw exception(SKU_NOT_EXISTS);
        }
    }

    @Override
    public ProductSkuDO getSku(Long id) {
        return productSkuMapper.selectById(id);
    }

    @Override
    public List<ProductSkuDO> getSkuList(Collection<Long> ids) {
        return productSkuMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<ProductSkuDO> getSkuPage(ProductSkuPageReqVO pageReqVO) {
        return productSkuMapper.selectPage(pageReqVO);
    }

    @Override
    public List<ProductSkuDO> getSkuList(ProductSkuExportReqVO exportReqVO) {
        return productSkuMapper.selectList(exportReqVO);
    }

    @Override
    public void validatedSkuReq(List<ProductSkuCreateReqVO> skuCreateReqList) {
        List<ProductSkuBaseVO.Property> skuPropertyList = skuCreateReqList.stream().flatMap(p -> p.getProperties().stream()).collect(Collectors.toList());
        // 校验规格属性以及规格值是否存在
        List<Integer> propertyIds = skuPropertyList.stream().map(ProductSkuBaseVO.Property::getPropertyId).collect(Collectors.toList());
        List<ProductPropertyRespVO> propertyAndValueList = productPropertyService.selectByIds(propertyIds);
        if (propertyAndValueList.isEmpty())
            throw ServiceExceptionUtil.exception(PROPERTY_NOT_EXISTS);
        Map<Long, ProductPropertyRespVO> propertyMap = propertyAndValueList.stream().collect(Collectors.toMap(ProductPropertyRespVO::getId, p -> p));
        skuPropertyList.forEach(p -> {
            ProductPropertyRespVO productPropertyRespVO = propertyMap.get(p.getPropertyId());
            // 如果对应的属性名不存在或属性名下的属性值集合为空，给出提示
            if (null == productPropertyRespVO || productPropertyRespVO.getPropertyValueList().isEmpty())
                throw ServiceExceptionUtil.exception(PROPERTY_NOT_EXISTS);
            // 判断改属性名对应的属性值是否存在,不存在，给出提示
            if (!productPropertyRespVO.getPropertyValueList().stream().map(ProductPropertyValueRespVO::getId).collect(Collectors.toSet()).contains(p.getValueId())) {
                throw ServiceExceptionUtil.exception(ErrorCodeConstants.PROPERTY_VALUE_NOT_EXISTS);
            }
        });
        // 校验是否有重复的sku组合
        List<List<ProductSkuBaseVO.Property>> skuProperties = skuCreateReqList.stream().map(ProductSkuBaseVO::getProperties).collect(Collectors.toList());
        Set<String> skuPropertiesConvertSet = new HashSet<>();
        skuProperties.forEach(p -> {
            // 组合属性值id为 1~2~3.... 形式的字符串，通过set的特性判断是否有重复的组合
            if (!skuPropertiesConvertSet.add(p.stream().map(pr -> String.valueOf(pr.getValueId())).sorted().collect(Collectors.joining("～")))) {
                throw ServiceExceptionUtil.exception(ErrorCodeConstants.SKU_PROPERTIES_DUPLICATED);
            }
        });
    }

    @Override
    public void batchSave(List<ProductSkuDO> skuDOList) {
        productSkuMapper.insertBatch(skuDOList);
    }
}
