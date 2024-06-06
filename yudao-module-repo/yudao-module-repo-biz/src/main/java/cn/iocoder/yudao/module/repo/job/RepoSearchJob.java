package cn.iocoder.yudao.module.repo.job;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.RandomUtil;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.quartz.core.handler.JobHandler;
import cn.iocoder.yudao.framework.tenant.core.job.TenantJob;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.dal.mysql.watchresult.RepoWatchResultMapper;
import cn.iocoder.yudao.module.repo.service.RepoService;
import cn.iocoder.yudao.module.repo.service.watchtask.RepoWatchTaskService;
import cn.iocoder.yudao.module.system.enums.sms.SmsSceneEnum;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Slf4j
public class RepoSearchJob implements JobHandler {

    @Resource(name = "repoGithubServiceImpl")
    private RepoService repoGithubService;

    @Resource
    private RepoWatchTaskService repoWatchTaskService;

    @Resource
    private RepoWatchResultMapper watchResultMapper;

    @Value("${debug.enabled:false}")
    private Boolean debugMode;

    private TimedCache<Long, Integer> timedCache = CacheUtil.newTimedCache(120000L);


    @Override
    @TenantJob // 标记多租户
    public String execute(String param) {
        log.info("RepoSearchJob start .... ");
        if (debugMode != null && debugMode) {
            return "debug mode";
        }
        List<RepoWatchTaskDO> list = repoWatchTaskService.list(new LambdaQueryWrapperX<RepoWatchTaskDO>()
                .eq(RepoWatchTaskDO::getStatus, 0)
                .eq(RepoWatchTaskDO::getDeleted, 0)
        );
        log.info("RepoSearchJob task size {} ", list.size());
        if (CollUtil.isNotEmpty(list)) {
            for (RepoWatchTaskDO repoWatchTaskDO : list) {
                // 这里限制非admin用户只能生成2个数据
                String creator = repoWatchTaskDO.getCreator();
                if (!creator.equals("1")) {
                    repoWatchTaskDO.setRepoLimit(2);
                    Long count = watchResultMapper.selectCount(new LambdaQueryWrapper<RepoWatchResultDO>()
                            .eq(RepoWatchResultDO::getTaskId, repoWatchTaskDO.getId())
                            .eq(RepoWatchResultDO::getCreator, creator)
                    );
                    if (null != count && count >= 2) {
                        continue;
                    }
                }
                try {
                    if (timedCache.containsKey(repoWatchTaskDO.getId())) {
                        continue;
                    }
                    timedCache.put(repoWatchTaskDO.getId(), 0);
                    Integer repoType = repoWatchTaskDO.getRepoType();
                    if (repoType == 0) {
                        repoGithubService.executeSearchTaskApi(repoWatchTaskDO);
                    } else {
                        // TODO 其他类型
                        log.error("RepoSearchJob 暂不支持该类型 {}", repoType);
                    }
                    timedCache.remove(repoWatchTaskDO.getId());
                    Thread.sleep(1000, RandomUtil.randomInt(200, 2000));
                } catch (Exception e) {
                    log.error("RepoSearchJob " + e.getMessage());
                    timedCache.remove(repoWatchTaskDO.getId());
                }
            }
        }

        log.info("RepoSearchJob end .... ");
        return "success";
    }

}
