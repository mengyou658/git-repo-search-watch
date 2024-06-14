package cn.iocoder.yudao.module.repo.dal.mysql.watchresult;

import cn.iocoder.yudao.module.repo.service.RepoService;
import cn.iocoder.yudao.server.YudaoServerApplication;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = YudaoServerApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class RepoWatchResultMapperTest {

    @Resource
    private RepoWatchResultMapper repoWatchResultMapper;

    @Resource(name = "repoGithubServiceImpl")
    private RepoService repoGithubService;

    @Test
    public void selectCountRawTest() {
        Long count = repoWatchResultMapper.selectCountRaw("select count(0) from repo_watch_result where repo_id ='R_kgDOMFqqhA'");
        System.out.println(count);
    }
    @Test
    public void cleanRepoTest() {
        repoGithubService.cleanRepo();
    }
}
