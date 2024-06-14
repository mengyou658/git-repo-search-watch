package cn.iocoder.yudao.module.repo.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.RuntimeUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.iocoder.yudao.module.infra.service.config.ConfigService;
import cn.iocoder.yudao.module.repo.controller.admin.RepoConfigVO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchconfig.RepoWatchConfigDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchresult.RepoWatchResultDO;
import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import cn.iocoder.yudao.module.repo.dal.mysql.watchresult.RepoWatchResultMapper;
import cn.iocoder.yudao.module.repo.dal.mysql.watchtask.RepoWatchTaskMapper;
import cn.iocoder.yudao.module.repo.service.watchconfig.RepoWatchConfigService;
import cn.iocoder.yudao.module.repo.service.watchtask.RepoWatchTaskServiceImpl;
import cn.iocoder.yudao.module.system.api.dict.DictDataApi;
import com.alibaba.fastjson.JSON;
import com.aliyun.devops20210625.Client;
import com.aliyun.devops20210625.models.CreateRepositoryRequest;
import com.aliyun.devops20210625.models.CreateRepositoryResponse;
import com.aliyun.devops20210625.models.CreateRepositoryResponseBody;
import com.aliyun.devops20210625.models.DeleteRepositoryRequest;
import com.aliyun.devops20210625.models.DeleteRepositoryResponse;
import com.aliyun.devops20210625.models.GetRepositoryRequest;
import com.aliyun.devops20210625.models.GetRepositoryResponse;
import com.aliyun.devops20210625.models.GetRepositoryResponseBody;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.microsoft.playwright.Browser;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.BrowserType;
import com.microsoft.playwright.ElementHandle;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.Playwright;
import com.microsoft.playwright.options.WaitUntilState;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import org.kohsuke.github.GHDirection;
import org.kohsuke.github.GHRepository;
import org.kohsuke.github.GHRepositorySearchBuilder;
import org.kohsuke.github.GitHub;
import org.kohsuke.github.GitHubBuilder;
import org.kohsuke.github.PagedSearchIterable;
import org.kohsuke.github.extras.okhttp3.OkHttpGitHubConnector;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Slf4j
public class RepoGithubServiceImpl implements RepoService {

    @Resource
    private RepoWatchTaskMapper repoWatchTaskMapper;

    @Resource
    private RepoWatchResultMapper repoWatchResultMapper;

    @Resource
    private RepoWatchConfigService repoWatchConfigService;

    @Resource
    private ConfigService configService;

    @Resource
    private DictDataApi dictDataApi;

    private GitHub gitHubGlobal;

    private BrowserContext browserContextGlobal;

    private Browser browserGlobal;

    public RepoConfigVO getRepoConfig(String creator) {
        RepoConfigVO defaultVal = new RepoConfigVO();
        defaultVal.setChromeExePath("C:\\Users\\Administrator\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe");
        defaultVal.setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36");
        defaultVal.setLocalClonePath("F:\\github-repo-clone");
        defaultVal.setAliyunCloneAk("");
        defaultVal.setAliyunCloneSk("");
        defaultVal.setAliyunCloneOrganizationId("");
        defaultVal.setAliyunCloneNamespaceId(0L);
        ArrayList<RepoConfigVO.RepoConfig> repoConfigs = new ArrayList<>();
        RepoConfigVO.RepoConfig e = new RepoConfigVO.RepoConfig();
        e.setRepoType(0);
        e.setUsername("");
        e.setPassword("");
        repoConfigs.add(e);
        defaultVal.setRepoConfigs(repoConfigs);

        RepoWatchConfigDO configByKey = repoWatchConfigService.getConfigByKey("repo.config", Long.parseLong(creator));
        return configByKey != null && configByKey.getValue() != null ? JSON.parseObject(configByKey.getValue(), RepoConfigVO.class) : defaultVal;
    }

