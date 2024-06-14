package cn.iocoder.yudao.module.repo.controller.admin;

import cn.iocoder.yudao.module.repo.dal.dataobject.watchtask.RepoWatchTaskDO;
import com.aliyun.devops20210625.Client;
import com.aliyun.devops20210625.models.ListGroupRepositoriesResponseBody;
import com.aliyun.devops20210625.models.ListRepositoriesResponseBody;
import com.aliyun.devops20210625.models.ListRepositoryGroupsResponseBody;
import lombok.Data;

import java.util.List;

@Data
public class RepoListVO {

    private List<ListGroupRepositoriesResponseBody.ListGroupRepositoriesResponseBodyResult> repoList;

    private RepoWatchTaskDO task;

    private RepoConfigVO repoConfig;

    private Client client;

}
