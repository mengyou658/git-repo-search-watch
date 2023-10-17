package cn.iocoder.yudao.module.member.service.signin;

import cn.iocoder.yudao.framework.common.enums.CommonStatusEnum;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.ObjectUtils;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.member.api.user.MemberUserApi;
import cn.iocoder.yudao.module.member.api.user.dto.MemberUserRespDTO;
import cn.iocoder.yudao.module.member.controller.admin.signin.vo.record.MemberSignInRecordPageReqVO;
import cn.iocoder.yudao.module.member.controller.app.signin.vo.AppMemberSignInSummaryRespVO;
import cn.iocoder.yudao.module.member.dal.dataobject.signin.MemberSignInConfigDO;
import cn.iocoder.yudao.module.member.dal.dataobject.signin.MemberSignInRecordDO;
import cn.iocoder.yudao.module.member.dal.mysql.signin.MemberSignInConfigMapper;
import cn.iocoder.yudao.module.member.dal.mysql.signin.MemberSignInRecordMapper;
import cn.iocoder.yudao.module.member.enums.ErrorCodeConstants;
import cn.iocoder.yudao.module.member.enums.MemberExperienceBizTypeEnum;
import cn.iocoder.yudao.module.member.enums.point.MemberPointBizTypeEnum;
import cn.iocoder.yudao.module.member.service.level.MemberLevelService;
import cn.iocoder.yudao.module.member.service.point.MemberPointRecordService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Set;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.convertSet;