    private GitHub initGithub(String creator) {
        if (null != gitHubGlobal) {
            return gitHubGlobal;
        }
        GitHub github = null;
        try {
            RepoConfigVO.RepoConfig repoConf = getRepoConfig(creator).getRepoConfigs().stream().filter(e -> e.getRepoType() == 0).findAny().get();
            HttpLoggingInterceptor logging = new HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BASIC);
            github = new GitHubBuilder()
                    .withPassword(repoConf.getUsername(), repoConf.getPassword())
                    .withConnector(new OkHttpGitHubConnector(new OkHttpClient.Builder().addInterceptor(logging).build()))
                    .build();
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        gitHubGlobal = github;
        return github;
    }

    private String getGithubHost() {
        return configService.getConfigStringByKey("github.host", "https://github.com");
    }

    @Override
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public void executeSearchTaskApi(RepoWatchTaskDO repoWatchTaskDO) {
        try {
            GitHub gitHub = initGithub(repoWatchTaskDO.getCreator());
            if (null == gitHub) {
                log.warn("github api init error");
                return;
            }
            Integer total = repoWatchTaskDO.getRepoLimit();
            if (null == total) {
                total = 50;
            }
            String keywords = repoWatchTaskDO.getKeywords();
            String search = StrUtil.join(" OR ", StrUtil.split(keywords, ",").stream().map(keyword -> "\"" + keyword + "\"").toList());
            String keywordLang = repoWatchTaskDO.getKeywordLang();
            String keywordNegative = repoWatchTaskDO.getKeywordNegative();
            List<String> keywordNegativeList = new ArrayList<>();
            if (StrUtil.isNotBlank(keywordNegative)) {
                keywordNegativeList = StrUtil.split(keywordNegative, ",");
            }
            GHRepositorySearchBuilder queryBuilder = gitHub.searchRepositories().q(search)
//                    .in("readme")
                    .sort(GHRepositorySearchBuilder.Sort.UPDATED)
                    .order(GHDirection.DESC);
            if (StrUtil.isNotBlank(keywordLang)) {
                queryBuilder.language(keywordLang);
            }
            PagedSearchIterable<GHRepository> repoList = queryBuilder.list().withPageSize(total);
            log.debug(" {} github repo elements size {} {} {} {}", repoWatchTaskDO.getName(), search, "language:" + keywordLang, keywordNegative, repoList.getTotalCount());
            LocalDateTime now = LocalDateTime.now();
            int index = 0;
            List<RepoWatchResultDO> taskList = new ArrayList<>();
            for (GHRepository ghRepository : repoList) {
                log.debug("github repo elements found {}", ghRepository.getUrl());
                index++;
                try {
                    LocalDateTime createTime = LocalDateTimeUtil.of(ghRepository.getCreatedAt());
                    String nodeId = ghRepository.getNodeId();
                    String repoUrl = ghRepository.getHtmlUrl().toString();
                    Long count = repoWatchResultMapper.selectCountRaw("select count(0) from repo_watch_result where repo_id = '" + nodeId + "'");
                    if (count != null && count > 0) {
                        break;
                    }
                    String description = ghRepository.getDescription();
                    if (keywordNegativeList.stream().anyMatch(keyword -> ghRepository.getFullName().contains(keyword) || (null != description && description.contains(keyword)))) {
                        continue;
                    }
                    RepoWatchResultDO task = new RepoWatchResultDO();
                    task.setTaskId(repoWatchTaskDO.getId());
                    task.setRepoId(nodeId);
                    task.setRepoUrl(repoUrl);
                    task.setRepoLang(ghRepository.getLanguage());
                    task.setRepoSshUrl(ghRepository.getSshUrl());
                    task.setRepoName(ghRepository.getFullName());
                    task.setRepoDesc(description);
                    task.setCreateTime(createTime);
                    task.setUpdateTime(now);
                    task.setCreator(repoWatchTaskDO.getCreator());
                    task.setUpdater(repoWatchTaskDO.getCreator());
                    taskList.add(task);
//                    if (null != repoWatchResultMapper) {
//                        repoWatchResultMapper.insert(task);
//                    }
                    // 判断是否clone
//                    if (repoWatchTaskDO.getRepoCloneFlag() == 1) {
//                        getSelf().cloneGithub(task, repoWatchTaskDO);
//                    }
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                }
                if (index >= total) {
                    break;
                }
            }

            if (CollUtil.isNotEmpty(taskList)) {
                repoWatchResultMapper.insertBatch(taskList);
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

    }

    @Override
    public void cloneGit2Local(RepoWatchResultDO result, RepoWatchTaskDO task) {
        try {
            String localClonePath = getRepoConfig(result.getCreator()).getLocalClonePath();

            File file = Path.of(localClonePath, task.getName(), result.getRepoName().replaceAll("/", "--")).toFile();
            if (!file.exists()) {
                file.mkdirs();
            }
            String cmd = "git clone " + result.getRepoSshUrl() + " " + file.toString();
            log.info("cloneGithub local {}", cmd);
//            Git.cloneRepository().setDirectory(file).setURI(result.getRepoSshUrl()).call();
            RuntimeUtil.exec(cmd);

            repoWatchResultMapper.update(new LambdaUpdateWrapper<RepoWatchResultDO>()
                    .eq(RepoWatchResultDO::getId, result.getId())
                    .set(RepoWatchResultDO::getRepoLocalClone, file.toString())
            );
        } catch (Exception e) {
            log.error("cloneGithub local error " + e.getMessage(), e);
        }
    }

    @Override
    public void cloneGit2AliyunCodeUp(RepoWatchResultDO result, RepoWatchTaskDO task) {
        RepoConfigVO repoConfig = getRepoConfig(result.getCreator());
        String repoName = result.getRepoName().replace("/", "--");
        try {
            com.aliyun.teaopenapi.models.Config config = new com.aliyun.teaopenapi.models.Config()
                    .setAccessKeyId(repoConfig.getAliyunCloneAk())
                    .setAccessKeySecret(repoConfig.getAliyunCloneSk())
                    .setEndpoint("devops.cn-hangzhou.aliyuncs.com")
                    ;

            Client client = new Client(config);

            CreateRepositoryRequest createRepositoryRequest = new CreateRepositoryRequest()
                    .setOrganizationId(repoConfig.getAliyunCloneOrganizationId())
                    .setSync(true)
                    .setCreateParentPath(true)
                    .setName(repoName)
//                    .path("gitsearch")
                    .setImportUrl(result.getRepoUrl())
                    .setNamespaceId(repoConfig.getAliyunCloneNamespaceId())
                    ;

            CreateRepositoryResponse createRepositoryResponse = client.createRepository(createRepositoryRequest);
            CreateRepositoryResponseBody body = createRepositoryResponse.getBody();
            log.debug("cloneGithubAliyunCodeUp res {} {}", createRepositoryRequest, body.getErrorMessage());
            if (body.getSuccess()) {
                CreateRepositoryResponseBody.CreateRepositoryResponseBodyResult resultData = body.getResult();

                repoWatchResultMapper.update(new LambdaUpdateWrapper<RepoWatchResultDO>()
                        .eq(RepoWatchResultDO::getId, result.getId())
                        .set(RepoWatchResultDO::getRepoLocalClone, resultData.getWebUrl())
                );
            }
        } catch (Exception e) {
            String message = e.getMessage();
            log.error("cloneGithubAliyunCodeUp " + repoName + " " + message);
            if (message.contains("企业内已存在同名代码库")) {

                repoWatchResultMapper.update(new LambdaUpdateWrapper<RepoWatchResultDO>()
                        .eq(RepoWatchResultDO::getId, result.getId())
                        .set(RepoWatchResultDO::getRepoLocalClone, "https://codeup.aliyun.com/" + repoConfig.getAliyunCloneNamespaceId() + "/" + result.getRepoName())
                );
            }
        }
    }

    private RepoWatchTaskServiceImpl getSelf() {
        return SpringUtil.getBean(RepoWatchTaskServiceImpl.class);
    }

    private BrowserContext initBrowserContext(String creator) {
        if (null != browserContextGlobal) {
            return browserContextGlobal;
        }
        try {
            String userAgent = getRepoConfig(creator).getUserAgent();
            if (null == browserGlobal) {
                Playwright playwright = Playwright.create();
                BrowserType.LaunchOptions options = new BrowserType.LaunchOptions();
                options.setExecutablePath(Path.of(getChromeExePath(creator)));
                options.setHeadless(false);
                options.setIgnoreDefaultArgs(Arrays.asList("--enable-automation"));
                options.setArgs(Arrays.asList("--disable-gpu", "--user-agent=\"" + userAgent + "\"", "--window-size=1920,1080", "--no-sandbox", "--disable-dev-shm-usage", "--log-level=3", "--disable-blink-features=AutomationControlled"));
                Browser browser = playwright.chromium().launch(options);
                browserGlobal = browser;
            }
            Browser.NewContextOptions newContextOptions = new Browser.NewContextOptions();
            newContextOptions.setGeolocation(39.891245, 116.373511);
            newContextOptions.setUserAgent(userAgent);
            newContextOptions.setViewportSize(1920, 1080);
            BrowserContext browserContext = browserGlobal.newContext(newContextOptions);
            browserContextGlobal = browserContext;
            return browserContext;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    private String getChromeExePath(String creator) {
        return getRepoConfig(creator).getChromeExePath();
    }

    private void deInitBrowserContext() {
        if (null != browserContextGlobal) {
            browserContextGlobal.close();
            browserContextGlobal = null;
        }
        if (null != browserGlobal) {
            browserGlobal.close();
            browserGlobal = null;
        }
    }

    @Override
    @Async
    public void executeSearchTaskSpider(RepoWatchTaskDO repoWatchTaskDO) {
        // TODO test
        BrowserContext browserContext = initBrowserContext(repoWatchTaskDO.getCreator());
        try {
            log.debug("executeSearchTaskSpider start {} {}", repoWatchTaskDO.getName(), browserContext != null);
            Page page = browserContext.newPage();
            page.addInitScript("Object.defineProperty(navigator, 'webdriver', {get: () => undefined});");
            Page.NavigateOptions navigateOptions = new Page.NavigateOptions();
            navigateOptions.setTimeout(10000);
            navigateOptions.setWaitUntil(WaitUntilState.DOMCONTENTLOADED);
            StringBuffer q = new StringBuffer(100);
            String keywords = repoWatchTaskDO.getKeywords();
            String search = StrUtil.join(" OR ", StrUtil.split(keywords, ",").stream().map(keyword -> "\"" + keyword + "\"").toList());
            String keywordLang = repoWatchTaskDO.getKeywordLang();
//            String keywordNegative = repoWatchTaskDO.getKeywordNegative();
//            List<String> keywordNegativeList = new ArrayList<>();
//            if (StrUtil.isNotBlank(keywordNegative)) {
//                keywordNegativeList = StrUtil.split(keywordNegative, ",");
//            }
            q.append(search);
            q.append(" ");
            q.append("language:");
            q.append(keywordLang);
            String url = String.format(getGithubHost() + "/search?q=%s&type=repositories&s=updated&o=desc", URLUtil.encode(q.toString()));
            int pageNum = 0;
            Integer repoLimit = repoWatchTaskDO.getRepoLimit();
            int pageNumMax = repoLimit / 50;
            while (pageNum <= pageNumMax) {
                pageNum += 1;
                boolean res = getRepo(repoWatchTaskDO, page, url, navigateOptions, pageNum);
                if (!res) {
                    return;
                }
                Thread.sleep(500 + RandomUtil.randomInt(100, 2000));
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        deInitBrowserContext();
    }

    @Override
    public void removeGitClone(RepoWatchResultDO watchResult, RepoWatchTaskDO task) {
        Integer cloneType = task.getCloneType();
        try {
            String repoLocalClone = watchResult.getRepoLocalClone();
            if (StrUtil.isBlank(repoLocalClone)) {
                return;
            }
            if (cloneType == 0) {
                FileUtil.del(repoLocalClone);
            } else {
                try {
                    RepoConfigVO repoConfig = getRepoConfig(watchResult.getCreator());
                    com.aliyun.teaopenapi.models.Config config = new com.aliyun.teaopenapi.models.Config()
                            .setAccessKeyId(repoConfig.getAliyunCloneAk())
                            .setAccessKeySecret(repoConfig.getAliyunCloneSk())
                            .setEndpoint("devops.cn-hangzhou.aliyuncs.com");

                    Client client = new Client(config);

                    String orgId = repoLocalClone.split("/")[3];
                    GetRepositoryRequest getRepositoryRequest = new GetRepositoryRequest()
                            .setOrganizationId(repoConfig.getAliyunCloneOrganizationId())
//                            .setIdentity(watchResult.getRepoName().replace("/", "--"))
                            .setIdentity(orgId +"/" + repoLocalClone.split(orgId +"/")[1])
                            ;

                    GetRepositoryResponse repository = client.getRepository(getRepositoryRequest);
                    GetRepositoryResponseBody repositoryBody = repository.getBody();
                    if (repositoryBody.getSuccess()) {
                        String repositoryId = repositoryBody.getRepository().getId() + "";

                        DeleteRepositoryRequest deleteRepositoryRequest = new DeleteRepositoryRequest()
                                .setOrganizationId(repoConfig.getAliyunCloneOrganizationId())
                                .setReason("del")
                                ;

                        DeleteRepositoryResponse createRepositoryResponse = client.deleteRepository(repositoryId, deleteRepositoryRequest);
                    }

                } catch (Exception e) {
                    String message = e.getMessage();
                    log.error("removeGitClone " + watchResult.getRepoName() + " " + message, e);
                }
            }
        } catch (Exception e) {
            log.error("removeGitClone " + watchResult.getRepoName() + " " + e.getMessage(), e);
        }
    }

    private boolean getRepo(RepoWatchTaskDO repoWatchTaskDO, Page page, String url, Page.NavigateOptions navigateOptions, int pageNum) {
        if (pageNum > 1) {
            url = url + "&p=" + pageNum;
        }
        page.navigate(url, navigateOptions);
        ElementHandle resultCount = page.waitForSelector("#search-results-count");
        if (resultCount.textContent().trim().equals("0 results")) {
            log.info("executeSearchTaskSpider no result found {} {}", repoWatchTaskDO.getName(), repoWatchTaskDO.getKeywords());
            return false;
        }

        // 获取数据
        String selector = "[data-testid=\"results-list\"]";
        List<ElementHandle> elements = page.querySelectorAll(selector);
        if (CollUtil.isNotEmpty(elements)) {
            for (ElementHandle element : elements) {
                String title = element.querySelector(".search-title").innerText();
                ElementHandle elementHandle = element.querySelector(".search-match");
                String desc = "";
                if (elementHandle != null) {
                    desc = elementHandle.innerText();
                }
                log.debug(" {} {} executeSearchTaskSpider found {} {}", repoWatchTaskDO.getName(), repoWatchTaskDO.getKeywords(), title, desc);
                RepoWatchResultDO.RepoWatchResultDOBuilder builder = RepoWatchResultDO.builder()
                        .taskId(repoWatchTaskDO.getId())
                        .repoName(title)
                        .repoDesc(desc);
                if (null != repoWatchResultMapper) {
                    repoWatchResultMapper.insert(builder.build());
                }
            }
        } else {
            log.info(" {} {} executeSearchTaskSpider no elements {} found", repoWatchTaskDO.getName(), repoWatchTaskDO.getKeywords(), selector);
            return false;
        }
        return true;
    }

}
