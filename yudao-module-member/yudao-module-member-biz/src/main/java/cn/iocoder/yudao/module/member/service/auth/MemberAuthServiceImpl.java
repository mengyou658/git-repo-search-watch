package cn.iocoder.yudao.module.member.service.auth;

import cn.hutool.core.lang.Assert;
import cn.iocoder.yudao.framework.common.enums.UserTypeEnum;
import cn.iocoder.yudao.framework.common.util.monitor.TracerUtils;
import cn.iocoder.yudao.framework.common.util.servlet.ServletUtils;
import cn.iocoder.yudao.framework.security.core.LoginUser;
import cn.iocoder.yudao.framework.security.core.authentication.MultiUsernamePasswordAuthenticationToken;
import cn.iocoder.yudao.module.member.controller.app.auth.vo.*;
import cn.iocoder.yudao.module.member.convert.auth.AuthConvert;
import cn.iocoder.yudao.module.member.dal.dataobject.user.MemberUserDO;
import cn.iocoder.yudao.module.member.dal.mysql.user.MemberUserMapper;
import cn.iocoder.yudao.module.member.service.user.MemberUserService;
import cn.iocoder.yudao.module.system.api.auth.UserSessionApi;
import cn.iocoder.yudao.module.system.api.logger.LoginLogApi;
import cn.iocoder.yudao.module.system.api.logger.dto.LoginLogCreateReqDTO;
import cn.iocoder.yudao.module.system.api.sms.SmsCodeApi;
import cn.iocoder.yudao.module.system.api.social.SocialUserApi;
import cn.iocoder.yudao.module.system.enums.logger.LoginLogTypeEnum;
import cn.iocoder.yudao.module.system.enums.logger.LoginResultEnum;
import cn.iocoder.yudao.module.system.enums.sms.SmsSceneEnum;
import com.google.common.annotations.VisibleForTesting;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Objects;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.framework.common.util.servlet.ServletUtils.getClientIP;
import static cn.iocoder.yudao.module.member.enums.ErrorCodeConstants.*;

/**
 * 会员的认证 Service 接口
 *
 * @author 芋道源码
 */
@Service
@Slf4j
public class MemberAuthServiceImpl implements MemberAuthService {

    @Resource
    @Lazy // 延迟加载，因为存在相互依赖的问题
    private AuthenticationManager authenticationManager;

    @Resource
    private MemberUserService userService;
    @Resource
    private SmsCodeApi smsCodeApi;
    @Resource
    private LoginLogApi loginLogApi;
    @Resource
    private UserSessionApi userSessionApi;
    @Resource
    private SocialUserApi socialUserApi;

