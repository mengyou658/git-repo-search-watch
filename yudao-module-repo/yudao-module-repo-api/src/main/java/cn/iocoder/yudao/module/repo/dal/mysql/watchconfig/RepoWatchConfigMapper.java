package cn.iocoder.yudao.module.repo.dal.mysql.watchconfig;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.repo.controller.admin.watchconfig.vo.RepoWatchConfigPageReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig.RepoWatchConfigDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 参数配置 Mapper
 *
 * @author yunchao
 */
@Mapper
public interface RepoWatchConfigMapper extends BaseMapperX<RepoWatchConfigDO> {

    default PageResult<RepoWatchConfigDO> selectPage(RepoWatchConfigPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<RepoWatchConfigDO>()
                .eqIfPresent(RepoWatchConfigDO::getConfigKey, reqVO.getConfigKey())
                .eqIfPresent(RepoWatchConfigDO::getValue, reqVO.getValue())
                .betweenIfPresent(RepoWatchConfigDO::getCreateTime, reqVO.getCreateTime())
                .betweenIfPresent(RepoWatchConfigDO::getUpdateTime, reqVO.getUpdateTime())
                .orderByDesc(RepoWatchConfigDO::getId));
    }

    default RepoWatchConfigDO selectByKey(String key, Long loginUserId) {
        return selectOne(RepoWatchConfigDO::getConfigKey, key, RepoWatchConfigDO::getCreator, loginUserId);
    }
}
