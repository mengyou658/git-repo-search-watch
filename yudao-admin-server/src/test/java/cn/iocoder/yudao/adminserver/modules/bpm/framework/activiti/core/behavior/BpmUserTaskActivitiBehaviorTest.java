package cn.iocoder.yudao.adminserver.modules.bpm.framework.activiti.core.behavior;

import cn.hutool.core.map.MapUtil;
import cn.iocoder.yudao.adminserver.modules.bpm.dal.dataobject.definition.BpmTaskAssignRuleDO;
import cn.iocoder.yudao.adminserver.modules.bpm.dal.dataobject.definition.BpmUserGroupDO;
import cn.iocoder.yudao.adminserver.modules.bpm.enums.definition.BpmTaskAssignRuleTypeEnum;
import cn.iocoder.yudao.adminserver.modules.bpm.enums.definition.BpmTaskRuleScriptEnum;
import cn.iocoder.yudao.adminserver.modules.bpm.framework.activiti.core.behavior.script.BpmTaskAssignScript;
import cn.iocoder.yudao.adminserver.modules.bpm.service.definition.BpmTaskAssignRuleService;
import cn.iocoder.yudao.adminserver.modules.bpm.service.definition.BpmUserGroupService;
import cn.iocoder.yudao.adminserver.modules.system.dal.dataobject.dept.SysDeptDO;
import cn.iocoder.yudao.adminserver.modules.system.service.dept.SysDeptService;
import cn.iocoder.yudao.adminserver.modules.system.service.permission.SysPermissionService;
import cn.iocoder.yudao.adminserver.modules.system.service.user.SysUserService;
import cn.iocoder.yudao.coreservice.modules.system.dal.dataobject.user.SysUserDO;
import cn.iocoder.yudao.framework.common.enums.CommonStatusEnum;
import cn.iocoder.yudao.framework.common.util.collection.CollectionUtils;
import cn.iocoder.yudao.framework.test.core.ut.BaseMockitoUnitTest;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntityImpl;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import java.util.*;

import static cn.iocoder.yudao.framework.common.util.collection.SetUtils.*;
import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.randomPojo;
import static java.util.Collections.singleton;
import static java.util.Collections.singletonList;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

public class BpmUserTaskActivitiBehaviorTest extends BaseMockitoUnitTest {

    @InjectMocks
    private BpmUserTaskActivitiBehavior behavior;
    @Mock
    private BpmTaskAssignRuleService bpmTaskRuleService;
    @Mock
    private SysPermissionService permissionService;
    @Mock
    private SysDeptService deptService;
    @Mock
    private BpmUserGroupService userGroupService;
    @Mock
    private SysUserService userService;

    @Test
    public void testCalculateTaskCandidateUsers_Role() {
        // 准备参数
        BpmTaskAssignRuleDO rule = new BpmTaskAssignRuleDO().setOptions(asSet(1L, 2L))
                .setType(BpmTaskAssignRuleTypeEnum.ROLE.getType());
        // mock 方法
        when(permissionService.getUserRoleIdListByRoleIds(eq(rule.getOptions())))
                .thenReturn(asSet(11L, 22L));
        mockGetUserMap(asSet(11L, 22L));

        // 调用
        Set<Long> results = behavior.calculateTaskCandidateUsers(null, rule);
        // 断言
        assertEquals(asSet(11L, 22L), results);
    }

    @Test
    public void testCalculateTaskCandidateUsers_DeptMember() {
        // 准备参数
        BpmTaskAssignRuleDO rule = new BpmTaskAssignRuleDO().setOptions(asSet(1L, 2L))
                .setType(BpmTaskAssignRuleTypeEnum.DEPT_MEMBER.getType());
        // mock 方法
        List<SysUserDO> users = CollectionUtils.convertList(asSet(11L, 22L),
                id -> new SysUserDO().setId(id));
        when(userService.getUsersByDeptIds(eq(rule.getOptions()))).thenReturn(users);
        mockGetUserMap(asSet(11L, 22L));

        // 调用
        Set<Long> results = behavior.calculateTaskCandidateUsers(null, rule);
        // 断言
        assertEquals(asSet(11L, 22L), results);
    }

    @Test
    public void testCalculateTaskCandidateUsers_DeptLeader() {
        // 准备参数
        BpmTaskAssignRuleDO rule = new BpmTaskAssignRuleDO().setOptions(asSet(1L, 2L))
                .setType(BpmTaskAssignRuleTypeEnum.DEPT_LEADER.getType());
        // mock 方法
        SysDeptDO dept1 = randomPojo(SysDeptDO.class, o -> o.setLeaderUserId(11L));
        SysDeptDO dept2 = randomPojo(SysDeptDO.class, o -> o.setLeaderUserId(22L));
        when(deptService.getDepts(eq(rule.getOptions()))).thenReturn(Arrays.asList(dept1, dept2));
        mockGetUserMap(asSet(11L, 22L));

        // 调用
        Set<Long> results = behavior.calculateTaskCandidateUsers(null, rule);
        // 断言
        assertEquals(asSet(11L, 22L), results);
    }

