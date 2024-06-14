package cn.iocoder.yudao.module.repo.dal.mysql.watchresult;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.repo.controller.admin.watchresult.vo.RepoWatchResultPageReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 仓库监控结果 Mapper
 *
 * @author yunchao
 */
@Mapper
public interface RepoWatchResultMapper extends BaseMapperX<RepoWatchResultDO> {

    default PageResult<RepoWatchResultDO> selectPage(RepoWatchResultPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<RepoWatchResultDO>()
                .eqIfPresent(RepoWatchResultDO::getTaskId, reqVO.getTaskId())
                .likeIfPresent(RepoWatchResultDO::getRepoName, reqVO.getRepoName())
                .eqIfPresent(RepoWatchResultDO::getRepoDesc, reqVO.getRepoDesc())
                .betweenIfPresent(RepoWatchResultDO::getCreateTime, reqVO.getCreateTime())
                .betweenIfPresent(RepoWatchResultDO::getUpdateTime, reqVO.getUpdateTime())
                .orderByDesc(RepoWatchResultDO::getId));
    }

    @Select("${sql}")
    Long selectCountRaw(@Param("sql") String sql);

    @Select("${sql}")
    List<RepoWatchResultDO> selectListRaw(@Param("sql") String sql);
}
