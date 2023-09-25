package cn.iocoder.yudao.module.promotion.service.seckill;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.iocoder.yudao.framework.common.enums.CommonStatusEnum;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.product.api.sku.ProductSkuApi;
import cn.iocoder.yudao.module.product.api.sku.dto.ProductSkuRespDTO;
import cn.iocoder.yudao.module.product.api.spu.ProductSpuApi;
import cn.iocoder.yudao.module.product.api.spu.dto.ProductSpuRespDTO;
import cn.iocoder.yudao.module.promotion.controller.admin.seckill.vo.activity.SeckillActivityCreateReqVO;
import cn.iocoder.yudao.module.promotion.controller.admin.seckill.vo.activity.SeckillActivityPageReqVO;
import cn.iocoder.yudao.module.promotion.controller.admin.seckill.vo.activity.SeckillActivityUpdateReqVO;
import cn.iocoder.yudao.module.promotion.controller.admin.seckill.vo.product.SeckillProductBaseVO;
import cn.iocoder.yudao.module.promotion.controller.app.seckill.vo.activity.AppSeckillActivityPageReqVO;
import cn.iocoder.yudao.module.promotion.convert.seckill.seckillactivity.SeckillActivityConvert;
import cn.iocoder.yudao.module.promotion.dal.dataobject.seckill.seckillactivity.SeckillActivityDO;
import cn.iocoder.yudao.module.promotion.dal.dataobject.seckill.seckillactivity.SeckillProductDO;
import cn.iocoder.yudao.module.promotion.dal.mysql.seckill.seckillactivity.SeckillActivityMapper;
import cn.iocoder.yudao.module.promotion.dal.mysql.seckill.seckillactivity.SeckillProductMapper;
import cn.iocoder.yudao.module.promotion.util.PromotionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import static cn.hutool.core.collection.CollUtil.isNotEmpty;
import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.LocalDateTimeUtils.isBetween;
import static cn.iocoder.yudao.module.product.enums.ErrorCodeConstants.SKU_NOT_EXISTS;
import static cn.iocoder.yudao.module.product.enums.ErrorCodeConstants.SPU_NOT_EXISTS;
import static cn.iocoder.yudao.module.promotion.enums.ErrorCodeConstants.*;
import static java.util.Collections.singletonList;

/**
 * 秒杀活动 Service 实现类
 *
 * @author halfninety
 */
@Service
@Validated
public class SeckillActivityServiceImpl implements SeckillActivityService {

    @Resource
    private SeckillActivityMapper seckillActivityMapper;
    @Resource
    private SeckillProductMapper seckillProductMapper;
    @Resource
    private SeckillConfigService seckillConfigService;
    @Resource
    private ProductSpuApi productSpuApi;
    @Resource
    private ProductSkuApi productSkuApi;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createSeckillActivity(SeckillActivityCreateReqVO createReqVO) {
        // 校验商品秒杀时段是否冲突
        validateProductConflict(createReqVO.getConfigIds(), createReqVO.getSpuId(), null);
        // 校验商品是否存在
        validateProductExists(createReqVO.getSpuId(), createReqVO.getProducts());

        // 插入秒杀活动
        SeckillActivityDO activity = SeckillActivityConvert.INSTANCE.convert(createReqVO)
                .setStatus(PromotionUtils.calculateActivityStatus(createReqVO.getEndTime()))
                .setTotalStock(getSumValue(createReqVO.getProducts(), SeckillProductBaseVO::getStock, Integer::sum));
        seckillActivityMapper.insert(activity);
        // 插入商品
        List<SeckillProductDO> products = SeckillActivityConvert.INSTANCE.convertList(createReqVO.getProducts(), activity);
        seckillProductMapper.insertBatch(products);
        return activity.getId();
    }

    /**
     * 校验秒杀商品参与的活动是否存在冲突
     *
     * 1. 校验秒杀时段是否存在
     * 2. 秒杀商品是否参加其它活动
     *
     * @param configIds  秒杀时段数组
     * @param spuId      商品 SPU 编号
     * @param activityId 秒杀活动编号
     */
    private void validateProductConflict(List<Long> configIds, Long spuId, Long activityId) {
        // 1. 校验秒杀时段是否存在
        seckillConfigService.validateSeckillConfigExists(configIds);

        // 2.1 查询所有开启的秒杀活动
        List<SeckillActivityDO> activityList = seckillActivityMapper.selectListByStatus(CommonStatusEnum.ENABLE.getStatus());
        if (activityId != null) { // 排除自己
            activityList.removeIf(item -> ObjectUtil.equal(item.getId(), activityId));
        }
        // 2.2 过滤出所有 configIds 有交集的活动，判断是否存在重叠
        List<SeckillActivityDO> conflictActivityList = filterList(activityList, s -> containsAny(s.getConfigIds(), configIds));
        if (isNotEmpty(conflictActivityList)) {
            throw exception(SECKILL_ACTIVITY_SPU_CONFLICTS);
        }
    }

