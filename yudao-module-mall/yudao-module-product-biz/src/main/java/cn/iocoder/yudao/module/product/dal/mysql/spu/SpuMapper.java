package cn.iocoder.yudao.module.product.dal.mysql.spu;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.product.dal.dataobject.spu.SpuDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.product.controller.admin.spu.vo.*;

/**
 * 商品spu Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface SpuMapper extends BaseMapperX<SpuDO> {

    default PageResult<SpuDO> selectPage(SpuPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<SpuDO>()
                .likeIfPresent(SpuDO::getName, reqVO.getName())
                .eqIfPresent(SpuDO::getSellPoint, reqVO.getSellPoint())
                .eqIfPresent(SpuDO::getDescription, reqVO.getDescription())
                .eqIfPresent(SpuDO::getCategoryId, reqVO.getCategoryId())
                .eqIfPresent(SpuDO::getPicUrls, reqVO.getPicUrls())
                .eqIfPresent(SpuDO::getSort, reqVO.getSort())
                .eqIfPresent(SpuDO::getLikeCount, reqVO.getLikeCount())
                .eqIfPresent(SpuDO::getPrice, reqVO.getPrice())
                .eqIfPresent(SpuDO::getQuantity, reqVO.getQuantity())
                .eqIfPresent(SpuDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(SpuDO::getCreateTime, reqVO.getBeginCreateTime(), reqVO.getEndCreateTime())
                .orderByDesc(SpuDO::getId));
    }

    default List<SpuDO> selectList(SpuExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<SpuDO>()
                .likeIfPresent(SpuDO::getName, reqVO.getName())
                .eqIfPresent(SpuDO::getSellPoint, reqVO.getSellPoint())
                .eqIfPresent(SpuDO::getDescription, reqVO.getDescription())
                .eqIfPresent(SpuDO::getCategoryId, reqVO.getCategoryId())
                .eqIfPresent(SpuDO::getPicUrls, reqVO.getPicUrls())
                .eqIfPresent(SpuDO::getSort, reqVO.getSort())
                .eqIfPresent(SpuDO::getLikeCount, reqVO.getLikeCount())
                .eqIfPresent(SpuDO::getPrice, reqVO.getPrice())
                .eqIfPresent(SpuDO::getQuantity, reqVO.getQuantity())
                .eqIfPresent(SpuDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(SpuDO::getCreateTime, reqVO.getBeginCreateTime(), reqVO.getEndCreateTime())
                .orderByDesc(SpuDO::getId));
    }

}
