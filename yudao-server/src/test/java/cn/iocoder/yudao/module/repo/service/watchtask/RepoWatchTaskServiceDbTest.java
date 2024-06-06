package cn.iocoder.yudao.module.repo.service.watchtask;

import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.service.RepoService;
import cn.iocoder.yudao.server.YudaoServerApplication;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest(classes = YudaoServerApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class RepoWatchTaskServiceDbTest {


    @Resource(name = "repoGithubServiceImpl")
    private RepoService repoGithubService;

    @Test
    @Transactional
    @Rollback(value = false)
    public void executeTaskApi() {
        RepoWatchTaskDO vo = new RepoWatchTaskDO();
        vo.setId(1L);
        vo.setName("test");
        vo.setType(0);
        vo.setStatus(0);
        vo.setWorkStatus(0);
        vo.setKeywords("language:Go");
        repoGithubService.executeSearchTaskApi(vo);
    }
}
