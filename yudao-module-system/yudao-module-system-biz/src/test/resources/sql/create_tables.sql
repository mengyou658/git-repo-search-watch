CREATE TABLE IF NOT EXISTS "system_dept" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar(30) NOT NULL DEFAULT '',
    "parent_id" bigint NOT NULL DEFAULT '0',
    "sort" int NOT NULL DEFAULT '0',
    "leader_user_id" bigint DEFAULT NULL,
    "phone" varchar(11) DEFAULT NULL,
    "email" varchar(50) DEFAULT NULL,
    "status" tinyint NOT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY ("id")
) COMMENT '部门表';

CREATE TABLE IF NOT EXISTS "system_dict_data" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "sort" int NOT NULL DEFAULT '0',
    "label" varchar(100) NOT NULL DEFAULT '',
    "value" varchar(100) NOT NULL DEFAULT '',
    "dict_type" varchar(100) NOT NULL DEFAULT '',
    "status" tinyint NOT NULL DEFAULT '0',
    "color_type" varchar(100) NOT NULL DEFAULT '',
    "css_class" varchar(100) NOT NULL DEFAULT '',
    "remark" varchar(500) DEFAULT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '字典数据表';

CREATE TABLE IF NOT EXISTS "system_role" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar(30) NOT NULL,
    "code" varchar(100) NOT NULL,
    "sort" int NOT NULL,
    "data_scope" tinyint NOT NULL DEFAULT '1',
    "data_scope_dept_ids" varchar(500) NOT NULL DEFAULT '',
    "status" tinyint NOT NULL,
    "type" tinyint NOT NULL,
    "remark" varchar(500) DEFAULT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY ("id")
) COMMENT '角色信息表';

CREATE TABLE IF NOT EXISTS "system_role_menu" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "role_id" bigint NOT NULL,
    "menu_id" bigint NOT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY ("id")
) COMMENT '角色和菜单关联表';

CREATE TABLE IF NOT EXISTS "system_menu" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar(50) NOT NULL,
    "permission" varchar(100) NOT NULL DEFAULT '',
    "type" tinyint NOT NULL,
    "sort" int NOT NULL DEFAULT '0',
    "parent_id" bigint NOT NULL DEFAULT '0',
    "path" varchar(200) DEFAULT '',
    "icon" varchar(100) DEFAULT '#',
    "component" varchar(255) DEFAULT NULL,
    "component_name" varchar(255) DEFAULT NULL,
    "status" tinyint NOT NULL DEFAULT '0',
    "visible" bit NOT NULL DEFAULT TRUE,
    "keep_alive" bit NOT NULL DEFAULT TRUE,
    "always_show" bit NOT NULL DEFAULT TRUE,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '菜单权限表';

CREATE TABLE IF NOT EXISTS "system_user_role" (
     "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
     "user_id" bigint NOT NULL,
     "role_id" bigint NOT NULL,
     "creator" varchar(64) DEFAULT '',
     "create_time" timestamp DEFAULT NULL,
     "updater" varchar(64) DEFAULT '',
     "update_time" timestamp DEFAULT NULL,
     "deleted" bit DEFAULT FALSE,
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY ("id")
) COMMENT '用户和角色关联表';

CREATE TABLE IF NOT EXISTS "system_dict_type" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar(100) NOT NULL DEFAULT '',
    "type" varchar(100) NOT NULL DEFAULT '',
    "status" tinyint NOT NULL DEFAULT '0',
    "remark" varchar(500) DEFAULT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    "deleted_time" timestamp NOT NULL,
    PRIMARY KEY ("id")
) COMMENT '字典类型表';

CREATE TABLE IF NOT EXISTS `system_user_session` (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `token` varchar(32) NOT NULL,
    `user_id` bigint DEFAULT NULL,
    "user_type" tinyint NOT NULL,
    `username` varchar(50) NOT NULL DEFAULT '',
    `user_ip` varchar(50) DEFAULT NULL,
    `user_agent` varchar(512) DEFAULT NULL,
    `session_timeout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater` varchar(64) DEFAULT '' ,
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY (`id`)
) COMMENT '用户在线 Session';

