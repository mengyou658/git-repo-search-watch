package cn.iocoder.yudao.module.member.service.level;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.member.controller.admin.level.vo.experience.MemberExperienceLogExportReqVO;
import cn.iocoder.yudao.module.member.controller.admin.level.vo.experience.MemberExperienceLogPageReqVO;
import cn.iocoder.yudao.module.member.dal.dataobject.level.MemberExperienceLogDO;
import cn.iocoder.yudao.module.member.enums.MemberExperienceBizTypeEnum;

import java.util.Collection;
import java.util.List;

/**
 * 会员经验记录 Service 接口
 *
 * @author owen
 */
public interface MemberExperienceLogService {

    /**
     * 删除会员经验记录
     *
     * @param id 编号
     */
    void deleteExperienceLog(Long id);

    /**
     * 获得会员经验记录
     *
     * @param id 编号
     * @return 会员经验记录
     */
    MemberExperienceLogDO getExperienceLog(Long id);

    /**
     * 获得会员经验记录列表
     *
     * @param ids 编号
     * @return 会员经验记录列表
     */
    List<MemberExperienceLogDO> getExperienceLogList(Collection<Long> ids);

    /**
     * 获得会员经验记录分页
     *
     * @param pageReqVO 分页查询
     * @return 会员经验记录分页
     */
    PageResult<MemberExperienceLogDO> getExperienceLogPage(MemberExperienceLogPageReqVO pageReqVO);

    /**
     * 获得会员经验记录列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 会员经验记录列表
     */
    List<MemberExperienceLogDO> getExperienceLogList(MemberExperienceLogExportReqVO exportReqVO);

    // TODO @疯狂：类似 MemberLevelLogService 的方法，这里也需要提供一个通用的方法，用于创建经验变动记录

    /**
     * 创建 手动调整 经验变动记录
     *
     * @param userId          会员编号
     * @param experience      变动经验值
     * @param totalExperience 会员当前的经验
     */
    void createAdjustLog(Long userId, int experience, int totalExperience);

    /**
     * 根据业务类型, 创建 经验变动记录
     *
     * @param userId          会员编号
     * @param experience      变动经验值
     * @param totalExperience 会员当前的经验
     * @param bizType         业务类型
     * @param bizId           业务ID
     */
    void createBizLog(Long userId, int experience, int totalExperience, MemberExperienceBizTypeEnum bizType, String bizId);
}
