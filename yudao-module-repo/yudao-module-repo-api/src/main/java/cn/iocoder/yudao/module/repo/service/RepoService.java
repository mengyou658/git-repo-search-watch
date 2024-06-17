package cn.iocoder.yudao.module.repo.service;

import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;

public interface RepoService {

    void executeSearchTaskApi(RepoWatchTaskDO repoWatchTaskDO);

    void cloneGit2Local(RepoWatchResultDO result, RepoWatchTaskDO task);

    void cloneGit2AliyunCodeUp(RepoWatchResultDO result, RepoWatchTaskDO task);

    void executeTrendingTaskSpider(RepoWatchTaskDO repoWatchTaskDO);

    void removeGitClone(RepoWatchResultDO watchResult, RepoWatchTaskDO task);

    void cleanRepo();
}