CREATE TABLE IF NOT EXISTS "system_post" (
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
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY ("id")
) COMMENT '岗位信息表';

CREATE TABLE IF NOT EXISTS `system_user_post`(
    "id"          bigint    NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "user_id"     bigint             DEFAULT NULL,
    "post_id"     bigint             DEFAULT NULL,
    "creator"     varchar(64)        DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)        DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted"     bit       NOT NULL DEFAULT FALSE,
    "tenant_id"   bigint    not null default '0',
    PRIMARY KEY (`id`)
) COMMENT ='用户岗位表';

CREATE TABLE IF NOT EXISTS "system_notice" (
	"id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	"title" varchar(50) NOT NULL COMMENT '公告标题',
	"content" text NOT NULL COMMENT '公告内容',
	"type" tinyint NOT NULL COMMENT '公告类型（1通知 2公告）',
	"status" tinyint NOT NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
	"creator" varchar(64) DEFAULT '' COMMENT '创建者',
	"create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	"updater" varchar(64) DEFAULT '' COMMENT '更新者',
	"update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	"deleted" bit NOT NULL DEFAULT 0 COMMENT '是否删除',
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY("id")
) COMMENT '通知公告表';

CREATE TABLE IF NOT EXISTS `system_login_log` (
    `id`          bigint(20)   NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `log_type`    bigint(4)    NOT NULL,
    "user_id" bigint not null default '0',
    "user_type" tinyint NOT NULL,
    `trace_id`    varchar(64)  NOT NULL DEFAULT '',
    `username`    varchar(50)  NOT NULL DEFAULT '',
    `result`      tinyint(4)   NOT NULL,
    `user_ip`     varchar(50)  NOT NULL,
    `user_agent`  varchar(512) NOT NULL,
    `creator`   varchar(64)           DEFAULT '',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`   varchar(64)           DEFAULT '',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`     bit(1)       NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) COMMENT ='系统访问记录';

CREATE TABLE IF NOT EXISTS `system_operate_log` (
    `id`               bigint(20)    NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `trace_id`         varchar(64)   NOT NULL DEFAULT '',
    `user_id`          bigint(20)    NOT NULL,
    "user_type" tinyint not null default '0',
    `module`           varchar(50)   NOT NULL,
    `name`             varchar(50)   NOT NULL,
    `type`     bigint(4)     NOT NULL DEFAULT '0',
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
    `creator`        varchar(64)            DEFAULT '',
    `create_time`      datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`        varchar(64)            DEFAULT '',
    `update_time`      datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`          bit(1)        NOT NULL DEFAULT '0',
    "tenant_id"         bigint not null default  '0',
    PRIMARY KEY (`id`)
) COMMENT ='操作日志记录';

CREATE TABLE IF NOT EXISTS "system_users" (
    "id" bigint not null GENERATED BY DEFAULT AS IDENTITY,
    "username" varchar(30) not null,
    "password" varchar(100) not null default '',
    "nickname" varchar(30) not null,
    "remark" varchar(500) default null,
    "dept_id" bigint default null,
    "post_ids" varchar(255) default null,
    "email" varchar(50) default '',
    "mobile" varchar(11) default '',
    "sex" tinyint default '0',
    "avatar" varchar(100) default '',
    "status" tinyint not null default '0',
    "login_ip" varchar(50) default '',
    "login_date" timestamp default null,
    "creator" varchar(64) default '',
    "create_time" timestamp not null default current_timestamp,
    "updater" varchar(64) default '',
    "update_time" timestamp not null default current_timestamp,
    "deleted" bit not null default false,
    "tenant_id" bigint not null default  '0',
    primary key ("id")
) comment '用户信息表';

CREATE TABLE IF NOT EXISTS "system_sms_channel" (
   "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
   "signature" varchar(10) NOT NULL,
   "code" varchar(63) NOT NULL,
   "status" tinyint NOT NULL,
   "remark" varchar(255) DEFAULT NULL,
   "api_key" varchar(63) NOT NULL,
   "api_secret" varchar(63) DEFAULT NULL,
   "callback_url" varchar(255) DEFAULT NULL,
   "creator" varchar(64) DEFAULT '',
   "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "updater" varchar(64) DEFAULT '',
   "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "deleted" bit NOT NULL DEFAULT FALSE,
   PRIMARY KEY ("id")
) COMMENT '短信渠道';

