package cn.iocoder.yudao.server.controller.admin;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.util.servlet.ServletUtils;
import com.alibaba.fastjson.JSON;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.annotation.security.PermitAll;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 默认 Controller，解决部分 module 未开启时的 404 提示。
 * 例如说，/bpm/** 路径，工作流
 *
 * @author 芋道源码
 */
@RestController
@RequestMapping("/home")
@Slf4j
public class HomeController {

    @PostMapping("logging/setLevel")
    @PermitAll
    public ResponseEntity<?> setLevel(@RequestParam("category") String category,
                                      @RequestParam("level") String level)
    {
        LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();

        Logger logger = loggerContext.getLogger(category);
        Level oldLevel   = logger.getLevel();
        Level newLevel   = Level.toLevel(level);
        logger.setLevel(newLevel);

        Map<String, String> result = new HashMap<>();
        result.put("current", oldLevel == null ? "" : oldLevel.toString());
        result.put("new", newLevel.toString());
        result.put("category", category);

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @GetMapping("logging/getLevel")
    @PermitAll
    public ResponseEntity<?> setLevel(@RequestParam("category") String category)
    {
        LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();

        Logger logger = loggerContext.getLogger(category);
        Level oldLevel   = logger.getLevel();
        Map<String, String> result = new HashMap<>();
        result.put("current", oldLevel == null ? "" : oldLevel.toString());
        result.put("category", category);

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @Operation(description = "打印header")
    @GetMapping("/getHeader")
    @PermitAll
    public CommonResult<Map<String, String>> getHeader(HttpServletRequest request) {
        Map<String, String> headerMap = ServletUtils.getHeaderMap(request);
        log.info("getHeader {}", JSON.toJSONString(headerMap, true));
        return CommonResult.success(headerMap);
    }

}
