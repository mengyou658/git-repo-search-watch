package cn.iocoder.yudao.module.trade.framework.aftersalelog.core.aop;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.iocoder.yudao.framework.common.util.spring.SpringExpressionUtils;
import cn.iocoder.yudao.framework.web.core.util.WebFrameworkUtils;
import cn.iocoder.yudao.module.trade.framework.aftersalelog.core.dto.TradeAfterSaleLogCreateReqDTO;
import cn.iocoder.yudao.module.trade.framework.aftersalelog.core.annotations.AfterSaleLog;
import cn.iocoder.yudao.module.trade.framework.aftersalelog.core.service.AfterSaleLogService;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

import static cn.iocoder.yudao.framework.common.util.json.JsonUtils.toJsonString;
import static java.util.Arrays.asList;

/**
 * 记录售后日志的 AOP 切面
 *
 * @author 陈賝
 * @since 2023/6/13 13:54
 */
@Slf4j
@Aspect
public class AfterSaleLogAspect {
    @Resource
    private AfterSaleLogService saleLogService;

    @AfterReturning(pointcut = "@annotation(afterSaleLog)", returning = "info")
    public void doAfterReturning(JoinPoint joinPoint, AfterSaleLog afterSaleLog, Object info) {
        try {
            // 日志对象拼接
            Integer userType = WebFrameworkUtils.getLoginUserType();
            Long id = WebFrameworkUtils.getLoginUserId();
            Map<String, String> formatObj = spelFormat(joinPoint, info);
            TradeAfterSaleLogCreateReqDTO dto = new TradeAfterSaleLogCreateReqDTO()
                    .setUserId(id).setUserType(userType)
                    .setAfterSaleId(MapUtil.getLong(formatObj, "id"))
                    .setContent(formatObj.get("content"))
                    .setOperateType(formatObj.get("operateType"));
            // 异步存入数据库
            saleLogService.createLog(dto);
        } catch (Exception exception) {
            log.error("[afterSaleLog({}) 日志记录错误]", toJsonString(afterSaleLog), exception);
        }
    }

    /**
     * 获取描述信息
     */
    public static Map<String, String> spelFormat(JoinPoint joinPoint, Object info) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        AfterSaleLog afterSaleLogPoint = signature.getMethod().getAnnotation(AfterSaleLog.class);
        HashMap<String, String> result = Maps.newHashMapWithExpectedSize(3);
        Map<String, Object> spelMap = SpringExpressionUtils.parseExpression(joinPoint, info,
                asList(afterSaleLogPoint.id(), afterSaleLogPoint.operateType().description(), afterSaleLogPoint.content()));
        // 售后ID
        String id = MapUtil.getStr(spelMap, afterSaleLogPoint.id());
        result.put("id", id);
        // 操作类型
        String operateType = MapUtil.getStr(spelMap, afterSaleLogPoint.operateType().description());
        result.put("operateType", operateType);
        // 日志内容
        String content = MapUtil.getStr(spelMap, afterSaleLogPoint.content());
        if (ObjectUtil.isNotNull(afterSaleLogPoint.operateType())) {
            content += MapUtil.getStr(spelMap, afterSaleLogPoint.operateType().description());
        }
        result.put("content", content);
        return result;
    }

}