CREATE TABLE IF NOT EXISTS "system_sms_template" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "type" tinyint NOT NULL,
    "status" tinyint NOT NULL,
    "code" varchar(63) NOT NULL,
    "name" varchar(63) NOT NULL,
    "content" varchar(255) NOT NULL,
    "params" varchar(255) NOT NULL,
    "remark" varchar(255) DEFAULT NULL,
    "api_template_id" varchar(63) NOT NULL,
    "channel_id" bigint NOT NULL,
    "channel_code" varchar(63) NOT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '短信模板';

CREATE TABLE IF NOT EXISTS "system_sms_log" (
   "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
   "channel_id" bigint NOT NULL,
   "channel_code" varchar(63) NOT NULL,
   "template_id" bigint NOT NULL,
   "template_code" varchar(63) NOT NULL,
   "template_type" tinyint NOT NULL,
   "template_content" varchar(255) NOT NULL,
   "template_params" varchar(255) NOT NULL,
   "api_template_id" varchar(63) NOT NULL,
   "mobile" varchar(11) NOT NULL,
   "user_id" bigint DEFAULT '0',
   "user_type" tinyint DEFAULT '0',
   "send_status" tinyint NOT NULL DEFAULT '0',
   "send_time" timestamp DEFAULT NULL,
   "send_code" int DEFAULT NULL,
   "send_msg" varchar(255) DEFAULT NULL,
   "api_send_code" varchar(63) DEFAULT NULL,
   "api_send_msg" varchar(255) DEFAULT NULL,
   "api_request_id" varchar(255) DEFAULT NULL,
   "api_serial_no" varchar(255) DEFAULT NULL,
   "receive_status" tinyint NOT NULL DEFAULT '0',
   "receive_time" timestamp DEFAULT NULL,
   "api_receive_code" varchar(63) DEFAULT NULL,
   "api_receive_msg" varchar(255) DEFAULT NULL,
   "creator" varchar(64) DEFAULT '',
   "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "updater" varchar(64) DEFAULT '',
   "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "deleted" bit NOT NULL DEFAULT FALSE,
   PRIMARY KEY ("id")
) COMMENT '短信日志';

CREATE TABLE IF NOT EXISTS "system_sms_code" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "mobile" varchar(11) NOT NULL,
    "code" varchar(11) NOT NULL,
    "scene" bigint NOT NULL,
    "create_ip" varchar NOT NULL,
    "today_index" int NOT NULL,
    "used" bit NOT NULL DEFAULT FALSE,
    "used_time" timestamp DEFAULT NULL,
    "used_ip" varchar NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '短信日志';

CREATE TABLE IF NOT EXISTS "system_error_code" (
  "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  "type" tinyint NOT NULL DEFAULT '0',
  "application_name" varchar(50) NOT NULL,
  "code" int NOT NULL DEFAULT '0',
  "message" varchar(512) NOT NULL DEFAULT '',
  "memo" varchar(512) DEFAULT '',
  "creator" varchar(64) DEFAULT '',
  "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(64) DEFAULT '',
  "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted" bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY ("id")
) COMMENT '错误码表';

CREATE TABLE IF NOT EXISTS "system_social_client" (
  "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  "name" varchar(255) NOT NULL,
  "social_type" int NOT NULL,
  "user_type" int NOT NULL,
  "client_id" varchar(255) NOT NULL,
  "client_secret" varchar(255) NOT NULL,
  "status" int NOT NULL,
  "creator" varchar(64) DEFAULT '',
  "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(64) DEFAULT '',
  "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  "deleted" bit NOT NULL DEFAULT FALSE,
  "tenant_id" bigint NOT NULL,
  PRIMARY KEY ("id")
) COMMENT '社交客户端表';