    @Test
    public void testCalculateTaskCandidateUsers_Post() {
        // 准备参数
        BpmTaskAssignRuleDO rule = new BpmTaskAssignRuleDO().setOptions(asSet(1L, 2L))
                .setType(BpmTaskAssignRuleTypeEnum.POST.getType());
        // mock 方法
        List<SysUserDO> users = CollectionUtils.convertList(asSet(11L, 22L),
                id -> new SysUserDO().setId(id));
        when(userService.getUsersByPostIds(eq(rule.getOptions()))).thenReturn(users);
        mockGetUserMap(asSet(11L, 22L));

        // 调用
        Set<Long> results = behavior.calculateTaskCandidateUsers(null, rule);
        // 断言
        assertEquals(asSet(11L, 22L), results);
    }

    @Test
    public void testCalculateTaskCandidateUsers_User() {
        // 准备参数
        BpmTaskAssignRuleDO rule = new BpmTaskAssignRuleDO().setOptions(asSet(1L, 2L))
                .setType(BpmTaskAssignRuleTypeEnum.USER.getType());
        // mock 方法
        mockGetUserMap(asSet(1L, 2L));

        // 调用
        Set<Long> results = behavior.calculateTaskCandidateUsers(null, rule);
        // 断言
        assertEquals(asSet(1L, 2L), results);
    }

    @Test
    public void testCalculateTaskCandidateUsers_UserGroup() {
        // 准备参数
        BpmTaskAssignRuleDO rule = new BpmTaskAssignRuleDO().setOptions(asSet(1L, 2L))
                .setType(BpmTaskAssignRuleTypeEnum.USER_GROUP.getType());
        // mock 方法
        BpmUserGroupDO userGroup1 = randomPojo(BpmUserGroupDO.class, o -> o.setMemberUserIds(asSet(11L, 12L)));
        BpmUserGroupDO userGroup2 = randomPojo(BpmUserGroupDO.class, o -> o.setMemberUserIds(asSet(21L, 22L)));
        when(userGroupService.getUserGroupList(eq(rule.getOptions()))).thenReturn(Arrays.asList(userGroup1, userGroup2));
        mockGetUserMap(asSet(11L, 12L, 21L, 22L));

        // 调用
        Set<Long> results = behavior.calculateTaskCandidateUsers(null, rule);
        // 断言
        assertEquals(asSet(11L, 12L, 21L, 22L), results);
    }

    @Test
    public void testCalculateTaskCandidateUsers_Script() {
        // 准备参数
        BpmTaskAssignRuleDO rule = new BpmTaskAssignRuleDO().setOptions(asSet(20L, 21L))
                .setType(BpmTaskAssignRuleTypeEnum.SCRIPT.getType());
        // mock 方法
        BpmTaskAssignScript script1 = new BpmTaskAssignScript() {

            @Override
            public Set<Long> calculateTaskCandidateUsers(TaskEntity task) {
                return singleton(11L);
            }

            @Override
            public BpmTaskRuleScriptEnum getEnum() {
                return BpmTaskRuleScriptEnum.LEADER_X1;
            }
        };
        BpmTaskAssignScript script2 = new BpmTaskAssignScript() {

            @Override
            public Set<Long> calculateTaskCandidateUsers(TaskEntity task) {
                return singleton(22L);
            }

            @Override
            public BpmTaskRuleScriptEnum getEnum() {
                return BpmTaskRuleScriptEnum.LEADER_X2;
            }
        };
        behavior.setScripts(Arrays.asList(script1, script2));
        mockGetUserMap(asSet(11L, 22L));

        // 调用
        Set<Long> results = behavior.calculateTaskCandidateUsers(null, rule);
        // 断言
        assertEquals(asSet(11L, 22L), results);
    }

    @Test
    public void testRemoveDisableUsers() {
        // 准备参数. 1L 可以找到；2L 是禁用的；3L 找不到
        Set<Long> assigneeUserIds = asSet(1L, 2L, 3L);
        // mock 方法
        SysUserDO user1 = randomPojo(SysUserDO.class, o -> o.setId(1L)
                .setStatus(CommonStatusEnum.ENABLE.getStatus()));
        SysUserDO user2 = randomPojo(SysUserDO.class, o -> o.setId(2L)
                .setStatus(CommonStatusEnum.DISABLE.getStatus()));
        Map<Long, SysUserDO> userMap = MapUtil.builder(user1.getId(), user1)
                .put(user2.getId(), user2).build();
        when(userService.getUserMap(eq(assigneeUserIds))).thenReturn(userMap);

        // 调用
        behavior.removeDisableUsers(assigneeUserIds);
        // 断言
        assertEquals(asSet(1L), assigneeUserIds);
    }

    private void mockGetUserMap(Set<Long> assigneeUserIds) {
        Map<Long, SysUserDO> userMap = CollectionUtils.convertMap(assigneeUserIds, id -> id,
                id -> new SysUserDO().setId(id).setStatus(CommonStatusEnum.ENABLE.getStatus()));
        when(userService.getUserMap(eq(assigneeUserIds))).thenReturn(userMap);
    }

}
