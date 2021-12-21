-- inf 开头的 DB

CREATE TABLE IF NOT EXISTS "inf_config"
(
    "id"          int          NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "group"       varchar(50)  NOT NULL,
    "type"        tinyint      NOT NULL,
    "name"        varchar(100) NOT NULL DEFAULT '',
    "key"         varchar(100) NOT NULL DEFAULT '',
    "value"       varchar(500) NOT NULL DEFAULT '',
    "sensitive"   bit          NOT NULL,
    "remark"      varchar(500)          DEFAULT NULL,
    "creator"     varchar(64)           DEFAULT '',
    "create_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)           DEFAULT '',
    "update_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '参数配置表';

CREATE TABLE IF NOT EXISTS "inf_file"
(
    "id"          varchar(188) NOT NULL,
    "type"        varchar(63)           DEFAULT NULL,
    "content"     blob         NOT NULL,
    "creator"     varchar(64)           DEFAULT '',
    "create_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)           DEFAULT '',
    "update_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '文件表';

CREATE TABLE IF NOT EXISTS "inf_job"
(
    "id"              bigint(20)  NOT NULL GENERATED BY DEFAULT AS IDENTITY COMMENT '任务编号',
    "name"            varchar(32) NOT NULL COMMENT '任务名称',
    "status"          tinyint(4)  NOT NULL COMMENT '任务状态',
    "handler_name"    varchar(64) NOT NULL COMMENT '处理器的名字',
    "handler_param"   varchar(255)         DEFAULT NULL COMMENT '处理器的参数',
    "cron_expression" varchar(32) NOT NULL COMMENT 'CRON 表达式',
    "retry_count"     int(11)     NOT NULL DEFAULT '0' COMMENT '重试次数',
    "retry_interval"  int(11)     NOT NULL DEFAULT '0' COMMENT '重试间隔',
    "monitor_timeout" int(11)     NOT NULL DEFAULT '0' COMMENT '监控超时时间',
    "creator"         varchar(64)          DEFAULT '' COMMENT '创建者',
    "create_time"     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    "updater"         varchar(64)          DEFAULT '' COMMENT '更新者',
    "update_time"     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    "deleted"         bit         NOT NULL DEFAULT FALSE COMMENT '是否删除',
    PRIMARY KEY ("id")
) COMMENT ='定时任务表';

CREATE TABLE IF NOT EXISTS "inf_job_log"
(
    "id"            bigint(20)  NOT NULL GENERATED BY DEFAULT AS IDENTITY COMMENT '日志编号',
    "job_id"        bigint(20)  NOT NULL COMMENT '任务编号',
    "handler_name"  varchar(64) NOT NULL COMMENT '处理器的名字',
    "handler_param" varchar(255)         DEFAULT NULL COMMENT '处理器的参数',
    "execute_index" tinyint(4)  NOT NULL DEFAULT '1' COMMENT '第几次执行',
    "begin_time"    datetime    NOT NULL COMMENT '开始执行时间',
    "end_time"      datetime             DEFAULT NULL COMMENT '结束执行时间',
    "duration"      int(11)              DEFAULT NULL COMMENT '执行时长',
    "status"        tinyint(4)  NOT NULL COMMENT '任务状态',
    "result"        varchar(4000)        DEFAULT '' COMMENT '结果数据',
    "creator"       varchar(64)          DEFAULT '' COMMENT '创建者',
    "create_time"   datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    "updater"       varchar(64)          DEFAULT '' COMMENT '更新者',
    "update_time"   datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    "deleted"       bit(1)      NOT NULL DEFAULT FALSE COMMENT '是否删除',
    PRIMARY KEY ("id")
) COMMENT ='定时任务日志表';

-- sys 开头的 DB

CREATE TABLE IF NOT EXISTS "sys_dept"
(
    "id"          bigint      NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name"        varchar(30) NOT NULL DEFAULT '',
    "parent_id"   bigint      NOT NULL DEFAULT '0',
    "sort"        int         NOT NULL DEFAULT '0',
    "leader"      varchar(20)          DEFAULT NULL,
    "phone"       varchar(11)          DEFAULT NULL,
    "email"       varchar(50)          DEFAULT NULL,
    "status"      tinyint     NOT NULL,
    "creator"     varchar(64)          DEFAULT '',
    "create_time" timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)          DEFAULT '',
    "update_time" timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit         NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '部门表';

CREATE TABLE IF NOT EXISTS "sys_dict_data"
(
    "id"          bigint       NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "sort"        int          NOT NULL DEFAULT '0',
    "label"       varchar(100) NOT NULL DEFAULT '',
    "value"       varchar(100) NOT NULL DEFAULT '',
    "dict_type"   varchar(100) NOT NULL DEFAULT '',
    "status"      tinyint      NOT NULL DEFAULT '0',
    "remark"      varchar(500)          DEFAULT NULL,
    "creator"     varchar(64)           DEFAULT '',
    "create_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)           DEFAULT '',
    "update_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '字典数据表';

CREATE TABLE IF NOT EXISTS "sys_role"
(
    "id"                  bigint       NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name"                varchar(30)  NOT NULL,
    "code"                varchar(100) NOT NULL,
    "sort"                int          NOT NULL,
    "data_scope"          tinyint      NOT NULL DEFAULT '1',
    "data_scope_dept_ids" varchar(500) NOT NULL DEFAULT '',
    "status"              tinyint      NOT NULL,
    "type"                tinyint      NOT NULL,
    "remark"              varchar(500)          DEFAULT NULL,
    "creator"             varchar(64)           DEFAULT '',
    "create_time"         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"             varchar(64)           DEFAULT '',
    "update_time"         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"             bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '角色信息表';

CREATE TABLE IF NOT EXISTS "sys_role_menu"
(
    "id"          bigint    NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "role_id"     bigint    NOT NULL,
    "menu_id"     bigint    NOT NULL,
    "creator"     varchar(64)        DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)        DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit       NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '角色和菜单关联表';

CREATE TABLE IF NOT EXISTS "sys_menu"
(
    "id"          bigint       NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name"        varchar(50)  NOT NULL,
    "permission"  varchar(100) NOT NULL DEFAULT '',
    "menu_type"   tinyint      NOT NULL,
    "sort"        int          NOT NULL DEFAULT '0',
    "parent_id"   bigint       NOT NULL DEFAULT '0',
    "path"        varchar(200)          DEFAULT '',
    "icon"        varchar(100)          DEFAULT '#',
    "component"   varchar(255)          DEFAULT NULL,
    "status"      tinyint      NOT NULL DEFAULT '0',
    "creator"     varchar(64)           DEFAULT '',
    "create_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)           DEFAULT '',
    "update_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '菜单权限表';

CREATE TABLE IF NOT EXISTS "sys_user_role"
(
    "id"          bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "user_id"     bigint NOT NULL,
    "role_id"     bigint NOT NULL,
    "creator"     varchar(64) DEFAULT '',
    "create_time" timestamp   DEFAULT NULL,
    "updater"     varchar(64) DEFAULT '',
    "update_time" timestamp   DEFAULT NULL,
    "deleted"     bit         DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '用户和角色关联表';

CREATE TABLE IF NOT EXISTS "sys_dict_type"
(
    "id"          bigint       NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name"        varchar(100) NOT NULL DEFAULT '',
    "type"        varchar(100) NOT NULL DEFAULT '',
    "status"      tinyint      NOT NULL DEFAULT '0',
    "remark"      varchar(500)          DEFAULT NULL,
    "creator"     varchar(64)           DEFAULT '',
    "create_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)           DEFAULT '',
    "update_time" timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '字典类型表';

CREATE TABLE IF NOT EXISTS `sys_user_session`
(
    `id`              varchar(32) NOT NULL,
    `user_id`         bigint               DEFAULT NULL,
    "user_type"       tinyint     NOT NULL,
    `username`        varchar(50) NOT NULL DEFAULT '',
    `user_ip`         varchar(50)          DEFAULT NULL,
    `user_agent`      varchar(512)         DEFAULT NULL,
    `session_timeout` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creator"         varchar(64)          DEFAULT '',
    "create_time"     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`         varchar(64)          DEFAULT '',
    "update_time"     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"         bit         NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
) COMMENT '用户在线 Session';

CREATE TABLE IF NOT EXISTS "sys_post"
(
    "id"          bigint      NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "code"        varchar(64) NOT NULL,
    "name"        varchar(50) NOT NULL,
    "sort"        integer     NOT NULL,
    "status"      tinyint     NOT NULL,
    "remark"      varchar(500)         DEFAULT NULL,
    "creator"     varchar(64)          DEFAULT '',
    "create_time" timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)          DEFAULT '',
    "update_time" timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit         NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '岗位信息表';

CREATE TABLE IF NOT EXISTS "sys_notice"
(
    "id"          bigint      NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "title"       varchar(50) NOT NULL COMMENT '公告标题',
    "content"     text        NOT NULL COMMENT '公告内容',
    "notice_type" tinyint     NOT NULL COMMENT '公告类型（1通知 2公告）',
    "status"      tinyint     NOT NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    "creator"     varchar(64)          DEFAULT '' COMMENT '创建者',
    "create_time" datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    "updater"     varchar(64)          DEFAULT '' COMMENT '更新者',
    "update_time" datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    "deleted"     bit         NOT NULL DEFAULT 0 COMMENT '是否删除',
    PRIMARY KEY ("id")
) COMMENT '通知公告表';

CREATE TABLE IF NOT EXISTS `sys_login_log`
(
    `id`          bigint(20)   NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `log_type`    bigint(4)    NOT NULL,
    "user_id"     bigint       not null default '0',
    "user_type"   tinyint      NOT NULL,
    `trace_id`    varchar(64)  NOT NULL DEFAULT '',
    `username`    varchar(50)  NOT NULL DEFAULT '',
    `result`      tinyint(4)   NOT NULL,
    `user_ip`     varchar(50)  NOT NULL,
    `user_agent`  varchar(512) NOT NULL,
    `creator`     varchar(64)           DEFAULT '',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`     varchar(64)           DEFAULT '',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`     bit(1)       NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) COMMENT ='系统访问记录';

CREATE TABLE IF NOT EXISTS `sys_operate_log`
(
    `id`               bigint(20)    NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `trace_id`         varchar(64)   NOT NULL DEFAULT '',
    `user_id`          bigint(20)    NOT NULL,
    `module`           varchar(50)   NOT NULL,
    `name`             varchar(50)   NOT NULL,
    `operate_type`     bigint(4)     NOT NULL DEFAULT '0',
    `content`          varchar(2000) NOT NULL DEFAULT '',
    `exts`             varchar(512)  NOT NULL DEFAULT '',
    `request_method`   varchar(16)            DEFAULT '',
    `request_url`      varchar(255)           DEFAULT '',
    `user_ip`          varchar(50)            DEFAULT NULL,
    `user_agent`       varchar(200)           DEFAULT NULL,
    `java_method`      varchar(512)  NOT NULL DEFAULT '',
    `java_method_args` varchar(8000)          DEFAULT '',
    `start_time`       datetime      NOT NULL,
    `duration`         int(11)       NOT NULL,
    `result_code`      int(11)       NOT NULL DEFAULT '0',
    `result_msg`       varchar(512)           DEFAULT '',
    `result_data`      varchar(4000)          DEFAULT '',
    `creator`          varchar(64)            DEFAULT '',
    `create_time`      datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`          varchar(64)            DEFAULT '',
    `update_time`      datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`          bit(1)        NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) COMMENT ='操作日志记录';

CREATE TABLE IF NOT EXISTS "sys_user"
(
    "id"          bigint       not null GENERATED BY DEFAULT AS IDENTITY,
    "username"    varchar(30)  not null,
    "password"    varchar(100) not null default '',
    "nickname"    varchar(30)  not null,
    "remark"      varchar(500)          default null,
    "dept_id"     bigint                default null,
    "post_ids"    varchar(255)          default null,
    "email"       varchar(50)           default '',
    "mobile"      varchar(11)           default '',
    "sex"         tinyint               default '0',
    "avatar"      varchar(100)          default '',
    "status"      tinyint      not null default '0',
    "login_ip"    varchar(50)           default '',
    "login_date"  timestamp             default null,
    "creator"     varchar(64)           default '',
    "create_time" timestamp    not null default current_timestamp,
    "updater"     varchar(64)           default '',
    "update_time" timestamp    not null default current_timestamp,
    "deleted"     bit          not null default false,
    primary key ("id")
) comment '用户信息表';

CREATE TABLE IF NOT EXISTS "inf_api_access_log"
(
    "id"               bigint        not null GENERATED BY DEFAULT AS IDENTITY,
    "trace_id"         varchar(64)   not null default '',
    "user_id"          bigint        not null default '0',
    "user_type"        tinyint       not null default '0',
    "application_name" varchar(50)   not null,
    "request_method"   varchar(16)   not null default '',
    "request_url"      varchar(255)  not null default '',
    "request_params"   varchar(8000) not null default '',
    "user_ip"          varchar(50)   not null,
    "user_agent"       varchar(512)  not null,
    "begin_time"       timestamp     not null,
    "end_time"         timestamp     not null,
    "duration"         integer       not null,
    "result_code"      integer       not null default '0',
    "result_msg"       varchar(512)           default '',
    "creator"          varchar(64)            default '',
    "create_time"      timestamp     not null default current_timestamp,
    "updater"          varchar(64)            default '',
    "update_time"      timestamp     not null default current_timestamp,
    "deleted"          bit           not null default false,
    primary key ("id")
) COMMENT 'API 访问日志表';

CREATE TABLE IF NOT EXISTS "inf_api_error_log"
(
    "id"                    integer       not null GENERATED BY DEFAULT AS IDENTITY,
    "trace_id"              varchar(64)   not null,
    "user_id"               bigint        not null default '0',
    "user_type"             tinyint       not null default '0',
    "application_name"      varchar(50)   not null,
    "request_method"        varchar(16)   not null,
    "request_url"           varchar(255)  not null,
    "request_params"        varchar(8000) not null,
    "user_ip"               varchar(50)   not null,
    "user_agent"            varchar(512)  not null,
    "exception_time"        timestamp     not null,
    "exception_name"        varchar(128)  not null default '',
    "exception_message" clob not null,
    "exception_root_cause_message" clob not null,
    "exception_stack_trace" clob not null,
    "exception_class_name"  varchar(512)  not null,
    "exception_file_name"   varchar(512)  not null,
    "exception_method_name" varchar(512)  not null,
    "exception_line_number" integer       not null,
    "process_status"        tinyint       not null,
    "process_time"          timestamp              default null,
    "process_user_id"       bigint                 default '0',
    "creator"               varchar(64)            default '',
    "create_time"           timestamp     not null default current_timestamp,
    "updater"               varchar(64)            default '',
    "update_time"           timestamp     not null default current_timestamp,
    "deleted"               bit           not null default false,
    primary key ("id")
) COMMENT '系统异常日志';

CREATE TABLE IF NOT EXISTS "sys_sms_channel"
(
    "id"           bigint      NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "signature"    varchar(10) NOT NULL,
    "code"         varchar(63) NOT NULL,
    "status"       tinyint     NOT NULL,
    "remark"       varchar(255)         DEFAULT NULL,
    "api_key"      varchar(63) NOT NULL,
    "api_secret"   varchar(63)          DEFAULT NULL,
    "callback_url" varchar(255)         DEFAULT NULL,
    "creator"      varchar(64)          DEFAULT '',
    "create_time"  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"      varchar(64)          DEFAULT '',
    "update_time"  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"      bit         NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '短信渠道';

CREATE TABLE IF NOT EXISTS "sys_sms_template"
(
    "id"              bigint       NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "type"            tinyint      NOT NULL,
    "status"          tinyint      NOT NULL,
    "code"            varchar(63)  NOT NULL,
    "name"            varchar(63)  NOT NULL,
    "content"         varchar(255) NOT NULL,
    "params"          varchar(255) NOT NULL,
    "remark"          varchar(255)          DEFAULT NULL,
    "api_template_id" varchar(63)  NOT NULL,
    "channel_id"      bigint       NOT NULL,
    "channel_code"    varchar(63)  NOT NULL,
    "creator"         varchar(64)           DEFAULT '',
    "create_time"     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"         varchar(64)           DEFAULT '',
    "update_time"     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"         bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '短信模板';

CREATE TABLE IF NOT EXISTS "sys_sms_log"
(
    "id"               bigint       NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "channel_id"       bigint       NOT NULL,
    "channel_code"     varchar(63)  NOT NULL,
    "template_id"      bigint       NOT NULL,
    "template_code"    varchar(63)  NOT NULL,
    "template_type"    tinyint      NOT NULL,
    "template_content" varchar(255) NOT NULL,
    "template_params"  varchar(255) NOT NULL,
    "api_template_id"  varchar(63)  NOT NULL,
    "mobile"           varchar(11)  NOT NULL,
    "user_id"          bigint                DEFAULT '0',
    "user_type"        tinyint               DEFAULT '0',
    "send_status"      tinyint      NOT NULL DEFAULT '0',
    "send_time"        timestamp             DEFAULT NULL,
    "send_code"        int                   DEFAULT NULL,
    "send_msg"         varchar(255)          DEFAULT NULL,
    "api_send_code"    varchar(63)           DEFAULT NULL,
    "api_send_msg"     varchar(255)          DEFAULT NULL,
    "api_request_id"   varchar(255)          DEFAULT NULL,
    "api_serial_no"    varchar(255)          DEFAULT NULL,
    "receive_status"   tinyint      NOT NULL DEFAULT '0',
    "receive_time"     timestamp             DEFAULT NULL,
    "api_receive_code" varchar(63)           DEFAULT NULL,
    "api_receive_msg"  varchar(255)          DEFAULT NULL,
    "creator"          varchar(64)           DEFAULT '',
    "create_time"      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"          varchar(64)           DEFAULT '',
    "update_time"      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"          bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '短信日志';

CREATE TABLE IF NOT EXISTS "sys_error_code"
(
    "id"               bigint       NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "type"             tinyint      NOT NULL DEFAULT '0',
    "application_name" varchar(50)  NOT NULL,
    "code"             int          NOT NULL DEFAULT '0',
    "message"          varchar(512) NOT NULL DEFAULT '',
    "memo"             varchar(512)          DEFAULT '',
    "creator"          varchar(64)           DEFAULT '',
    "create_time"      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"          varchar(64)           DEFAULT '',
    "update_time"      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"          bit          NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '错误码表';

CREATE TABLE IF NOT EXISTS "sys_social_user"
(
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "user_id"        bigint        NOT NULL,
    "user_type"      tinyint       NOT NULL DEFAULT '0',
    "type"           tinyint       NOT NULL,
    "openid"         varchar(32)   NOT NULL,
    "token"          varchar(256)           DEFAULT NULL,
    "union_id"       varchar(32)   NOT NULL,
    "raw_token_info" varchar(1024) NOT NULL,
    "nickname"       varchar(32)   NOT NULL,
    "avatar"         varchar(255)           DEFAULT NULL,
    "raw_user_info"  varchar(1024) NOT NULL,
    "creator"        varchar(64)            DEFAULT '',
    "create_time"    timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"        varchar(64)            DEFAULT '',
    "update_time"    timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"        bit           NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '社交用户';

CREATE TABLE IF NOT EXISTS "pay_merchant"
(
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "no"          varchar(32) NOT NULL,
    "name"        varchar(64) NOT NULL,
    "short_name"  varchar(64) NOT NULL,
    "status"      tinyint     NOT NULL,
    "remark"      varchar(255)         DEFAULT NULL,
    "creator"     varchar(64)          DEFAULT '',
    "create_time" datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)          DEFAULT '',
    "update_time" datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted"     bit(1)      NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '支付商户信息';

CREATE TABLE IF NOT EXISTS "pay_app"
(
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name"              varchar(64)   NOT NULL,
    "status"            tinyint       NOT NULL,
    "remark"            varchar(255)           DEFAULT NULL,
    `pay_notify_url`    varchar(1024) NOT NULL,
    `refund_notify_url` varchar(1024) NOT NULL,
    `merchant_id`       bigint(20)    NOT NULL,
    "creator"           varchar(64)            DEFAULT '',
    "create_time"       datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"           varchar(64)            DEFAULT '',
    "update_time"       datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted"           bit(1)        NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT = '支付应用信息';

CREATE TABLE "pay_channel"
(
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "code"        varchar(32)    NOT NULL,
    "status"      tinyint(4)     NOT NULL,
    "remark"      varchar(255)            DEFAULT NULL,
    "fee_rate"    double         NOT NULL DEFAULT 0,
    "merchant_id" bigint(20)     NOT NULL,
    "app_id"      bigint(20)     NOT NULL,
    "config"      varchar(10240) NOT NULL,
    "creator"     varchar(64)    NULL     DEFAULT '',
    "create_time" datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)    NULL     DEFAULT '',
    "update_time" datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted"     bit(1)         NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT = '支付渠道';

CREATE TABLE `pay_order`
(
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `merchant_id`          bigint(20)    NOT NULL,
    `app_id`               bigint(20)    NOT NULL,
    `channel_id`           bigint(20)             DEFAULT NULL,
    `channel_code`         varchar(32)            DEFAULT NULL,
    `merchant_order_id`    varchar(64)   NOT NULL,
    `subject`              varchar(32)   NOT NULL,
    `body`                 varchar(128)  NOT NULL,
    `notify_url`           varchar(1024) NOT NULL,
    `notify_status`        tinyint(4)    NOT NULL,
    `amount`               bigint(20)    NOT NULL,
    `channel_fee_rate`     double                 DEFAULT 0,
    `channel_fee_amount`   bigint(20)             DEFAULT 0,
    `status`               tinyint(4)    NOT NULL,
    `user_ip`              varchar(50)   NOT NULL,
    `expire_time`          datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `success_time`         datetime(0)            DEFAULT CURRENT_TIMESTAMP,
    `notify_time`          datetime(0)            DEFAULT CURRENT_TIMESTAMP,
    `success_extension_id` bigint(20)             DEFAULT NULL COMMENT '支付成功的订单拓展单编号',
    `refund_status`        tinyint(4)    NOT NULL,
    `refund_times`         tinyint(4)    NOT NULL,
    `refund_amount`        bigint(20)    NOT NULL,
    `channel_user_id`      varchar(255)           DEFAULT NULL,
    `channel_order_no`     varchar(64)            DEFAULT NULL,
    `creator`              varchar(64)            DEFAULT '',
    `create_time`          datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`              varchar(64)            DEFAULT '',
    `update_time`          datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`              bit(1)        NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT = '支付订单';



CREATE TABLE `pay_refund`
(
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `req_no`             varchar(64)   NOT NULL,
    `merchant_id`        bigint(20)    NOT NULL,
    `app_id`             bigint(20)    NOT NULL,
    `channel_id`         bigint(20)    NOT NULL,
    `channel_code`       varchar(32)   NOT NULL,
    `order_id`           bigint(20)    NOT NULL,
    `trade_no`           varchar(64)   NOT NULL,
    `merchant_order_id`  varchar(64)   NOT NULL,
    `merchant_refund_no` varchar(64)   NOT NULL,
    `notify_url`         varchar(1024) NOT NULL,
    `notify_status`      tinyint(4)    NOT NULL,
    `status`             tinyint(4)    NOT NULL,
    `type`               tinyint(4)    NOT NULL,
    `pay_amount`         bigint(20)    NOT NULL,
    `refund_amount`      bigint(20)    NOT NULL,
    `reason`             varchar(256)  NOT NULL,
    `user_ip`            varchar(50)   NULL     DEFAULT NULL,
    `channel_order_no`   varchar(64)   NOT NULL,
    `channel_refund_no`  varchar(64)   NULL     DEFAULT NULL,
    `channel_error_code` varchar(128)  NULL     DEFAULT NULL,
    `channel_error_msg`  varchar(256)  NULL     DEFAULT NULL,
    `channel_extras`     varchar(1024) NULL     DEFAULT NULL,
    `expire_time`        datetime(0)   NULL     DEFAULT NULL,
    `success_time`       datetime(0)   NULL     DEFAULT NULL,
    `notify_time`        datetime(0)   NULL     DEFAULT NULL,
    `creator`            varchar(64)   NULL     DEFAULT '',
    `create_time`        datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`            varchar(64)   NULL     DEFAULT '',
    `update_time`        datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`            bit(1)        NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT = '退款订单';