    /**
     * 校验秒杀商品是否都存在
     *
     * @param spuId    商品 SPU 编号
     * @param products 秒杀商品
     */
    private void validateProductExists(Long spuId, List<SeckillProductBaseVO> products) {
        // 1. 校验商品 spu 是否存在
        ProductSpuRespDTO spu = productSpuApi.getSpu(spuId);
        if (spu == null) {
            throw exception(SPU_NOT_EXISTS);
        }

        // 2. 校验商品 sku 都存在
        Map<Long, ProductSkuRespDTO> skuMap = convertMap(productSkuApi.getSkuListBySpuId(singletonList(spuId)),
                ProductSkuRespDTO::getId);
        products.forEach(product -> {
            if (!skuMap.containsKey(product.getSkuId())) {
                throw exception(SKU_NOT_EXISTS);
            }
        });
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSeckillActivity(SeckillActivityUpdateReqVO updateReqVO) {
        // 校验存在
        SeckillActivityDO seckillActivity = validateSeckillActivityExists(updateReqVO.getId());
        if (CommonStatusEnum.DISABLE.getStatus().equals(seckillActivity.getStatus())) {
            throw exception(SECKILL_ACTIVITY_UPDATE_FAIL_STATUS_CLOSED);
        }
        // 校验商品是否冲突
        validateProductConflict(updateReqVO.getConfigIds(), updateReqVO.getSpuId(), updateReqVO.getId());
        // 校验商品是否存在
        validateProductExists(updateReqVO.getSpuId(), updateReqVO.getProducts());

        // 更新活动
        SeckillActivityDO updateObj = SeckillActivityConvert.INSTANCE.convert(updateReqVO)
                .setStatus(PromotionUtils.calculateActivityStatus(updateReqVO.getEndTime()))
                .setTotalStock(getSumValue(updateReqVO.getProducts(), SeckillProductBaseVO::getStock, Integer::sum));
        seckillActivityMapper.updateById(updateObj);
        // 更新商品
        updateSeckillProduct(updateObj, updateReqVO.getProducts());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSeckillStock(Long id, Long skuId, Integer count) {
        // 1、校验秒杀活动是否存在
        SeckillActivityDO seckillActivity = getSeckillActivity(id);
        // 1.1、校验库存是否充足
        if (seckillActivity.getTotalStock() < count) {
            throw exception(SECKILL_ACTIVITY_UPDATE_STOCK_FAIL);
        }

        // 2、获取活动商品
        List<SeckillProductDO> products = getSeckillProductListByActivityId(id);
        // 2.1、过滤出购买的商品
        SeckillProductDO product = findFirst(products, item -> ObjectUtil.equal(skuId, item.getSkuId()));
        // 2.2、检查活动商品库存是否充足
        boolean isSufficient = product == null || (product.getStock() == 0 || (product.getStock() < count) || (product.getStock() - count) < 0);
        if (isSufficient) {
            throw exception(SECKILL_ACTIVITY_UPDATE_STOCK_FAIL);
        }

        // 3、更新活动商品库存
        int updateCount = seckillProductMapper.updateActivityStock(product.getId(), count);
        if (updateCount == 0) {
            throw exception(SECKILL_ACTIVITY_UPDATE_STOCK_FAIL);
        }

        // 4、更新活动库存
        updateCount = seckillActivityMapper.updateActivityStock(seckillActivity.getId(), count);
        if (updateCount == 0) {
            throw exception(SECKILL_ACTIVITY_UPDATE_STOCK_FAIL);
        }
    }

    /**
     * 更新秒杀商品
     *
     * @param activity 秒杀活动
     * @param products 该活动的最新商品配置
     */
    private void updateSeckillProduct(SeckillActivityDO activity, List<SeckillProductBaseVO> products) {
        // 第一步，对比新老数据，获得添加、修改、删除的列表
        List<SeckillProductDO> newList = SeckillActivityConvert.INSTANCE.convertList(products, activity);
        List<SeckillProductDO> oldList = seckillProductMapper.selectListByActivityId(activity.getId());
        List<List<SeckillProductDO>> diffList = diffList(oldList, newList, (oldVal, newVal) -> {
            boolean same = ObjectUtil.equal(oldVal.getSkuId(), newVal.getSkuId());
            if (same) {
                newVal.setId(oldVal.getId());
            }
            return same;
        });

        // 第二步，批量添加、修改、删除
        if (isNotEmpty(diffList.get(0))) {
            seckillProductMapper.insertBatch(diffList.get(0));
        }
        if (isNotEmpty(diffList.get(1))) {
            seckillProductMapper.updateBatch(diffList.get(1));
        }
        if (isNotEmpty(diffList.get(2))) {
            seckillProductMapper.deleteBatchIds(convertList(diffList.get(2), SeckillProductDO::getId));
        }
    }

    @Override
    public void closeSeckillActivity(Long id) {
        // 校验存在
        SeckillActivityDO activity = validateSeckillActivityExists(id);
        if (CommonStatusEnum.DISABLE.getStatus().equals(activity.getStatus())) {
            throw exception(SECKILL_ACTIVITY_CLOSE_FAIL_STATUS_CLOSED);
        }

        // 更新
        SeckillActivityDO updateObj = new SeckillActivityDO().setId(id).setStatus(CommonStatusEnum.DISABLE.getStatus());
        seckillActivityMapper.updateById(updateObj);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSeckillActivity(Long id) {
        // 校验存在
        SeckillActivityDO seckillActivity = this.validateSeckillActivityExists(id);
        if (CommonStatusEnum.ENABLE.getStatus().equals(seckillActivity.getStatus())) {
            throw exception(SECKILL_ACTIVITY_DELETE_FAIL_STATUS_NOT_CLOSED_OR_END);
        }

        // 删除活动
        seckillActivityMapper.deleteById(id);
        // 删除活动商品
        List<SeckillProductDO> products = seckillProductMapper.selectListByActivityId(id);
        seckillProductMapper.deleteBatchIds(convertSet(products, SeckillProductDO::getId));
    }

    private SeckillActivityDO validateSeckillActivityExists(Long id) {
        SeckillActivityDO seckillActivity = seckillActivityMapper.selectById(id);
        if (seckillActivity == null) {
            throw exception(SECKILL_ACTIVITY_NOT_EXISTS);
        }
        return seckillActivity;
    }

    @Override
    public SeckillActivityDO getSeckillActivity(Long id) {
        return validateSeckillActivityExists(id);
    }

    @Override
    public PageResult<SeckillActivityDO> getSeckillActivityPage(SeckillActivityPageReqVO pageReqVO) {
        return seckillActivityMapper.selectPage(pageReqVO);
    }

    @Override
    public List<SeckillProductDO> getSeckillProductListByActivityId(Long activityId) {
        return seckillProductMapper.selectListByActivityId(activityId);
    }

    @Override
    public List<SeckillProductDO> getSeckillProductListByActivityId(Collection<Long> activityIds) {
        return seckillProductMapper.selectListByActivityId(activityIds);
    }

    @Override
    public List<SeckillActivityDO> getSeckillActivityListByConfigIds(Collection<Long> ids) {
        return filterList(seckillActivityMapper.selectList(),
                item -> anyMatch(item.getConfigIds(), ids::contains));
    }

    @Override
    public List<SeckillActivityDO> getSeckillActivityListByConfigIdAndStatus(Long configId, Integer status) {
        return filterList(seckillActivityMapper.selectList(SeckillActivityDO::getStatus, status),
                item -> anyMatch(item.getConfigIds(), id -> ObjectUtil.equal(id, configId)) // 校验时段
                        && isBetween(item.getStartTime(), item.getEndTime())); // 追加当前日期是否处在活动日期之间的校验条件
    }

    @Override
    public PageResult<SeckillActivityDO> getSeckillActivityAppPageByConfigId(AppSeckillActivityPageReqVO pageReqVO) {
        return seckillActivityMapper.selectPage(pageReqVO, CommonStatusEnum.ENABLE.getStatus());
    }

    @Override
    public List<SeckillProductDO> getSeckillActivityProductList(Long id, Collection<Long> skuIds) {
        // 1、校验秒杀活动是否存在
        validateSeckillActivityExists(id);
        // 2、校验活动商品是否存在
        List<SeckillProductDO> productList = filterList(seckillProductMapper.selectListByActivityId(id),
                item -> skuIds.contains(item.getSkuId()));
        if (CollectionUtil.isEmpty(productList)) {
            throw exception(SKU_NOT_EXISTS);
        }

        return productList;
    }

}