    @Resource
    private PasswordEncoder passwordEncoder;
    @Resource
    private MemberUserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String mobile) throws UsernameNotFoundException {
        // 获取 username 对应的 SysUserDO
        MemberUserDO user = userService.getUserByMobile(mobile);
        if (user == null) {
            throw new UsernameNotFoundException(mobile);
        }
        // 创建 LoginUser 对象
        return AuthConvert.INSTANCE.convert2(user);
    }

    @Override
    public String login(AppAuthLoginReqVO reqVO, String userIp, String userAgent) {
        // 使用手机 + 密码，进行登录。
        LoginUser loginUser = login0(reqVO.getMobile(), reqVO.getPassword());

        // 缓存登录用户到 Redis 中，返回 Token 令牌
        return createUserSessionAfterLoginSuccess(loginUser, reqVO.getMobile(),
                LoginLogTypeEnum.LOGIN_USERNAME, userIp, userAgent);
    }

    @Override
    @Transactional
    public String smsLogin(AppAuthSmsLoginReqVO reqVO, String userIp, String userAgent) {
        // 校验验证码
        smsCodeApi.useSmsCode(AuthConvert.INSTANCE.convert(reqVO, SmsSceneEnum.MEMBER_LOGIN.getScene(), userIp));

        // 获得获得注册用户
        MemberUserDO user = userService.createUserIfAbsent(reqVO.getMobile(), userIp);
        Assert.notNull(user, "获取用户失败，结果为空");

        // 执行登陆
        LoginUser loginUser = buildLoginUser(user);

        // 缓存登录用户到 Redis 中，返回 Token 令牌
        return createUserSessionAfterLoginSuccess(loginUser, reqVO.getMobile(),
                LoginLogTypeEnum.LOGIN_SMS, userIp, userAgent);
    }

    @Override
    public String socialQuickLogin(AppAuthSocialQuickLoginReqVO reqVO, String userIp, String userAgent) {
        // 使用 code 授权码，进行登录。然后，获得到绑定的用户编号
        Long userId = socialUserApi.getBindUserId(UserTypeEnum.MEMBER.getValue(), reqVO.getType(),
                reqVO.getCode(), reqVO.getState());
        if (userId == null) {
            throw exception(AUTH_THIRD_LOGIN_NOT_BIND);
        }

        // 自动登录
        MemberUserDO user = userService.getUser(userId);
        if (user == null) {
            throw exception(USER_NOT_EXISTS);
        }

        // 创建 LoginUser 对象
        LoginUser loginUser = buildLoginUser(user);

        // 缓存登录用户到 Redis 中，返回 Token 令牌
        return createUserSessionAfterLoginSuccess(loginUser, null,
                LoginLogTypeEnum.LOGIN_SOCIAL, userIp, userAgent);
    }

    @Override
    public String socialBindLogin(AppAuthSocialBindLoginReqVO reqVO, String userIp, String userAgent) {
        // 使用手机号、手机验证码登录
        AppAuthSmsLoginReqVO loginReqVO = AppAuthSmsLoginReqVO.builder()
                .mobile(reqVO.getMobile()).code(reqVO.getSmsCode()).build();
        String token = this.smsLogin(loginReqVO, userIp, userAgent);
        LoginUser loginUser = userSessionApi.getLoginUser(token);

        // 绑定社交用户
        socialUserApi.bindSocialUser(AuthConvert.INSTANCE.convert(loginUser.getId(), getUserType().getValue(), reqVO));
        return token;
    }

    private String createUserSessionAfterLoginSuccess(LoginUser loginUser, String mobile,
                                                      LoginLogTypeEnum logType, String userIp, String userAgent) {
        // 插入登陆日志
        createLoginLog(loginUser.getId(), mobile, logType, LoginResultEnum.SUCCESS);
        // 缓存登录用户到 Redis 中，返回 Token 令牌
        return userSessionApi.createUserSession(loginUser, userIp, userAgent);
    }

    @Override
    public String getSocialAuthorizeUrl(Integer type, String redirectUri) {
        return socialUserApi.getAuthorizeUrl(type, redirectUri);
    }

    private LoginUser login0(String username, String password) {
        final LoginLogTypeEnum logType = LoginLogTypeEnum.LOGIN_USERNAME;
        // 用户验证
        Authentication authentication;
        try {
            // 调用 Spring Security 的 AuthenticationManager#authenticate(...) 方法，使用账号密码进行认证
            // 在其内部，会调用到 loadUserByUsername 方法，获取 User 信息
            authentication = authenticationManager.authenticate(new MultiUsernamePasswordAuthenticationToken(
                    username, password, getUserType()));
        } catch (BadCredentialsException badCredentialsException) {
            this.createLoginLog(null, username, logType, LoginResultEnum.BAD_CREDENTIALS);
            throw exception(AUTH_LOGIN_BAD_CREDENTIALS);
        } catch (DisabledException disabledException) {
            this.createLoginLog(null, username, logType, LoginResultEnum.USER_DISABLED);
            throw exception(AUTH_LOGIN_USER_DISABLED);
        } catch (AuthenticationException authenticationException) {
            log.error("[login0][username({}) 发生未知异常]", username, authenticationException);
            this.createLoginLog(null, username, logType, LoginResultEnum.UNKNOWN_ERROR);
            throw exception(AUTH_LOGIN_FAIL_UNKNOWN);
        }
        Assert.notNull(authentication.getPrincipal(), "Principal 不会为空");
        return (LoginUser) authentication.getPrincipal();
    }

    private void createLoginLog(Long userId, String mobile, LoginLogTypeEnum logType, LoginResultEnum loginResult) {
        // 获得用户
        if (userId == null) {
            MemberUserDO user = userService.getUserByMobile(mobile);
            userId = user != null ? user.getId() : null;
        }
        // 插入登录日志
        LoginLogCreateReqDTO reqDTO = new LoginLogCreateReqDTO();
        reqDTO.setLogType(logType.getType());
        reqDTO.setTraceId(TracerUtils.getTraceId());
        if (userId != null) {
            reqDTO.setUserId(userId);
        }
        reqDTO.setUserType(getUserType().getValue());
        reqDTO.setUsername(mobile);
        reqDTO.setUserAgent(ServletUtils.getUserAgent());
        reqDTO.setUserIp(getClientIP());
        reqDTO.setResult(loginResult.getResult());
        loginLogApi.createLoginLog(reqDTO);
        // 更新最后登录时间
        if (userId != null && Objects.equals(LoginResultEnum.SUCCESS.getResult(), loginResult.getResult())) {
            userService.updateUserLogin(userId, getClientIP());
        }
    }

    @Override
    public LoginUser verifyTokenAndRefresh(String token) {
        return userSessionApi.getLoginUser(token);
    }

    @Override
    public void logout(String token) {
        // 查询用户信息
        LoginUser loginUser = userSessionApi.getLoginUser(token);
        if (loginUser == null) {
            return;
        }
        // 删除 session
        userSessionApi.deleteUserSession(token);
        // 记录登出日志
        createLogoutLog(loginUser.getId());
    }

    @Override
    public UserTypeEnum getUserType() {
        return UserTypeEnum.MEMBER;
    }

    @Override
    public void updatePassword(Long userId, AppAuthUpdatePasswordReqVO reqVO) {
        // 检验旧密码
        MemberUserDO userDO = checkOldPassword(userId, reqVO.getOldPassword());

        // 更新用户密码
        userMapper.updateById(MemberUserDO.builder().id(userDO.getId())
                .password(passwordEncoder.encode(reqVO.getPassword())).build());
    }

    @Override
    public void resetPassword(AppAuthResetPasswordReqVO reqVO) {
        // 检验用户是否存在
        MemberUserDO userDO = checkUserIfExists(reqVO.getMobile());

        // 使用验证码
        smsCodeApi.useSmsCode(AuthConvert.INSTANCE.convert(reqVO, SmsSceneEnum.MEMBER_FORGET_PASSWORD,
                getClientIP()));

        // 更新密码
        userMapper.updateById(MemberUserDO.builder().id(userDO.getId())
                .password(passwordEncoder.encode(reqVO.getPassword())).build());
    }

    @Override
    public void sendSmsCode(Long userId, AppAuthSmsSendReqVO reqVO) {
        // TODO 要根据不同的场景，校验是否有用户
        smsCodeApi.sendSmsCode(AuthConvert.INSTANCE.convert(reqVO).setCreateIp(getClientIP()));
    }

    /**
     * 校验旧密码
     *
     * @param id          用户 id
     * @param oldPassword 旧密码
     * @return MemberUserDO 用户实体
     */
    @VisibleForTesting
    public MemberUserDO checkOldPassword(Long id, String oldPassword) {
        MemberUserDO user = userMapper.selectById(id);
        if (user == null) {
            throw exception(USER_NOT_EXISTS);
        }
        // 参数：未加密密码，编码后的密码
        if (!passwordEncoder.matches(oldPassword,user.getPassword())) {
            throw exception(USER_PASSWORD_FAILED);
        }
        return user;
    }

    public MemberUserDO checkUserIfExists(String mobile) {
        MemberUserDO user = userMapper.selectByMobile(mobile);
        if (user == null) {
            throw exception(USER_NOT_EXISTS);
        }
        return user;
    }

    private void createLogoutLog(Long userId) {
        LoginLogCreateReqDTO reqDTO = new LoginLogCreateReqDTO();
        reqDTO.setLogType(LoginLogTypeEnum.LOGOUT_SELF.getType());
        reqDTO.setTraceId(TracerUtils.getTraceId());
        reqDTO.setUserId(userId);
        reqDTO.setUserType(getUserType().getValue());
        reqDTO.setUsername(getMobile(userId));
        reqDTO.setUserAgent(ServletUtils.getUserAgent());
        reqDTO.setUserIp(getClientIP());
        reqDTO.setResult(LoginResultEnum.SUCCESS.getResult());
        loginLogApi.createLoginLog(reqDTO);
    }

    private LoginUser buildLoginUser(MemberUserDO user) {
        return AuthConvert.INSTANCE.convert(user).setUserType(getUserType().getValue());
    }

    private String getMobile(Long userId) {
        if (userId == null) {
            return null;
        }
        MemberUserDO user = userService.getUser(userId);
        return user != null ? user.getMobile() : null;
    }

}
