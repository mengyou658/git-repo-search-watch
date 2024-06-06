package cn.iocoder.yudao;

import cn.iocoder.yudao.module.repo.controller.admin.RepoConfigVO;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

public class RepoConfigVOTest {

    @Test
    public void testJson() {
        RepoConfigVO vo = new RepoConfigVO();
        ArrayList<RepoConfigVO.RepoConfig> repoConfigs = new ArrayList<>();
        repoConfigs.add(new RepoConfigVO.RepoConfig());
        vo.setRepoConfigs(repoConfigs);
//        vo.setSpiderConfig(new RepoConfigVO.SpiderConfig());
//        vo.setCloneConfig(new RepoConfigVO.CloneConfig());

        System.out.println(JSON.toJSONString(vo, SerializerFeature.WriteMapNullValue));
    }

}
