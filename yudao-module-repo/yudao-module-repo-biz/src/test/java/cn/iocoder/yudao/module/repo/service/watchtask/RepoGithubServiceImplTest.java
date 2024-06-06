package cn.iocoder.yudao.module.repo.service.watchtask;

import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.service.RepoGithubServiceImpl;
import cn.iocoder.yudao.module.repo.service.RepoService;
import org.junit.jupiter.api.Test;

class RepoGithubServiceImplTest {

    private RepoService repoWatchTaskService = new RepoGithubServiceImpl();

    @Test
    void executeTask() {
        RepoWatchTaskDO vo = new RepoWatchTaskDO();
        vo.setId(1L);
        vo.setName("test");
        vo.setType(0);
        vo.setStatus(0);
        vo.setWorkStatus(0);
        vo.setKeywords("language:Go");
        repoWatchTaskService.executeSearchTaskSpider(vo);

    }
    @Test
    void executeTaskApi() {
        RepoWatchTaskDO vo = new RepoWatchTaskDO();
        vo.setId(1L);
        vo.setName("test");
        vo.setType(0);
        vo.setStatus(0);
        vo.setWorkStatus(0);
        vo.setKeywords("language:Go");
        repoWatchTaskService.executeSearchTaskApi(vo);

    }
}
