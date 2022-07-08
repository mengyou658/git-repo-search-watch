package cn.iocoder.yudao.module.market.dal.mysql.banner;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.market.controller.admin.banner.vo.BannerPageReqVO;
import cn.iocoder.yudao.module.market.dal.dataobject.banner.BannerDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * Banner Mapper
 *
 * @author xia
 */
@Mapper
public interface BannerMapper extends BaseMapperX<BannerDO> {

    default PageResult<BannerDO> selectPage(BannerPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<BannerDO>()
                .likeIfPresent(BannerDO::getTitle, reqVO.getTitle())
                .eqIfPresent(BannerDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(BannerDO::getCreateTime, reqVO.getBeginCreateTime(), reqVO.getEndCreateTime())
                .betweenIfPresent(BannerDO::getCreateTime, reqVO.getBeginCreateTime(), reqVO.getEndCreateTime())
                .orderByDesc(BannerDO::getSort));
    }

}