CREATE TABLE IF NOT EXISTS "system_social_user" (
   "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
   "type" tinyint NOT NULL,
   "openid" varchar(64) NOT NULL,
   "token" varchar(256) DEFAULT NULL,
   "raw_token_info" varchar(1024) NOT NULL,
   "nickname" varchar(32) NOT NULL,
   "avatar" varchar(255) DEFAULT NULL,
   "raw_user_info" varchar(1024) NOT NULL,
   "code" varchar(64) NOT NULL,
   "state" varchar(64),
   "creator" varchar(64) DEFAULT '',
   "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "updater" varchar(64) DEFAULT '',
   "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "deleted" bit NOT NULL DEFAULT FALSE,
   PRIMARY KEY ("id")
) COMMENT '社交用户';

CREATE TABLE IF NOT EXISTS "system_social_user_bind" (
   "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
   "user_id" bigint NOT NULL,
   "user_type" tinyint NOT NULL,
   "social_type" tinyint NOT NULL,
   "social_user_id" number NOT NULL,
   "creator" varchar(64) DEFAULT '',
   "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "updater" varchar(64) DEFAULT '',
   "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "deleted" bit NOT NULL DEFAULT FALSE,
   PRIMARY KEY ("id")
) COMMENT '社交用户的绑定';

CREATE TABLE IF NOT EXISTS "system_tenant" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar(63) NOT NULL,
    "contact_user_id" bigint NOT NULL DEFAULT '0',
    "contact_name" varchar(255) NOT NULL,
    "contact_mobile" varchar(255),
    "status" tinyint NOT NULL,
    "domain" varchar(63) DEFAULT '',
    "package_id"  bigint NOT NULL,
    "expire_time" timestamp NOT NULL,
    "account_count" int NOT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '租户';

CREATE TABLE IF NOT EXISTS "system_tenant_package" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar(30) NOT NULL,
    "status" tinyint NOT NULL,
    "remark" varchar(256),
    "menu_ids" varchar(2048) NOT NULL,
    "creator" varchar(64) DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '租户套餐表';

CREATE TABLE IF NOT EXISTS "system_sensitive_word" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar(255) NOT NULL,
    "tags" varchar(1024) NOT NULL,
    "status" bit NOT NULL DEFAULT FALSE,
    "description" varchar(512),
    "creator" varchar(64) DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '系统敏感词';

CREATE TABLE IF NOT EXISTS "system_oauth2_client" (
  "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  "client_id" varchar NOT NULL,
  "secret" varchar NOT NULL,
  "name" varchar NOT NULL,
  "logo" varchar NOT NULL,
  "description" varchar,
  "status" int NOT NULL,
  "access_token_validity_seconds" int NOT NULL,
  "refresh_token_validity_seconds" int NOT NULL,
  "redirect_uris" varchar NOT NULL,
  "authorized_grant_types" varchar NOT NULL,
  "scopes" varchar NOT NULL DEFAULT '',
  "auto_approve_scopes" varchar NOT NULL DEFAULT '',
  "authorities" varchar NOT NULL DEFAULT '',
  "resource_ids" varchar NOT NULL DEFAULT '',
  "additional_information" varchar NOT NULL DEFAULT '',
  "creator" varchar DEFAULT '',
  "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar DEFAULT '',
  "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  "deleted" bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY ("id")
) COMMENT 'OAuth2 客户端表';

CREATE TABLE IF NOT EXISTS "system_oauth2_approve" (
  "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
  "user_id" bigint NOT NULL,
  "user_type" tinyint NOT NULL,
  "client_id" varchar NOT NULL,
  "scope" varchar NOT NULL,
  "approved" bit NOT NULL DEFAULT FALSE,
  "expires_time" datetime NOT NULL,
  "creator" varchar DEFAULT '',
  "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar DEFAULT '',
  "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  "deleted" bit NOT NULL DEFAULT FALSE,
  PRIMARY KEY ("id")
) COMMENT 'OAuth2 批准表';