/**
 * 签到记录 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class MemberSignInRecordServiceImpl implements MemberSignInRecordService {

    @Resource
    private MemberSignInRecordMapper signInRecordMapper;
    @Resource
    private MemberSignInConfigMapper signInConfigMapper;
    @Resource
    private MemberPointRecordService pointRecordService;
    @Resource
    private MemberLevelService memberLevelService;

    @Resource
    private MemberUserApi memberUserApi;

    @Override
    public AppMemberSignInSummaryRespVO getSignInRecordSummary(Long userId) {
        AppMemberSignInSummaryRespVO vo = new AppMemberSignInSummaryRespVO();
        vo.setTotalDay(0);
        vo.setContinuousDay(0);
        vo.setTodaySignIn(false);
        //获取用户签到的记录，按照天数倒序获取
        List<MemberSignInRecordDO> signInRecordDOList = signInRecordMapper.selectListByUserId(userId);
        // TODO @xiaqing：if 空的时候，直接 return；这样括号少，逻辑更简洁；
        if (!CollectionUtils.isEmpty(signInRecordDOList)) {
            //设置总签到天数
            vo.setTotalDay(signInRecordDOList.size()); // TODO @xiaqing：是不是不用读取 signInRecordDOList 所有的，而是 count下，然后另外再读取一条最后一条；
            //判断当天是否有签到复用校验方法
            // TODO @xiaqing：不要用异常实现逻辑；还是判断哈；
            try {
                validSignDay(signInRecordDOList.get(0));
                vo.setTodaySignIn(false);
            } catch (Exception e) {
                vo.setTodaySignIn(true);
            }
            //如果当天签到了则说明连续签到天数有意义，否则直接用默认值0
            if (vo.getTodaySignIn()) {
                //下方计算连续签到从2天开始，此处直接设置一天连续签到
                vo.setContinuousDay(1);
                //判断连续签到天数
                // TODO @xiaqing：这里逻辑，想想怎么在简化下，可读性可以在提升下哈；
                for (int i = 1; i < signInRecordDOList.size(); i++) {
                    //前一天减1等于当前天数则说明连续，继续循环
                    LocalDate cur = signInRecordDOList.get(i).getCreateTime().toLocalDate();
                    LocalDate pre = signInRecordDOList.get(i - 1).getCreateTime().toLocalDate();
                    if (1 == daysBetween(cur, pre)) {
                        vo.setContinuousDay(i + 1);
                    } else {
                        break;
                    }
                }
            }


        }
        return vo;
    }

    private long daysBetween(LocalDate date1, LocalDate date2) {
        return ChronoUnit.DAYS.between(date1, date2);
    }

    @Override
    public PageResult<MemberSignInRecordDO> getSignInRecordPage(MemberSignInRecordPageReqVO pageReqVO) {
        // 根据用户昵称查询出用户ids
        Set<Long> userIds = null;
        if (StringUtils.isNotBlank(pageReqVO.getNickname())) {
            List<MemberUserRespDTO> users = memberUserApi.getUserListByNickname(pageReqVO.getNickname());
            // 如果查询用户结果为空直接返回无需继续查询
            if (CollectionUtils.isEmpty(users)) {
                return PageResult.empty();
            }
            userIds = convertSet(users, MemberUserRespDTO::getId);
        }
        // 分页查询
        return signInRecordMapper.selectPage(pageReqVO, userIds);
    }

    @Override
    public PageResult<MemberSignInRecordDO> getSignRecordPage(Long userId, PageParam pageParam) {
        return signInRecordMapper.selectPage(userId, pageParam);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public MemberSignInRecordDO createSignRecord(Long userId) {
        // 获取当前用户签到的最大天数
        // TODO @xiaqing：db 操作，dou封装到 mapper 中；
        // TODO @xiaqing：maxSignDay，是不是变量叫 lastRecord 会更容易理解哈；
        MemberSignInRecordDO maxSignDay = signInRecordMapper.selectOne(new LambdaQueryWrapperX<MemberSignInRecordDO>()
                .eq(MemberSignInRecordDO::getUserId, userId)
                .orderByDesc(MemberSignInRecordDO::getDay)
                .last("limit 1"));
        // 判断是否重复签到
        validSignDay(maxSignDay);

        // 1. 查询出当前签到的天数
        MemberSignInRecordDO sign = new MemberSignInRecordDO().setUserId(userId); // TODO @xiaqing：应该使用 record 变量，会更合适
        sign.setDay(1); // 设置签到初始化天数
        sign.setPoint(0);  // 设置签到积分默认为 0
        sign.setExperience(0);  // 设置签到经验默认为 0
        // 如果不为空则修改当前签到对应的天数
        // TODO @xiaqing：应该是要判断连续哈，就是昨天；
        if (maxSignDay != null) {
            sign.setDay(maxSignDay.getDay() + 1);
        }
        // 2. 获取签到对应的积分数
        // 获取所有的签到规则，按照天数排序，只获取启用的 TODO @xiaqing：不要使用 signInConfigMapper 直接查询，而是要通过 SigninConfigService；
        List<MemberSignInConfigDO> configDOList = signInConfigMapper.selectList(new LambdaQueryWrapperX<MemberSignInConfigDO>()
                .eq(MemberSignInConfigDO::getStatus, CommonStatusEnum.ENABLE.getStatus())
                .orderByAsc(MemberSignInConfigDO::getDay));
        // 如果签到的天数大于最大启用的规则天数，直接给最大签到的积分数
        // TODO @xiaqing：超过最大配置的天数，应该直接重置到第一天哈；
        MemberSignInConfigDO lastConfig = configDOList.get(configDOList.size() - 1);
        if (sign.getDay() > lastConfig.getDay()) {
            sign.setPoint(lastConfig.getPoint());
            sign.setExperience(lastConfig.getExperience());
        } else {
            configDOList.forEach(el -> {
                // 循环匹配对应天数，设置对应积分数
                // TODO @xiaqing：使用 equals；另外，这种不应该去遍历比较，从可读性来说，应该  CollUtil.findOne()
                if (el.getDay() == sign.getDay()) {
                    sign.setPoint(el.getPoint());
                    sign.setExperience(el.getExperience());
                }

            });
        }

        // 3. 插入签到记录
        signInRecordMapper.insert(sign);

        // 4. 增加积分
        if (!ObjectUtils.equalsAny(sign.getPoint(), null, 0)) {
            pointRecordService.createPointRecord(userId, sign.getPoint(), MemberPointBizTypeEnum.SIGN, String.valueOf(sign.getId()));
        }
        // 5. 增加经验
        if (!ObjectUtils.equalsAny(sign.getPoint(), null, 0)) {
            memberLevelService.addExperience(userId, sign.getExperience(), MemberExperienceBizTypeEnum.SIGN_IN, String.valueOf(sign.getId()));
        }

        return sign;
    }

    // TODO @xiaqing：校验使用 validate 动词哈；可以改成 validateSigned
    private void validSignDay(MemberSignInRecordDO signInRecordDO) {
        // TODO @xiaqing：代码格式：if () {} 要有括号哈
        if (signInRecordDO == null)
            return;
        // TODO @xiaqing：可以直接使用  DateUtils.isToday()
        LocalDate today = LocalDate.now();
        if (today.equals(signInRecordDO.getCreateTime().toLocalDate())) {
            throw exception(ErrorCodeConstants.SIGN_IN_RECORD_TODAY_EXISTS);
        }
    }

}
