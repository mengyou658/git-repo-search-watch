package cn.iocoder.yudao.module.repo.enums;

import cn.iocoder.yudao.framework.common.exception.ErrorCode;

public interface ErrorCodeConstants {

    // ========== 仓库监控结果 ==========
    ErrorCode WATCH_RESULT_NOT_EXISTS = new ErrorCode(1_003_001_001, "仓库监控结果不存在");
    ErrorCode WATCH_RESULT_IMPORT_FAIL = new ErrorCode(1_003_001_002, "仓库监控结果导入失败， {}");


    // ========== 仓库监控任务 ==========
    ErrorCode WATCH_TASK_NOT_EXISTS = new ErrorCode(1_003_002_001, "仓库监控任务不存在");
    ErrorCode WATCH_TASK_LIMIT = new ErrorCode(1_003_002_001, "测试账号，仓库监控任务不能超过1");
    ErrorCode WATCH_TASK_IMPORT_FAIL = new ErrorCode(1_003_002_002, "仓库监控任务导入失败， {}");


    // ========== 参数配置 ==========
    ErrorCode WATCH_CONFIG_NOT_EXISTS = new ErrorCode(1_003_001_001, "参数配置不存在");
    ErrorCode WATCH_CONFIG_IMPORT_FAIL = new ErrorCode(1_003_001_002, "参数配置导入失败， {}");

    // ========== 字典数据 ==========
    ErrorCode WATCH_DICT_DATA_NOT_EXISTS = new ErrorCode(1_003_002_001, "字典数据不存在");
    ErrorCode WATCH_DICT_DATA_IMPORT_FAIL = new ErrorCode(1_003_002_002, "字典数据导入失败， {}");

}