CREATE TABLE IF NOT EXISTS "system_oauth2_access_token" (
   "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
   "user_id" bigint NOT NULL,
   "user_type" tinyint NOT NULL,
   "access_token" varchar NOT NULL,
   "refresh_token" varchar NOT NULL,
   "client_id" varchar NOT NULL,
   "scopes" varchar NOT NULL,
   "approved" bit NOT NULL DEFAULT FALSE,
   "expires_time" datetime NOT NULL,
   "creator" varchar DEFAULT '',
   "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   "updater" varchar DEFAULT '',
   "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   "deleted" bit NOT NULL DEFAULT FALSE,
   "tenant_id" bigint NOT NULL,
   PRIMARY KEY ("id")
) COMMENT 'OAuth2 访问令牌';

CREATE TABLE IF NOT EXISTS "system_oauth2_refresh_token" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "user_id" bigint NOT NULL,
    "user_type" tinyint NOT NULL,
    "refresh_token" varchar NOT NULL,
    "client_id" varchar NOT NULL,
    "scopes" varchar NOT NULL,
    "approved" bit NOT NULL DEFAULT FALSE,
    "expires_time" datetime NOT NULL,
    "creator" varchar DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT 'OAuth2 刷新令牌';

CREATE TABLE IF NOT EXISTS "system_oauth2_code" (
     "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
     "user_id" bigint NOT NULL,
     "user_type" tinyint NOT NULL,
     "code" varchar NOT NULL,
     "client_id" varchar NOT NULL,
     "scopes" varchar NOT NULL,
     "expires_time" datetime NOT NULL,
     "redirect_uri" varchar NOT NULL,
     "state" varchar NOT NULL,
     "creator" varchar DEFAULT '',
     "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
     "updater" varchar DEFAULT '',
     "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     "deleted" bit NOT NULL DEFAULT FALSE,
     PRIMARY KEY ("id")
) COMMENT 'OAuth2 刷新令牌';

CREATE TABLE IF NOT EXISTS "system_mail_account" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "mail" varchar NOT NULL,
    "username" varchar NOT NULL,
    "password" varchar NOT NULL,
    "host" varchar NOT NULL,
    "port" int NOT NULL,
    "ssl_enable" bit NOT NULL,
    "creator" varchar DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '邮箱账号表';

CREATE TABLE IF NOT EXISTS "system_mail_template" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar NOT NULL,
    "code" varchar NOT NULL,
    "account_id" bigint NOT NULL,
    "nickname" varchar,
    "title" varchar NOT NULL,
    "content" varchar NOT NULL,
    "params" varchar NOT NULL,
    "status" varchar NOT NULL,
    "remark" varchar,
    "creator" varchar DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '邮件模版表';

CREATE TABLE IF NOT EXISTS "system_mail_log" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "user_id" bigint,
    "user_type" varchar,
    "to_mail" varchar NOT NULL,
    "account_id" bigint NOT NULL,
    "from_mail" varchar NOT NULL,
    "template_id" bigint NOT NULL,
    "template_code" varchar NOT NULL,
    "template_nickname" varchar,
    "template_title" varchar NOT NULL,
    "template_content" varchar NOT NULL,
    "template_params" varchar NOT NULL,
    "send_status" varchar NOT NULL,
    "send_time" datetime,
    "send_message_id" varchar,
    "send_exception" varchar,
    "creator" varchar DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '邮件日志表';

-- 将该建表 SQL 语句，添加到 yudao-module-system-biz 模块的 test/resources/sql/create_tables.sql 文件里
CREATE TABLE IF NOT EXISTS "system_notify_template" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name" varchar NOT NULL,
    "code" varchar NOT NULL,
    "nickname" varchar NOT NULL,
    "content" varchar NOT NULL,
    "type" varchar NOT NULL,
    "params" varchar,
    "status" varchar NOT NULL,
    "remark" varchar,
    "creator" varchar DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '站内信模板表';

CREATE TABLE IF NOT EXISTS "system_notify_message" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "user_id" bigint NOT NULL,
    "user_type" varchar NOT NULL,
    "template_id" bigint NOT NULL,
    "template_code" varchar NOT NULL,
    "template_nickname" varchar NOT NULL,
    "template_content" varchar NOT NULL,
    "template_type" int NOT NULL,
    "template_params" varchar NOT NULL,
    "read_status" bit NOT NULL,
    "read_time" varchar,
    "creator" varchar DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY ("id")
) COMMENT '站内信消息表';
