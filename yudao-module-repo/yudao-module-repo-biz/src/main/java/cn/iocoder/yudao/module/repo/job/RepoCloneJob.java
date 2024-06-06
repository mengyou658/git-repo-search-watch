package cn.iocoder.yudao.module.repo.job;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.util.RandomUtil;
import cn.iocoder.yudao.framework.quartz.core.handler.JobHandler;
import cn.iocoder.yudao.framework.tenant.core.job.TenantJob;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.dal.mysql.watchresult.RepoWatchResultMapper;
import cn.iocoder.yudao.module.repo.dal.mysql.watchtask.RepoWatchTaskMapper;
import cn.iocoder.yudao.module.repo.service.RepoService;
import cn.iocoder.yudao.module.repo.service.watchtask.RepoWatchTaskService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.aop.scope.ScopedObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Slf4j
public class RepoCloneJob implements JobHandler {

    @Resource(name = "repoGithubServiceImpl")
    private RepoService repoGithubService;

    @Resource
    private RepoWatchTaskService repoWatchTaskService;

    @Resource
    private RepoWatchTaskMapper repoWatchTaskMapper;

    @Resource
    private RepoWatchResultMapper watchResultMapper;

    @Value("${debug.enabled:false}")
    private Boolean debugMode;

    private TimedCache<Long, Integer> timedCache = CacheUtil.newTimedCache(120000L);

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    @TenantJob // 标记多租户
    public String execute(String param) {
        log.info("RepoCloneJob start .... ");

//        if (debugMode != null && debugMode) {
//            log.info("RepoCloneJob debug mode skip .... ");
//            return "debug mode";
//        }

        if (!timedCache.containsKey(1L)) {
            timedCache.put(1L, 0);
            try {
                List<RepoWatchResultDO> taskList = watchResultMapper.selectJoinList(RepoWatchResultDO.class, new MPJLambdaWrapper<RepoWatchResultDO>()
                        .selectAll(RepoWatchResultDO.class)
                        .selectAs(RepoWatchTaskDO::getRepoClonePath, "'task.repoClonePath'")
                        .selectAs(RepoWatchTaskDO::getRepoType, "'task.repoType'")
                        .selectAs(RepoWatchTaskDO::getCloneType, "'task.cloneType'")
                        .selectAs(RepoWatchTaskDO::getName, "'task.name'")
                        .innerJoin(RepoWatchTaskDO.class, RepoWatchTaskDO::getId, RepoWatchResultDO::getTaskId)
                        .eq(RepoWatchTaskDO::getRepoCloneFlag, 1)
                        .eq(RepoWatchTaskDO::getStatus, 0)
                        .eq(RepoWatchTaskDO::getDeleted, 0)
                        .and(ew-> ew.isNull(RepoWatchResultDO::getRepoLocalClone).or()
                                .eq(RepoWatchResultDO::getRepoLocalClone, ""))
                );

                int count = 0;
                for (RepoWatchResultDO repoWatchResultDO : taskList) {
                    RepoWatchTaskDO task = repoWatchResultDO.getTask();
                    Integer repoType = task.getRepoType();
                    try {
                        if (repoType == 0) {
                            Integer cloneType = task.getCloneType();
                            if (cloneType == 0) {
                                repoGithubService.cloneGit2Local(repoWatchResultDO, task);
                            } else {
                                repoGithubService.cloneGit2AliyunCodeUp(repoWatchResultDO, task);
                            }
                        } else {
                            // TODO 其他类型
                            log.error("RepoSearchJob 暂不支持该类型 {}", repoType);
                        }
                        Thread.sleep(500, RandomUtil.randomInt(200, 1000));
                    } catch (Exception e) {
                        log.error("RepoSearchJob " + e.getMessage());
                    }
                }
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
            timedCache.remove(1L);
        }

        log.info("RepoCloneJob end .... ");
        return "success";
    }

}
