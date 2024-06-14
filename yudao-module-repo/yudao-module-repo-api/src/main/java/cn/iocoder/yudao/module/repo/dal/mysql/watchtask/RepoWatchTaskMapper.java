package cn.iocoder.yudao.module.repo.dal.mysql.watchtask;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.repo.controller.admin.watchtask.vo.RepoWatchTaskPageReqVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 仓库监控任务 Mapper
 *
 * @author yunchao
 */
@Mapper
public interface RepoWatchTaskMapper extends BaseMapperX<RepoWatchTaskDO> {

    default PageResult<RepoWatchTaskDO> selectPage(RepoWatchTaskPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<RepoWatchTaskDO>()
                .likeIfPresent(RepoWatchTaskDO::getName, reqVO.getName())
                .eqIfPresent(RepoWatchTaskDO::getType, reqVO.getType())
                .eqIfPresent(RepoWatchTaskDO::getStatus, reqVO.getStatus())
                .eqIfPresent(RepoWatchTaskDO::getWorkStatus, reqVO.getWorkStatus())
                .eqIfPresent(RepoWatchTaskDO::getKeywords, reqVO.getKeywords())
                .betweenIfPresent(RepoWatchTaskDO::getCreateTime, reqVO.getCreateTime())
                .betweenIfPresent(RepoWatchTaskDO::getUpdateTime, reqVO.getUpdateTime())
                .orderByDesc(RepoWatchTaskDO::getId));
    }

    @Select("${sql}")
    List<RepoWatchTaskDO> selectListRaw(@Param("sql") String sql);
}
