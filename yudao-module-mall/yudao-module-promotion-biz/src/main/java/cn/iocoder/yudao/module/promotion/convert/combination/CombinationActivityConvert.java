package cn.iocoder.yudao.module.promotion.convert.combination;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.collection.CollectionUtils;
import cn.iocoder.yudao.framework.common.util.collection.MapUtils;
import cn.iocoder.yudao.module.member.api.user.dto.MemberUserRespDTO;
import cn.iocoder.yudao.module.product.api.sku.dto.ProductSkuRespDTO;
import cn.iocoder.yudao.module.product.api.spu.dto.ProductSpuRespDTO;
import cn.iocoder.yudao.module.promotion.api.combination.dto.CombinationRecordCreateReqDTO;
import cn.iocoder.yudao.module.promotion.controller.admin.combination.vo.activity.CombinationActivityCreateReqVO;
import cn.iocoder.yudao.module.promotion.controller.admin.combination.vo.activity.CombinationActivityPageItemRespVO;
import cn.iocoder.yudao.module.promotion.controller.admin.combination.vo.activity.CombinationActivityRespVO;
import cn.iocoder.yudao.module.promotion.controller.admin.combination.vo.activity.CombinationActivityUpdateReqVO;
import cn.iocoder.yudao.module.promotion.controller.admin.combination.vo.product.CombinationProductBaseVO;
import cn.iocoder.yudao.module.promotion.controller.admin.combination.vo.product.CombinationProductRespVO;
import cn.iocoder.yudao.module.promotion.controller.admin.combination.vo.recrod.CombinationRecordRespVO;
import cn.iocoder.yudao.module.promotion.controller.app.combination.vo.activity.AppCombinationActivityDetailRespVO;
import cn.iocoder.yudao.module.promotion.controller.app.combination.vo.activity.AppCombinationActivityRespVO;
import cn.iocoder.yudao.module.promotion.controller.app.combination.vo.record.AppCombinationRecordRespVO;
import cn.iocoder.yudao.module.promotion.dal.dataobject.combination.CombinationActivityDO;
import cn.iocoder.yudao.module.promotion.dal.dataobject.combination.CombinationProductDO;
import cn.iocoder.yudao.module.promotion.dal.dataobject.combination.CombinationRecordDO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

import java.util.List;
import java.util.Map;

import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.convertMap;
import static cn.iocoder.yudao.framework.common.util.collection.MapUtils.findAndThen;

/**
 * 拼团活动 Convert
 *
 * @author HUIHUI
 */
@Mapper
public interface CombinationActivityConvert {

    CombinationActivityConvert INSTANCE = Mappers.getMapper(CombinationActivityConvert.class);

    CombinationActivityDO convert(CombinationActivityCreateReqVO bean);

    CombinationActivityDO convert(CombinationActivityUpdateReqVO bean);

    CombinationActivityRespVO convert(CombinationActivityDO bean);

    CombinationProductRespVO convert(CombinationProductDO bean);

    default CombinationActivityRespVO convert(CombinationActivityDO activity, List<CombinationProductDO> products) {
        return convert(activity).setProducts(convertList2(products));
    }

    List<CombinationActivityRespVO> convertList(List<CombinationActivityDO> list);


    default PageResult<CombinationActivityPageItemRespVO> convertPage(PageResult<CombinationActivityDO> page,
                                                                      List<CombinationProductDO> productList,
                                                                      Map<Long, Integer> groupCountMap,
                                                                      Map<Long, Integer> groupSuccessCountMap,
                                                                      Map<Long, Integer> recordCountMap,
                                                                      List<ProductSpuRespDTO> spuList) {
        PageResult<CombinationActivityPageItemRespVO> pageResult = convertPage(page);
        Map<Long, ProductSpuRespDTO> spuMap = convertMap(spuList, ProductSpuRespDTO::getId);
        pageResult.getList().forEach(item -> {
            MapUtils.findAndThen(spuMap, item.getSpuId(), spu -> item.setSpuName(spu.getName()).setPicUrl(spu.getPicUrl())
                    .setMarketPrice(spu.getMarketPrice()));
            item.setProducts(convertList2(productList));
            // 设置统计字段
            item.setGroupCount(groupCountMap.getOrDefault(item.getId(), 0))
                    .setGroupSuccessCount(groupSuccessCountMap.getOrDefault(item.getId(), 0))
                    .setRecordCount(recordCountMap.getOrDefault(item.getId(), 0));
        });
        return pageResult;
    }
    PageResult<CombinationActivityPageItemRespVO> convertPage(PageResult<CombinationActivityDO> page);

