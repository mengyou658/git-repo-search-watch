package cn.iocoder.yudao.module.system.service.mail;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.system.controller.admin.mail.vo.send.MailReqVO;
import cn.iocoder.yudao.module.system.controller.admin.mail.vo.template.MailTemplateCreateReqVO;
import cn.iocoder.yudao.module.system.controller.admin.mail.vo.template.MailTemplatePageReqVO;
import cn.iocoder.yudao.module.system.controller.admin.mail.vo.template.MailTemplateUpdateReqVO;
import cn.iocoder.yudao.module.system.dal.dataobject.mail.MailTemplateDO;
import cn.iocoder.yudao.module.system.mq.message.mail.MailSendMessage;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 *  邮箱模版服务类
 *
 * @author wangjingyi
 * @since 2022-03-21
 */
public interface MailSendService {

    /**
     * 发送邮件
     *
     * @param templateCode 邮件模版编码
     * @param from 邮箱
     * @param content 内容
     * @param templateParams 模版参数
     * @param to 收件人
     * @param userId 用户编码
     * @param userType 用户类型
     */
    void sendMail(Long userId, Integer userType, String templateCode, String from,String to, String content, Map<String, Object> templateParams);

    /**
     * 执行真正的邮件发送
     * 注意，该方法仅仅提供给 MQ Consumer 使用
     *
     * @param message 邮件
     */
    void doSendMail(MailSendMessage message);
}