    List<CombinationProductRespVO> convertList2(List<CombinationProductDO> productDOs);

    @Mappings({
            @Mapping(target = "id", ignore = true),
            @Mapping(target = "activityId", source = "activity.id"),
            @Mapping(target = "spuId", source = "activity.spuId"),
            @Mapping(target = "skuId", source = "product.skuId"),
            @Mapping(target = "combinationPrice", source = "product.combinationPrice"),
            @Mapping(target = "activityStartTime", source = "activity.startTime"),
            @Mapping(target = "activityEndTime", source = "activity.endTime")
    })
    CombinationProductDO convert(CombinationActivityDO activity, CombinationProductBaseVO product);

    default List<CombinationProductDO> convertList(List<? extends CombinationProductBaseVO> products, CombinationActivityDO activity) {
        return CollectionUtils.convertList(products, item -> convert(activity, item).setActivityStatus(activity.getStatus()));
    }

    default List<CombinationProductDO> convertList(List<CombinationProductBaseVO> updateProductVOs,
                                                   List<CombinationProductDO> products, CombinationActivityDO activity) {
        Map<Long, Long> productMap = convertMap(products, CombinationProductDO::getSkuId, CombinationProductDO::getId);
        return CollectionUtils.convertList(updateProductVOs, updateProductVO -> convert(activity, updateProductVO)
                .setId(productMap.get(updateProductVO.getSkuId()))
                .setActivityStatus(activity.getStatus()));
    }

    CombinationRecordDO convert(CombinationRecordCreateReqDTO reqDTO);

    default CombinationRecordDO convert(CombinationRecordCreateReqDTO reqDTO,
                                        CombinationActivityDO activity, MemberUserRespDTO user,
                                        ProductSpuRespDTO spu, ProductSkuRespDTO sku) {
        return convert(reqDTO)
                .setCount(reqDTO.getCount())
                .setVirtualGroup(false)
                .setExpireTime(activity.getStartTime().plusHours(activity.getLimitDuration()))
                .setUserSize(activity.getUserSize())
                .setNickname(user.getNickname())
                .setAvatar(user.getAvatar())
                .setSpuName(spu.getName())
                .setPicUrl(sku.getPicUrl());
    }

    List<AppCombinationActivityRespVO> convertAppList(List<CombinationActivityDO> list);

    default List<AppCombinationActivityRespVO> convertAppList(List<CombinationActivityDO> list, List<ProductSpuRespDTO> spuList) {
        List<AppCombinationActivityRespVO> activityList = convertAppList(list);
        Map<Long, ProductSpuRespDTO> spuMap = convertMap(spuList, ProductSpuRespDTO::getId);
        return CollectionUtils.convertList(activityList, item -> {
            findAndThen(spuMap, item.getSpuId(), spu -> item.setPicUrl(spu.getPicUrl()).setMarketPrice(spu.getMarketPrice()));
            return item;
        });
    }

    PageResult<AppCombinationActivityRespVO> convertAppPage(PageResult<CombinationActivityDO> result);

    default PageResult<AppCombinationActivityRespVO> convertAppPage(PageResult<CombinationActivityDO> result, List<ProductSpuRespDTO> spuList) {
        PageResult<AppCombinationActivityRespVO> appPage = convertAppPage(result);
        Map<Long, ProductSpuRespDTO> spuMap = convertMap(spuList, ProductSpuRespDTO::getId);
        List<AppCombinationActivityRespVO> list = CollectionUtils.convertList(appPage.getList(), item -> {
            findAndThen(spuMap, item.getSpuId(), spu -> {
                item.setPicUrl(spu.getPicUrl()).setMarketPrice(spu.getMarketPrice());
            });
            return item;
        });
        appPage.setList(list);
        return appPage;
    }

    AppCombinationActivityDetailRespVO convert2(CombinationActivityDO combinationActivity);

    List<AppCombinationActivityDetailRespVO.Product> convertList1(List<CombinationProductDO> products);

    default AppCombinationActivityDetailRespVO convert3(CombinationActivityDO combinationActivity, List<CombinationProductDO> products) {
        return convert2(combinationActivity).setProducts(convertList1(products));
    }

    List<AppCombinationRecordRespVO> convertList3(List<CombinationRecordDO> records);

    AppCombinationRecordRespVO convert(CombinationRecordDO record);

    PageResult<CombinationRecordRespVO> convert(PageResult<CombinationRecordDO> result);

}
