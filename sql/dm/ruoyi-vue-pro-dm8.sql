/*
 Yudao Database Transfer Tool

 Source Server Type    : MySQL

 Target Server Type    : DM8

 Date: 2024-05-03 22:21:06
*/


-- ----------------------------
-- Table structure for infra_api_access_log
-- ----------------------------
CREATE TABLE infra_api_access_log
(
    id               bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    trace_id         varchar(64)  DEFAULT ''                NULL,
    user_id          bigint       DEFAULT 0                 NOT NULL,
    user_type        smallint     DEFAULT 0                 NOT NULL,
    application_name varchar(50)                            NOT NULL,
    request_method   varchar(16)  DEFAULT ''                NULL,
    request_url      varchar(255) DEFAULT ''                NULL,
    request_params   text                                   NULL,
    response_body    text                                   NULL,
    user_ip          varchar(50)                            NOT NULL,
    user_agent       varchar(512)                           NOT NULL,
    operate_module   varchar(50)  DEFAULT NULL              NULL,
    operate_name     varchar(50)  DEFAULT NULL              NULL,
    operate_type     smallint     DEFAULT 0                 NULL,
    begin_time       datetime                               NOT NULL,
    end_time         datetime                               NOT NULL,
    duration         int                                    NOT NULL,
    result_code      int          DEFAULT 0                 NOT NULL,
    result_msg       varchar(512) DEFAULT ''                NULL,
    creator          varchar(64)  DEFAULT ''                NULL,
    create_time      datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater          varchar(64)  DEFAULT ''                NULL,
    update_time      datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted          bit          DEFAULT '0'               NOT NULL,
    tenant_id        bigint       DEFAULT 0                 NOT NULL
);

CREATE INDEX idx_infra_api_access_log_01 ON infra_api_access_log (create_time);

COMMENT ON COLUMN infra_api_access_log.id IS '��־����';
COMMENT ON COLUMN infra_api_access_log.trace_id IS '��·׷�ٱ��';
COMMENT ON COLUMN infra_api_access_log.user_id IS '�û����';
COMMENT ON COLUMN infra_api_access_log.user_type IS '�û�����';
COMMENT ON COLUMN infra_api_access_log.application_name IS 'Ӧ����';
COMMENT ON COLUMN infra_api_access_log.request_method IS '���󷽷���';
COMMENT ON COLUMN infra_api_access_log.request_url IS '�����ַ';
COMMENT ON COLUMN infra_api_access_log.request_params IS '�������';
COMMENT ON COLUMN infra_api_access_log.response_body IS '��Ӧ���';
COMMENT ON COLUMN infra_api_access_log.user_ip IS '�û� IP';
COMMENT ON COLUMN infra_api_access_log.user_agent IS '����� UA';
COMMENT ON COLUMN infra_api_access_log.operate_module IS '����ģ��';
COMMENT ON COLUMN infra_api_access_log.operate_name IS '������';
COMMENT ON COLUMN infra_api_access_log.operate_type IS '��������';
COMMENT ON COLUMN infra_api_access_log.begin_time IS '��ʼ����ʱ��';
COMMENT ON COLUMN infra_api_access_log.end_time IS '��������ʱ��';
COMMENT ON COLUMN infra_api_access_log.duration IS 'ִ��ʱ��';
COMMENT ON COLUMN infra_api_access_log.result_code IS '�����';
COMMENT ON COLUMN infra_api_access_log.result_msg IS '�����ʾ';
COMMENT ON COLUMN infra_api_access_log.creator IS '������';
COMMENT ON COLUMN infra_api_access_log.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_api_access_log.updater IS '������';
COMMENT ON COLUMN infra_api_access_log.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_api_access_log.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN infra_api_access_log.tenant_id IS '�⻧���';
COMMENT ON TABLE infra_api_access_log IS 'API ������־��';

-- ----------------------------
-- Table structure for infra_api_error_log
-- ----------------------------
CREATE TABLE infra_api_error_log
(
    id                           bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    trace_id                     varchar(64)                            NOT NULL,
    user_id                      int          DEFAULT 0                 NOT NULL,
    user_type                    smallint     DEFAULT 0                 NOT NULL,
    application_name             varchar(50)                            NOT NULL,
    request_method               varchar(16)                            NOT NULL,
    request_url                  varchar(255)                           NOT NULL,
    request_params               varchar(8000)                          NOT NULL,
    user_ip                      varchar(50)                            NOT NULL,
    user_agent                   varchar(512)                           NOT NULL,
    exception_time               datetime                               NOT NULL,
    exception_name               varchar(128) DEFAULT ''                NULL,
    exception_message            text                                   NOT NULL,
    exception_root_cause_message text                                   NOT NULL,
    exception_stack_trace        text                                   NOT NULL,
    exception_class_name         varchar(512)                           NOT NULL,
    exception_file_name          varchar(512)                           NOT NULL,
    exception_method_name        varchar(512)                           NOT NULL,
    exception_line_number        int                                    NOT NULL,
    process_status               smallint                               NOT NULL,
    process_time                 datetime     DEFAULT NULL              NULL,
    process_user_id              int          DEFAULT 0                 NULL,
    creator                      varchar(64)  DEFAULT ''                NULL,
    create_time                  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater                      varchar(64)  DEFAULT ''                NULL,
    update_time                  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted                      bit          DEFAULT '0'               NOT NULL,
    tenant_id                    bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN infra_api_error_log.id IS '���';
COMMENT ON COLUMN infra_api_error_log.trace_id IS '��·׷�ٱ��
     *
     * һ����˵��ͨ����·׷�ٱ�ţ����Խ�������־��������־����·׷����־��logger ��ӡ��־�ȣ������һ�𣬴Ӷ������Ŵ�';
COMMENT ON COLUMN infra_api_error_log.user_id IS '�û����';
COMMENT ON COLUMN infra_api_error_log.user_type IS '�û�����';
COMMENT ON COLUMN infra_api_error_log.application_name IS 'Ӧ����
     *
     * Ŀǰ��ȡ spring.application.name';
COMMENT ON COLUMN infra_api_error_log.request_method IS '���󷽷���';
COMMENT ON COLUMN infra_api_error_log.request_url IS '�����ַ';
COMMENT ON COLUMN infra_api_error_log.request_params IS '�������';
COMMENT ON COLUMN infra_api_error_log.user_ip IS '�û� IP';
COMMENT ON COLUMN infra_api_error_log.user_agent IS '����� UA';
COMMENT ON COLUMN infra_api_error_log.exception_time IS '�쳣����ʱ��';
COMMENT ON COLUMN infra_api_error_log.exception_name IS '�쳣��
     *
     * {@link Throwable#getClass()} ����ȫ��';
COMMENT ON COLUMN infra_api_error_log.exception_message IS '�쳣���µ���Ϣ
     *
     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getMessage(Throwable)}';
COMMENT ON COLUMN infra_api_error_log.exception_root_cause_message IS '�쳣���µĸ���Ϣ
     *
     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getRootCauseMessage(Throwable)}';
COMMENT ON COLUMN infra_api_error_log.exception_stack_trace IS '�쳣��ջ�켣
     *
     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getServiceException(Exception)}';
COMMENT ON COLUMN infra_api_error_log.exception_class_name IS '�쳣��������ȫ��
     *
     * {@link StackTraceElement#getClassName()}';
COMMENT ON COLUMN infra_api_error_log.exception_file_name IS '�쳣���������ļ�
     *
     * {@link StackTraceElement#getFileName()}';
COMMENT ON COLUMN infra_api_error_log.exception_method_name IS '�쳣�����ķ�����
     *
     * {@link StackTraceElement#getMethodName()}';
COMMENT ON COLUMN infra_api_error_log.exception_line_number IS '�쳣�����ķ���������
     *
     * {@link StackTraceElement#getLineNumber()}';
COMMENT ON COLUMN infra_api_error_log.process_status IS '����״̬';
COMMENT ON COLUMN infra_api_error_log.process_time IS '����ʱ��';
COMMENT ON COLUMN infra_api_error_log.process_user_id IS '�����û����';
COMMENT ON COLUMN infra_api_error_log.creator IS '������';
COMMENT ON COLUMN infra_api_error_log.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_api_error_log.updater IS '������';
COMMENT ON COLUMN infra_api_error_log.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_api_error_log.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN infra_api_error_log.tenant_id IS '�⻧���';
COMMENT ON TABLE infra_api_error_log IS 'ϵͳ�쳣��־';

-- ----------------------------
-- Table structure for infra_codegen_column
-- ----------------------------
CREATE TABLE infra_codegen_column
(
    id                       bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    table_id                 bigint                                 NOT NULL,
    column_name              varchar(200)                           NOT NULL,
    data_type                varchar(100)                           NOT NULL,
    column_comment           varchar(500)                           NOT NULL,
    nullable                 bit                                    NOT NULL,
    primary_key              bit                                    NOT NULL,
    ordinal_position         int                                    NOT NULL,
    java_type                varchar(32)                            NOT NULL,
    java_field               varchar(64)                            NOT NULL,
    dict_type                varchar(200) DEFAULT ''                NULL,
    example                  varchar(64)  DEFAULT NULL              NULL,
    create_operation         bit                                    NOT NULL,
    update_operation         bit                                    NOT NULL,
    list_operation           bit                                    NOT NULL,
    list_operation_condition varchar(32)  DEFAULT '='               NOT NULL,
    list_operation_result    bit                                    NOT NULL,
    html_type                varchar(32)                            NOT NULL,
    creator                  varchar(64)  DEFAULT ''                NULL,
    create_time              datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater                  varchar(64)  DEFAULT ''                NULL,
    update_time              datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted                  bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_codegen_column.id IS '���';
COMMENT ON COLUMN infra_codegen_column.table_id IS '����';
COMMENT ON COLUMN infra_codegen_column.column_name IS '�ֶ���';
COMMENT ON COLUMN infra_codegen_column.data_type IS '�ֶ�����';
COMMENT ON COLUMN infra_codegen_column.column_comment IS '�ֶ�����';
COMMENT ON COLUMN infra_codegen_column.nullable IS '�Ƿ�����Ϊ��';
COMMENT ON COLUMN infra_codegen_column.primary_key IS '�Ƿ�����';
COMMENT ON COLUMN infra_codegen_column.ordinal_position IS '����';
COMMENT ON COLUMN infra_codegen_column.java_type IS 'Java ��������';
COMMENT ON COLUMN infra_codegen_column.java_field IS 'Java ������';
COMMENT ON COLUMN infra_codegen_column.dict_type IS '�ֵ�����';
COMMENT ON COLUMN infra_codegen_column.example IS '����ʾ��';
COMMENT ON COLUMN infra_codegen_column.create_operation IS '�Ƿ�Ϊ Create �����������ֶ�';
COMMENT ON COLUMN infra_codegen_column.update_operation IS '�Ƿ�Ϊ Update ���²������ֶ�';
COMMENT ON COLUMN infra_codegen_column.list_operation IS '�Ƿ�Ϊ List ��ѯ�������ֶ�';
COMMENT ON COLUMN infra_codegen_column.list_operation_condition IS 'List ��ѯ��������������';
COMMENT ON COLUMN infra_codegen_column.list_operation_result IS '�Ƿ�Ϊ List ��ѯ�����ķ����ֶ�';
COMMENT ON COLUMN infra_codegen_column.html_type IS '��ʾ����';
COMMENT ON COLUMN infra_codegen_column.creator IS '������';
COMMENT ON COLUMN infra_codegen_column.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_codegen_column.updater IS '������';
COMMENT ON COLUMN infra_codegen_column.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_codegen_column.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_codegen_column IS '�������ɱ��ֶζ���';

-- ----------------------------
-- Table structure for infra_codegen_table
-- ----------------------------
CREATE TABLE infra_codegen_table
(
    id                    bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    data_source_config_id bigint                                 NOT NULL,
    scene                 smallint     DEFAULT 1                 NOT NULL,
    table_name            varchar(200) DEFAULT ''                NULL,
    table_comment         varchar(500) DEFAULT ''                NULL,
    remark                varchar(500) DEFAULT NULL              NULL,
    module_name           varchar(30)                            NOT NULL,
    business_name         varchar(30)                            NOT NULL,
    class_name            varchar(100) DEFAULT ''                NULL,
    class_comment         varchar(50)                            NOT NULL,
    author                varchar(50)                            NOT NULL,
    template_type         smallint     DEFAULT 1                 NOT NULL,
    front_type            smallint                               NOT NULL,
    parent_menu_id        bigint       DEFAULT NULL              NULL,
    master_table_id       bigint       DEFAULT NULL              NULL,
    sub_join_column_id    bigint       DEFAULT NULL              NULL,
    sub_join_many         bit          DEFAULT NULL              NULL,
    tree_parent_column_id bigint       DEFAULT NULL              NULL,
    tree_name_column_id   bigint       DEFAULT NULL              NULL,
    creator               varchar(64)  DEFAULT ''                NULL,
    create_time           datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater               varchar(64)  DEFAULT ''                NULL,
    update_time           datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted               bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_codegen_table.id IS '���';
COMMENT ON COLUMN infra_codegen_table.data_source_config_id IS '����Դ���õı��';
COMMENT ON COLUMN infra_codegen_table.scene IS '���ɳ���';
COMMENT ON COLUMN infra_codegen_table.table_name IS '������';
COMMENT ON COLUMN infra_codegen_table.table_comment IS '������';
COMMENT ON COLUMN infra_codegen_table.remark IS '��ע';
COMMENT ON COLUMN infra_codegen_table.module_name IS 'ģ����';
COMMENT ON COLUMN infra_codegen_table.business_name IS 'ҵ����';
COMMENT ON COLUMN infra_codegen_table.class_name IS '������';
COMMENT ON COLUMN infra_codegen_table.class_comment IS '������';
COMMENT ON COLUMN infra_codegen_table.author IS '����';
COMMENT ON COLUMN infra_codegen_table.template_type IS 'ģ������';
COMMENT ON COLUMN infra_codegen_table.front_type IS 'ǰ������';
COMMENT ON COLUMN infra_codegen_table.parent_menu_id IS '���˵����';
COMMENT ON COLUMN infra_codegen_table.master_table_id IS '����ı��';
COMMENT ON COLUMN infra_codegen_table.sub_join_column_id IS '�ӱ����������ֶα��';
COMMENT ON COLUMN infra_codegen_table.sub_join_many IS '�������ӱ��Ƿ�һ�Զ�';
COMMENT ON COLUMN infra_codegen_table.tree_parent_column_id IS '����ĸ��ֶα��';
COMMENT ON COLUMN infra_codegen_table.tree_name_column_id IS '����������ֶα��';
COMMENT ON COLUMN infra_codegen_table.creator IS '������';
COMMENT ON COLUMN infra_codegen_table.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_codegen_table.updater IS '������';
COMMENT ON COLUMN infra_codegen_table.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_codegen_table.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_codegen_table IS '�������ɱ���';

-- ----------------------------
-- Table structure for infra_config
-- ----------------------------
CREATE TABLE infra_config
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    category    varchar(50)                            NOT NULL,
    type        smallint                               NOT NULL,
    name        varchar(100) DEFAULT ''                NULL,
    config_key  varchar(100) DEFAULT ''                NULL,
    value       varchar(500) DEFAULT ''                NULL,
    visible     bit                                    NOT NULL,
    remark      varchar(500) DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_config.id IS '��������';
COMMENT ON COLUMN infra_config.category IS '��������';
COMMENT ON COLUMN infra_config.type IS '��������';
COMMENT ON COLUMN infra_config.name IS '��������';
COMMENT ON COLUMN infra_config.config_key IS '��������';
COMMENT ON COLUMN infra_config.value IS '������ֵ';
COMMENT ON COLUMN infra_config.visible IS '�Ƿ�ɼ�';
COMMENT ON COLUMN infra_config.remark IS '��ע';
COMMENT ON COLUMN infra_config.creator IS '������';
COMMENT ON COLUMN infra_config.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_config.updater IS '������';
COMMENT ON COLUMN infra_config.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_config.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_config IS '�������ñ�';

-- ----------------------------
-- Records of infra_config
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT infra_config ON;
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (2, 'biz', 1, '�û�����-�˺ų�ʼ����', 'sys.user.init-password', '123456', '0', '��ʼ������ 123456', 'admin', '2021-01-05 17:03:48', '1', '2024-04-03 17:22:28', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (7, 'url', 2, 'MySQL ��صĵ�ַ', 'url.druid', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:33:38', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (8, 'url', 2, 'SkyWalking ��صĵ�ַ', 'url.skywalking', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:57:03', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (9, 'url', 2, 'Spring Boot Admin ��صĵ�ַ', 'url.spring-boot-admin', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:52:07', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (10, 'url', 2, 'Swagger �ӿ��ĵ��ĵ�ַ', 'url.swagger', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:59:00', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (11, 'ui', 2, '��Ѷ��ͼ key', 'tencent.lbs.key', 'TVDBZ-TDILD-4ON4B-PFDZA-RNLKH-VVF6E', '1', '��Ѷ��ͼ key', '1', '2023-06-03 19:16:27', '1', '2023-06-03 19:16:27', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (12, 'test2', 2, 'test3', 'test4', 'test5', '1', 'test6', '1', '2023-12-03 09:55:16', '1', '2023-12-03 09:55:27', '0');
COMMIT;
SET IDENTITY_INSERT infra_config OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for infra_data_source_config
-- ----------------------------
CREATE TABLE infra_data_source_config
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(100) DEFAULT ''                NULL,
    url         varchar(1024)                          NOT NULL,
    username    varchar(255)                           NOT NULL,
    password    varchar(255) DEFAULT ''                NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_data_source_config.id IS '�������';
COMMENT ON COLUMN infra_data_source_config.name IS '��������';
COMMENT ON COLUMN infra_data_source_config.url IS '����Դ����';
COMMENT ON COLUMN infra_data_source_config.username IS '�û���';
COMMENT ON COLUMN infra_data_source_config.password IS '����';
COMMENT ON COLUMN infra_data_source_config.creator IS '������';
COMMENT ON COLUMN infra_data_source_config.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_data_source_config.updater IS '������';
COMMENT ON COLUMN infra_data_source_config.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_data_source_config.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_data_source_config IS '����Դ���ñ�';

-- ----------------------------
-- Table structure for infra_file
-- ----------------------------
CREATE TABLE infra_file
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    config_id   bigint       DEFAULT NULL              NULL,
    name        varchar(256) DEFAULT NULL              NULL,
    path        varchar(512)                           NOT NULL,
    url         varchar(1024)                          NOT NULL,
    type        varchar(128) DEFAULT NULL              NULL,
    size        int                                    NOT NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_file.id IS '�ļ����';
COMMENT ON COLUMN infra_file.config_id IS '���ñ��';
COMMENT ON COLUMN infra_file.name IS '�ļ���';
COMMENT ON COLUMN infra_file.path IS '�ļ�·��';
COMMENT ON COLUMN infra_file.url IS '�ļ� URL';
COMMENT ON COLUMN infra_file.type IS '�ļ�����';
COMMENT ON COLUMN infra_file.size IS '�ļ���С';
COMMENT ON COLUMN infra_file.creator IS '������';
COMMENT ON COLUMN infra_file.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_file.updater IS '������';
COMMENT ON COLUMN infra_file.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_file.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_file IS '�ļ���';

-- ----------------------------
-- Table structure for infra_file_config
-- ----------------------------
CREATE TABLE infra_file_config
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(63)                            NOT NULL,
    storage     smallint                               NOT NULL,
    remark      varchar(255) DEFAULT NULL              NULL,
    master      bit                                    NOT NULL,
    config      varchar(4096)                          NOT NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_file_config.id IS '���';
COMMENT ON COLUMN infra_file_config.name IS '������';
COMMENT ON COLUMN infra_file_config.storage IS '�洢��';
COMMENT ON COLUMN infra_file_config.remark IS '��ע';
COMMENT ON COLUMN infra_file_config.master IS '�Ƿ�Ϊ������';
COMMENT ON COLUMN infra_file_config.config IS '�洢����';
COMMENT ON COLUMN infra_file_config.creator IS '������';
COMMENT ON COLUMN infra_file_config.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_file_config.updater IS '������';
COMMENT ON COLUMN infra_file_config.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_file_config.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_file_config IS '�ļ����ñ�';

-- ----------------------------
-- Records of infra_file_config
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT infra_file_config ON;
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (4, '���ݿ�', 1, '�������ݿ�', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.db.DBFileClientConfig","domain":"http://127.0.0.1:28000"}', '1', '2022-03-15 23:56:24', '1', '2024-02-28 22:54:07', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (22, '��ţ�洢��', 20, '', '1', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"s3.cn-south-1.qiniucs.com","domain":"http://test.yudao.iocoder.cn","bucket":"ruoyi-vue-pro","accessKey":"3TvrJ70gl2Gt6IBe7_IZT1F6i_k0iMuRtyEv4EyS","accessSecret":"wd0tbVBYlp0S-ihA8Qg2hPLncoP83wyrIq24OZuY"}', '1', '2024-01-13 22:11:12', '1', '2024-04-03 19:38:34', '0');
COMMIT;
SET IDENTITY_INSERT infra_file_config OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for infra_file_content
-- ----------------------------
CREATE TABLE infra_file_content
(
    id          bigint                                NOT NULL PRIMARY KEY IDENTITY,
    config_id   bigint                                NOT NULL,
    path        varchar(512)                          NOT NULL,
    content     varchar(10240)                        NOT NULL,
    creator     varchar(64) DEFAULT ''                NULL,
    create_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64) DEFAULT ''                NULL,
    update_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit         DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_file_content.id IS '���';
COMMENT ON COLUMN infra_file_content.config_id IS '���ñ��';
COMMENT ON COLUMN infra_file_content.path IS '�ļ�·��';
COMMENT ON COLUMN infra_file_content.content IS '�ļ�����';
COMMENT ON COLUMN infra_file_content.creator IS '������';
COMMENT ON COLUMN infra_file_content.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_file_content.updater IS '������';
COMMENT ON COLUMN infra_file_content.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_file_content.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_file_content IS '�ļ���';

-- ----------------------------
-- Table structure for infra_job
-- ----------------------------
CREATE TABLE infra_job
(
    id              bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name            varchar(32)                            NOT NULL,
    status          smallint                               NOT NULL,
    handler_name    varchar(64)                            NOT NULL,
    handler_param   varchar(255) DEFAULT NULL              NULL,
    cron_expression varchar(32)                            NOT NULL,
    retry_count     int          DEFAULT 0                 NOT NULL,
    retry_interval  int          DEFAULT 0                 NOT NULL,
    monitor_timeout int          DEFAULT 0                 NOT NULL,
    creator         varchar(64)  DEFAULT ''                NULL,
    create_time     datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater         varchar(64)  DEFAULT ''                NULL,
    update_time     datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted         bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_job.id IS '������';
COMMENT ON COLUMN infra_job.name IS '��������';
COMMENT ON COLUMN infra_job.status IS '����״̬';
COMMENT ON COLUMN infra_job.handler_name IS '������������';
COMMENT ON COLUMN infra_job.handler_param IS '�������Ĳ���';
COMMENT ON COLUMN infra_job.cron_expression IS 'CRON ���ʽ';
COMMENT ON COLUMN infra_job.retry_count IS '���Դ���';
COMMENT ON COLUMN infra_job.retry_interval IS '���Լ��';
COMMENT ON COLUMN infra_job.monitor_timeout IS '��س�ʱʱ��';
COMMENT ON COLUMN infra_job.creator IS '������';
COMMENT ON COLUMN infra_job.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_job.updater IS '������';
COMMENT ON COLUMN infra_job.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_job.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_job IS '��ʱ�����';

-- ----------------------------
-- Records of infra_job
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT infra_job ON;
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (5, '֧��֪ͨ Job', 2, 'payNotifyJob', NULL, '* * * * * ?', 0, 0, 0, '1', '2021-10-27 08:34:42', '1', '2023-07-09 20:51:41', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (17, '֧������ͬ�� Job', 2, 'payOrderSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 14:36:26', '1', '2023-07-22 15:39:08', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (18, '֧���������� Job', 2, 'payOrderExpireJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 15:36:23', '1', '2023-07-22 15:39:54', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (19, '�˿����ͬ�� Job', 2, 'payRefundSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-23 21:03:44', '1', '2023-07-23 21:09:00', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (21, '���׶������Զ����� Job', 2, 'tradeOrderAutoCancelJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-25 23:43:26', '1', '2023-09-26 19:23:30', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (22, '���׶������Զ��ջ� Job', 2, 'tradeOrderAutoReceiveJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-26 19:23:53', '1', '2023-09-26 23:38:08', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (23, '���׶������Զ����� Job', 2, 'tradeOrderAutoCommentJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-26 23:38:29', '1', '2023-09-27 11:03:10', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (24, 'Ӷ��ⶳ Job', 2, 'brokerageRecordUnfreezeJob', '', '0 * * * * ?', 3, 0, 0, '1', '2023-09-28 22:01:46', '1', '2023-09-28 22:01:56', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (25, '������־���� Job', 2, 'accessLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 10:59:41', '1', '2023-10-03 11:01:10', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (26, '������־���� Job', 2, 'errorLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:00:43', '1', '2023-10-03 11:01:12', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (27, '������־���� Job', 2, 'jobLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:01:33', '1', '2023-10-03 11:01:42', '0');
COMMIT;
SET IDENTITY_INSERT infra_job OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for infra_job_log
-- ----------------------------
CREATE TABLE infra_job_log
(
    id            bigint                                  NOT NULL PRIMARY KEY IDENTITY,
    job_id        bigint                                  NOT NULL,
    handler_name  varchar(64)                             NOT NULL,
    handler_param varchar(255)  DEFAULT NULL              NULL,
    execute_index smallint      DEFAULT 1                 NOT NULL,
    begin_time    datetime                                NOT NULL,
    end_time      datetime      DEFAULT NULL              NULL,
    duration      int           DEFAULT NULL              NULL,
    status        smallint                                NOT NULL,
    result        varchar(4000) DEFAULT ''                NULL,
    creator       varchar(64)   DEFAULT ''                NULL,
    create_time   datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater       varchar(64)   DEFAULT ''                NULL,
    update_time   datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted       bit           DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN infra_job_log.id IS '��־���';
COMMENT ON COLUMN infra_job_log.job_id IS '������';
COMMENT ON COLUMN infra_job_log.handler_name IS '������������';
COMMENT ON COLUMN infra_job_log.handler_param IS '�������Ĳ���';
COMMENT ON COLUMN infra_job_log.execute_index IS '�ڼ���ִ��';
COMMENT ON COLUMN infra_job_log.begin_time IS '��ʼִ��ʱ��';
COMMENT ON COLUMN infra_job_log.end_time IS '����ִ��ʱ��';
COMMENT ON COLUMN infra_job_log.duration IS 'ִ��ʱ��';
COMMENT ON COLUMN infra_job_log.status IS '����״̬';
COMMENT ON COLUMN infra_job_log.result IS '�������';
COMMENT ON COLUMN infra_job_log.creator IS '������';
COMMENT ON COLUMN infra_job_log.create_time IS '����ʱ��';
COMMENT ON COLUMN infra_job_log.updater IS '������';
COMMENT ON COLUMN infra_job_log.update_time IS '����ʱ��';
COMMENT ON COLUMN infra_job_log.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE infra_job_log IS '��ʱ������־��';

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
CREATE TABLE system_dept
(
    id             bigint                                NOT NULL PRIMARY KEY IDENTITY,
    name           varchar(30) DEFAULT ''                NULL,
    parent_id      bigint      DEFAULT 0                 NOT NULL,
    sort           int         DEFAULT 0                 NOT NULL,
    leader_user_id bigint      DEFAULT NULL              NULL,
    phone          varchar(11) DEFAULT NULL              NULL,
    email          varchar(50) DEFAULT NULL              NULL,
    status         smallint                              NOT NULL,
    creator        varchar(64) DEFAULT ''                NULL,
    create_time    datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater        varchar(64) DEFAULT ''                NULL,
    update_time    datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted        bit         DEFAULT '0'               NOT NULL,
    tenant_id      bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_dept.id IS '����id';
COMMENT ON COLUMN system_dept.name IS '��������';
COMMENT ON COLUMN system_dept.parent_id IS '������id';
COMMENT ON COLUMN system_dept.sort IS '��ʾ˳��';
COMMENT ON COLUMN system_dept.leader_user_id IS '������';
COMMENT ON COLUMN system_dept.phone IS '��ϵ�绰';
COMMENT ON COLUMN system_dept.email IS '����';
COMMENT ON COLUMN system_dept.status IS '����״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_dept.creator IS '������';
COMMENT ON COLUMN system_dept.create_time IS '����ʱ��';
COMMENT ON COLUMN system_dept.updater IS '������';
COMMENT ON COLUMN system_dept.update_time IS '����ʱ��';
COMMENT ON COLUMN system_dept.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_dept.tenant_id IS '�⻧���';
COMMENT ON TABLE system_dept IS '���ű�';

-- ----------------------------
-- Records of system_dept
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_dept ON;
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, '���Դ��', 0, 0, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2023-11-14 23:30:36', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (101, '�����ܹ�˾', 100, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2023-12-02 09:53:35', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (102, '��ɳ�ֹ�˾', 100, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:40', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, '�з�����', 101, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2024-03-24 20:56:04', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, '�г�����', 101, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:38', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (105, '���Բ���', 101, 3, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:15', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (106, '������', 101, 4, 103, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-15 21:32:22', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, '��ά����', 101, 5, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2023-12-02 09:28:22', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, '�г�����', 102, 1, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-02-16 08:35:45', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, '������', 102, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:29', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, '�²���', 0, 1, NULL, NULL, NULL, 0, '110', '2022-02-23 20:46:30', '110', '2022-02-23 20:46:30', '0', 121);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, '��������', 0, 1, NULL, NULL, NULL, 0, '113', '2022-03-07 21:44:50', '113', '2022-03-07 21:44:50', '0', 122);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, '��Ʒ����', 101, 100, 1, NULL, NULL, 1, '1', '2023-12-02 09:45:13', '1', '2023-12-02 09:45:31', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, '֧�ֲ���', 102, 3, 104, NULL, NULL, 1, '1', '2023-12-02 09:47:38', '1', '2023-12-02 09:47:38', '0', 1);
COMMIT;
SET IDENTITY_INSERT system_dept OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
CREATE TABLE system_dict_data
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    sort        int          DEFAULT 0                 NOT NULL,
    label       varchar(100) DEFAULT ''                NULL,
    value       varchar(100) DEFAULT ''                NULL,
    dict_type   varchar(100) DEFAULT ''                NULL,
    status      smallint     DEFAULT 0                 NOT NULL,
    color_type  varchar(100) DEFAULT ''                NULL,
    css_class   varchar(100) DEFAULT ''                NULL,
    remark      varchar(500) DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_dict_data.id IS '�ֵ����';
COMMENT ON COLUMN system_dict_data.sort IS '�ֵ�����';
COMMENT ON COLUMN system_dict_data.label IS '�ֵ��ǩ';
COMMENT ON COLUMN system_dict_data.value IS '�ֵ��ֵ';
COMMENT ON COLUMN system_dict_data.dict_type IS '�ֵ�����';
COMMENT ON COLUMN system_dict_data.status IS '״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_dict_data.color_type IS '��ɫ����';
COMMENT ON COLUMN system_dict_data.css_class IS 'css ��ʽ';
COMMENT ON COLUMN system_dict_data.remark IS '��ע';
COMMENT ON COLUMN system_dict_data.creator IS '������';
COMMENT ON COLUMN system_dict_data.create_time IS '����ʱ��';
COMMENT ON COLUMN system_dict_data.updater IS '������';
COMMENT ON COLUMN system_dict_data.update_time IS '����ʱ��';
COMMENT ON COLUMN system_dict_data.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_dict_data IS '�ֵ����ݱ�';

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_dict_data ON;
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1, 1, '��', '1', 'system_user_sex', 0, 'default', 'A', '�Ա���', 'admin', '2021-01-05 17:03:48', '1', '2022-03-29 00:14:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (2, 2, 'Ů', '2', 'system_user_sex', 0, 'success', '', '�Ա�Ů', 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 23:30:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (8, 1, '����', '1', 'infra_job_status', 0, 'success', '', '����״̬', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (9, 2, '��ͣ', '2', 'infra_job_status', 0, 'danger', '', 'ͣ��״̬', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (12, 1, 'ϵͳ����', '1', 'infra_config_type', 0, 'danger', '', '�������� - ϵͳ����', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (13, 2, '�Զ���', '2', 'infra_config_type', 0, 'primary', '', '�������� - �Զ���', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (14, 1, '֪ͨ', '1', 'system_notice_type', 0, 'success', '', '֪ͨ', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:05:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (15, 2, '����', '2', 'system_notice_type', 0, 'info', '', '����', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:06:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (16, 0, '����', '0', 'infra_operate_type', 0, 'default', '', '��������', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (17, 1, '��ѯ', '1', 'infra_operate_type', 0, 'info', '', '��ѯ����', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (18, 2, '����', '2', 'infra_operate_type', 0, 'primary', '', '��������', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (19, 3, '�޸�', '3', 'infra_operate_type', 0, 'warning', '', '�޸Ĳ���', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (20, 4, 'ɾ��', '4', 'infra_operate_type', 0, 'danger', '', 'ɾ������', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (22, 5, '����', '5', 'infra_operate_type', 0, 'default', '', '��������', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (23, 6, '����', '6', 'infra_operate_type', 0, 'default', '', '�������', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (27, 1, '����', '0', 'common_status', 0, 'primary', '', '����״̬', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (28, 2, '�ر�', '1', 'common_status', 0, 'info', '', '�ر�״̬', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (29, 1, 'Ŀ¼', '1', 'system_menu_type', 0, '', '', 'Ŀ¼', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (30, 2, '�˵�', '2', 'system_menu_type', 0, '', '', '�˵�', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (31, 3, '��ť', '3', 'system_menu_type', 0, '', '', '��ť', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (32, 1, '����', '1', 'system_role_type', 0, 'danger', '', '���ý�ɫ', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (33, 2, '�Զ���', '2', 'system_role_type', 0, 'primary', '', '�Զ����ɫ', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (34, 1, 'ȫ������Ȩ��', '1', 'system_data_scope', 0, '', '', 'ȫ������Ȩ��', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (35, 2, 'ָ����������Ȩ��', '2', 'system_data_scope', 0, '', '', 'ָ����������Ȩ��', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (36, 3, '����������Ȩ��', '3', 'system_data_scope', 0, '', '', '����������Ȩ��', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (37, 4, '�����ż���������Ȩ��', '4', 'system_data_scope', 0, '', '', '�����ż���������Ȩ��', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (38, 5, '����������Ȩ��', '5', 'system_data_scope', 0, '', '', '����������Ȩ��', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (39, 0, '�ɹ�', '0', 'system_login_result', 0, 'success', '', '��½��� - �ɹ�', '', '2021-01-18 06:17:36', '1', '2022-02-16 13:23:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (40, 10, '�˺Ż����벻��ȷ', '10', 'system_login_result', 0, 'primary', '', '��½��� - �˺Ż����벻��ȷ', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:27', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (41, 20, '�û�������', '20', 'system_login_result', 0, 'warning', '', '��½��� - �û�������', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:23:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (42, 30, '��֤�벻����', '30', 'system_login_result', 0, 'info', '', '��½��� - ��֤�벻����', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (43, 31, '��֤�벻��ȷ', '31', 'system_login_result', 0, 'info', '', '��½��� - ��֤�벻��ȷ', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (44, 100, 'δ֪�쳣', '100', 'system_login_result', 0, 'danger', '', '��½��� - δ֪�쳣', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (45, 1, '��', 'true', 'infra_boolean_string', 0, 'danger', '', 'Boolean �Ƿ����� - ��', '', '2021-01-19 03:20:55', '1', '2022-03-15 23:01:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (46, 1, '��', 'false', 'infra_boolean_string', 0, 'info', '', 'Boolean �Ƿ����� - ��', '', '2021-01-19 03:20:55', '1', '2022-03-15 23:09:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (50, 1, '������ɾ�Ĳ飩', '1', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:09:06', '', '2022-03-10 16:33:15', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (51, 2, '������ɾ�Ĳ飩', '2', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:14:46', '', '2022-03-10 16:33:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (53, 0, '��ʼ����', '0', 'infra_job_status', 0, 'primary', '', NULL, '', '2021-02-07 07:46:49', '1', '2022-02-16 19:33:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (57, 0, '������', '0', 'infra_job_log_status', 0, 'primary', '', 'RUNNING', '', '2021-02-08 10:04:24', '1', '2022-02-16 19:07:48', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (58, 1, '�ɹ�', '1', 'infra_job_log_status', 0, 'success', '', NULL, '', '2021-02-08 10:06:57', '1', '2022-02-16 19:07:52', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (59, 2, 'ʧ��', '2', 'infra_job_log_status', 0, 'warning', '', 'ʧ��', '', '2021-02-08 10:07:38', '1', '2022-02-16 19:07:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (60, 1, '��Ա', '1', 'user_type', 0, 'primary', '', NULL, '', '2021-02-26 00:16:27', '1', '2022-02-16 10:22:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (61, 2, '����Ա', '2', 'user_type', 0, 'success', '', NULL, '', '2021-02-26 00:16:34', '1', '2022-02-16 10:22:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (62, 0, 'δ����', '0', 'infra_api_error_log_process_status', 0, 'primary', '', NULL, '', '2021-02-26 07:07:19', '1', '2022-02-16 20:14:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (63, 1, '�Ѵ���', '1', 'infra_api_error_log_process_status', 0, 'success', '', NULL, '', '2021-02-26 07:07:26', '1', '2022-02-16 20:14:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (64, 2, '�Ѻ���', '2', 'infra_api_error_log_process_status', 0, 'danger', '', NULL, '', '2021-02-26 07:07:34', '1', '2022-02-16 20:14:14', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (66, 2, '������', 'ALIYUN', 'system_sms_channel_code', 0, 'primary', '', NULL, '1', '2021-04-05 01:05:26', '1', '2022-02-16 10:09:52', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (67, 1, '��֤��', '1', 'system_sms_template_type', 0, 'warning', '', NULL, '1', '2021-04-05 21:50:57', '1', '2022-02-16 12:48:30', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (68, 2, '֪ͨ', '2', 'system_sms_template_type', 0, 'primary', '', NULL, '1', '2021-04-05 21:51:08', '1', '2022-02-16 12:48:27', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (69, 0, 'Ӫ��', '3', 'system_sms_template_type', 0, 'danger', '', NULL, '1', '2021-04-05 21:51:15', '1', '2022-02-16 12:48:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (70, 0, '��ʼ��', '0', 'system_sms_send_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:18:33', '1', '2022-02-16 10:26:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (71, 1, '���ͳɹ�', '10', 'system_sms_send_status', 0, 'success', '', NULL, '1', '2021-04-11 20:18:43', '1', '2022-02-16 10:25:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (72, 2, '����ʧ��', '20', 'system_sms_send_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:18:49', '1', '2022-02-16 10:26:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (73, 3, '������', '30', 'system_sms_send_status', 0, 'info', '', NULL, '1', '2021-04-11 20:19:44', '1', '2022-02-16 10:26:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (74, 0, '�ȴ����', '0', 'system_sms_receive_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:27:43', '1', '2022-02-16 10:28:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (75, 1, '���ճɹ�', '10', 'system_sms_receive_status', 0, 'success', '', NULL, '1', '2021-04-11 20:29:25', '1', '2022-02-16 10:28:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (76, 2, '����ʧ��', '20', 'system_sms_receive_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:29:31', '1', '2022-02-16 10:28:32', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (77, 0, '����(����)', 'DEBUG_DING_TALK', 'system_sms_channel_code', 0, 'info', '', NULL, '1', '2021-04-13 00:20:37', '1', '2022-02-16 10:10:00', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (80, 100, '�˺ŵ�¼', '100', 'system_login_type', 0, 'primary', '', '�˺ŵ�¼', '1', '2021-10-06 00:52:02', '1', '2022-02-16 13:11:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (81, 101, '�罻��¼', '101', 'system_login_type', 0, 'info', '', '�罻��¼', '1', '2021-10-06 00:52:17', '1', '2022-02-16 13:11:40', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (83, 200, '�����ǳ�', '200', 'system_login_type', 0, 'primary', '', '�����ǳ�', '1', '2021-10-06 00:52:58', '1', '2022-02-16 13:11:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (85, 202, 'ǿ�Ƶǳ�', '202', 'system_login_type', 0, 'danger', '', 'ǿ���˳�', '1', '2021-10-06 00:53:41', '1', '2022-02-16 13:11:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (86, 0, '����', '1', 'bpm_oa_leave_type', 0, 'primary', '', NULL, '1', '2021-09-21 22:35:28', '1', '2022-02-16 10:00:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (87, 1, '�¼�', '2', 'bpm_oa_leave_type', 0, 'info', '', NULL, '1', '2021-09-21 22:36:11', '1', '2022-02-16 10:00:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (88, 2, '���', '3', 'bpm_oa_leave_type', 0, 'warning', '', NULL, '1', '2021-09-21 22:36:38', '1', '2022-02-16 10:00:53', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (113, 1, '΢�Ź��ں�֧��', 'wx_pub', 'pay_channel_code', 0, 'success', '', '΢�Ź��ں�֧��', '1', '2021-12-03 10:40:24', '1', '2023-07-19 20:08:47', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (114, 2, '΢��С����֧��', 'wx_lite', 'pay_channel_code', 0, 'success', '', '΢��С����֧��', '1', '2021-12-03 10:41:06', '1', '2023-07-19 20:08:50', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (115, 3, '΢�� App ֧��', 'wx_app', 'pay_channel_code', 0, 'success', '', '΢�� App ֧��', '1', '2021-12-03 10:41:20', '1', '2023-07-19 20:08:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (116, 10, '֧���� PC ��վ֧��', 'alipay_pc', 'pay_channel_code', 0, 'primary', '', '֧���� PC ��վ֧��', '1', '2021-12-03 10:42:09', '1', '2023-07-19 20:09:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (117, 11, '֧���� Wap ��վ֧��', 'alipay_wap', 'pay_channel_code', 0, 'primary', '', '֧���� Wap ��վ֧��', '1', '2021-12-03 10:42:26', '1', '2023-07-19 20:09:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (118, 12, '֧���� App ֧��', 'alipay_app', 'pay_channel_code', 0, 'primary', '', '֧���� App ֧��', '1', '2021-12-03 10:42:55', '1', '2023-07-19 20:09:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (119, 14, '֧����ɨ��֧��', 'alipay_qr', 'pay_channel_code', 0, 'primary', '', '֧����ɨ��֧��', '1', '2021-12-03 10:43:10', '1', '2023-07-19 20:09:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (120, 10, '֪ͨ�ɹ�', '10', 'pay_notify_status', 0, 'success', '', '֪ͨ�ɹ�', '1', '2021-12-03 11:02:41', '1', '2023-07-19 10:08:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (121, 20, '֪ͨʧ��', '20', 'pay_notify_status', 0, 'danger', '', '֪ͨʧ��', '1', '2021-12-03 11:02:59', '1', '2023-07-19 10:08:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (122, 0, '�ȴ�֪ͨ', '0', 'pay_notify_status', 0, 'info', '', 'δ֪ͨ', '1', '2021-12-03 11:03:10', '1', '2023-07-19 10:08:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (123, 10, '֧���ɹ�', '10', 'pay_order_status', 0, 'success', '', '֧���ɹ�', '1', '2021-12-03 11:18:29', '1', '2023-07-19 18:04:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (124, 30, '֧���ر�', '30', 'pay_order_status', 0, 'info', '', '֧���ر�', '1', '2021-12-03 11:18:42', '1', '2023-07-19 18:05:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (125, 0, '�ȴ�֧��', '0', 'pay_order_status', 0, 'info', '', 'δ֧��', '1', '2021-12-03 11:18:18', '1', '2023-07-19 18:04:15', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (600, 5, '��ҳ', '1', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (601, 4, '��ɱ�ҳ', '2', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (602, 3, '���ۻҳ', '3', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (603, 2, '��ʱ�ۿ�ҳ', '4', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (604, 1, '������ҳ', '5', 'promotion_banner_position', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1118, 0, '�ȴ��˿�', '0', 'pay_refund_status', 0, 'info', '', '�ȴ��˿�', '1', '2021-12-10 16:44:59', '1', '2023-07-19 10:14:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1119, 20, '�˿�ʧ��', '20', 'pay_refund_status', 0, 'danger', '', '�˿�ʧ��', '1', '2021-12-10 16:45:10', '1', '2023-07-19 10:15:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1124, 10, '�˿�ɹ�', '10', 'pay_refund_status', 0, 'success', '', '�˿�ɹ�', '1', '2021-12-10 16:46:26', '1', '2023-07-19 10:15:00', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1127, 1, '������', '1', 'bpm_process_instance_status', 0, 'default', '', '����ʵ����״̬ - ������', '1', '2022-01-07 23:47:22', '1', '2024-03-16 16:11:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1128, 2, '����ͨ��', '2', 'bpm_process_instance_status', 0, 'success', '', '����ʵ����״̬ - �����', '1', '2022-01-07 23:47:49', '1', '2024-03-16 16:11:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1129, 1, '������', '1', 'bpm_task_status', 0, 'primary', '', '����ʵ���Ľ�� - ������', '1', '2022-01-07 23:48:32', '1', '2024-03-08 22:41:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1130, 2, '����ͨ��', '2', 'bpm_task_status', 0, 'success', '', '����ʵ���Ľ�� - ͨ��', '1', '2022-01-07 23:48:45', '1', '2024-03-08 22:41:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1131, 3, '������ͨ��', '3', 'bpm_task_status', 0, 'danger', '', '����ʵ���Ľ�� - ��ͨ��', '1', '2022-01-07 23:48:55', '1', '2024-03-08 22:41:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1132, 4, '��ȡ��', '4', 'bpm_task_status', 0, 'info', '', '����ʵ���Ľ�� - ����', '1', '2022-01-07 23:49:06', '1', '2024-03-08 22:41:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1133, 10, '���̱�', '10', 'bpm_model_form_type', 0, '', '', '���̵ı����� - ���̱�', '103', '2022-01-11 23:51:30', '103', '2022-01-11 23:51:30', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1134, 20, 'ҵ���', '20', 'bpm_model_form_type', 0, '', '', '���̵ı����� - ҵ���', '103', '2022-01-11 23:51:47', '103', '2022-01-11 23:51:47', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1135, 10, '��ɫ', '10', 'bpm_task_candidate_strategy', 0, 'info', '', '��������������� - ��ɫ', '103', '2022-01-12 23:21:22', '1', '2024-03-06 02:53:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1136, 20, '���ŵĳ�Ա', '20', 'bpm_task_candidate_strategy', 0, 'primary', '', '��������������� - ���ŵĳ�Ա', '103', '2022-01-12 23:21:47', '1', '2024-03-06 02:53:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1137, 21, '���ŵĸ�����', '21', 'bpm_task_candidate_strategy', 0, 'primary', '', '��������������� - ���ŵĸ�����', '103', '2022-01-12 23:33:36', '1', '2024-03-06 02:53:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1138, 30, '�û�', '30', 'bpm_task_candidate_strategy', 0, 'info', '', '��������������� - �û�', '103', '2022-01-12 23:34:02', '1', '2024-03-06 02:53:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1139, 40, '�û���', '40', 'bpm_task_candidate_strategy', 0, 'warning', '', '��������������� - �û���', '103', '2022-01-12 23:34:21', '1', '2024-03-06 02:53:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1140, 60, '���̱��ʽ', '60', 'bpm_task_candidate_strategy', 0, 'danger', '', '��������������� - ���̱��ʽ', '103', '2022-01-12 23:34:43', '1', '2024-03-06 02:53:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1141, 22, '��λ', '22', 'bpm_task_candidate_strategy', 0, 'success', '', '��������������� - ��λ', '103', '2022-01-14 18:41:55', '1', '2024-03-06 02:53:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1145, 1, '�����̨', '1', 'infra_codegen_scene', 0, '', '', '�������ɵĳ���ö�� - �����̨', '1', '2022-02-02 13:15:06', '1', '2022-03-10 16:32:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1146, 2, '�û� APP', '2', 'infra_codegen_scene', 0, '', '', '�������ɵĳ���ö�� - �û� APP', '1', '2022-02-02 13:15:19', '1', '2022-03-10 16:33:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1150, 1, '���ݿ�', '1', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:28', '1', '2022-03-15 00:25:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1151, 10, '���ش���', '10', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:41', '1', '2022-03-15 00:25:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1152, 11, 'FTP ������', '11', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:06', '1', '2022-03-15 00:26:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1153, 12, 'SFTP ������', '12', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:22', '1', '2022-03-15 00:26:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1154, 20, 'S3 ����洢', '20', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:31', '1', '2022-03-15 00:26:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1155, 103, '���ŵ�¼', '103', 'system_login_type', 0, 'default', '', NULL, '1', '2022-05-09 23:57:58', '1', '2022-05-09 23:58:09', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1156, 1, 'password', 'password', 'system_oauth2_grant_type', 0, 'default', '', '����ģʽ', '1', '2022-05-12 00:22:05', '1', '2022-05-11 16:26:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1157, 2, 'authorization_code', 'authorization_code', 'system_oauth2_grant_type', 0, 'primary', '', '��Ȩ��ģʽ', '1', '2022-05-12 00:22:59', '1', '2022-05-11 16:26:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1158, 3, 'implicit', 'implicit', 'system_oauth2_grant_type', 0, 'success', '', '��ģʽ', '1', '2022-05-12 00:23:40', '1', '2022-05-11 16:26:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1159, 4, 'client_credentials', 'client_credentials', 'system_oauth2_grant_type', 0, 'default', '', '�ͻ���ģʽ', '1', '2022-05-12 00:23:51', '1', '2022-05-11 16:26:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1160, 5, 'refresh_token', 'refresh_token', 'system_oauth2_grant_type', 0, 'info', '', 'ˢ��ģʽ', '1', '2022-05-12 00:24:02', '1', '2022-05-11 16:26:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1162, 1, '������', '1', 'product_spu_status', 0, 'success', '', '��Ʒ SPU ״̬ - ������', '1', '2022-10-24 21:19:47', '1', '2022-10-24 21:20:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1163, 0, '�ֿ���', '0', 'product_spu_status', 0, 'info', '', '��Ʒ SPU ״̬ - �ֿ���', '1', '2022-10-24 21:20:54', '1', '2022-10-24 21:21:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1164, 0, '����վ', '-1', 'product_spu_status', 0, 'default', '', '��Ʒ SPU ״̬ - ����վ', '1', '2022-10-24 21:21:11', '1', '2022-10-24 21:21:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1165, 1, '����', '1', 'promotion_discount_type', 0, 'success', '', '�Ż����� - ����', '1', '2022-11-01 12:46:41', '1', '2022-11-01 12:50:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1166, 2, '�ۿ�', '2', 'promotion_discount_type', 0, 'primary', '', '�Ż����� - �ۿ�', '1', '2022-11-01 12:46:51', '1', '2022-11-01 12:50:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1167, 1, '�̶�����', '1', 'promotion_coupon_template_validity_type', 0, 'default', '', '�Ż݄�ģ������������� - �̶�����', '1', '2022-11-02 00:07:34', '1', '2022-11-04 00:07:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1168, 2, '��ȡ֮��', '2', 'promotion_coupon_template_validity_type', 0, 'default', '', '�Ż݄�ģ������������� - ��ȡ֮��', '1', '2022-11-02 00:07:54', '1', '2022-11-04 00:07:52', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1169, 1, 'ͨ�Ä�', '1', 'promotion_product_scope', 0, 'default', '', 'Ӫ������Ʒ��Χ - ȫ����Ʒ����', '1', '2022-11-02 00:28:22', '1', '2023-09-28 00:27:42', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1170, 2, '��Ʒ��', '2', 'promotion_product_scope', 0, 'default', '', 'Ӫ������Ʒ��Χ - ָ����Ʒ����', '1', '2022-11-02 00:28:34', '1', '2023-09-28 00:27:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1171, 1, 'δʹ��', '1', 'promotion_coupon_status', 0, 'primary', '', '�Ż݄���״̬ - ����ȡ', '1', '2022-11-04 00:15:08', '1', '2023-10-03 12:54:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1172, 2, '��ʹ��', '2', 'promotion_coupon_status', 0, 'success', '', '�Ż݄���״̬ - ��ʹ��', '1', '2022-11-04 00:15:21', '1', '2022-11-04 19:16:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1173, 3, '�ѹ���', '3', 'promotion_coupon_status', 0, 'info', '', '�Ż݄���״̬ - �ѹ���', '1', '2022-11-04 00:15:43', '1', '2022-11-04 19:16:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1174, 1, 'ֱ����ȡ', '1', 'promotion_coupon_take_type', 0, 'primary', '', '�Ż݄�����ȡ��ʽ - ֱ����ȡ', '1', '2022-11-04 19:13:00', '1', '2022-11-04 19:13:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1175, 2, 'ָ������', '2', 'promotion_coupon_take_type', 0, 'success', '', '�Ż݄�����ȡ��ʽ - ָ������', '1', '2022-11-04 19:13:13', '1', '2022-11-04 19:14:48', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1176, 10, 'δ��ʼ', '10', 'promotion_activity_status', 0, 'primary', '', '�������״̬ö�� - δ��ʼ', '1', '2022-11-04 22:54:49', '1', '2022-11-04 22:55:53', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1177, 20, '������', '20', 'promotion_activity_status', 0, 'success', '', '�������״̬ö�� - ������', '1', '2022-11-04 22:55:06', '1', '2022-11-04 22:55:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1178, 30, '�ѽ���', '30', 'promotion_activity_status', 0, 'info', '', '�������״̬ö�� - �ѽ���', '1', '2022-11-04 22:55:41', '1', '2022-11-04 22:55:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1179, 40, '�ѹر�', '40', 'promotion_activity_status', 0, 'warning', '', '�������״̬ö�� - �ѹر�', '1', '2022-11-04 22:56:10', '1', '2022-11-04 22:56:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1180, 10, '�� N Ԫ', '10', 'promotion_condition_type', 0, 'primary', '', 'Ӫ������������ - �� N Ԫ', '1', '2022-11-04 22:59:45', '1', '2022-11-04 22:59:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1181, 20, '�� N ��', '20', 'promotion_condition_type', 0, 'success', '', 'Ӫ������������ - �� N ��', '1', '2022-11-04 23:00:02', '1', '2022-11-04 23:00:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1182, 10, '�����ۺ�', '10', 'trade_after_sale_status', 0, 'primary', '', '�����ۺ�״̬ - �����ۺ�', '1', '2022-11-19 20:53:33', '1', '2022-11-19 20:54:42', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1183, 20, '��Ʒ���˻�', '20', 'trade_after_sale_status', 0, 'primary', '', '�����ۺ�״̬ - ��Ʒ���˻�', '1', '2022-11-19 20:54:36', '1', '2022-11-19 20:58:58', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1184, 30, '�̼Ҵ��ջ�', '30', 'trade_after_sale_status', 0, 'primary', '', '�����ۺ�״̬ - �̼Ҵ��ջ�', '1', '2022-11-19 20:56:56', '1', '2022-11-19 20:59:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1185, 40, '�ȴ��˿�', '40', 'trade_after_sale_status', 0, 'primary', '', '�����ۺ�״̬ - �ȴ��˿�', '1', '2022-11-19 20:59:54', '1', '2022-11-19 21:00:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1186, 50, '�˿�ɹ�', '50', 'trade_after_sale_status', 0, 'default', '', '�����ۺ�״̬ - �˿�ɹ�', '1', '2022-11-19 21:00:33', '1', '2022-11-19 21:00:33', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1187, 61, '���ȡ��', '61', 'trade_after_sale_status', 0, 'info', '', '�����ۺ�״̬ - ���ȡ��', '1', '2022-11-19 21:01:29', '1', '2022-11-19 21:01:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1188, 62, '�̼Ҿܾ�', '62', 'trade_after_sale_status', 0, 'info', '', '�����ۺ�״̬ - �̼Ҿܾ�', '1', '2022-11-19 21:02:17', '1', '2022-11-19 21:02:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1189, 63, '�̼Ҿ��ջ�', '63', 'trade_after_sale_status', 0, 'info', '', '�����ۺ�״̬ - �̼Ҿ��ջ�', '1', '2022-11-19 21:02:37', '1', '2022-11-19 21:03:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1190, 10, '�����˿�', '10', 'trade_after_sale_type', 0, 'success', '', '�����ۺ������ - �����˿�', '1', '2022-11-19 21:05:05', '1', '2022-11-19 21:38:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1191, 20, '�ۺ��˿�', '20', 'trade_after_sale_type', 0, 'primary', '', '�����ۺ������ - �ۺ��˿�', '1', '2022-11-19 21:05:32', '1', '2022-11-19 21:38:32', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1192, 10, '���˿�', '10', 'trade_after_sale_way', 0, 'primary', '', '�����ۺ�ķ�ʽ - ���˿�', '1', '2022-11-19 21:39:19', '1', '2022-11-19 21:39:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1193, 20, '�˻��˿�', '20', 'trade_after_sale_way', 0, 'success', '', '�����ۺ�ķ�ʽ - �˻��˿�', '1', '2022-11-19 21:39:38', '1', '2022-11-19 21:39:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1194, 10, '΢��С����', '10', 'terminal', 0, 'default', '', '�ն� - ΢��С����', '1', '2022-12-10 10:51:11', '1', '2022-12-10 10:51:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1195, 20, 'H5 ��ҳ', '20', 'terminal', 0, 'default', '', '�ն� - H5 ��ҳ', '1', '2022-12-10 10:51:30', '1', '2022-12-10 10:51:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1196, 11, '΢�Ź��ں�', '11', 'terminal', 0, 'default', '', '�ն� - ΢�Ź��ں�', '1', '2022-12-10 10:54:16', '1', '2022-12-10 10:52:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1197, 31, 'ƻ�� App', '31', 'terminal', 0, 'default', '', '�ն� - ƻ�� App', '1', '2022-12-10 10:54:42', '1', '2022-12-10 10:52:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1198, 32, '��׿ App', '32', 'terminal', 0, 'default', '', '�ն� - ��׿ App', '1', '2022-12-10 10:55:02', '1', '2022-12-10 10:59:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1199, 0, '��ͨ����', '0', 'trade_order_type', 0, 'default', '', '���׶��������� - ��ͨ����', '1', '2022-12-10 16:34:14', '1', '2022-12-10 16:34:14', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1200, 1, '��ɱ����', '1', 'trade_order_type', 0, 'default', '', '���׶��������� - ��ɱ����', '1', '2022-12-10 16:34:26', '1', '2022-12-10 16:34:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1201, 2, 'ƴ�Ŷ���', '2', 'trade_order_type', 0, 'default', '', '���׶��������� - ƴ�Ŷ���', '1', '2022-12-10 16:34:36', '1', '2022-12-10 16:34:36', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1202, 3, '���۶���', '3', 'trade_order_type', 0, 'default', '', '���׶��������� - ���۶���', '1', '2022-12-10 16:34:48', '1', '2022-12-10 16:34:48', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1203, 0, '��֧��', '0', 'trade_order_status', 0, 'default', '', '���׶���״̬ - ��֧��', '1', '2022-12-10 16:49:29', '1', '2022-12-10 16:49:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1204, 10, '������', '10', 'trade_order_status', 0, 'primary', '', '���׶���״̬ - ������', '1', '2022-12-10 16:49:53', '1', '2022-12-10 16:51:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1205, 20, '�ѷ���', '20', 'trade_order_status', 0, 'primary', '', '���׶���״̬ - �ѷ���', '1', '2022-12-10 16:50:13', '1', '2022-12-10 16:51:31', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1206, 30, '�����', '30', 'trade_order_status', 0, 'success', '', '���׶���״̬ - �����', '1', '2022-12-10 16:50:30', '1', '2022-12-10 16:51:06', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1207, 40, '��ȡ��', '40', 'trade_order_status', 0, 'danger', '', '���׶���״̬ - ��ȡ��', '1', '2022-12-10 16:50:50', '1', '2022-12-10 16:51:00', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1208, 0, 'δ�ۺ�', '0', 'trade_order_item_after_sale_status', 0, 'info', '', '���׶�������ۺ�״̬ - δ�ۺ�', '1', '2022-12-10 20:58:42', '1', '2022-12-10 20:59:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1209, 1, '�ۺ���', '1', 'trade_order_item_after_sale_status', 0, 'primary', '', '���׶�������ۺ�״̬ - �ۺ���', '1', '2022-12-10 20:59:21', '1', '2022-12-10 20:59:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1210, 2, '���˿�', '2', 'trade_order_item_after_sale_status', 0, 'success', '', '���׶�������ۺ�״̬ - ���˿�', '1', '2022-12-10 20:59:46', '1', '2022-12-10 20:59:46', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1211, 1, '��ȫƥ��', '1', 'mp_auto_reply_request_match', 0, 'primary', '', '���ں��Զ��ظ�������ؼ���ƥ��ģʽ - ��ȫƥ��', '1', '2023-01-16 23:30:39', '1', '2023-01-16 23:31:00', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1212, 2, '��ƥ��', '2', 'mp_auto_reply_request_match', 0, 'success', '', '���ں��Զ��ظ�������ؼ���ƥ��ģʽ - ��ƥ��', '1', '2023-01-16 23:30:55', '1', '2023-01-16 23:31:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1213, 1, '�ı�', 'text', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - �ı�', '1', '2023-01-17 22:17:32', '1', '2023-01-17 22:17:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1214, 2, 'ͼƬ', 'image', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - ͼƬ', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:19:47', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1215, 3, '����', 'voice', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - ����', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:20:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1216, 4, '��Ƶ', 'video', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - ��Ƶ', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:21:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1217, 5, 'С��Ƶ', 'shortvideo', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - С��Ƶ', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:19:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1218, 6, 'ͼ��', 'news', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - ͼ��', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:22:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1219, 7, '����', 'music', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - ����', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:22:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1220, 8, '����λ��', 'location', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - ����λ��', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:23:51', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1221, 9, '����', 'link', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - ����', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:24:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1222, 10, '�¼�', 'event', 'mp_message_type', 0, 'default', '', '���ںŵ���Ϣ���� - �¼�', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:24:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1223, 0, '��ʼ��', '0', 'system_mail_send_status', 0, 'primary', '', '�ʼ�����״̬ - ��ʼ��\n', '1', '2023-01-26 09:53:49', '1', '2023-01-26 16:36:14', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1224, 10, '���ͳɹ�', '10', 'system_mail_send_status', 0, 'success', '', '�ʼ�����״̬ - ���ͳɹ�', '1', '2023-01-26 09:54:28', '1', '2023-01-26 16:36:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1225, 20, '����ʧ��', '20', 'system_mail_send_status', 0, 'danger', '', '�ʼ�����״̬ - ����ʧ��', '1', '2023-01-26 09:54:50', '1', '2023-01-26 16:36:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1226, 30, '������', '30', 'system_mail_send_status', 0, 'info', '', '�ʼ�����״̬ -  ������', '1', '2023-01-26 09:55:06', '1', '2023-01-26 16:36:36', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1227, 1, '֪ͨ����', '1', 'system_notify_template_type', 0, 'primary', '', 'վ����ģ������� - ֪ͨ����', '1', '2023-01-28 10:35:59', '1', '2023-01-28 10:35:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1228, 2, 'ϵͳ��Ϣ', '2', 'system_notify_template_type', 0, 'success', '', 'վ����ģ������� - ϵͳ��Ϣ', '1', '2023-01-28 10:36:20', '1', '2023-01-28 10:36:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1230, 13, '֧��������֧��', 'alipay_bar', 'pay_channel_code', 0, 'primary', '', '֧��������֧��', '1', '2023-02-18 23:32:24', '1', '2023-07-19 20:09:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1231, 10, 'Vue2 Element UI ��׼ģ��', '10', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:03:55', '1', '2023-04-13 00:03:55', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1232, 20, 'Vue3 Element Plus ��׼ģ��', '20', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:08', '1', '2023-04-13 00:04:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1233, 21, 'Vue3 Element Plus Schema ģ��', '21', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:26', '1', '2023-04-13 00:04:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1234, 30, 'Vue3 vben ģ��', '30', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:26', '1', '2023-04-13 00:04:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1244, 0, '����', '1', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:46:40', '1', '2023-05-21 22:46:40', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1245, 1, '������', '2', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:46:58', '1', '2023-05-21 22:46:58', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1246, 2, '�����', '3', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:47:18', '1', '2023-05-21 22:47:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1335, 11, '�������ֵֿ�', '11', 'member_point_biz_type', 0, '', '', '', '1', '2023-06-10 12:15:27', '1', '2023-10-11 07:41:43', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1336, 1, 'ǩ��', '1', 'member_point_biz_type', 0, '', '', '', '1', '2023-06-10 12:15:48', '1', '2023-08-20 11:59:53', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1341, 20, '���˿�', '20', 'pay_order_status', 0, 'danger', '', '���˿�', '1', '2023-07-19 18:05:37', '1', '2023-07-19 18:05:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1342, 21, '����ɹ������ǽ��ʧ��', '21', 'pay_notify_status', 0, 'warning', '', '����ɹ������ǽ��ʧ��', '1', '2023-07-19 18:10:47', '1', '2023-07-19 18:11:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1343, 22, '����ʧ��', '22', 'pay_notify_status', 0, 'warning', '', NULL, '1', '2023-07-19 18:11:05', '1', '2023-07-19 18:11:27', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1344, 4, '΢��ɨ��֧��', 'wx_native', 'pay_channel_code', 0, 'success', '', '΢��ɨ��֧��', '1', '2023-07-19 20:07:47', '1', '2023-07-19 20:09:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1345, 5, '΢������֧��', 'wx_bar', 'pay_channel_code', 0, 'success', '', '΢������֧��\n', '1', '2023-07-19 20:08:06', '1', '2023-07-19 20:09:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1346, 1, '֧����', '1', 'pay_notify_type', 0, 'primary', '', '֧����', '1', '2023-07-20 12:23:17', '1', '2023-07-20 12:23:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1347, 2, '�˿', '2', 'pay_notify_type', 0, 'danger', '', NULL, '1', '2023-07-20 12:23:26', '1', '2023-07-20 12:23:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1348, 20, 'ģ��֧��', 'mock', 'pay_channel_code', 0, 'default', '', 'ģ��֧��', '1', '2023-07-29 11:10:51', '1', '2023-07-29 03:14:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1349, 12, '�������ֵֿۣ�����ȡ����', '12', 'member_point_biz_type', 0, '', '', '', '1', '2023-08-20 12:00:03', '1', '2023-10-11 07:42:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1350, 0, '����Ա����', '0', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1351, 1, '���½���', '1', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1352, 11, '�µ�����', '11', 'member_experience_biz_type', 0, 'success', '', NULL, '', '2023-08-22 12:41:01', '1', '2023-10-11 07:45:09', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1353, 12, '�µ�����������ȡ����', '12', 'member_experience_biz_type', 0, 'warning', '', NULL, '', '2023-08-22 12:41:01', '1', '2023-10-11 07:45:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1354, 4, 'ǩ������', '4', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1355, 5, '�齱����', '5', 'member_experience_biz_type', 0, '', '', NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1356, 1, '��ݷ���', '1', 'trade_delivery_type', 0, '', '', '', '1', '2023-08-23 00:04:55', '1', '2023-08-23 00:04:55', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1357, 2, '�û�����', '2', 'trade_delivery_type', 0, '', '', '', '1', '2023-08-23 00:05:05', '1', '2023-08-23 00:05:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1358, 3, 'Ʒ����', '3', 'promotion_product_scope', 0, 'default', '', '', '1', '2023-09-01 23:43:07', '1', '2023-09-28 00:27:47', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1359, 1, '���˷���', '1', 'brokerage_enabled_condition', 0, '', '', '�����û������Է���', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1360, 2, 'ָ������', '2', 'brokerage_enabled_condition', 0, '', '', '���ɺ�̨�ֶ������ƹ�Ա', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1361, 1, '�״ΰ�', '1', 'brokerage_bind_mode', 0, '', '', 'ֻҪ�û�û���ƹ��ˣ���ʱ�����԰��ƹ��ϵ', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1362, 2, 'ע���', '2', 'brokerage_bind_mode', 0, '', '', '�����û�ע��ʱ���ܰ��ƹ��ϵ', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1363, 3, '���ǰ�', '3', 'brokerage_bind_mode', 0, '', '', '����û��Ѿ����ƹ��ˣ��ƹ��˻ᱻ���', '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1364, 1, 'Ǯ��', '1', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1365, 2, '���п�', '2', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1366, 3, '΢��', '3', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1367, 4, '֧����', '4', 'brokerage_withdraw_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1368, 1, '������Ӷ', '1', 'brokerage_record_biz_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1369, 2, '��������', '2', 'brokerage_record_biz_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1370, 3, '�������ֲ���', '3', 'brokerage_record_biz_type', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1371, 0, '������', '0', 'brokerage_record_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1372, 1, '�ѽ���', '1', 'brokerage_record_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1373, 2, '��ȡ��', '2', 'brokerage_record_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1374, 0, '�����', '0', 'brokerage_withdraw_status', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1375, 10, '���ͨ��', '10', 'brokerage_withdraw_status', 0, 'success', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1376, 11, '���ֳɹ�', '11', 'brokerage_withdraw_status', 0, 'success', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1377, 20, '��˲�ͨ��', '20', 'brokerage_withdraw_status', 0, 'danger', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1378, 21, '����ʧ��', '21', 'brokerage_withdraw_status', 0, 'danger', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1379, 0, '��������', '0', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1380, 1, '��������', '1', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1381, 2, 'ũҵ����', '2', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1382, 3, '�й�����', '3', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1383, 4, '��ͨ����', '4', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1384, 5, '��������', '5', 'brokerage_bank_name', 0, '', '', NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1385, 21, 'Ǯ��', 'wallet', 'pay_channel_code', 0, 'primary', '', '', '1', '2023-10-01 21:46:19', '1', '2023-10-01 21:48:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1386, 1, '������', '1', 'promotion_bargain_record_status', 0, 'default', '', '', '1', '2023-10-05 10:41:26', '1', '2023-10-05 10:41:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1387, 2, '���۳ɹ�', '2', 'promotion_bargain_record_status', 0, 'success', '', '', '1', '2023-10-05 10:41:39', '1', '2023-10-05 10:41:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1388, 3, '����ʧ��', '3', 'promotion_bargain_record_status', 0, 'warning', '', '', '1', '2023-10-05 10:41:57', '1', '2023-10-05 10:41:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1389, 1, 'ƴ����', '1', 'promotion_combination_record_status', 0, '', '', '', '1', '2023-10-08 07:24:44', '1', '2023-10-08 07:24:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1390, 2, 'ƴ�ųɹ�', '2', 'promotion_combination_record_status', 0, 'success', '', '', '1', '2023-10-08 07:24:56', '1', '2023-10-08 07:24:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1391, 3, 'ƴ��ʧ��', '3', 'promotion_combination_record_status', 0, 'warning', '', '', '1', '2023-10-08 07:25:11', '1', '2023-10-08 07:25:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1392, 2, '����Ա�޸�', '2', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:41:34', '1', '2023-10-11 07:41:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1393, 13, '�������ֵֿۣ������˿', '13', 'member_point_biz_type', 0, '', '', '', '1', '2023-10-11 07:42:29', '1', '2023-10-11 07:42:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1394, 21, '�������ֽ���', '21', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:42:44', '1', '2023-10-11 07:42:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1395, 22, '�������ֽ���������ȡ����', '22', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:42:55', '1', '2023-10-11 07:43:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1396, 23, '�������ֽ����������˿', '23', 'member_point_biz_type', 0, 'default', '', '', '1', '2023-10-11 07:43:16', '1', '2023-10-11 07:43:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1397, 13, '�µ������������˿', '13', 'member_experience_biz_type', 0, 'warning', '', '', '1', '2023-10-11 07:45:24', '1', '2023-10-11 07:45:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1398, 5, '����ת��', '5', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:24', '1', '2023-10-18 21:55:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1399, 6, '֧����', '6', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:38', '1', '2023-10-18 21:55:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1400, 7, '΢��֧��', '7', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:53', '1', '2023-10-18 21:55:53', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1401, 8, '����', '8', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:56:06', '1', '2023-10-18 21:56:06', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1402, 1, 'IT', '1', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:15', '1', '2024-02-18 23:30:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1403, 2, '����ҵ', '2', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:29', '1', '2024-02-18 23:30:43', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1404, 3, '���ز�', '3', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:41', '1', '2024-02-18 23:30:48', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1405, 4, '��ҵ����', '4', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:02:54', '1', '2024-02-18 23:30:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1406, 5, '����/����', '5', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:03', '1', '2024-02-18 23:31:00', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1407, 6, '����', '6', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:13', '1', '2024-02-18 23:31:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1408, 7, '����', '7', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:27', '1', '2024-02-18 23:31:13', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1409, 8, '�Ļ���ý', '8', 'crm_customer_industry', 0, 'default', '', '', '1', '2023-10-28 23:03:37', '1', '2024-02-18 23:31:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1422, 1, 'A ���ص�ͻ���', '1', 'crm_customer_level', 0, 'primary', '', '', '1', '2023-10-28 23:07:13', '1', '2023-10-28 23:07:13', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1423, 2, 'B ����ͨ�ͻ���', '2', 'crm_customer_level', 0, 'info', '', '', '1', '2023-10-28 23:07:35', '1', '2023-10-28 23:07:35', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1424, 3, 'C �������ȿͻ���', '3', 'crm_customer_level', 0, 'default', '', '', '1', '2023-10-28 23:07:53', '1', '2023-10-28 23:07:53', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1425, 1, '����', '1', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:29', '1', '2023-10-28 23:08:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1426, 2, '��������', '2', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:39', '1', '2023-10-28 23:08:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1427, 3, '���', '3', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:47', '1', '2023-10-28 23:08:47', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1428, 4, 'ת����', '4', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:08:58', '1', '2023-10-28 23:08:58', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1429, 5, '����ע��', '5', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:09:12', '1', '2023-10-28 23:09:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1430, 6, '������ѯ', '6', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:09:22', '1', '2023-10-28 23:09:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1431, 7, 'ԤԼ����', '7', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:09:39', '1', '2023-10-28 23:09:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1432, 8, 'İ��', '8', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:10:04', '1', '2023-10-28 23:10:04', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1433, 9, '�绰��ѯ', '9', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:10:18', '1', '2023-10-28 23:10:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1434, 10, '�ʼ���ѯ', '10', 'crm_customer_source', 0, 'default', '', '', '1', '2023-10-28 23:10:33', '1', '2023-10-28 23:10:33', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1435, 10, 'Gitee', '10', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:42', '1', '2023-11-04 13:04:42', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1436, 20, '����', '20', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:54', '1', '2023-11-04 13:04:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1437, 30, '��ҵ΢��', '30', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:09', '1', '2023-11-04 13:05:09', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1438, 31, '΢�Ź���ƽ̨', '31', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:18', '1', '2023-11-04 13:05:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1439, 32, '΢�ſ���ƽ̨', '32', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:30', '1', '2023-11-04 13:05:30', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1440, 34, '΢��С����', '34', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:38', '1', '2023-11-04 13:07:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1441, 1, '�ϼ�', '1', 'crm_product_status', 0, 'success', '', '', '1', '2023-10-30 21:49:34', '1', '2023-10-30 21:49:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1442, 0, '�¼�', '0', 'crm_product_status', 0, 'success', '', '', '1', '2023-10-30 21:49:13', '1', '2023-10-30 21:49:13', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1443, 15, '�ӱ�', '15', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-13 23:06:16', '1', '2023-11-13 23:06:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1444, 10, '������׼ģʽ��', '10', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:32:49', '1', '2023-11-14 12:32:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1445, 11, '����ERP ģʽ��', '11', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:33:05', '1', '2023-11-14 12:33:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1446, 12, '������Ƕģʽ��', '12', 'infra_codegen_template_type', 0, '', '', '', '1', '2023-11-14 12:33:31', '1', '2023-11-14 12:33:31', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1447, 1, '������', '1', 'crm_permission_level', 0, 'default', '', '', '1', '2023-11-30 09:53:12', '1', '2023-11-30 09:53:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1448, 2, 'ֻ��', '2', 'crm_permission_level', 0, '', '', '', '1', '2023-11-30 09:53:29', '1', '2023-11-30 09:53:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1449, 3, '��д', '3', 'crm_permission_level', 0, '', '', '', '1', '2023-11-30 09:53:36', '1', '2023-11-30 09:53:36', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1450, 0, 'δ�ύ', '0', 'crm_audit_status', 0, '', '', '', '1', '2023-11-30 18:56:59', '1', '2023-11-30 18:56:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1451, 10, '������', '10', 'crm_audit_status', 0, '', '', '', '1', '2023-11-30 18:57:10', '1', '2023-11-30 18:57:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1452, 20, '���ͨ��', '20', 'crm_audit_status', 0, '', '', '', '1', '2023-11-30 18:57:24', '1', '2023-11-30 18:57:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1453, 30, '��˲�ͨ��', '30', 'crm_audit_status', 0, '', '', '', '1', '2023-11-30 18:57:32', '1', '2023-11-30 18:57:32', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1454, 40, '��ȡ��', '40', 'crm_audit_status', 0, '', '', '', '1', '2023-11-30 18:57:42', '1', '2023-11-30 18:57:42', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1456, 1, '֧Ʊ', '1', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:54:29', '1', '2023-10-18 21:54:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1457, 2, '�ֽ�', '2', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:54:41', '1', '2023-10-18 21:54:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1458, 3, '�������', '3', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:54:53', '1', '2023-10-18 21:54:53', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1459, 4, '���', '4', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:07', '1', '2023-10-18 21:55:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1460, 5, '����ת��', '5', 'crm_receivable_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:24', '1', '2023-10-18 21:55:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1461, 1, '��', '1', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:02:26', '1', '2023-12-05 23:02:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1462, 2, '��', '2', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:02:34', '1', '2023-12-05 23:02:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1463, 3, 'ֻ', '3', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:02:57', '1', '2023-12-05 23:02:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1464, 4, '��', '4', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:03:05', '1', '2023-12-05 23:03:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1465, 5, 'ö', '5', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:03:14', '1', '2023-12-05 23:03:14', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1466, 6, 'ƿ', '6', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:03:20', '1', '2023-12-05 23:03:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1467, 7, '��', '7', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:03:30', '1', '2023-12-05 23:03:30', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1468, 8, '̨', '8', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:03:41', '1', '2023-12-05 23:03:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1469, 9, '��', '9', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:03:48', '1', '2023-12-05 23:03:48', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1470, 10, 'ǧ��', '10', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:04:03', '1', '2023-12-05 23:04:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1471, 11, '��', '11', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:04:12', '1', '2023-12-05 23:04:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1472, 12, '��', '12', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:04:25', '1', '2023-12-05 23:04:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1473, 13, '��', '13', 'crm_product_unit', 0, '', '', '', '1', '2023-12-05 23:04:34', '1', '2023-12-05 23:04:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1474, 1, '��绰', '1', 'crm_follow_up_type', 0, '', '', '', '1', '2024-01-15 20:48:20', '1', '2024-01-15 20:48:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1475, 2, '������', '2', 'crm_follow_up_type', 0, '', '', '', '1', '2024-01-15 20:48:31', '1', '2024-01-15 20:48:31', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1476, 3, '���Űݷ�', '3', 'crm_follow_up_type', 0, '', '', '', '1', '2024-01-15 20:49:07', '1', '2024-01-15 20:49:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1477, 4, '΢�Ź�ͨ', '4', 'crm_follow_up_type', 0, '', '', '', '1', '2024-01-15 20:49:15', '1', '2024-01-15 20:49:15', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1478, 4, 'Ǯ�����', '4', 'pay_transfer_type', 0, 'info', '', '', '1', '2023-10-28 16:28:37', '1', '2023-10-28 16:28:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1479, 3, '���п�', '3', 'pay_transfer_type', 0, 'default', '', '', '1', '2023-10-28 16:28:21', '1', '2023-10-28 16:28:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1480, 2, '΢�����', '2', 'pay_transfer_type', 0, 'info', '', '', '1', '2023-10-28 16:28:07', '1', '2023-10-28 16:28:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1481, 1, '֧�������', '1', 'pay_transfer_type', 0, 'default', '', '', '1', '2023-10-28 16:27:44', '1', '2023-10-28 16:27:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1482, 4, 'ת��ʧ��', '30', 'pay_transfer_status', 0, 'warning', '', '', '1', '2023-10-28 16:24:16', '1', '2023-10-28 16:24:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1483, 3, 'ת�˳ɹ�', '20', 'pay_transfer_status', 0, 'success', '', '', '1', '2023-10-28 16:23:50', '1', '2023-10-28 16:23:50', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1484, 2, 'ת�˽�����', '10', 'pay_transfer_status', 0, 'info', '', '', '1', '2023-10-28 16:23:12', '1', '2023-10-28 16:23:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1485, 1, '�ȴ�ת��', '0', 'pay_transfer_status', 0, 'default', '', '', '1', '2023-10-28 16:21:43', '1', '2023-10-28 16:23:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1486, 10, '�������', '10', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-05 18:07:25', '1', '2024-02-05 18:07:43', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1487, 11, '������⣨���ϣ�', '11', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-05 18:08:07', '1', '2024-02-05 19:20:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1488, 20, '��������', '20', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-05 18:08:51', '1', '2024-02-05 18:08:51', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1489, 21, '�������⣨���ϣ�', '21', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-05 18:09:00', '1', '2024-02-05 19:20:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1490, 10, 'δ���', '10', 'erp_audit_status', 0, 'default', '', '', '1', '2024-02-06 00:00:21', '1', '2024-02-06 00:00:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1491, 20, '�����', '20', 'erp_audit_status', 0, 'success', '', '', '1', '2024-02-06 00:00:35', '1', '2024-02-06 00:00:35', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1492, 30, '�������', '30', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-07 20:34:19', '1', '2024-02-07 12:36:31', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1493, 31, '������⣨���ϣ�', '31', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-07 20:34:29', '1', '2024-02-07 20:37:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1494, 32, '��������', '32', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-07 20:34:38', '1', '2024-02-07 12:36:33', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1495, 33, '�������⣨���ϣ�', '33', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-07 20:34:49', '1', '2024-02-07 20:37:06', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1496, 40, '��ӯ���', '40', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-08 08:53:00', '1', '2024-02-08 08:53:09', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1497, 41, '��ӯ��⣨���ϣ�', '41', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-08 08:53:39', '1', '2024-02-16 19:40:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1498, 42, '�̿�����', '42', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-08 08:54:16', '1', '2024-02-08 08:54:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1499, 43, '�̿����⣨���ϣ�', '43', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-08 08:54:31', '1', '2024-02-16 19:40:46', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1500, 50, '���۳���', '50', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-11 21:47:25', '1', '2024-02-11 21:50:40', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1501, 51, '���۳��⣨���ϣ�', '51', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-11 21:47:37', '1', '2024-02-11 21:51:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1502, 60, '�����˻����', '60', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-12 06:51:05', '1', '2024-02-12 06:51:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1503, 61, '�����˻���⣨���ϣ�', '61', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-12 06:51:18', '1', '2024-02-12 06:51:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1504, 70, '�ɹ����', '70', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-16 13:10:02', '1', '2024-02-16 13:10:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1505, 71, '�ɹ���⣨���ϣ�', '71', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-16 13:10:10', '1', '2024-02-16 19:40:40', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1506, 80, '�ɹ��˻�����', '80', 'erp_stock_record_biz_type', 0, '', '', '', '1', '2024-02-16 13:10:17', '1', '2024-02-16 13:10:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1507, 81, '�ɹ��˻����⣨���ϣ�', '81', 'erp_stock_record_biz_type', 0, 'danger', '', '', '1', '2024-02-16 13:10:26', '1', '2024-02-16 19:40:33', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1509, 3, '������ͨ��', '3', 'bpm_process_instance_status', 0, 'danger', '', '', '1', '2024-03-16 16:12:06', '1', '2024-03-16 16:12:06', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1510, 4, '��ȡ��', '4', 'bpm_process_instance_status', 0, 'warning', '', '', '1', '2024-03-16 16:12:22', '1', '2024-03-16 16:12:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1511, 5, '���˻�', '5', 'bpm_task_status', 0, 'warning', '', '', '1', '2024-03-16 19:10:46', '1', '2024-03-08 22:41:40', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1512, 6, 'ί����', '6', 'bpm_task_status', 0, 'primary', '', '', '1', '2024-03-17 10:06:22', '1', '2024-03-08 22:41:40', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1513, 7, '����ͨ����', '7', 'bpm_task_status', 0, 'success', '', '', '1', '2024-03-17 10:06:47', '1', '2024-03-08 22:41:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1514, 0, '������', '0', 'bpm_task_status', 0, 'info', '', '', '1', '2024-03-17 10:07:11', '1', '2024-03-08 22:41:42', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1515, 35, '��������ѡ', '35', 'bpm_task_candidate_strategy', 0, '', '', '', '1', '2024-03-22 19:45:16', '1', '2024-03-22 19:45:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1516, 1, 'ִ�м�����', 'execution', 'bpm_process_listener_type', 0, 'primary', '', '', '1', '2024-03-23 12:54:03', '1', '2024-03-23 19:14:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1517, 1, '���������', 'task', 'bpm_process_listener_type', 0, 'success', '', '', '1', '2024-03-23 12:54:13', '1', '2024-03-23 19:14:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1526, 1, 'Java ��', 'class', 'bpm_process_listener_value_type', 0, 'primary', '', '', '1', '2024-03-23 15:08:45', '1', '2024-03-23 19:14:32', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1527, 2, '���ʽ', 'expression', 'bpm_process_listener_value_type', 0, 'success', '', '', '1', '2024-03-23 15:09:06', '1', '2024-03-23 19:14:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1528, 3, '������ʽ', 'delegateExpression', 'bpm_process_listener_value_type', 0, 'info', '', '', '1', '2024-03-23 15:11:23', '1', '2024-03-23 19:14:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1529, 1, '��', '1', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:26', '1', '2024-03-29 22:50:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1530, 2, '��', '2', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:36', '1', '2024-03-29 22:50:36', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1531, 3, '��', '3', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:46', '1', '2024-03-29 22:50:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1532, 4, '����', '4', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:51:01', '1', '2024-03-29 22:51:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1533, 5, '��', '5', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:51:07', '1', '2024-03-29 22:51:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1534, 1, 'Ӯ��', '1', 'crm_business_end_status_type', 0, 'success', '', '', '1', '2024-04-13 23:26:57', '1', '2024-04-13 23:26:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1535, 2, '�䵥', '2', 'crm_business_end_status_type', 0, 'primary', '', '', '1', '2024-04-13 23:27:31', '1', '2024-04-13 23:27:31', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1536, 3, '��Ч', '3', 'crm_business_end_status_type', 0, 'info', '', '', '1', '2024-04-13 23:27:59', '1', '2024-04-13 23:27:59', '0');
COMMIT;
SET IDENTITY_INSERT system_dict_data OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
CREATE TABLE system_dict_type
(
    id           bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name         varchar(100) DEFAULT ''                NULL,
    type         varchar(100) DEFAULT ''                NULL,
    status       smallint     DEFAULT 0                 NOT NULL,
    remark       varchar(500) DEFAULT NULL              NULL,
    creator      varchar(64)  DEFAULT ''                NULL,
    create_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater      varchar(64)  DEFAULT ''                NULL,
    update_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted      bit          DEFAULT '0'               NOT NULL,
    deleted_time datetime     DEFAULT NULL              NULL
);

COMMENT ON COLUMN system_dict_type.id IS '�ֵ�����';
COMMENT ON COLUMN system_dict_type.name IS '�ֵ�����';
COMMENT ON COLUMN system_dict_type.type IS '�ֵ�����';
COMMENT ON COLUMN system_dict_type.status IS '״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_dict_type.remark IS '��ע';
COMMENT ON COLUMN system_dict_type.creator IS '������';
COMMENT ON COLUMN system_dict_type.create_time IS '����ʱ��';
COMMENT ON COLUMN system_dict_type.updater IS '������';
COMMENT ON COLUMN system_dict_type.update_time IS '����ʱ��';
COMMENT ON COLUMN system_dict_type.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_dict_type.deleted_time IS 'ɾ��ʱ��';
COMMENT ON TABLE system_dict_type IS '�ֵ����ͱ�';

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_dict_type ON;
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (1, '�û��Ա�', 'system_user_sex', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2022-05-16 20:29:32', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (6, '��������', 'infra_config_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:36:54', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (7, '֪ͨ����', 'system_notice_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:35:26', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (9, '��������', 'infra_operate_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:01', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (10, 'ϵͳ״̬', 'common_status', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:21:28', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (11, 'Boolean �Ƿ�����', 'infra_boolean_string', 0, 'boolean ת�Ƿ�', '', '2021-01-19 03:20:08', '', '2022-02-01 16:37:10', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (104, '��½���', 'system_login_result', 0, '��½���', '', '2021-01-18 06:17:11', '', '2022-02-01 16:36:00', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (106, '��������ģ������', 'infra_codegen_template_type', 0, NULL, '', '2021-02-05 07:08:06', '1', '2022-05-16 20:26:50', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (107, '��ʱ����״̬', 'infra_job_status', 0, NULL, '', '2021-02-07 07:44:16', '', '2022-02-01 16:51:11', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (108, '��ʱ������־״̬', 'infra_job_log_status', 0, NULL, '', '2021-02-08 10:03:51', '', '2022-02-01 16:50:43', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (109, '�û�����', 'user_type', 0, NULL, '', '2021-02-26 00:15:51', '', '2021-02-26 00:15:51', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (110, 'API �쳣���ݵĴ���״̬', 'infra_api_error_log_process_status', 0, NULL, '', '2021-02-26 07:07:01', '', '2022-02-01 16:50:53', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (111, '������������', 'system_sms_channel_code', 0, NULL, '1', '2021-04-05 01:04:50', '1', '2022-02-16 02:09:08', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (112, '����ģ�������', 'system_sms_template_type', 0, NULL, '1', '2021-04-05 21:50:43', '1', '2022-02-01 16:35:06', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (113, '���ŷ���״̬', 'system_sms_send_status', 0, NULL, '1', '2021-04-11 20:18:03', '1', '2022-02-01 16:35:09', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (114, '���Ž���״̬', 'system_sms_receive_status', 0, NULL, '1', '2021-04-11 20:27:14', '1', '2022-02-01 16:35:14', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (116, '��½��־������', 'system_login_type', 0, '��½��־������', '1', '2021-10-06 00:50:46', '1', '2022-02-01 16:35:56', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (117, 'OA �������', 'bpm_oa_leave_type', 0, NULL, '1', '2021-09-21 22:34:33', '1', '2022-01-22 10:41:37', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (130, '֧��������������', 'pay_channel_code', 0, '֧�������ı���', '1', '2021-12-03 10:35:08', '1', '2023-07-10 10:11:39', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (131, '֧���ص�״̬', 'pay_notify_status', 0, '֧���ص�״̬�������˿�ص���', '1', '2021-12-03 10:53:29', '1', '2023-07-19 18:09:43', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (132, '֧������״̬', 'pay_order_status', 0, '֧������״̬', '1', '2021-12-03 11:17:50', '1', '2021-12-03 11:17:50', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (134, '�˿��״̬', 'pay_refund_status', 0, '�˿��״̬', '1', '2021-12-10 16:42:50', '1', '2023-07-19 10:13:17', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (139, '����ʵ����״̬', 'bpm_process_instance_status', 0, '����ʵ����״̬', '1', '2022-01-07 23:46:42', '1', '2022-01-07 23:46:42', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (140, '����ʵ���Ľ��', 'bpm_task_status', 0, '����ʵ���Ľ��', '1', '2022-01-07 23:48:10', '1', '2024-03-08 22:42:03', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (141, '���̵ı�����', 'bpm_model_form_type', 0, '���̵ı�����', '103', '2022-01-11 23:50:45', '103', '2022-01-11 23:50:45', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (142, '���������������', 'bpm_task_candidate_strategy', 0, 'BPM ����ĺ�ѡ�˵Ĳ���', '103', '2022-01-12 23:21:04', '103', '2024-03-06 02:53:59', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (144, '�������ɵĳ���ö��', 'infra_codegen_scene', 0, '�������ɵĳ���ö��', '1', '2022-02-02 13:14:45', '1', '2022-03-10 16:33:46', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (145, '��ɫ����', 'system_role_type', 0, '��ɫ����', '1', '2022-02-16 13:01:46', '1', '2022-02-16 13:01:46', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (146, '�ļ��洢��', 'infra_file_storage', 0, '�ļ��洢��', '1', '2022-03-15 00:24:38', '1', '2022-03-15 00:24:38', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (147, 'OAuth 2.0 ��Ȩ����', 'system_oauth2_grant_type', 0, 'OAuth 2.0 ��Ȩ���ͣ�ģʽ��', '1', '2022-05-12 00:20:52', '1', '2022-05-11 16:25:49', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (149, '��Ʒ SPU ״̬', 'product_spu_status', 0, '��Ʒ SPU ״̬', '1', '2022-10-24 21:19:04', '1', '2022-10-24 21:19:08', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (150, '�Ż�����', 'promotion_discount_type', 0, '�Ż�����', '1', '2022-11-01 12:46:06', '1', '2022-11-01 12:46:06', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (151, '�Ż݄�ģ�������������', 'promotion_coupon_template_validity_type', 0, '�Ż݄�ģ�������������', '1', '2022-11-02 00:06:20', '1', '2022-11-04 00:08:26', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (152, 'Ӫ������Ʒ��Χ', 'promotion_product_scope', 0, 'Ӫ������Ʒ��Χ', '1', '2022-11-02 00:28:01', '1', '2022-11-02 00:28:01', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (153, '�Ż݄���״̬', 'promotion_coupon_status', 0, '�Ż݄���״̬', '1', '2022-11-04 00:14:49', '1', '2022-11-04 00:14:49', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (154, '�Ż݄�����ȡ��ʽ', 'promotion_coupon_take_type', 0, '�Ż݄�����ȡ��ʽ', '1', '2022-11-04 19:12:27', '1', '2022-11-04 19:12:27', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (155, '�������״̬', 'promotion_activity_status', 0, '�������״̬', '1', '2022-11-04 22:54:23', '1', '2022-11-04 22:54:23', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (156, 'Ӫ������������', 'promotion_condition_type', 0, 'Ӫ������������', '1', '2022-11-04 22:59:23', '1', '2022-11-04 22:59:23', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (157, '�����ۺ�״̬', 'trade_after_sale_status', 0, '�����ۺ�״̬', '1', '2022-11-19 20:52:56', '1', '2022-11-19 20:52:56', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (158, '�����ۺ������', 'trade_after_sale_type', 0, '�����ۺ������', '1', '2022-11-19 21:04:09', '1', '2022-11-19 21:04:09', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (159, '�����ۺ�ķ�ʽ', 'trade_after_sale_way', 0, '�����ۺ�ķ�ʽ', '1', '2022-11-19 21:39:04', '1', '2022-11-19 21:39:04', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (160, '�ն�', 'terminal', 0, '�ն�', '1', '2022-12-10 10:50:50', '1', '2022-12-10 10:53:11', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (161, '���׶���������', 'trade_order_type', 0, '���׶���������', '1', '2022-12-10 16:33:54', '1', '2022-12-10 16:33:54', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (162, '���׶�����״̬', 'trade_order_status', 0, '���׶�����״̬', '1', '2022-12-10 16:48:44', '1', '2022-12-10 16:48:44', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (163, '���׶�������ۺ�״̬', 'trade_order_item_after_sale_status', 0, '���׶�������ۺ�״̬', '1', '2022-12-10 20:58:08', '1', '2022-12-10 20:58:08', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (164, '���ں��Զ��ظ�������ؼ���ƥ��ģʽ', 'mp_auto_reply_request_match', 0, '���ں��Զ��ظ�������ؼ���ƥ��ģʽ', '1', '2023-01-16 23:29:56', '1', '2023-01-16 23:29:56', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (165, '���ںŵ���Ϣ����', 'mp_message_type', 0, '���ںŵ���Ϣ����', '1', '2023-01-17 22:17:09', '1', '2023-01-17 22:17:09', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (166, '�ʼ�����״̬', 'system_mail_send_status', 0, '�ʼ�����״̬', '1', '2023-01-26 09:53:13', '1', '2023-01-26 09:53:13', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (167, 'վ����ģ�������', 'system_notify_template_type', 0, 'վ����ģ�������', '1', '2023-01-28 10:35:10', '1', '2023-01-28 10:35:10', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (168, '�������ɵ�ǰ������', 'infra_codegen_front_type', 0, '', '1', '2023-04-12 23:57:52', '1', '2023-04-12 23:57:52', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (170, '��ݼƷѷ�ʽ', 'trade_delivery_express_charge_mode', 0, '�����̳ǽ���ģ�����͹���', '1', '2023-05-21 22:45:03', '1', '2023-05-21 22:45:03', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (171, '����ҵ������', 'member_point_biz_type', 0, '', '1', '2023-06-10 12:15:00', '1', '2023-06-28 13:48:20', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (173, '֧��֪ͨ����', 'pay_notify_type', 0, NULL, '1', '2023-07-20 12:23:03', '1', '2023-07-20 12:23:03', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (174, '��Ա����ҵ������', 'member_experience_biz_type', 0, NULL, '', '2023-08-22 12:41:01', '', '2023-08-22 12:41:01', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (175, '������������', 'trade_delivery_type', 0, '', '1', '2023-08-23 00:03:14', '1', '2023-08-23 00:03:14', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (176, '��Ӷģʽ', 'brokerage_enabled_condition', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (177, '������ϵ��ģʽ', 'brokerage_bind_mode', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (178, 'Ӷ����������', 'brokerage_withdraw_type', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (179, 'Ӷ���¼ҵ������', 'brokerage_record_biz_type', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (180, 'Ӷ���¼״̬', 'brokerage_record_status', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (181, 'Ӷ������״̬', 'brokerage_withdraw_status', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (182, 'Ӷ����������', 'brokerage_bank_name', 0, NULL, '', '2023-09-28 02:46:05', '', '2023-09-28 02:46:05', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (183, '���ۼ�¼��״̬', 'promotion_bargain_record_status', 0, '', '1', '2023-10-05 10:41:08', '1', '2023-10-05 10:41:08', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (184, 'ƴ�ż�¼��״̬', 'promotion_combination_record_status', 0, '', '1', '2023-10-08 07:24:25', '1', '2023-10-08 07:24:25', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (185, '�ؿ�-�ؿʽ', 'crm_receivable_return_type', 0, '�ؿ�-�ؿʽ', '1', '2023-10-18 21:54:10', '1', '2023-10-18 21:54:10', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (186, 'CRM �ͻ���ҵ', 'crm_customer_industry', 0, 'CRM �ͻ�������ҵ', '1', '2023-10-28 22:57:07', '1', '2024-02-18 23:30:22', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (187, '�ͻ��ȼ�', 'crm_customer_level', 0, 'CRM �ͻ��ȼ�', '1', '2023-10-28 22:59:12', '1', '2023-10-28 15:11:16', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (188, '�ͻ���Դ', 'crm_customer_source', 0, 'CRM �ͻ���Դ', '1', '2023-10-28 23:00:34', '1', '2023-10-28 15:11:16', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (600, 'Banner λ��', 'promotion_banner_position', 0, '', '1', '2023-10-08 07:24:25', '1', '2023-11-04 13:04:02', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (601, '�罻����', 'system_social_type', 0, '', '1', '2023-11-04 13:03:54', '1', '2023-11-04 13:03:54', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (604, '��Ʒ״̬', 'crm_product_status', 0, '', '1', '2023-10-30 21:47:59', '1', '2023-10-30 21:48:45', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (605, 'CRM ����Ȩ�޵ļ���', 'crm_permission_level', 0, '', '1', '2023-11-30 09:51:59', '1', '2023-11-30 09:51:59', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (606, 'CRM ����״̬', 'crm_audit_status', 0, '', '1', '2023-11-30 18:56:23', '1', '2023-11-30 18:56:23', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (607, 'CRM ��Ʒ��λ', 'crm_product_unit', 0, '', '1', '2023-12-05 23:01:51', '1', '2023-12-05 23:01:51', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (608, 'CRM ������ʽ', 'crm_follow_up_type', 0, '', '1', '2024-01-15 20:48:05', '1', '2024-01-15 20:48:05', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (609, '֧��ת������', 'pay_transfer_type', 0, '', '1', '2023-10-28 16:27:18', '1', '2023-10-28 16:27:18', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (610, 'ת�˶���״̬', 'pay_transfer_status', 0, '', '1', '2023-10-28 16:18:32', '1', '2023-10-28 16:18:32', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (611, 'ERP �����ϸ��ҵ������', 'erp_stock_record_biz_type', 0, 'ERP �����ϸ��ҵ������', '1', '2024-02-05 18:07:02', '1', '2024-02-05 18:07:02', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (612, 'ERP ����״̬', 'erp_audit_status', 0, '', '1', '2024-02-06 00:00:07', '1', '2024-02-06 00:00:07', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (613, 'BPM ����������', 'bpm_process_listener_type', 0, '', '1', '2024-03-23 12:52:24', '1', '2024-03-09 15:54:28', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (615, 'BPM ������ֵ����', 'bpm_process_listener_value_type', 0, '', '1', '2024-03-23 13:00:31', '1', '2024-03-23 13:00:31', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (616, 'ʱ����', 'date_interval', 0, '', '1', '2024-03-29 22:50:09', '1', '2024-03-29 22:50:09', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (619, 'CRM �̻�����״̬����', 'crm_business_end_status_type', 0, '', '1', '2024-04-13 23:23:00', '1', '2024-04-13 23:23:00', '0', '1970-01-01 00:00:00');
COMMIT;
SET IDENTITY_INSERT system_dict_type OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
CREATE TABLE system_login_log
(
    id          bigint                                NOT NULL PRIMARY KEY IDENTITY,
    log_type    bigint                                NOT NULL,
    trace_id    varchar(64) DEFAULT ''                NULL,
    user_id     bigint      DEFAULT 0                 NOT NULL,
    user_type   smallint    DEFAULT 0                 NOT NULL,
    username    varchar(50) DEFAULT ''                NULL,
    result      smallint                              NOT NULL,
    user_ip     varchar(50)                           NOT NULL,
    user_agent  varchar(512)                          NOT NULL,
    creator     varchar(64) DEFAULT ''                NULL,
    create_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64) DEFAULT ''                NULL,
    update_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit         DEFAULT '0'               NOT NULL,
    tenant_id   bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_login_log.id IS '����ID';
COMMENT ON COLUMN system_login_log.log_type IS '��־����';
COMMENT ON COLUMN system_login_log.trace_id IS '��·׷�ٱ��';
COMMENT ON COLUMN system_login_log.user_id IS '�û����';
COMMENT ON COLUMN system_login_log.user_type IS '�û�����';
COMMENT ON COLUMN system_login_log.username IS '�û��˺�';
COMMENT ON COLUMN system_login_log.result IS '��½���';
COMMENT ON COLUMN system_login_log.user_ip IS '�û� IP';
COMMENT ON COLUMN system_login_log.user_agent IS '����� UA';
COMMENT ON COLUMN system_login_log.creator IS '������';
COMMENT ON COLUMN system_login_log.create_time IS '����ʱ��';
COMMENT ON COLUMN system_login_log.updater IS '������';
COMMENT ON COLUMN system_login_log.update_time IS '����ʱ��';
COMMENT ON COLUMN system_login_log.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_login_log.tenant_id IS '�⻧���';
COMMENT ON TABLE system_login_log IS 'ϵͳ���ʼ�¼';

-- ----------------------------
-- Table structure for system_mail_account
-- ----------------------------
CREATE TABLE system_mail_account
(
    id              bigint                                NOT NULL PRIMARY KEY IDENTITY,
    mail            varchar(255)                          NOT NULL,
    username        varchar(255)                          NOT NULL,
    password        varchar(255)                          NOT NULL,
    host            varchar(255)                          NOT NULL,
    port            int                                   NOT NULL,
    ssl_enable      bit         DEFAULT '0'               NOT NULL,
    starttls_enable bit         DEFAULT '0'               NOT NULL,
    creator         varchar(64) DEFAULT ''                NULL,
    create_time     datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater         varchar(64) DEFAULT ''                NULL,
    update_time     datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted         bit         DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_mail_account.id IS '����';
COMMENT ON COLUMN system_mail_account.mail IS '����';
COMMENT ON COLUMN system_mail_account.username IS '�û���';
COMMENT ON COLUMN system_mail_account.password IS '����';
COMMENT ON COLUMN system_mail_account.host IS 'SMTP ����������';
COMMENT ON COLUMN system_mail_account.port IS 'SMTP �������˿�';
COMMENT ON COLUMN system_mail_account.ssl_enable IS '�Ƿ��� SSL';
COMMENT ON COLUMN system_mail_account.starttls_enable IS '�Ƿ��� STARTTLS';
COMMENT ON COLUMN system_mail_account.creator IS '������';
COMMENT ON COLUMN system_mail_account.create_time IS '����ʱ��';
COMMENT ON COLUMN system_mail_account.updater IS '������';
COMMENT ON COLUMN system_mail_account.update_time IS '����ʱ��';
COMMENT ON COLUMN system_mail_account.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_mail_account IS '�����˺ű�';

-- ----------------------------
-- Records of system_mail_account
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_mail_account ON;
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (1, '7684413@qq.com', '7684413@qq.com', '1234576', '127.0.0.1', 8080, '0', '0', '1', '2023-01-25 17:39:52', '1', '2024-04-24 09:13:56', '0');
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (2, 'ydym_test@163.com', 'ydym_test@163.com', 'WBZTEINMIFVRYSOE', 'smtp.163.com', 465, '1', '0', '1', '2023-01-26 01:26:03', '1', '2023-04-12 22:39:38', '0');
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (3, '76854114@qq.com', '3335', '11234', 'yunai1.cn', 466, '0', '0', '1', '2023-01-27 15:06:38', '1', '2023-01-27 07:08:36', '1');
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (4, '7685413x@qq.com', '2', '3', '4', 5, '1', '0', '1', '2023-04-12 23:05:06', '1', '2023-04-12 15:05:11', '1');
COMMIT;
SET IDENTITY_INSERT system_mail_account OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_mail_log
-- ----------------------------
CREATE TABLE system_mail_log
(
    id                bigint                                  NOT NULL PRIMARY KEY IDENTITY,
    user_id           bigint        DEFAULT NULL              NULL,
    user_type         smallint      DEFAULT NULL              NULL,
    to_mail           varchar(255)                            NOT NULL,
    account_id        bigint                                  NOT NULL,
    from_mail         varchar(255)                            NOT NULL,
    template_id       bigint                                  NOT NULL,
    template_code     varchar(63)                             NOT NULL,
    template_nickname varchar(255)  DEFAULT NULL              NULL,
    template_title    varchar(255)                            NOT NULL,
    template_content  varchar(10240)                          NOT NULL,
    template_params   varchar(255)                            NOT NULL,
    send_status       smallint      DEFAULT 0                 NOT NULL,
    send_time         datetime      DEFAULT NULL              NULL,
    send_message_id   varchar(255)  DEFAULT NULL              NULL,
    send_exception    varchar(4096) DEFAULT NULL              NULL,
    creator           varchar(64)   DEFAULT ''                NULL,
    create_time       datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater           varchar(64)   DEFAULT ''                NULL,
    update_time       datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted           bit           DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_mail_log.id IS '���';
COMMENT ON COLUMN system_mail_log.user_id IS '�û����';
COMMENT ON COLUMN system_mail_log.user_type IS '�û�����';
COMMENT ON COLUMN system_mail_log.to_mail IS '���������ַ';
COMMENT ON COLUMN system_mail_log.account_id IS '�����˺ű��';
COMMENT ON COLUMN system_mail_log.from_mail IS '���������ַ';
COMMENT ON COLUMN system_mail_log.template_id IS 'ģ����';
COMMENT ON COLUMN system_mail_log.template_code IS 'ģ�����';
COMMENT ON COLUMN system_mail_log.template_nickname IS 'ģ�淢��������';
COMMENT ON COLUMN system_mail_log.template_title IS '�ʼ�����';
COMMENT ON COLUMN system_mail_log.template_content IS '�ʼ�����';
COMMENT ON COLUMN system_mail_log.template_params IS '�ʼ�����';
COMMENT ON COLUMN system_mail_log.send_status IS '����״̬';
COMMENT ON COLUMN system_mail_log.send_time IS '����ʱ��';
COMMENT ON COLUMN system_mail_log.send_message_id IS '���ͷ��ص���Ϣ ID';
COMMENT ON COLUMN system_mail_log.send_exception IS '�����쳣';
COMMENT ON COLUMN system_mail_log.creator IS '������';
COMMENT ON COLUMN system_mail_log.create_time IS '����ʱ��';
COMMENT ON COLUMN system_mail_log.updater IS '������';
COMMENT ON COLUMN system_mail_log.update_time IS '����ʱ��';
COMMENT ON COLUMN system_mail_log.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_mail_log IS '�ʼ���־��';

-- ----------------------------
-- Table structure for system_mail_template
-- ----------------------------
CREATE TABLE system_mail_template
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(63)                            NOT NULL,
    code        varchar(63)                            NOT NULL,
    account_id  bigint                                 NOT NULL,
    nickname    varchar(255) DEFAULT NULL              NULL,
    title       varchar(255)                           NOT NULL,
    content     varchar(10240)                         NOT NULL,
    params      varchar(255)                           NOT NULL,
    status      smallint                               NOT NULL,
    remark      varchar(255) DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_mail_template.id IS '���';
COMMENT ON COLUMN system_mail_template.name IS 'ģ������';
COMMENT ON COLUMN system_mail_template.code IS 'ģ�����';
COMMENT ON COLUMN system_mail_template.account_id IS '���͵������˺ű��';
COMMENT ON COLUMN system_mail_template.nickname IS '����������';
COMMENT ON COLUMN system_mail_template.title IS 'ģ�����';
COMMENT ON COLUMN system_mail_template.content IS 'ģ������';
COMMENT ON COLUMN system_mail_template.params IS '��������';
COMMENT ON COLUMN system_mail_template.status IS '����״̬';
COMMENT ON COLUMN system_mail_template.remark IS '��ע';
COMMENT ON COLUMN system_mail_template.creator IS '������';
COMMENT ON COLUMN system_mail_template.create_time IS '����ʱ��';
COMMENT ON COLUMN system_mail_template.updater IS '������';
COMMENT ON COLUMN system_mail_template.update_time IS '����ʱ��';
COMMENT ON COLUMN system_mail_template.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_mail_template IS '�ʼ�ģ���';

-- ----------------------------
-- Records of system_mail_template
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_mail_template ON;
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (13, '��̨�û����ŵ�¼', 'admin-sms-login', 1, '������', '����Ҳ�', '<p>������֤����{code}��������{name}</p>', '["code","name"]', 0, '3', '1', '2021-10-11 08:10:00', '1', '2023-12-02 19:51:14', '0');
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (14, '����ģ��', 'test_01', 2, '��ܵ', 'һ������', '<p>���� {key01} ��</p><p><br></p><p>�ǵĻ����Ͻ� {key02} һ�£�</p>', '["key01","key02"]', 0, NULL, '1', '2023-01-26 01:27:40', '1', '2023-01-27 10:32:16', '0');
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (15, '3', '2', 2, '7', '4', '<p>45</p>', '[]', 1, '80', '1', '2023-01-27 15:50:35', '1', '2023-01-27 16:34:49', '0');
COMMIT;
SET IDENTITY_INSERT system_mail_template OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
CREATE TABLE system_menu
(
    id             bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name           varchar(50)                            NOT NULL,
    permission     varchar(100) DEFAULT ''                NULL,
    type           smallint                               NOT NULL,
    sort           int          DEFAULT 0                 NOT NULL,
    parent_id      bigint       DEFAULT 0                 NOT NULL,
    path           varchar(200) DEFAULT ''                NULL,
    icon           varchar(100) DEFAULT '#'               NULL,
    component      varchar(255) DEFAULT NULL              NULL,
    component_name varchar(255) DEFAULT NULL              NULL,
    status         smallint     DEFAULT 0                 NOT NULL,
    visible        bit          DEFAULT '1'               NOT NULL,
    keep_alive     bit          DEFAULT '1'               NOT NULL,
    always_show    bit          DEFAULT '1'               NOT NULL,
    creator        varchar(64)  DEFAULT ''                NULL,
    create_time    datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater        varchar(64)  DEFAULT ''                NULL,
    update_time    datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted        bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_menu.id IS '�˵�ID';
COMMENT ON COLUMN system_menu.name IS '�˵�����';
COMMENT ON COLUMN system_menu.permission IS 'Ȩ�ޱ�ʶ';
COMMENT ON COLUMN system_menu.type IS '�˵�����';
COMMENT ON COLUMN system_menu.sort IS '��ʾ˳��';
COMMENT ON COLUMN system_menu.parent_id IS '���˵�ID';
COMMENT ON COLUMN system_menu.path IS '·�ɵ�ַ';
COMMENT ON COLUMN system_menu.icon IS '�˵�ͼ��';
COMMENT ON COLUMN system_menu.component IS '���·��';
COMMENT ON COLUMN system_menu.component_name IS '�����';
COMMENT ON COLUMN system_menu.status IS '�˵�״̬';
COMMENT ON COLUMN system_menu.visible IS '�Ƿ�ɼ�';
COMMENT ON COLUMN system_menu.keep_alive IS '�Ƿ񻺴�';
COMMENT ON COLUMN system_menu.always_show IS '�Ƿ�������ʾ';
COMMENT ON COLUMN system_menu.creator IS '������';
COMMENT ON COLUMN system_menu.create_time IS '����ʱ��';
COMMENT ON COLUMN system_menu.updater IS '������';
COMMENT ON COLUMN system_menu.update_time IS '����ʱ��';
COMMENT ON COLUMN system_menu.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_menu IS '�˵�Ȩ�ޱ�';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_menu ON;
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1, 'ϵͳ����', '', 1, 10, 0, '/system', 'ep:tools', NULL, NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:04:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2, '������ʩ', '', 1, 20, 0, '/infra', 'ep:monitor', NULL, NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-03-01 08:28:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5, 'OA ʾ��', '', 1, 40, 1185, 'oa', 'fa:road', NULL, NULL, 0, '1', '1', '1', 'admin', '2021-09-20 16:26:19', '1', '2024-02-29 12:38:13', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (100, '�û�����', 'system:user:list', 2, 1, 1, 'user', 'ep:avatar', 'system/user/index', 'SystemUser', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:02:04', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (101, '��ɫ����', '', 2, 2, 1, 'role', 'ep:user', 'system/role/index', 'SystemRole', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:03:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (102, '�˵�����', '', 2, 3, 1, 'menu', 'ep:menu', 'system/menu/index', 'SystemMenu', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:03:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (103, '���Ź���', '', 2, 4, 1, 'dept', 'fa:address-card', 'system/dept/index', 'SystemDept', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:06:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (104, '��λ����', '', 2, 5, 1, 'post', 'fa:address-book-o', 'system/post/index', 'SystemPost', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:06:39', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (105, '�ֵ����', '', 2, 6, 1, 'dict', 'ep:collection', 'system/dict/index', 'SystemDictType', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:07:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (106, '���ù���', '', 2, 8, 2, 'config', 'fa:connectdevelop', 'infra/config/index', 'InfraConfig', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:02:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (107, '֪ͨ����', '', 2, 4, 2739, 'notice', 'ep:takeaway-box', 'system/notice/index', 'SystemNotice', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-22 23:56:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (108, '�����־', '', 1, 9, 1, 'log', 'ep:document-copy', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:08:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (109, '���ƹ���', '', 2, 2, 1261, 'token', 'fa:key', 'system/oauth2/token/index', 'SystemTokenClient', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:13:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (110, '��ʱ����', '', 2, 7, 2, 'job', 'fa-solid:tasks', 'infra/job/index', 'InfraJob', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:57:36', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (111, 'MySQL ���', '', 2, 1, 2740, 'druid', 'fa-solid:box', 'infra/druid/index', 'InfraDruid', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:05:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (112, 'Java ���', '', 2, 3, 2740, 'admin-server', 'ep:coffee-cup', 'infra/server/index', 'InfraAdminServer', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:06:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (113, 'Redis ���', '', 2, 2, 2740, 'redis', 'fa:reddit-square', 'infra/redis/index', 'InfraRedis', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:06:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (114, '������', 'infra:build:list', 2, 2, 2, 'build', 'fa:wpforms', 'infra/build/index', 'InfraBuild', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:51:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (115, '��������', 'infra:codegen:query', 2, 1, 2, 'codegen', 'ep:document-copy', 'infra/codegen/index', 'InfraCodegen', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:51:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (116, 'API �ӿ�', 'infra:swagger:list', 2, 3, 2, 'swagger', 'fa:fighter-jet', 'infra/swagger/index', 'InfraSwagger', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:01:24', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (500, '������־', '', 2, 1, 108, 'operate-log', 'ep:position', 'system/operatelog/index', 'SystemOperateLog', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:09:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (501, '��¼��־', '', 2, 2, 108, 'login-log', 'ep:promotion', 'system/loginlog/index', 'SystemLoginLog', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:10:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1001, '�û���ѯ', 'system:user:query', 3, 1, 100, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1002, '�û�����', 'system:user:create', 3, 2, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1003, '�û��޸�', 'system:user:update', 3, 3, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1004, '�û�ɾ��', 'system:user:delete', 3, 4, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1005, '�û�����', 'system:user:export', 3, 5, 100, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1006, '�û�����', 'system:user:import', 3, 6, 100, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1007, '��������', 'system:user:update-password', 3, 7, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1008, '��ɫ��ѯ', 'system:role:query', 3, 1, 101, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1009, '��ɫ����', 'system:role:create', 3, 2, 101, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1010, '��ɫ�޸�', 'system:role:update', 3, 3, 101, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1011, '��ɫɾ��', 'system:role:delete', 3, 4, 101, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1012, '��ɫ����', 'system:role:export', 3, 5, 101, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1013, '�˵���ѯ', 'system:menu:query', 3, 1, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1014, '�˵�����', 'system:menu:create', 3, 2, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1015, '�˵��޸�', 'system:menu:update', 3, 3, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1016, '�˵�ɾ��', 'system:menu:delete', 3, 4, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1017, '���Ų�ѯ', 'system:dept:query', 3, 1, 103, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1018, '��������', 'system:dept:create', 3, 2, 103, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1019, '�����޸�', 'system:dept:update', 3, 3, 103, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1020, '����ɾ��', 'system:dept:delete', 3, 4, 103, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1021, '��λ��ѯ', 'system:post:query', 3, 1, 104, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1022, '��λ����', 'system:post:create', 3, 2, 104, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1023, '��λ�޸�', 'system:post:update', 3, 3, 104, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1024, '��λɾ��', 'system:post:delete', 3, 4, 104, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1025, '��λ����', 'system:post:export', 3, 5, 104, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1026, '�ֵ��ѯ', 'system:dict:query', 3, 1, 105, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1027, '�ֵ�����', 'system:dict:create', 3, 2, 105, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1028, '�ֵ��޸�', 'system:dict:update', 3, 3, 105, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1029, '�ֵ�ɾ��', 'system:dict:delete', 3, 4, 105, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1030, '�ֵ䵼��', 'system:dict:export', 3, 5, 105, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1031, '���ò�ѯ', 'infra:config:query', 3, 1, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1032, '��������', 'infra:config:create', 3, 2, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1033, '�����޸�', 'infra:config:update', 3, 3, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1034, '����ɾ��', 'infra:config:delete', 3, 4, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1035, '���õ���', 'infra:config:export', 3, 5, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1036, '�����ѯ', 'system:notice:query', 3, 1, 107, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1037, '��������', 'system:notice:create', 3, 2, 107, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1038, '�����޸�', 'system:notice:update', 3, 3, 107, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1039, '����ɾ��', 'system:notice:delete', 3, 4, 107, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1040, '������ѯ', 'system:operate-log:query', 3, 1, 500, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1042, '��־����', 'system:operate-log:export', 3, 2, 500, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1043, '��¼��ѯ', 'system:login-log:query', 3, 1, 501, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1045, '��־����', 'system:login-log:export', 3, 3, 501, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1046, '�����б�', 'system:oauth2-token:page', 3, 1, 109, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1048, '����ɾ��', 'system:oauth2-token:delete', 3, 2, 109, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1050, '��������', 'infra:job:create', 3, 2, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1051, '�����޸�', 'infra:job:update', 3, 3, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1052, '����ɾ��', 'infra:job:delete', 3, 4, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1053, '״̬�޸�', 'infra:job:update', 3, 5, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1054, '���񵼳�', 'infra:job:export', 3, 7, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1056, '�����޸�', 'infra:codegen:update', 3, 2, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1057, '����ɾ��', 'infra:codegen:delete', 3, 3, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1058, '�������', 'infra:codegen:create', 3, 2, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1059, 'Ԥ������', 'infra:codegen:preview', 3, 4, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1060, '���ɴ���', 'infra:codegen:download', 3, 5, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1063, '���ý�ɫ�˵�Ȩ��', 'system:permission:assign-role-menu', 3, 6, 101, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-06 17:53:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1064, '���ý�ɫ����Ȩ��', 'system:permission:assign-role-data-scope', 3, 7, 101, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-06 17:56:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1065, '�����û���ɫ', 'system:permission:assign-user-role', 3, 8, 101, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-07 10:23:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1066, '��� Redis �����Ϣ', 'infra:redis:get-monitor-info', 3, 1, 113, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-26 01:02:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1067, '��� Redis Key �б�', 'infra:redis:get-key-list', 3, 2, 113, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-26 01:02:52', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1070, '�������ɰ���', '', 1, 1, 2, 'demo', 'ep:aim', 'infra/testDemo/index', NULL, 0, '1', '1', '1', '', '2021-02-06 12:42:49', '1', '2023-11-15 23:45:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1075, '���񴥷�', 'infra:job:trigger', 3, 8, 110, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-07 13:03:10', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1077, '��·׷��', '', 2, 4, 2740, 'skywalking', 'fa:eye', 'infra/skywalking/index', 'InfraSkyWalking', 0, '1', '1', '1', '', '2021-02-08 20:41:31', '1', '2024-04-23 00:07:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1078, '������־', '', 2, 1, 1083, 'api-access-log', 'ep:place', 'infra/apiAccessLog/index', 'InfraApiAccessLog', 0, '1', '1', '1', '', '2021-02-26 01:32:59', '1', '2024-02-29 08:54:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1082, '��־����', 'infra:api-access-log:export', 3, 2, 1078, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-26 01:32:59', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1083, 'API ��־', '', 2, 4, 2, 'log', 'fa:tasks', NULL, NULL, 0, '1', '1', '1', '', '2021-02-26 02:18:24', '1', '2024-04-22 23:58:36', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1084, '������־', 'infra:api-error-log:query', 2, 2, 1083, 'api-error-log', 'ep:warning-filled', 'infra/apiErrorLog/index', 'InfraApiErrorLog', 0, '1', '1', '1', '', '2021-02-26 07:53:20', '1', '2024-02-29 08:55:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1085, '��־����', 'infra:api-error-log:update-status', 3, 2, 1084, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1086, '��־����', 'infra:api-error-log:export', 3, 3, 1084, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1087, '�����ѯ', 'infra:job:query', 3, 1, 110, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-03-10 01:26:19', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1088, '��־��ѯ', 'infra:api-access-log:query', 3, 1, 1078, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-03-10 01:28:04', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1089, '��־��ѯ', 'infra:api-error-log:query', 3, 1, 1084, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-03-10 01:29:09', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1090, '�ļ��б�', '', 2, 5, 1243, 'file', 'ep:upload-filled', 'infra/file/index', 'InfraFile', 0, '1', '1', '1', '', '2021-03-12 20:16:20', '1', '2024-02-29 08:53:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1091, '�ļ���ѯ', 'infra:file:query', 3, 1, 1090, '', '', '', NULL, 0, '1', '1', '1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1092, '�ļ�ɾ��', 'infra:file:delete', 3, 4, 1090, '', '', '', NULL, 0, '1', '1', '1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1093, '���Ź���', '', 1, 1, 2739, 'sms', 'ep:message', NULL, NULL, 0, '1', '1', '1', '1', '2021-04-05 01:10:16', '1', '2024-04-22 23:56:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1094, '��������', '', 2, 0, 1093, 'sms-channel', 'fa:stack-exchange', 'system/sms/channel/index', 'SystemSmsChannel', 0, '1', '1', '1', '', '2021-04-01 11:07:15', '1', '2024-02-29 01:15:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1095, '����������ѯ', 'system:sms-channel:query', 3, 1, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1096, '������������', 'system:sms-channel:create', 3, 2, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1097, '������������', 'system:sms-channel:update', 3, 3, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1098, '��������ɾ��', 'system:sms-channel:delete', 3, 4, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1100, '����ģ��', '', 2, 1, 1093, 'sms-template', 'ep:connection', 'system/sms/template/index', 'SystemSmsTemplate', 0, '1', '1', '1', '', '2021-04-01 17:35:17', '1', '2024-02-29 01:16:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1101, '����ģ���ѯ', 'system:sms-template:query', 3, 1, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1102, '����ģ�崴��', 'system:sms-template:create', 3, 2, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1103, '����ģ�����', 'system:sms-template:update', 3, 3, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1104, '����ģ��ɾ��', 'system:sms-template:delete', 3, 4, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1105, '����ģ�嵼��', 'system:sms-template:export', 3, 5, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1106, '���Ͳ��Զ���', 'system:sms-template:send-sms', 3, 6, 1100, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-04-11 00:26:40', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1107, '������־', '', 2, 2, 1093, 'sms-log', 'fa:edit', 'system/sms/log/index', 'SystemSmsLog', 0, '1', '1', '1', '', '2021-04-11 08:37:05', '1', '2024-02-29 08:49:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1108, '������־��ѯ', 'system:sms-log:query', 3, 1, 1107, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1109, '������־����', 'system:sms-log:export', 3, 5, 1107, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1117, '֧������', '', 1, 30, 0, '/pay', 'ep:money', NULL, NULL, 0, '1', '1', '1', '1', '2021-12-25 16:43:41', '1', '2024-02-29 08:58:38', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1118, '��ٲ�ѯ', '', 2, 0, 5, 'leave', 'fa:leanpub', 'bpm/oa/leave/index', 'BpmOALeave', 0, '1', '1', '1', '', '2021-09-20 08:51:03', '1', '2024-02-29 12:38:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1119, '��������ѯ', 'bpm:oa-leave:query', 3, 1, 1118, '', '', '', NULL, 0, '1', '1', '1', '', '2021-09-20 08:51:03', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1120, '������봴��', 'bpm:oa-leave:create', 3, 2, 1118, '', '', '', NULL, 0, '1', '1', '1', '', '2021-09-20 08:51:03', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1126, 'Ӧ����Ϣ', '', 2, 1, 1117, 'app', 'fa:apple', 'pay/app/index', 'PayApp', 0, '1', '1', '1', '', '2021-11-10 01:13:30', '1', '2024-02-29 08:59:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1127, '֧��Ӧ����Ϣ��ѯ', 'pay:app:query', 3, 1, 1126, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1128, '֧��Ӧ����Ϣ����', 'pay:app:create', 3, 2, 1126, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1129, '֧��Ӧ����Ϣ����', 'pay:app:update', 3, 3, 1126, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1130, '֧��Ӧ����Ϣɾ��', 'pay:app:delete', 3, 4, 1126, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1132, '��Կ����', 'pay:channel:parsing', 3, 6, 1129, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-11-08 15:15:47', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1133, '֧���̻���Ϣ��ѯ', 'pay:merchant:query', 3, 1, 1132, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1134, '֧���̻���Ϣ����', 'pay:merchant:create', 3, 2, 1132, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1135, '֧���̻���Ϣ����', 'pay:merchant:update', 3, 3, 1132, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1136, '֧���̻���Ϣɾ��', 'pay:merchant:delete', 3, 4, 1132, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1137, '֧���̻���Ϣ����', 'pay:merchant:export', 3, 5, 1132, '', '', '', NULL, 0, '1', '1', '1', '', '2021-11-10 01:13:41', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1138, '�⻧�б�', '', 2, 0, 1224, 'list', 'ep:house', 'system/tenant/index', 'SystemTenant', 0, '1', '1', '1', '', '2021-12-14 12:31:43', '1', '2024-02-29 01:01:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1139, '�⻧��ѯ', 'system:tenant:query', 3, 1, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1140, '�⻧����', 'system:tenant:create', 3, 2, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1141, '�⻧����', 'system:tenant:update', 3, 3, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1142, '�⻧ɾ��', 'system:tenant:delete', 3, 4, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1143, '�⻧����', 'system:tenant:export', 3, 5, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1150, '��Կ����', '', 3, 6, 1129, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-11-08 15:15:47', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1161, '�˿��', '', 2, 3, 1117, 'refund', 'fa:registered', 'pay/refund/index', 'PayRefund', 0, '1', '1', '1', '', '2021-12-25 08:29:07', '1', '2024-02-29 08:59:20', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1162, '�˿����ѯ', 'pay:refund:query', 3, 1, 1161, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1163, '�˿������', 'pay:refund:create', 3, 2, 1161, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1164, '�˿������', 'pay:refund:update', 3, 3, 1161, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1165, '�˿��ɾ��', 'pay:refund:delete', 3, 4, 1161, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1166, '�˿������', 'pay:refund:export', 3, 5, 1161, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:29:07', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1173, '֧������', '', 2, 2, 1117, 'order', 'fa:cc-paypal', 'pay/order/index', 'PayOrder', 0, '1', '1', '1', '', '2021-12-25 08:49:43', '1', '2024-02-29 08:59:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1174, '֧��������ѯ', 'pay:order:query', 3, 1, 1173, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1175, '֧����������', 'pay:order:create', 3, 2, 1173, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1176, '֧����������', 'pay:order:update', 3, 3, 1173, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1177, '֧������ɾ��', 'pay:order:delete', 3, 4, 1173, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1178, '֧����������', 'pay:order:export', 3, 5, 1173, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-25 08:49:43', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1185, '��������', '', 1, 50, 0, '/bpm', 'fa:medium', NULL, NULL, 0, '1', '1', '1', '1', '2021-12-30 20:26:36', '1', '2024-02-29 12:43:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1186, '���̹���', '', 1, 10, 1185, 'manager', 'fa:dedent', NULL, NULL, 0, '1', '1', '1', '1', '2021-12-30 20:28:30', '1', '2024-02-29 12:36:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1187, '���̱�', '', 2, 2, 1186, 'form', 'fa:hdd-o', 'bpm/form/index', 'BpmForm', 0, '1', '1', '1', '', '2021-12-30 12:38:22', '1', '2024-03-19 12:25:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1188, '����ѯ', 'bpm:form:query', 3, 1, 1187, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1189, '������', 'bpm:form:create', 3, 2, 1187, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1190, '������', 'bpm:form:update', 3, 3, 1187, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1191, '��ɾ��', 'bpm:form:delete', 3, 4, 1187, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1192, '������', 'bpm:form:export', 3, 5, 1187, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-30 12:38:22', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1193, '����ģ��', '', 2, 1, 1186, 'model', 'fa-solid:project-diagram', 'bpm/model/index', 'BpmModel', 0, '1', '1', '1', '1', '2021-12-31 23:24:58', '1', '2024-03-19 12:25:19', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1194, 'ģ�Ͳ�ѯ', 'bpm:model:query', 3, 1, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-03 19:01:10', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1195, 'ģ�ʹ���', 'bpm:model:create', 3, 2, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-03 19:01:24', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1196, 'ģ�͵���', 'bpm:model:import', 3, 3, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-03 19:01:35', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1197, 'ģ�͸���', 'bpm:model:update', 3, 4, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-03 19:02:28', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1198, 'ģ��ɾ��', 'bpm:model:delete', 3, 5, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-03 19:02:43', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1199, 'ģ�ͷ���', 'bpm:model:deploy', 3, 6, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-03 19:03:24', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1200, '��������', '', 2, 20, 1185, 'task', 'fa:tasks', NULL, NULL, 0, '1', '1', '1', '1', '2022-01-07 23:51:48', '1', '2024-03-21 00:33:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1201, '�ҵ�����', '', 2, 1, 1200, 'my', 'fa-solid:book', 'bpm/processInstance/index', 'BpmProcessInstanceMy', 0, '1', '1', '1', '', '2022-01-07 15:53:44', '1', '2024-03-21 23:52:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1202, '����ʵ���Ĳ�ѯ', 'bpm:process-instance:query', 3, 1, 1201, '', '', '', NULL, 0, '1', '1', '1', '', '2022-01-07 15:53:44', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1207, '��������', '', 2, 10, 1200, 'todo', 'fa:slack', 'bpm/task/todo/index', 'BpmTodoTask', 0, '1', '1', '1', '1', '2022-01-08 10:33:37', '1', '2024-02-29 12:37:39', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1208, '�Ѱ�����', '', 2, 20, 1200, 'done', 'fa:delicious', 'bpm/task/done/index', 'BpmDoneTask', 0, '1', '1', '1', '1', '2022-01-08 10:34:13', '1', '2024-02-29 12:37:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1209, '�û�����', '', 2, 4, 1186, 'user-group', 'fa:user-secret', 'bpm/group/index', 'BpmUserGroup', 0, '1', '1', '1', '', '2022-01-14 02:14:20', '1', '2024-03-21 23:55:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1210, '�û����ѯ', 'bpm:user-group:query', 3, 1, 1209, '', '', '', NULL, 0, '1', '1', '1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1211, '�û��鴴��', 'bpm:user-group:create', 3, 2, 1209, '', '', '', NULL, 0, '1', '1', '1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1212, '�û������', 'bpm:user-group:update', 3, 3, 1209, '', '', '', NULL, 0, '1', '1', '1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1213, '�û���ɾ��', 'bpm:user-group:delete', 3, 4, 1209, '', '', '', NULL, 0, '1', '1', '1', '', '2022-01-14 02:14:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1215, '���̶����ѯ', 'bpm:process-definition:query', 3, 10, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:21:43', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1216, '���������������ѯ', 'bpm:task-assign-rule:query', 3, 20, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:26:53', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1217, '�������������򴴽�', 'bpm:task-assign-rule:create', 3, 21, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:28:15', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1218, '�����������������', 'bpm:task-assign-rule:update', 3, 22, 1193, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:28:41', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1219, '����ʵ���Ĵ���', 'bpm:process-instance:create', 3, 2, 1201, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:36:15', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1220, '����ʵ����ȡ��', 'bpm:process-instance:cancel', 3, 3, 1201, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:36:33', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1221, '��������Ĳ�ѯ', 'bpm:task:query', 3, 1, 1207, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:38:52', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1222, '��������ĸ���', 'bpm:task:update', 3, 2, 1207, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-01-23 00:39:24', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1224, '�⻧����', '', 2, 0, 1, 'tenant', 'fa-solid:house-user', NULL, NULL, 0, '1', '1', '1', '1', '2022-02-20 01:41:13', '1', '2024-02-29 00:59:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1225, '�⻧�ײ�', '', 2, 0, 1224, 'package', 'fa:bars', 'system/tenantPackage/index', 'SystemTenantPackage', 0, '1', '1', '1', '', '2022-02-19 17:44:06', '1', '2024-02-29 01:01:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1226, '�⻧�ײͲ�ѯ', 'system:tenant-package:query', 3, 1, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1227, '�⻧�ײʹ���', 'system:tenant-package:create', 3, 2, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1228, '�⻧�ײ͸���', 'system:tenant-package:update', 3, 3, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1229, '�⻧�ײ�ɾ��', 'system:tenant-package:delete', 3, 4, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1237, '�ļ�����', '', 2, 0, 1243, 'file-config', 'fa-solid:file-signature', 'infra/fileConfig/index', 'InfraFileConfig', 0, '1', '1', '1', '', '2022-03-15 14:35:28', '1', '2024-02-29 08:52:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1238, '�ļ����ò�ѯ', 'infra:file-config:query', 3, 1, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1239, '�ļ����ô���', 'infra:file-config:create', 3, 2, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1240, '�ļ����ø���', 'infra:file-config:update', 3, 3, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1241, '�ļ�����ɾ��', 'infra:file-config:delete', 3, 4, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1242, '�ļ����õ���', 'infra:file-config:export', 3, 5, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1243, '�ļ�����', '', 2, 6, 2, 'file', 'ep:files', NULL, '', 0, '1', '1', '1', '1', '2022-03-16 23:47:40', '1', '2024-04-23 00:02:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1254, '���߶�̬', '', 1, 0, 0, 'https://www.iocoder.cn', 'ep:avatar', NULL, NULL, 0, '1', '1', '1', '1', '2022-04-23 01:03:15', '1', '2023-12-08 23:40:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1255, '����Դ����', '', 2, 1, 2, 'data-source-config', 'ep:data-analysis', 'infra/dataSourceConfig/index', 'InfraDataSourceConfig', 0, '1', '1', '1', '', '2022-04-27 14:37:32', '1', '2024-02-29 08:51:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1256, '����Դ���ò�ѯ', 'infra:data-source-config:query', 3, 1, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1257, '����Դ���ô���', 'infra:data-source-config:create', 3, 2, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1258, '����Դ���ø���', 'infra:data-source-config:update', 3, 3, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1259, '����Դ����ɾ��', 'infra:data-source-config:delete', 3, 4, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1260, '����Դ���õ���', 'infra:data-source-config:export', 3, 5, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1261, 'OAuth 2.0', '', 2, 10, 1, 'oauth2', 'fa:dashcube', NULL, NULL, 0, '1', '1', '1', '1', '2022-05-09 23:38:17', '1', '2024-02-29 01:12:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1263, 'Ӧ�ù���', '', 2, 0, 1261, 'oauth2/application', 'fa:hdd-o', 'system/oauth2/client/index', 'SystemOAuth2Client', 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2024-02-29 01:13:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1264, '�ͻ��˲�ѯ', 'system:oauth2-client:query', 3, 1, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1265, '�ͻ��˴���', 'system:oauth2-client:create', 3, 2, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1266, '�ͻ��˸���', 'system:oauth2-client:update', 3, 3, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1267, '�ͻ���ɾ��', 'system:oauth2-client:delete', 3, 4, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1281, '�������', '', 2, 40, 0, '/report', 'ep:pie-chart', NULL, NULL, 0, '1', '1', '1', '1', '2022-07-10 20:22:15', '1', '2024-02-29 12:33:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1282, '���������', '', 2, 1, 1281, 'jimu-report', 'ep:trend-charts', 'report/jmreport/index', 'GoView', 0, '1', '1', '1', '1', '2022-07-10 20:26:36', '1', '2024-02-29 12:33:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2000, '��Ʒ����', '', 1, 60, 2362, 'product', 'fa:product-hunt', NULL, NULL, 0, '1', '1', '1', '', '2022-07-29 15:53:53', '1', '2023-09-30 11:52:36', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2002, '��Ʒ����', '', 2, 2, 2000, 'category', 'ep:cellphone', 'mall/product/category/index', 'ProductCategory', 0, '1', '1', '1', '', '2022-07-29 15:53:53', '1', '2023-08-21 10:27:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2003, '�����ѯ', 'product:category:query', 3, 1, 2002, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2004, '���ഴ��', 'product:category:create', 3, 2, 2002, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2005, '�������', 'product:category:update', 3, 3, 2002, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2006, '����ɾ��', 'product:category:delete', 3, 4, 2002, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-29 15:53:53', '', '2022-07-29 15:53:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2008, '��ƷƷ��', '', 2, 3, 2000, 'brand', 'ep:chicken', 'mall/product/brand/index', 'ProductBrand', 0, '1', '1', '1', '', '2022-07-30 13:52:44', '1', '2023-08-21 10:27:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2009, 'Ʒ�Ʋ�ѯ', 'product:brand:query', 3, 1, 2008, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2010, 'Ʒ�ƴ���', 'product:brand:create', 3, 2, 2008, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2011, 'Ʒ�Ƹ���', 'product:brand:update', 3, 3, 2008, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2012, 'Ʒ��ɾ��', 'product:brand:delete', 3, 4, 2008, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 13:52:44', '', '2022-07-30 13:52:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2014, '��Ʒ�б�', '', 2, 1, 2000, 'spu', 'ep:apple', 'mall/product/spu/index', 'ProductSpu', 0, '1', '1', '1', '', '2022-07-30 14:22:58', '1', '2023-08-21 10:27:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2015, '��Ʒ��ѯ', 'product:spu:query', 3, 1, 2014, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2016, '��Ʒ����', 'product:spu:create', 3, 2, 2014, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2017, '��Ʒ����', 'product:spu:update', 3, 3, 2014, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2018, '��Ʒɾ��', 'product:spu:delete', 3, 4, 2014, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2019, '��Ʒ����', '', 2, 4, 2000, 'property', 'ep:cold-drink', 'mall/product/property/index', 'ProductProperty', 0, '1', '1', '1', '', '2022-08-01 14:55:35', '1', '2023-08-26 11:01:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2020, '����ѯ', 'product:property:query', 3, 1, 2019, '', '', '', NULL, 0, '1', '1', '1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:24', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2021, '��񴴽�', 'product:property:create', 3, 2, 2019, '', '', '', NULL, 0, '1', '1', '1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2022, '������', 'product:property:update', 3, 3, 2019, '', '', '', NULL, 0, '1', '1', '1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2023, '���ɾ��', 'product:property:delete', 3, 4, 2019, '', '', '', NULL, 0, '1', '1', '1', '', '2022-08-01 14:55:35', '', '2022-12-12 20:26:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2025, 'Banner', '', 2, 100, 2387, 'banner', 'fa:bandcamp', 'mall/promotion/banner/index', NULL, 0, '1', '1', '1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2026, 'Banner��ѯ', 'promotion:banner:query', 3, 1, 2025, '', '', '', '', 0, '1', '1', '1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2027, 'Banner����', 'promotion:banner:create', 3, 2, 2025, '', '', '', '', 0, '1', '1', '1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2028, 'Banner����', 'promotion:banner:update', 3, 3, 2025, '', '', '', '', 0, '1', '1', '1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2029, 'Bannerɾ��', 'promotion:banner:delete', 3, 4, 2025, '', '', '', '', 0, '1', '1', '1', '', '2022-08-01 14:56:14', '1', '2023-10-24 20:20:36', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2030, 'Ӫ������', '', 1, 70, 2362, 'promotion', 'ep:present', NULL, NULL, 0, '1', '1', '1', '1', '2022-10-31 21:25:09', '1', '2023-09-30 11:54:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2032, '�Ż݄��б�', '', 2, 1, 2365, 'template', 'ep:discount', 'mall/promotion/coupon/template/index', 'PromotionCouponTemplate', 0, '1', '1', '1', '', '2022-10-31 22:27:14', '1', '2023-10-03 12:40:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2033, '�Ż݄�ģ���ѯ', 'promotion:coupon-template:query', 3, 1, 2032, '', '', '', NULL, 0, '1', '1', '1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2034, '�Ż݄�ģ�崴��', 'promotion:coupon-template:create', 3, 2, 2032, '', '', '', NULL, 0, '1', '1', '1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2035, '�Ż݄�ģ�����', 'promotion:coupon-template:update', 3, 3, 2032, '', '', '', NULL, 0, '1', '1', '1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2036, '�Ż݄�ģ��ɾ��', 'promotion:coupon-template:delete', 3, 4, 2032, '', '', '', NULL, 0, '1', '1', '1', '', '2022-10-31 22:27:14', '', '2022-10-31 22:27:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2038, '��ȡ��¼', '', 2, 2, 2365, 'list', 'ep:collection-tag', 'mall/promotion/coupon/index', 'PromotionCoupon', 0, '1', '1', '1', '', '2022-11-03 23:21:31', '1', '2023-10-03 12:55:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2039, '�Ż݄���ѯ', 'promotion:coupon:query', 3, 1, 2038, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-03 23:21:31', '', '2022-11-03 23:21:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2040, '�Ż݄�ɾ��', 'promotion:coupon:delete', 3, 4, 2038, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-03 23:21:31', '', '2022-11-03 23:21:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2041, '������', '', 2, 10, 2390, 'reward-activity', 'ep:goblet-square-full', 'mall/promotion/rewardActivity/index', 'PromotionRewardActivity', 0, '1', '1', '1', '', '2022-11-04 23:47:49', '1', '2023-10-21 19:24:46', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2042, '�����ͻ��ѯ', 'promotion:reward-activity:query', 3, 1, 2041, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-04 23:47:49', '', '2022-11-04 23:47:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2043, '�����ͻ����', 'promotion:reward-activity:create', 3, 2, 2041, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-04 23:47:49', '', '2022-11-04 23:47:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2044, '�����ͻ����', 'promotion:reward-activity:update', 3, 3, 2041, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-04 23:47:50', '', '2022-11-04 23:47:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2045, '�����ͻɾ��', 'promotion:reward-activity:delete', 3, 4, 2041, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-04 23:47:50', '', '2022-11-04 23:47:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2046, '�����ͻ�ر�', 'promotion:reward-activity:close', 3, 5, 2041, '', '', '', NULL, 0, '1', '1', '1', '1', '2022-11-05 10:42:53', '1', '2022-11-05 10:42:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2047, '��ʱ�ۿ�', '', 2, 7, 2390, 'discount-activity', 'ep:timer', 'mall/promotion/discountActivity/index', 'PromotionDiscountActivity', 0, '1', '1', '1', '', '2022-11-05 17:12:15', '1', '2023-10-21 19:24:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2048, '��ʱ�ۿۻ��ѯ', 'promotion:discount-activity:query', 3, 1, 2047, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-05 17:12:15', '', '2022-11-05 17:12:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2049, '��ʱ�ۿۻ����', 'promotion:discount-activity:create', 3, 2, 2047, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-05 17:12:15', '', '2022-11-05 17:12:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2050, '��ʱ�ۿۻ����', 'promotion:discount-activity:update', 3, 3, 2047, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-05 17:12:16', '', '2022-11-05 17:12:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2051, '��ʱ�ۿۻɾ��', 'promotion:discount-activity:delete', 3, 4, 2047, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-05 17:12:16', '', '2022-11-05 17:12:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2052, '��ʱ�ۿۻ�ر�', 'promotion:discount-activity:close', 3, 5, 2047, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-05 17:12:16', '', '2022-11-05 17:12:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2059, '��ɱ��Ʒ', '', 2, 2, 2209, 'activity', 'ep:basketball', 'mall/promotion/seckill/activity/index', 'PromotionSeckillActivity', 0, '1', '1', '1', '', '2022-11-06 22:24:49', '1', '2023-06-24 18:57:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2060, '��ɱ���ѯ', 'promotion:seckill-activity:query', 3, 1, 2059, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2061, '��ɱ�����', 'promotion:seckill-activity:create', 3, 2, 2059, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2062, '��ɱ�����', 'promotion:seckill-activity:update', 3, 3, 2059, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2063, '��ɱ�ɾ��', 'promotion:seckill-activity:delete', 3, 4, 2059, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-06 22:24:49', '', '2022-11-06 22:24:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2066, '��ɱʱ��', '', 2, 1, 2209, 'config', 'ep:baseball', 'mall/promotion/seckill/config/index', 'PromotionSeckillConfig', 0, '1', '1', '1', '', '2022-11-15 19:46:50', '1', '2023-06-24 18:57:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2067, '��ɱʱ�β�ѯ', 'promotion:seckill-config:query', 3, 1, 2066, '', '', '', '', 0, '1', '1', '1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:50:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2068, '��ɱʱ�δ���', 'promotion:seckill-config:create', 3, 2, 2066, '', '', '', '', 0, '1', '1', '1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:48:39', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2069, '��ɱʱ�θ���', 'promotion:seckill-config:update', 3, 3, 2066, '', '', '', '', 0, '1', '1', '1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:50:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2070, '��ɱʱ��ɾ��', 'promotion:seckill-config:delete', 3, 4, 2066, '', '', '', '', 0, '1', '1', '1', '', '2022-11-15 19:46:51', '1', '2023-06-24 17:50:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2072, '��������', '', 1, 65, 2362, 'trade', 'ep:eleme', NULL, NULL, 0, '1', '1', '1', '1', '2022-11-19 18:57:19', '1', '2023-09-30 11:54:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2073, '�ۺ��˿�', '', 2, 2, 2072, 'after-sale', 'ep:refrigerator', 'mall/trade/afterSale/index', 'TradeAfterSale', 0, '1', '1', '1', '', '2022-11-19 20:15:32', '1', '2023-10-01 21:42:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2074, '�ۺ��ѯ', 'trade:after-sale:query', 3, 1, 2073, '', '', '', NULL, 0, '1', '1', '1', '', '2022-11-19 20:15:33', '1', '2022-12-10 21:04:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2075, '��ɱ��ر�', 'promotion:seckill-activity:close', 3, 5, 2059, '', '', '', '', 0, '1', '1', '1', '1', '2022-11-28 20:20:15', '1', '2023-10-03 18:34:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2076, '�����б�', '', 2, 1, 2072, 'order', 'ep:list', 'mall/trade/order/index', 'TradeOrder', 0, '1', '1', '1', '1', '2022-12-10 21:05:44', '1', '2023-10-01 21:42:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2083, '��������', '', 2, 14, 1, 'area', 'fa:map-marker', 'system/area/index', 'SystemArea', 0, '1', '1', '1', '1', '2022-12-23 17:35:05', '1', '2024-02-29 08:50:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2084, '���ںŹ���', '', 1, 100, 0, '/mp', 'ep:compass', NULL, NULL, 0, '1', '1', '1', '1', '2023-01-01 20:11:04', '1', '2024-02-29 12:39:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2085, '�˺Ź���', '', 2, 1, 2084, 'account', 'fa:user', 'mp/account/index', 'MpAccount', 0, '1', '1', '1', '1', '2023-01-01 20:13:31', '1', '2024-02-29 12:42:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2086, '�����˺�', 'mp:account:create', 3, 1, 2085, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-01 20:21:40', '1', '2023-01-07 17:32:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2087, '�޸��˺�', 'mp:account:update', 3, 2, 2085, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-07 17:32:46', '1', '2023-01-07 17:32:46', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2088, '��ѯ�˺�', 'mp:account:query', 3, 0, 2085, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-07 17:33:07', '1', '2023-01-07 17:33:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2089, 'ɾ���˺�', 'mp:account:delete', 3, 3, 2085, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-07 17:33:21', '1', '2023-01-07 17:33:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2090, '���ɶ�ά��', 'mp:account:qr-code', 3, 4, 2085, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-07 17:33:58', '1', '2023-01-07 17:33:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2091, '��� API ���', 'mp:account:clear-quota', 3, 5, 2085, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-07 18:20:32', '1', '2023-01-07 18:20:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2092, '����ͳ��', 'mp:statistics:query', 2, 2, 2084, 'statistics', 'ep:trend-charts', 'mp/statistics/index', 'MpStatistics', 0, '1', '1', '1', '1', '2023-01-07 20:17:36', '1', '2024-02-29 12:42:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2093, '��ǩ����', '', 2, 3, 2084, 'tag', 'ep:collection-tag', 'mp/tag/index', 'MpTag', 0, '1', '1', '1', '1', '2023-01-08 11:37:32', '1', '2024-02-29 12:42:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2094, '��ѯ��ǩ', 'mp:tag:query', 3, 0, 2093, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 11:59:03', '1', '2023-01-08 11:59:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2095, '������ǩ', 'mp:tag:create', 3, 1, 2093, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 11:59:23', '1', '2023-01-08 11:59:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2096, '�޸ı�ǩ', 'mp:tag:update', 3, 2, 2093, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 11:59:41', '1', '2023-01-08 11:59:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2097, 'ɾ����ǩ', 'mp:tag:delete', 3, 3, 2093, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 12:00:04', '1', '2023-01-08 12:00:13', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2098, 'ͬ����ǩ', 'mp:tag:sync', 3, 4, 2093, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 12:00:29', '1', '2023-01-08 12:00:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2099, '��˿����', '', 2, 4, 2084, 'user', 'fa:user-secret', 'mp/user/index', 'MpUser', 0, '1', '1', '1', '1', '2023-01-08 16:51:20', '1', '2024-02-29 12:42:39', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2100, '��ѯ��˿', 'mp:user:query', 3, 0, 2099, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 17:16:59', '1', '2023-01-08 17:17:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2101, '�޸ķ�˿', 'mp:user:update', 3, 1, 2099, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 17:17:11', '1', '2023-01-08 17:17:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2102, 'ͬ����˿', 'mp:user:sync', 3, 2, 2099, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-08 17:17:40', '1', '2023-01-08 17:17:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2103, '��Ϣ����', '', 2, 5, 2084, 'message', 'ep:message', 'mp/message/index', 'MpMessage', 0, '1', '1', '1', '1', '2023-01-08 18:44:19', '1', '2024-02-29 12:42:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2104, 'ͼ�ķ����¼', '', 2, 10, 2084, 'free-publish', 'ep:edit-pen', 'mp/freePublish/index', 'MpFreePublish', 0, '1', '1', '1', '1', '2023-01-13 00:30:50', '1', '2024-02-29 12:43:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2105, '��ѯ�����б�', 'mp:free-publish:query', 3, 1, 2104, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-13 07:19:17', '1', '2023-01-13 07:19:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2106, '�����ݸ�', 'mp:free-publish:submit', 3, 2, 2104, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-13 07:19:46', '1', '2023-01-13 07:19:46', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2107, 'ɾ��������¼', 'mp:free-publish:delete', 3, 3, 2104, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-13 07:20:01', '1', '2023-01-13 07:20:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2108, 'ͼ�Ĳݸ���', '', 2, 9, 2084, 'draft', 'ep:edit', 'mp/draft/index', 'MpDraft', 0, '1', '1', '1', '1', '2023-01-13 07:40:21', '1', '2024-02-29 12:43:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2109, '�½��ݸ�', 'mp:draft:create', 3, 1, 2108, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-13 23:15:30', '1', '2023-01-13 23:15:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2110, '�޸Ĳݸ�', 'mp:draft:update', 3, 2, 2108, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 10:08:47', '1', '2023-01-14 10:08:47', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2111, '��ѯ�ݸ�', 'mp:draft:query', 3, 0, 2108, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 10:09:01', '1', '2023-01-14 10:09:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2112, 'ɾ���ݸ�', 'mp:draft:delete', 3, 3, 2108, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 10:09:19', '1', '2023-01-14 10:09:19', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2113, '�زĹ���', '', 2, 8, 2084, 'material', 'ep:basketball', 'mp/material/index', 'MpMaterial', 0, '1', '1', '1', '1', '2023-01-14 14:12:07', '1', '2024-02-29 12:43:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2114, '�ϴ���ʱ�ز�', 'mp:material:upload-temporary', 3, 1, 2113, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 15:33:55', '1', '2023-01-14 15:33:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2115, '�ϴ������ز�', 'mp:material:upload-permanent', 3, 2, 2113, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 15:34:14', '1', '2023-01-14 15:34:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2116, 'ɾ���ز�', 'mp:material:delete', 3, 3, 2113, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 15:35:37', '1', '2023-01-14 15:35:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2117, '�ϴ�ͼ��ͼƬ', 'mp:material:upload-news-image', 3, 4, 2113, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 15:36:31', '1', '2023-01-14 15:36:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2118, '��ѯ�ز�', 'mp:material:query', 3, 5, 2113, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-14 15:39:22', '1', '2023-01-14 15:39:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2119, '�˵�����', '', 2, 6, 2084, 'menu', 'ep:menu', 'mp/menu/index', 'MpMenu', 0, '1', '1', '1', '1', '2023-01-14 17:43:54', '1', '2024-02-29 12:42:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2120, '�Զ��ظ�', '', 2, 7, 2084, 'auto-reply', 'fa-solid:republican', 'mp/autoReply/index', 'MpAutoReply', 0, '1', '1', '1', '1', '2023-01-15 22:13:09', '1', '2024-02-29 12:43:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2121, '��ѯ�ظ�', 'mp:auto-reply:query', 3, 0, 2120, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-16 22:28:41', '1', '2023-01-16 22:28:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2122, '�����ظ�', 'mp:auto-reply:create', 3, 1, 2120, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-16 22:28:54', '1', '2023-01-16 22:28:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2123, '�޸Ļظ�', 'mp:auto-reply:update', 3, 2, 2120, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-16 22:29:05', '1', '2023-01-16 22:29:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2124, 'ɾ���ظ�', 'mp:auto-reply:delete', 3, 3, 2120, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-16 22:29:34', '1', '2023-01-16 22:29:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2125, '��ѯ�˵�', 'mp:menu:query', 3, 0, 2119, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-17 23:05:41', '1', '2023-01-17 23:05:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2126, '����˵�', 'mp:menu:save', 3, 1, 2119, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-17 23:06:01', '1', '2023-01-17 23:06:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2127, 'ɾ���˵�', 'mp:menu:delete', 3, 2, 2119, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-17 23:06:16', '1', '2023-01-17 23:06:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2128, '��ѯ��Ϣ', 'mp:message:query', 3, 0, 2103, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-17 23:07:14', '1', '2023-01-17 23:07:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2129, '������Ϣ', 'mp:message:send', 3, 1, 2103, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-17 23:07:26', '1', '2023-01-17 23:07:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2130, '�������', '', 2, 2, 2739, 'mail', 'fa-solid:mail-bulk', NULL, NULL, 0, '1', '1', '1', '1', '2023-01-25 17:27:44', '1', '2024-04-22 23:56:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2131, '�����˺�', '', 2, 0, 2130, 'mail-account', 'fa:universal-access', 'system/mail/account/index', 'SystemMailAccount', 0, '1', '1', '1', '', '2023-01-25 09:33:48', '1', '2024-02-29 08:48:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2132, '�˺Ų�ѯ', 'system:mail-account:query', 3, 1, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2133, '�˺Ŵ���', 'system:mail-account:create', 3, 2, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2134, '�˺Ÿ���', 'system:mail-account:update', 3, 3, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2135, '�˺�ɾ��', 'system:mail-account:delete', 3, 4, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2136, '�ʼ�ģ��', '', 2, 0, 2130, 'mail-template', 'fa:tag', 'system/mail/template/index', 'SystemMailTemplate', 0, '1', '1', '1', '', '2023-01-25 12:05:31', '1', '2024-02-29 08:48:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2137, 'ģ���ѯ', 'system:mail-template:query', 3, 1, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2138, 'ģ�洴��', 'system:mail-template:create', 3, 2, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2139, 'ģ�����', 'system:mail-template:update', 3, 3, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2140, 'ģ��ɾ��', 'system:mail-template:delete', 3, 4, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2141, '�ʼ���¼', '', 2, 0, 2130, 'mail-log', 'fa:edit', 'system/mail/log/index', 'SystemMailLog', 0, '1', '1', '1', '', '2023-01-26 02:16:50', '1', '2024-02-29 08:48:51', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2142, '��־��ѯ', 'system:mail-log:query', 3, 1, 2141, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-26 02:16:50', '', '2023-01-26 02:16:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2143, '���Ͳ����ʼ�', 'system:mail-template:send-mail', 3, 5, 2136, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-26 23:29:15', '1', '2023-01-26 23:29:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2144, 'վ���Ź���', '', 1, 3, 2739, 'notify', 'ep:message-box', NULL, NULL, 0, '1', '1', '1', '1', '2023-01-28 10:25:18', '1', '2024-04-22 23:56:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2145, 'ģ�����', '', 2, 0, 2144, 'notify-template', 'fa:archive', 'system/notify/template/index', 'SystemNotifyTemplate', 0, '1', '1', '1', '', '2023-01-28 02:26:42', '1', '2024-02-29 08:49:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2146, 'վ����ģ���ѯ', 'system:notify-template:query', 3, 1, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2147, 'վ����ģ�崴��', 'system:notify-template:create', 3, 2, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2148, 'վ����ģ�����', 'system:notify-template:update', 3, 3, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2149, 'վ����ģ��ɾ��', 'system:notify-template:delete', 3, 4, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2150, '���Ͳ���վ����', 'system:notify-template:send-notify', 3, 5, 2145, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-28 10:54:43', '1', '2023-01-28 10:54:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2151, '��Ϣ��¼', '', 2, 0, 2144, 'notify-message', 'fa:edit', 'system/notify/message/index', 'SystemNotifyMessage', 0, '1', '1', '1', '', '2023-01-28 04:28:22', '1', '2024-02-29 08:49:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2152, 'վ������Ϣ��ѯ', 'system:notify-message:query', 3, 1, 2151, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 04:28:22', '', '2023-01-28 04:28:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2153, '���������', '', 2, 2, 1281, 'go-view', 'fa:area-chart', 'report/goview/index', 'JimuReport', 0, '1', '1', '1', '1', '2023-02-07 00:03:19', '1', '2024-02-29 12:34:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2154, '������Ŀ', 'report:go-view-project:create', 3, 1, 2153, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-02-07 19:25:14', '1', '2023-02-07 19:25:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2155, '������Ŀ', 'report:go-view-project:update', 3, 2, 2153, '', '', '', '', 0, '1', '1', '1', '1', '2023-02-07 19:25:34', '1', '2024-04-24 20:01:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2156, '��ѯ��Ŀ', 'report:go-view-project:query', 3, 0, 2153, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-02-07 19:25:53', '1', '2023-02-07 19:25:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2157, 'ʹ�� SQL ��ѯ����', 'report:go-view-data:get-by-sql', 3, 3, 2153, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-02-07 19:26:15', '1', '2023-02-07 19:26:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2158, 'ʹ�� HTTP ��ѯ����', 'report:go-view-data:get-by-http', 3, 4, 2153, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-02-07 19:26:35', '1', '2023-02-07 19:26:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2159, 'Boot �����ĵ�', '', 1, 1, 0, 'https://doc.iocoder.cn/', 'ep:document', NULL, NULL, 0, '1', '1', '1', '1', '2023-02-10 22:46:28', '1', '2023-12-02 21:32:20', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2160, 'Cloud �����ĵ�', '', 1, 2, 0, 'https://cloud.iocoder.cn', 'ep:document-copy', NULL, NULL, 0, '1', '1', '1', '1', '2023-02-10 22:47:07', '1', '2023-12-02 21:32:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2161, '����ʾ��', '', 1, 99, 1117, 'demo', 'fa-solid:dragon', 'pay/demo/index', NULL, 0, '1', '1', '1', '', '2023-02-11 14:21:42', '1', '2024-01-18 23:50:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2162, '��Ʒ����', 'product:spu:export', 3, 5, 2014, '', '', '', NULL, 0, '1', '1', '1', '', '2022-07-30 14:22:58', '', '2022-07-30 14:22:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2164, '���͹���', '', 1, 3, 2072, 'delivery', 'ep:shopping-cart', '', '', 0, '1', '1', '1', '1', '2023-05-18 09:18:02', '1', '2023-09-28 10:58:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2165, '��ݷ���', '', 1, 0, 2164, 'express', 'ep:bicycle', '', '', 0, '1', '1', '1', '1', '2023-05-18 09:22:06', '1', '2023-08-30 21:02:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2166, '�ŵ�����', '', 1, 1, 2164, 'pick-up-store', 'ep:add-location', '', '', 0, '1', '1', '1', '1', '2023-05-18 09:23:14', '1', '2023-08-30 21:03:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2167, '��ݹ�˾', '', 2, 0, 2165, 'express', 'ep:compass', 'mall/trade/delivery/express/index', 'Express', 0, '1', '1', '1', '1', '2023-05-18 09:27:21', '1', '2023-08-30 21:02:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2168, '��ݹ�˾��ѯ', 'trade:delivery:express:query', 3, 1, 2167, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2169, '��ݹ�˾����', 'trade:delivery:express:create', 3, 2, 2167, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2170, '��ݹ�˾����', 'trade:delivery:express:update', 3, 3, 2167, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2171, '��ݹ�˾ɾ��', 'trade:delivery:express:delete', 3, 4, 2167, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2172, '��ݹ�˾����', 'trade:delivery:express:export', 3, 5, 2167, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-18 09:37:53', '', '2023-05-18 09:37:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2173, '�˷�ģ��', 'trade:delivery:express-template:query', 2, 1, 2165, 'express-template', 'ep:coordinate', 'mall/trade/delivery/expressTemplate/index', 'ExpressTemplate', 0, '1', '1', '1', '1', '2023-05-20 06:48:10', '1', '2023-08-30 21:03:13', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2174, '����˷�ģ���ѯ', 'trade:delivery:express-template:query', 3, 1, 2173, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2175, '����˷�ģ�崴��', 'trade:delivery:express-template:create', 3, 2, 2173, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2176, '����˷�ģ�����', 'trade:delivery:express-template:update', 3, 3, 2173, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2177, '����˷�ģ��ɾ��', 'trade:delivery:express-template:delete', 3, 4, 2173, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2178, '����˷�ģ�嵼��', 'trade:delivery:express-template:export', 3, 5, 2173, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-20 06:49:53', '', '2023-05-20 06:49:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2179, '�ŵ����', '', 2, 1, 2166, 'pick-up-store', 'ep:basketball', 'mall/trade/delivery/pickUpStore/index', 'PickUpStore', 0, '1', '1', '1', '1', '2023-05-25 10:50:00', '1', '2023-08-30 21:03:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2180, '�����ŵ��ѯ', 'trade:delivery:pick-up-store:query', 3, 1, 2179, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2181, '�����ŵ괴��', 'trade:delivery:pick-up-store:create', 3, 2, 2179, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2182, '�����ŵ����', 'trade:delivery:pick-up-store:update', 3, 3, 2179, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2183, '�����ŵ�ɾ��', 'trade:delivery:pick-up-store:delete', 3, 4, 2179, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2184, '�����ŵ굼��', 'trade:delivery:pick-up-store:export', 3, 5, 2179, '', '', '', NULL, 0, '1', '1', '1', '', '2023-05-25 10:53:29', '', '2023-05-25 10:53:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2209, '��ɱ�', '', 2, 3, 2030, 'seckill', 'ep:place', '', '', 0, '1', '1', '1', '1', '2023-06-24 17:39:13', '1', '2023-06-24 18:55:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2262, '��Ա����', '', 1, 55, 0, '/member', 'ep:bicycle', NULL, NULL, 0, '1', '1', '1', '1', '2023-06-10 00:42:03', '1', '2023-08-20 09:23:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2275, '��Ա����', '', 2, 0, 2262, 'config', 'fa:archive', 'member/config/index', 'MemberConfig', 0, '1', '1', '1', '', '2023-06-10 02:07:44', '1', '2023-10-01 23:41:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2276, '��Ա���ò�ѯ', 'member:config:query', 3, 1, 2275, '', '', '', '', 0, '1', '1', '1', '', '2023-06-10 02:07:44', '1', '2024-04-24 19:48:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2277, '��Ա���ñ���', 'member:config:save', 3, 2, 2275, '', '', '', '', 0, '1', '1', '1', '', '2023-06-10 02:07:44', '1', '2024-04-24 19:49:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2281, 'ǩ������', '', 2, 2, 2300, 'config', 'ep:calendar', 'member/signin/config/index', 'SignInConfig', 0, '1', '1', '1', '', '2023-06-10 03:26:12', '1', '2023-08-20 19:25:51', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2282, '����ǩ�������ѯ', 'point:sign-in-config:query', 3, 1, 2281, '', '', '', NULL, 0, '1', '1', '1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2283, '����ǩ�����򴴽�', 'point:sign-in-config:create', 3, 2, 2281, '', '', '', NULL, 0, '1', '1', '1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2284, '����ǩ���������', 'point:sign-in-config:update', 3, 3, 2281, '', '', '', NULL, 0, '1', '1', '1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2285, '����ǩ������ɾ��', 'point:sign-in-config:delete', 3, 4, 2281, '', '', '', NULL, 0, '1', '1', '1', '', '2023-06-10 03:26:12', '', '2023-06-10 03:26:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2287, '��Ա����', '', 2, 10, 2262, 'record', 'fa:asterisk', 'member/point/record/index', 'PointRecord', 0, '1', '1', '1', '', '2023-06-10 04:18:50', '1', '2023-10-01 23:42:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2288, '�û����ּ�¼��ѯ', 'point:record:query', 3, 1, 2287, '', '', '', NULL, 0, '1', '1', '1', '', '2023-06-10 04:18:50', '', '2023-06-10 04:18:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2293, 'ǩ����¼', '', 2, 3, 2300, 'record', 'ep:chicken', 'member/signin/record/index', 'SignInRecord', 0, '1', '1', '1', '', '2023-06-10 04:48:22', '1', '2023-08-20 19:26:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2294, '�û�ǩ�����ֲ�ѯ', 'point:sign-in-record:query', 3, 1, 2293, '', '', '', NULL, 0, '1', '1', '1', '', '2023-06-10 04:48:22', '', '2023-06-10 04:48:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2297, '�û�ǩ������ɾ��', 'point:sign-in-record:delete', 3, 4, 2293, '', '', '', NULL, 0, '1', '1', '1', '', '2023-06-10 04:48:22', '', '2023-06-10 04:48:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2300, '��Աǩ��', '', 1, 11, 2262, 'signin', 'ep:alarm-clock', '', '', 0, '1', '1', '1', '1', '2023-06-27 22:49:53', '1', '2023-08-20 09:23:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2301, '�ص�֪ͨ', '', 2, 5, 1117, 'notify', 'ep:mute-notification', 'pay/notify/index', 'PayNotify', 0, '1', '1', '1', '', '2023-07-20 04:41:32', '1', '2024-01-18 23:56:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2302, '֧��֪ͨ��ѯ', 'pay:notify:query', 3, 1, 2301, '', '', '', NULL, 0, '1', '1', '1', '', '2023-07-20 04:41:32', '', '2023-07-20 04:41:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2303, 'ƴ�Ż', '', 2, 3, 2030, 'combination', 'fa:group', '', '', 0, '1', '1', '1', '1', '2023-08-12 17:19:54', '1', '2023-08-12 17:20:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2304, 'ƴ����Ʒ', '', 2, 1, 2303, 'acitivity', 'ep:apple', 'mall/promotion/combination/activity/index', 'PromotionCombinationActivity', 0, '1', '1', '1', '1', '2023-08-12 17:22:03', '1', '2023-08-12 17:22:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2305, 'ƴ�Ż��ѯ', 'promotion:combination-activity:query', 3, 1, 2304, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-12 17:54:32', '1', '2023-11-24 11:57:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2306, 'ƴ�Ż����', 'promotion:combination-activity:create', 3, 2, 2304, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-12 17:54:49', '1', '2023-08-12 17:54:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2307, 'ƴ�Ż����', 'promotion:combination-activity:update', 3, 3, 2304, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-12 17:55:04', '1', '2023-08-12 17:55:04', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2308, 'ƴ�Żɾ��', 'promotion:combination-activity:delete', 3, 4, 2304, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-12 17:55:23', '1', '2023-08-12 17:55:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2309, 'ƴ�Ż�ر�', 'promotion:combination-activity:close', 3, 5, 2304, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-12 17:55:37', '1', '2023-10-06 10:51:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2310, '���ۻ', '', 2, 4, 2030, 'bargain', 'ep:box', '', '', 0, '1', '1', '1', '1', '2023-08-13 00:27:25', '1', '2023-08-13 00:27:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2311, '������Ʒ', '', 2, 1, 2310, 'activity', 'ep:burger', 'mall/promotion/bargain/activity/index', 'PromotionBargainActivity', 0, '1', '1', '1', '1', '2023-08-13 00:28:49', '1', '2023-10-05 01:16:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2312, '���ۻ��ѯ', 'promotion:bargain-activity:query', 3, 1, 2311, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-13 00:32:30', '1', '2023-08-13 00:32:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2313, '���ۻ����', 'promotion:bargain-activity:create', 3, 2, 2311, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-13 00:32:44', '1', '2023-08-13 00:32:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2314, '���ۻ����', 'promotion:bargain-activity:update', 3, 3, 2311, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-13 00:32:55', '1', '2023-08-13 00:32:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2315, '���ۻɾ��', 'promotion:bargain-activity:delete', 3, 4, 2311, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-13 00:34:50', '1', '2023-08-13 00:34:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2316, '���ۻ�ر�', 'promotion:bargain-activity:close', 3, 5, 2311, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-13 00:35:02', '1', '2023-08-13 00:35:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2317, '��Ա����', '', 2, 0, 2262, 'user', 'ep:avatar', 'member/user/index', 'MemberUser', 0, '1', '1', '1', '', '2023-08-19 04:12:15', '1', '2023-08-24 00:50:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2318, '��Ա�û���ѯ', 'member:user:query', 3, 1, 2317, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-19 04:12:15', '', '2023-08-19 04:12:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2319, '��Ա�û�����', 'member:user:update', 3, 3, 2317, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-19 04:12:15', '', '2023-08-19 04:12:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2320, '��Ա��ǩ', '', 2, 1, 2262, 'tag', 'ep:collection-tag', 'member/tag/index', 'MemberTag', 0, '1', '1', '1', '', '2023-08-20 01:03:08', '1', '2023-08-20 09:23:19', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2321, '��Ա��ǩ��ѯ', 'member:tag:query', 3, 1, 2320, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2322, '��Ա��ǩ����', 'member:tag:create', 3, 2, 2320, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2323, '��Ա��ǩ����', 'member:tag:update', 3, 3, 2320, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2324, '��Ա��ǩɾ��', 'member:tag:delete', 3, 4, 2320, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-20 01:03:08', '', '2023-08-20 01:03:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2325, '��Ա�ȼ�', '', 2, 2, 2262, 'level', 'fa:level-up', 'member/level/index', 'MemberLevel', 0, '1', '1', '1', '', '2023-08-22 12:41:01', '1', '2023-08-22 21:47:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2326, '��Ա�ȼ���ѯ', 'member:level:query', 3, 1, 2325, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2327, '��Ա�ȼ�����', 'member:level:create', 3, 2, 2325, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2328, '��Ա�ȼ�����', 'member:level:update', 3, 3, 2325, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2329, '��Ա�ȼ�ɾ��', 'member:level:delete', 3, 4, 2325, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 12:41:02', '', '2023-08-22 12:41:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2330, '��Ա����', '', 2, 3, 2262, 'group', 'fa:group', 'member/group/index', 'MemberGroup', 0, '1', '1', '1', '', '2023-08-22 13:50:06', '1', '2023-10-01 23:42:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2331, '�û������ѯ', 'member:group:query', 3, 1, 2330, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2332, '�û����鴴��', 'member:group:create', 3, 2, 2330, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2333, '�û��������', 'member:group:update', 3, 3, 2330, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2334, '�û�����ɾ��', 'member:group:delete', 3, 4, 2330, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-22 13:50:06', '', '2023-08-22 13:50:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2335, '�û��ȼ��޸�', 'member:user:update-level', 3, 5, 2317, '', '', '', NULL, 0, '1', '1', '1', '', '2023-08-23 16:49:05', '', '2023-08-23 16:50:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2336, '��Ʒ����', '', 2, 5, 2000, 'comment', 'ep:comment', 'mall/product/comment/index', 'ProductComment', 0, '1', '1', '1', '1', '2023-08-26 11:03:00', '1', '2023-08-26 11:03:38', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2337, '���۲�ѯ', 'product:comment:query', 3, 1, 2336, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-26 11:04:01', '1', '2023-08-26 11:04:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2338, '�������', 'product:comment:create', 3, 2, 2336, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-26 11:04:23', '1', '2023-08-26 11:08:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2339, '�̼һظ�', 'product:comment:update', 3, 3, 2336, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-26 11:04:37', '1', '2023-08-26 11:04:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2340, '��������', 'product:comment:update', 3, 4, 2336, '', '', '', '', 0, '1', '1', '1', '1', '2023-08-26 11:04:55', '1', '2023-08-26 11:04:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2341, '�Ż݄�����', 'promotion:coupon:send', 3, 2, 2038, '', '', '', '', 0, '1', '1', '1', '1', '2023-09-02 00:03:14', '1', '2023-09-02 00:03:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2342, '��������', '', 2, 0, 2072, 'config', 'ep:setting', 'mall/trade/config/index', 'TradeConfig', 0, '1', '1', '1', '', '2023-09-28 02:46:22', '1', '2024-02-26 20:30:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2343, '�����������ò�ѯ', 'trade:config:query', 3, 1, 2342, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2344, '�����������ñ���', 'trade:config:save', 3, 2, 2342, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2345, '��������', '', 1, 4, 2072, 'brokerage', 'fa-solid:project-diagram', '', '', 0, '1', '1', '1', '', '2023-09-28 02:46:22', '1', '2023-09-28 10:58:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2346, '�����û�', '', 2, 0, 2345, 'brokerage-user', 'fa-solid:user-tie', 'mall/trade/brokerage/user/index', 'TradeBrokerageUser', 0, '1', '1', '1', '', '2023-09-28 02:46:22', '1', '2024-02-26 20:33:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2347, '�����û���ѯ', 'trade:brokerage-user:query', 3, 1, 2346, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2348, '�����û��ƹ��˲�ѯ', 'trade:brokerage-user:user-query', 3, 2, 2346, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2349, '�����û��ƹ㶩����ѯ', 'trade:brokerage-user:order-query', 3, 3, 2346, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2350, '�����û��޸��ƹ��ʸ�', 'trade:brokerage-user:update-brokerage-enable', 3, 4, 2346, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2351, '�����û��޸��ƹ�Ա', 'trade:brokerage-user:update-bind-user', 3, 5, 2346, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2352, '�����û�����ƹ�Ա', 'trade:brokerage-user:clear-bind-user', 3, 6, 2346, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2353, 'Ӷ���¼', '', 2, 1, 2345, 'brokerage-record', 'fa:money', 'mall/trade/brokerage/record/index', 'TradeBrokerageRecord', 0, '1', '1', '1', '', '2023-09-28 02:46:22', '1', '2024-02-26 20:33:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2354, 'Ӷ���¼��ѯ', 'trade:brokerage-record:query', 3, 1, 2353, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2355, 'Ӷ������', '', 2, 2, 2345, 'brokerage-withdraw', 'fa:credit-card', 'mall/trade/brokerage/withdraw/index', 'TradeBrokerageWithdraw', 0, '1', '1', '1', '', '2023-09-28 02:46:22', '1', '2024-02-26 20:33:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2356, 'Ӷ�����ֲ�ѯ', 'trade:brokerage-withdraw:query', 3, 1, 2355, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2357, 'Ӷ���������', 'trade:brokerage-withdraw:audit', 3, 2, 2355, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-28 02:46:22', '', '2023-09-28 02:46:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2358, 'ͳ������', '', 1, 75, 2362, 'statistics', 'ep:data-line', '', '', 0, '1', '1', '1', '', '2023-09-30 03:22:40', '1', '2023-09-30 11:54:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2359, '����ͳ��', '', 2, 4, 2358, 'trade', 'fa-solid:credit-card', 'mall/statistics/trade/index', 'TradeStatistics', 0, '1', '1', '1', '', '2023-09-30 03:22:40', '1', '2024-02-26 20:42:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2360, '����ͳ�Ʋ�ѯ', 'statistics:trade:query', 3, 1, 2359, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-30 03:22:40', '', '2023-09-30 03:22:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2361, '����ͳ�Ƶ���', 'statistics:trade:export', 3, 2, 2359, '', '', '', NULL, 0, '1', '1', '1', '', '2023-09-30 03:22:40', '', '2023-09-30 03:22:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2362, '�̳�ϵͳ', '', 1, 59, 0, '/mall', 'ep:shop', '', '', 0, '1', '1', '1', '1', '2023-09-30 11:52:02', '1', '2023-09-30 11:52:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2363, '�û������޸�', 'member:user:update-point', 3, 6, 2317, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-01 14:39:43', '', '2023-10-01 14:39:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2364, '�û�����޸�', 'member:user:update-balance', 3, 7, 2317, '', '', '', '', 0, '1', '1', '1', '', '2023-10-01 14:39:43', '1', '2023-10-01 22:42:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2365, '�Ż݄�', '', 1, 2, 2030, 'coupon', 'fa-solid:disease', '', '', 0, '1', '1', '1', '1', '2023-10-03 12:39:15', '1', '2023-10-05 00:16:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2366, '���ۼ�¼', '', 2, 2, 2310, 'record', 'ep:list', 'mall/promotion/bargain/record/index', 'PromotionBargainRecord', 0, '1', '1', '1', '', '2023-10-05 02:49:06', '1', '2023-10-05 10:50:38', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2367, '���ۼ�¼��ѯ', 'promotion:bargain-record:query', 3, 1, 2366, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-05 02:49:06', '', '2023-10-05 02:49:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2368, '������¼��ѯ', 'promotion:bargain-help:query', 3, 2, 2366, '', '', '', '', 0, '1', '1', '1', '1', '2023-10-05 12:27:49', '1', '2023-10-05 12:27:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2369, 'ƴ�ż�¼', 'promotion:combination-record:query', 2, 2, 2303, 'record', 'ep:avatar', 'mall/promotion/combination/record/index.vue', 'PromotionCombinationRecord', 0, '1', '1', '1', '1', '2023-10-08 07:10:22', '1', '2023-10-08 07:34:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2374, '��Աͳ��', '', 2, 2, 2358, 'member', 'ep:avatar', 'mall/statistics/member/index', 'MemberStatistics', 0, '1', '1', '1', '', '2023-10-11 04:39:24', '1', '2024-02-26 20:41:46', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2375, '��Աͳ�Ʋ�ѯ', 'statistics:member:query', 3, 1, 2374, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-11 04:39:24', '', '2023-10-11 04:39:24', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2376, '��������', 'trade:order:pick-up', 3, 10, 2076, '', '', '', '', 0, '1', '1', '1', '1', '2023-10-14 17:11:58', '1', '2023-10-14 17:11:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2377, '���·���', '', 2, 0, 2387, 'article/category', 'fa:certificate', 'mall/promotion/article/category/index', 'ArticleCategory', 0, '1', '1', '1', '', '2023-10-16 01:26:18', '1', '2023-10-16 09:38:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2378, '�����ѯ', 'promotion:article-category:query', 3, 1, 2377, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2379, '���ഴ��', 'promotion:article-category:create', 3, 2, 2377, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2380, '�������', 'promotion:article-category:update', 3, 3, 2377, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2381, '����ɾ��', 'promotion:article-category:delete', 3, 4, 2377, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2382, '�����б�', '', 2, 2, 2387, 'article', 'ep:connection', 'mall/promotion/article/index', 'Article', 0, '1', '1', '1', '', '2023-10-16 01:26:18', '1', '2023-10-16 09:41:19', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2383, '���¹����ѯ', 'promotion:article:query', 3, 1, 2382, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2384, '���¹�����', 'promotion:article:create', 3, 2, 2382, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2385, '���¹������', 'promotion:article:update', 3, 3, 2382, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2386, '���¹���ɾ��', 'promotion:article:delete', 3, 4, 2382, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-16 01:26:18', '', '2023-10-16 01:26:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2387, '���ݹ���', '', 1, 1, 2030, 'content', 'ep:collection', '', '', 0, '1', '1', '1', '1', '2023-10-16 09:37:31', '1', '2023-10-16 09:37:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2388, '�̳���ҳ', '', 2, 1, 2362, 'home', 'ep:home-filled', 'mall/home/index', 'MallHome', 0, '1', '1', '1', '', '2023-10-16 12:10:33', '', '2023-10-16 12:10:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2389, '��������', '', 2, 2, 2166, 'pick-up-order', 'ep:list', 'mall/trade/delivery/pickUpOrder/index', 'PickUpOrder', 0, '1', '1', '1', '', '2023-10-19 16:09:51', '', '2023-10-19 16:09:51', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2390, '�Żݻ', '', 1, 99, 2030, 'youhui', 'ep:aim', '', '', 0, '1', '1', '1', '1', '2023-10-21 19:23:49', '1', '2023-10-21 19:23:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2391, '�ͻ�����', '', 2, 10, 2397, 'customer', 'fa:address-book-o', 'crm/customer/index', 'CrmCustomer', 0, '1', '1', '1', '', '2023-10-29 09:04:21', '1', '2024-02-17 17:13:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2392, '�ͻ���ѯ', 'crm:customer:query', 3, 1, 2391, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2393, '�ͻ�����', 'crm:customer:create', 3, 2, 2391, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2394, '�ͻ�����', 'crm:customer:update', 3, 3, 2391, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2395, '�ͻ�ɾ��', 'crm:customer:delete', 3, 4, 2391, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2396, '�ͻ�����', 'crm:customer:export', 3, 5, 2391, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 09:04:21', '', '2023-10-29 09:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2397, 'CRM ϵͳ', '', 1, 200, 0, '/crm', 'ep:avatar', '', '', 0, '1', '1', '1', '1', '2023-10-29 17:08:30', '1', '2024-02-04 15:37:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2398, '��ͬ����', '', 2, 50, 2397, 'contract', 'ep:notebook', 'crm/contract/index', 'CrmContract', 0, '1', '1', '1', '', '2023-10-29 10:50:41', '1', '2024-02-17 17:15:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2399, '��ͬ��ѯ', 'crm:contract:query', 3, 1, 2398, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2400, '��ͬ����', 'crm:contract:create', 3, 2, 2398, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2401, '��ͬ����', 'crm:contract:update', 3, 3, 2398, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2402, '��ͬɾ��', 'crm:contract:delete', 3, 4, 2398, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2403, '��ͬ����', 'crm:contract:export', 3, 5, 2398, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 10:50:41', '', '2023-10-29 10:50:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2404, '��������', '', 2, 8, 2397, 'clue', 'fa:pagelines', 'crm/clue/index', 'CrmClue', 0, '1', '1', '1', '', '2023-10-29 11:06:29', '1', '2024-02-17 17:15:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2405, '������ѯ', 'crm:clue:query', 3, 1, 2404, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2406, '��������', 'crm:clue:create', 3, 2, 2404, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2407, '��������', 'crm:clue:update', 3, 3, 2404, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2408, '����ɾ��', 'crm:clue:delete', 3, 4, 2404, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2409, '��������', 'crm:clue:export', 3, 5, 2404, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:06:29', '', '2023-10-29 11:06:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2410, '�̻�����', '', 2, 40, 2397, 'business', 'fa:bus', 'crm/business/index', 'CrmBusiness', 0, '1', '1', '1', '', '2023-10-29 11:12:35', '1', '2024-02-17 17:14:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2411, '�̻���ѯ', 'crm:business:query', 3, 1, 2410, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2412, '�̻�����', 'crm:business:create', 3, 2, 2410, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2413, '�̻�����', 'crm:business:update', 3, 3, 2410, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2414, '�̻�ɾ��', 'crm:business:delete', 3, 4, 2410, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2415, '�̻�����', 'crm:business:export', 3, 5, 2410, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:12:35', '', '2023-10-29 11:12:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2416, '��ϵ�˹���', '', 2, 20, 2397, 'contact', 'fa:address-book-o', 'crm/contact/index', 'CrmContact', 0, '1', '1', '1', '', '2023-10-29 11:14:56', '1', '2024-02-17 17:13:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2417, '��ϵ�˲�ѯ', 'crm:contact:query', 3, 1, 2416, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2418, '��ϵ�˴���', 'crm:contact:create', 3, 2, 2416, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2419, '��ϵ�˸���', 'crm:contact:update', 3, 3, 2416, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2420, '��ϵ��ɾ��', 'crm:contact:delete', 3, 4, 2416, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2421, '��ϵ�˵���', 'crm:contact:export', 3, 5, 2416, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:14:56', '', '2023-10-29 11:14:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2422, '�ؿ����', '', 2, 60, 2397, 'receivable', 'ep:money', 'crm/receivable/index', 'CrmReceivable', 0, '1', '1', '1', '', '2023-10-29 11:18:09', '1', '2024-02-17 17:16:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2423, '�ؿ�����ѯ', 'crm:receivable:query', 3, 1, 2422, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2424, '�ؿ������', 'crm:receivable:create', 3, 2, 2422, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2425, '�ؿ�������', 'crm:receivable:update', 3, 3, 2422, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2426, '�ؿ����ɾ��', 'crm:receivable:delete', 3, 4, 2422, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2427, '�ؿ������', 'crm:receivable:export', 3, 5, 2422, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2428, '�ؿ�ƻ�', '', 2, 61, 2397, 'receivable-plan', 'fa:money', 'crm/receivable/plan/index', 'CrmReceivablePlan', 0, '1', '1', '1', '', '2023-10-29 11:18:09', '1', '2024-02-17 17:16:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2429, '�ؿ�ƻ���ѯ', 'crm:receivable-plan:query', 3, 1, 2428, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2430, '�ؿ�ƻ�����', 'crm:receivable-plan:create', 3, 2, 2428, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2431, '�ؿ�ƻ�����', 'crm:receivable-plan:update', 3, 3, 2428, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2432, '�ؿ�ƻ�ɾ��', 'crm:receivable-plan:delete', 3, 4, 2428, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2433, '�ؿ�ƻ�����', 'crm:receivable-plan:export', 3, 5, 2428, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 11:18:09', '', '2023-10-29 11:18:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2435, '�̳�װ��', '', 2, 20, 2030, 'diy-template', 'fa6-solid:brush', 'mall/promotion/diy/template/index', 'DiyTemplate', 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2436, 'װ��ģ��', '', 2, 1, 2435, 'diy-template', 'fa6-solid:brush', 'mall/promotion/diy/template/index', 'DiyTemplate', 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2437, 'װ��ģ���ѯ', 'promotion:diy-template:query', 3, 1, 2436, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2438, 'װ��ģ�崴��', 'promotion:diy-template:create', 3, 2, 2436, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2439, 'װ��ģ�����', 'promotion:diy-template:update', 3, 3, 2436, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2440, 'װ��ģ��ɾ��', 'promotion:diy-template:delete', 3, 4, 2436, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2441, 'װ��ģ��ʹ��', 'promotion:diy-template:use', 3, 5, 2436, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2442, 'װ��ҳ��', '', 2, 2, 2435, 'diy-page', 'foundation:page-edit', 'mall/promotion/diy/page/index', 'DiyPage', 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2443, 'װ��ҳ���ѯ', 'promotion:diy-page:query', 3, 1, 2442, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:25', '', '2023-10-29 14:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2444, 'װ��ҳ�洴��', 'promotion:diy-page:create', 3, 2, 2442, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:26', '', '2023-10-29 14:19:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2445, 'װ��ҳ�����', 'promotion:diy-page:update', 3, 3, 2442, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:26', '', '2023-10-29 14:19:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2446, 'װ��ҳ��ɾ��', 'promotion:diy-page:delete', 3, 4, 2442, '', '', '', NULL, 0, '1', '1', '1', '', '2023-10-29 14:19:26', '', '2023-10-29 14:19:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2447, '������¼', '', 1, 10, 1, 'social', 'fa:rocket', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:12:01', '1', '2024-02-29 01:14:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2448, '����Ӧ��', '', 2, 1, 2447, 'client', 'ep:set-up', 'views/system/social/client/index.vue', 'SocialClient', 0, '1', '1', '1', '1', '2023-11-04 12:17:19', '1', '2023-11-04 12:17:19', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2449, '����Ӧ�ò�ѯ', 'system:social-client:query', 3, 1, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:43:12', '1', '2023-11-04 12:43:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2450, '����Ӧ�ô���', 'system:social-client:create', 3, 2, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:43:58', '1', '2023-11-04 12:43:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2451, '����Ӧ�ø���', 'system:social-client:update', 3, 3, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:44:27', '1', '2023-11-04 12:44:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2452, '����Ӧ��ɾ��', 'system:social-client:delete', 3, 4, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:44:43', '1', '2023-11-04 12:44:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2453, '�����û�', 'system:social-user:query', 2, 2, 2447, 'user', 'ep:avatar', 'system/social/user/index.vue', 'SocialUser', 0, '1', '1', '1', '1', '2023-11-04 14:01:05', '1', '2023-11-04 14:01:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2472, '���ӱ���Ƕ��', '', 2, 12, 1070, 'demo03-inner', 'fa:power-off', 'infra/demo/demo03/inner/index', 'Demo03StudentInner', 0, '1', '1', '1', '', '2023-11-13 04:39:51', '1', '2023-11-16 23:53:46', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2478, '������ɾ�Ĳ飩', '', 2, 1, 1070, 'demo01-contact', 'ep:bicycle', 'infra/demo/demo01/index', 'Demo01Contact', 0, '1', '1', '1', '', '2023-11-15 14:42:30', '1', '2023-11-16 20:34:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2479, 'ʾ����ϵ�˲�ѯ', 'infra:demo01-contact:query', 3, 1, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2480, 'ʾ����ϵ�˴���', 'infra:demo01-contact:create', 3, 2, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2481, 'ʾ����ϵ�˸���', 'infra:demo01-contact:update', 3, 3, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2482, 'ʾ����ϵ��ɾ��', 'infra:demo01-contact:delete', 3, 4, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2483, 'ʾ����ϵ�˵���', 'infra:demo01-contact:export', 3, 5, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2484, '������ɾ�Ĳ飩', '', 2, 2, 1070, 'demo02-category', 'fa:tree', 'infra/demo/demo02/index', 'Demo02Category', 0, '1', '1', '1', '', '2023-11-16 12:18:27', '1', '2023-11-16 20:35:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2485, 'ʾ�������ѯ', 'infra:demo02-category:query', 3, 1, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2486, 'ʾ�����ഴ��', 'infra:demo02-category:create', 3, 2, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2487, 'ʾ���������', 'infra:demo02-category:update', 3, 3, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2488, 'ʾ������ɾ��', 'infra:demo02-category:delete', 3, 4, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2489, 'ʾ�����ർ��', 'infra:demo02-category:export', 3, 5, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2490, '���ӱ���׼��', '', 2, 10, 1070, 'demo03-normal', 'fa:battery-3', 'infra/demo/demo03/normal/index', 'Demo03StudentNormal', 0, '1', '1', '1', '', '2023-11-16 12:53:37', '1', '2023-11-16 23:10:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2491, 'ѧ����ѯ', 'infra:demo03-student:query', 3, 1, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2492, 'ѧ������', 'infra:demo03-student:create', 3, 2, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2493, 'ѧ������', 'infra:demo03-student:update', 3, 3, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2494, 'ѧ��ɾ��', 'infra:demo03-student:delete', 3, 4, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2495, 'ѧ������', 'infra:demo03-student:export', 3, 5, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2497, '���ӱ�ERP��', '', 2, 11, 1070, 'demo03-erp', 'ep:calendar', 'infra/demo/demo03/erp/index', 'Demo03StudentERP', 0, '1', '1', '1', '', '2023-11-16 15:50:59', '1', '2023-11-17 13:19:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2516, '�ͻ���������', '', 2, 0, 2524, 'customer-pool-config', 'ep:data-analysis', 'crm/customer/poolConfig/index', 'CrmCustomerPoolConfig', 0, '1', '1', '1', '', '2023-11-18 13:33:31', '1', '2024-01-03 19:52:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2517, '�ͻ��������ñ���', 'crm:customer-pool-config:update', 3, 1, 2516, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-18 13:33:31', '', '2023-11-18 13:33:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2518, '�ͻ���������', '', 2, 1, 2524, 'customer-limit-config', 'ep:avatar', 'crm/customer/limitConfig/index', 'CrmCustomerLimitConfig', 0, '1', '1', '1', '', '2023-11-18 13:33:53', '1', '2024-02-24 16:43:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2519, '�ͻ��������ò�ѯ', 'crm:customer-limit-config:query', 3, 1, 2518, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-18 13:33:53', '', '2023-11-18 13:33:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2520, '�ͻ��������ô���', 'crm:customer-limit-config:create', 3, 2, 2518, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-18 13:33:53', '', '2023-11-18 13:33:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2521, '�ͻ��������ø���', 'crm:customer-limit-config:update', 3, 3, 2518, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-18 13:33:53', '', '2023-11-18 13:33:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2522, '�ͻ���������ɾ��', 'crm:customer-limit-config:delete', 3, 4, 2518, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-18 13:33:53', '', '2023-11-18 13:33:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2523, '�ͻ��������õ���', 'crm:customer-limit-config:export', 3, 5, 2518, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-18 13:33:53', '', '2023-11-18 13:33:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2524, 'ϵͳ����', '', 1, 999, 2397, 'config', 'ep:connection', '', '', 0, '1', '1', '1', '1', '2023-11-18 21:58:00', '1', '2024-02-17 17:14:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2525, 'WebSocket', '', 2, 5, 2, 'websocket', 'ep:connection', 'infra/webSocket/index', 'InfraWebSocket', 0, '1', '1', '1', '1', '2023-11-23 19:41:55', '1', '2024-04-23 00:02:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2526, '��Ʒ����', '', 2, 80, 2397, 'product', 'fa:product-hunt', 'crm/product/index', 'CrmProduct', 0, '1', '1', '1', '1', '2023-12-05 22:45:26', '1', '2024-02-20 20:36:20', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2527, '��Ʒ��ѯ', 'crm:product:query', 3, 1, 2526, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-05 22:47:16', '1', '2023-12-05 22:47:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2528, '��Ʒ����', 'crm:product:create', 3, 2, 2526, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-05 22:47:41', '1', '2023-12-05 22:47:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2529, '��Ʒ����', 'crm:product:update', 3, 3, 2526, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-05 22:48:03', '1', '2023-12-05 22:48:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2530, '��Ʒɾ��', 'crm:product:delete', 3, 4, 2526, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-05 22:48:17', '1', '2023-12-05 22:48:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2531, '��Ʒ����', 'crm:product:export', 3, 5, 2526, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-05 22:48:29', '1', '2023-12-05 22:48:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2532, '��Ʒ��������', '', 2, 3, 2524, 'product/category', 'fa-solid:window-restore', 'crm/product/category/index', 'CrmProductCategory', 0, '1', '1', '1', '1', '2023-12-06 12:52:36', '1', '2023-12-06 12:52:51', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2533, '��Ʒ�����ѯ', 'crm:product-category:query', 3, 1, 2532, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-06 12:53:23', '1', '2023-12-06 12:53:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2534, '��Ʒ���ഴ��', 'crm:product-category:create', 3, 2, 2532, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-06 12:53:41', '1', '2023-12-06 12:53:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2535, '��Ʒ�������', 'crm:product-category:update', 3, 3, 2532, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-06 12:53:59', '1', '2023-12-06 12:53:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2536, '��Ʒ����ɾ��', 'crm:product-category:delete', 3, 4, 2532, '', '', '', '', 0, '1', '1', '1', '1', '2023-12-06 12:54:14', '1', '2023-12-06 12:54:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2543, '�����̻�', 'crm:contact:create-business', 3, 10, 2416, '', '', '', '', 0, '1', '1', '1', '1', '2024-01-02 17:28:25', '1', '2024-01-02 17:28:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2544, 'ȡ���̻�', 'crm:contact:delete-business', 3, 11, 2416, '', '', '', '', 0, '1', '1', '1', '1', '2024-01-02 17:28:43', '1', '2024-01-02 17:28:51', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2545, '��Ʒͳ��', '', 2, 3, 2358, 'product', 'fa:product-hunt', 'mall/statistics/product/index', 'ProductStatistics', 0, '1', '1', '1', '', '2023-12-15 18:54:28', '1', '2024-02-26 20:41:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2546, '�ͻ�����', '', 2, 30, 2397, 'customer/pool', 'fa-solid:swimming-pool', 'crm/customer/pool/index', 'CrmCustomerPool', 0, '1', '1', '1', '1', '2024-01-15 21:29:34', '1', '2024-02-17 17:14:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2547, '������ѯ', 'trade:order:query', 3, 1, 2076, '', '', '', '', 0, '1', '1', '1', '1', '2024-01-16 08:52:00', '1', '2024-01-16 08:52:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2548, '��������', 'trade:order:update', 3, 2, 2076, '', '', '', '', 0, '1', '1', '1', '1', '2024-01-16 08:52:21', '1', '2024-01-16 08:52:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2549, '֧��&�˿��', '', 2, 1, 2161, 'order', 'fa:paypal', 'pay/demo/order/index', '', 0, '1', '1', '1', '1', '2024-01-18 23:45:00', '1', '2024-01-18 23:47:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2550, 'ת�˰���', '', 2, 2, 2161, 'transfer', 'fa:transgender-alt', 'pay/demo/transfer/index', '', 0, '1', '1', '1', '1', '2024-01-18 23:51:16', '1', '2024-01-18 23:51:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2551, 'Ǯ������', '', 1, 4, 1117, 'wallet', 'ep:wallet', '', '', 0, '1', '1', '1', '', '2023-12-29 02:32:54', '1', '2024-02-29 08:58:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2552, '��ֵ�ײ�', '', 2, 2, 2551, 'wallet-recharge-package', 'fa:leaf', 'pay/wallet/rechargePackage/index', 'WalletRechargePackage', 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2553, 'Ǯ����ֵ�ײͲ�ѯ', 'pay:wallet-recharge-package:query', 3, 1, 2552, '', '', '', NULL, 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2554, 'Ǯ����ֵ�ײʹ���', 'pay:wallet-recharge-package:create', 3, 2, 2552, '', '', '', NULL, 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2555, 'Ǯ����ֵ�ײ͸���', 'pay:wallet-recharge-package:update', 3, 3, 2552, '', '', '', NULL, 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2556, 'Ǯ����ֵ�ײ�ɾ��', 'pay:wallet-recharge-package:delete', 3, 4, 2552, '', '', '', NULL, 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2557, 'Ǯ�����', '', 2, 1, 2551, 'wallet-balance', 'fa:leaf', 'pay/wallet/balance/index', 'WalletBalance', 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2558, 'Ǯ������ѯ', 'pay:wallet:query', 3, 1, 2557, '', '', '', NULL, 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2559, 'ת�˶���', '', 2, 3, 1117, 'transfer', 'ep:credit-card', 'pay/transfer/index', 'PayTransfer', 0, '1', '1', '1', '', '2023-12-29 02:32:54', '', '2023-12-29 02:32:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2560, '����ͳ��', '', 1, 200, 2397, 'statistics', 'ep:data-line', '', '', 0, '1', '1', '1', '1', '2024-01-26 22:50:35', '1', '2024-02-24 20:10:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2561, '���а�', 'crm:statistics-rank:query', 2, 1, 2560, 'ranking', 'fa:area-chart', 'crm/statistics/rank/index', 'CrmStatisticsRank', 0, '1', '1', '1', '1', '2024-01-26 22:52:09', '1', '2024-04-24 19:39:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2562, '�ͻ�����', 'crm:customer:import', 3, 6, 2391, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-01 13:09:00', '1', '2024-02-01 13:09:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2563, 'ERP ϵͳ', '', 1, 300, 0, '/erp', 'fa-solid:store', '', '', 0, '1', '1', '1', '1', '2024-02-04 15:37:25', '1', '2024-02-04 15:37:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2564, '��Ʒ����', '', 1, 40, 2563, 'product', 'fa:product-hunt', '', '', 0, '1', '1', '1', '1', '2024-02-04 15:38:43', '1', '2024-02-04 15:38:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2565, '��Ʒ��Ϣ', '', 2, 0, 2564, 'product', 'fa-solid:apple-alt', 'erp/product/product/index', 'ErpProduct', 0, '1', '1', '1', '', '2024-02-04 07:52:15', '1', '2024-02-05 14:42:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2566, '��Ʒ��ѯ', 'erp:product:query', 3, 1, 2565, '', '', '', '', 0, '1', '1', '1', '', '2024-02-04 07:52:15', '1', '2024-02-04 17:21:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2567, '��Ʒ����', 'erp:product:create', 3, 2, 2565, '', '', '', '', 0, '1', '1', '1', '', '2024-02-04 07:52:15', '1', '2024-02-04 17:22:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2568, '��Ʒ����', 'erp:product:update', 3, 3, 2565, '', '', '', '', 0, '1', '1', '1', '', '2024-02-04 07:52:15', '1', '2024-02-04 17:22:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2569, '��Ʒɾ��', 'erp:product:delete', 3, 4, 2565, '', '', '', '', 0, '1', '1', '1', '', '2024-02-04 07:52:15', '1', '2024-02-04 17:22:22', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2570, '��Ʒ����', 'erp:product:export', 3, 5, 2565, '', '', '', '', 0, '1', '1', '1', '', '2024-02-04 07:52:15', '1', '2024-02-04 17:22:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2571, '��Ʒ����', '', 2, 1, 2564, 'product-category', 'fa:certificate', 'erp/product/category/index', 'ErpProductCategory', 0, '1', '1', '1', '', '2024-02-04 09:21:04', '1', '2024-02-04 17:24:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2572, '�����ѯ', 'erp:product-category:query', 3, 1, 2571, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 09:21:04', '', '2024-02-04 09:21:04', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2573, '���ഴ��', 'erp:product-category:create', 3, 2, 2571, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 09:21:04', '', '2024-02-04 09:21:04', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2574, '�������', 'erp:product-category:update', 3, 3, 2571, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 09:21:04', '', '2024-02-04 09:21:04', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2575, '����ɾ��', 'erp:product-category:delete', 3, 4, 2571, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 09:21:04', '', '2024-02-04 09:21:04', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2576, '���ർ��', 'erp:product-category:export', 3, 5, 2571, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 09:21:04', '', '2024-02-04 09:21:04', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2577, '��Ʒ��λ', '', 2, 2, 2564, 'unit', 'ep:opportunity', 'erp/product/unit/index', 'ErpProductUnit', 0, '1', '1', '1', '', '2024-02-04 11:54:08', '1', '2024-02-04 19:54:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2578, '��λ��ѯ', 'erp:product-unit:query', 3, 1, 2577, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 11:54:08', '', '2024-02-04 11:54:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2579, '��λ����', 'erp:product-unit:create', 3, 2, 2577, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 11:54:08', '', '2024-02-04 11:54:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2580, '��λ����', 'erp:product-unit:update', 3, 3, 2577, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 11:54:08', '', '2024-02-04 11:54:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2581, '��λɾ��', 'erp:product-unit:delete', 3, 4, 2577, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 11:54:08', '', '2024-02-04 11:54:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2582, '��λ����', 'erp:product-unit:export', 3, 5, 2577, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 11:54:08', '', '2024-02-04 11:54:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2583, '������', '', 1, 30, 2563, 'stock', 'fa:window-restore', '', '', 0, '1', '1', '1', '1', '2024-02-05 00:29:37', '1', '2024-02-05 00:29:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2584, '�ֿ���Ϣ', '', 2, 0, 2583, 'warehouse', 'ep:house', 'erp/stock/warehouse/index', 'ErpWarehouse', 0, '1', '1', '1', '', '2024-02-04 17:12:09', '1', '2024-02-05 01:12:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2585, '�ֿ��ѯ', 'erp:warehouse:query', 3, 1, 2584, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 17:12:09', '', '2024-02-04 17:12:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2586, '�ֿⴴ��', 'erp:warehouse:create', 3, 2, 2584, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 17:12:09', '', '2024-02-04 17:12:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2587, '�ֿ����', 'erp:warehouse:update', 3, 3, 2584, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 17:12:09', '', '2024-02-04 17:12:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2588, '�ֿ�ɾ��', 'erp:warehouse:delete', 3, 4, 2584, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 17:12:09', '', '2024-02-04 17:12:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2589, '�ֿ⵼��', 'erp:warehouse:export', 3, 5, 2584, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-04 17:12:09', '', '2024-02-04 17:12:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2590, '��Ʒ���', '', 2, 1, 2583, 'stock', 'ep:coffee', 'erp/stock/stock/index', 'ErpStock', 0, '1', '1', '1', '', '2024-02-05 06:40:50', '1', '2024-02-05 14:42:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2591, '����ѯ', 'erp:stock:query', 3, 1, 2590, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 06:40:50', '', '2024-02-05 06:40:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2592, '��浼��', 'erp:stock:export', 3, 5, 2590, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 06:40:50', '', '2024-02-05 06:40:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2593, '�������ϸ', '', 2, 2, 2583, 'record', 'fa-solid:blog', 'erp/stock/record/index', 'ErpStockRecord', 0, '1', '1', '1', '', '2024-02-05 10:27:21', '1', '2024-02-06 17:26:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2594, '�����ϸ��ѯ', 'erp:stock-record:query', 3, 1, 2593, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 10:27:21', '', '2024-02-05 10:27:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2595, '�����ϸ����', 'erp:stock-record:export', 3, 5, 2593, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 10:27:21', '', '2024-02-05 10:27:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2596, '�������', '', 2, 3, 2583, 'in', 'ep:zoom-in', 'erp/stock/in/index', 'ErpStockIn', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-07 19:06:51', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2597, '������ⵥ��ѯ', 'erp:stock-in:query', 3, 1, 2596, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-05 16:08:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2598, '������ⵥ����', 'erp:stock-in:create', 3, 2, 2596, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-05 16:08:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2599, '������ⵥ����', 'erp:stock-in:update', 3, 3, 2596, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-05 16:08:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2600, '������ⵥɾ��', 'erp:stock-in:delete', 3, 4, 2596, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-05 16:08:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2601, '������ⵥ����', 'erp:stock-in:export', 3, 5, 2596, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-05 16:08:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2602, '�ɹ�����', '', 1, 10, 2563, 'purchase', 'fa:buysellads', '', '', 0, '1', '1', '1', '1', '2024-02-06 16:01:01', '1', '2024-02-06 16:01:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2603, '��Ӧ����Ϣ', '', 2, 4, 2602, 'supplier', 'fa:superpowers', 'erp/purchase/supplier/index', 'ErpSupplier', 0, '1', '1', '1', '', '2024-02-06 08:21:55', '1', '2024-02-06 16:22:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2604, '��Ӧ�̲�ѯ', 'erp:supplier:query', 3, 1, 2603, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-06 08:21:55', '', '2024-02-06 08:21:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2605, '��Ӧ�̴���', 'erp:supplier:create', 3, 2, 2603, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-06 08:21:55', '', '2024-02-06 08:21:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2606, '��Ӧ�̸���', 'erp:supplier:update', 3, 3, 2603, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-06 08:21:55', '', '2024-02-06 08:21:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2607, '��Ӧ��ɾ��', 'erp:supplier:delete', 3, 4, 2603, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-06 08:21:55', '', '2024-02-06 08:21:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2608, '��Ӧ�̵���', 'erp:supplier:export', 3, 5, 2603, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-06 08:21:55', '', '2024-02-06 08:21:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2609, '������ⵥ����', 'erp:stock-in:update-status', 3, 6, 2596, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-05 16:08:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2610, '��������', '', 2, 4, 2583, 'out', 'ep:zoom-out', 'erp/stock/out/index', 'ErpStockOut', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-07 19:06:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2611, '�������ⵥ��ѯ', 'erp:stock-out:query', 3, 1, 2610, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 06:43:39', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2612, '�������ⵥ����', 'erp:stock-out:create', 3, 2, 2610, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 06:43:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2613, '�������ⵥ����', 'erp:stock-out:update', 3, 3, 2610, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 06:43:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2614, '�������ⵥɾ��', 'erp:stock-out:delete', 3, 4, 2610, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 06:43:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2615, '�������ⵥ����', 'erp:stock-out:export', 3, 5, 2610, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 06:43:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2616, '�������ⵥ����', 'erp:stock-out:update-status', 3, 6, 2610, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 06:43:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2617, '���۹���', '', 1, 20, 2563, 'sale', 'fa:sellsy', '', '', 0, '1', '1', '1', '1', '2024-02-07 15:12:32', '1', '2024-02-07 15:12:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2618, '�ͻ���Ϣ', '', 2, 4, 2617, 'customer', 'ep:avatar', 'erp/sale/customer/index', 'ErpCustomer', 0, '1', '1', '1', '', '2024-02-07 07:21:45', '1', '2024-02-07 15:22:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2619, '�ͻ���ѯ', 'erp:customer:query', 3, 1, 2618, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-07 07:21:45', '', '2024-02-07 07:21:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2620, '�ͻ�����', 'erp:customer:create', 3, 2, 2618, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-07 07:21:45', '', '2024-02-07 07:21:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2621, '�ͻ�����', 'erp:customer:update', 3, 3, 2618, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-07 07:21:45', '', '2024-02-07 07:21:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2622, '�ͻ�ɾ��', 'erp:customer:delete', 3, 4, 2618, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-07 07:21:45', '', '2024-02-07 07:21:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2623, '�ͻ�����', 'erp:customer:export', 3, 5, 2618, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-07 07:21:45', '', '2024-02-07 07:21:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2624, '������', '', 2, 5, 2583, 'move', 'ep:folder-remove', 'erp/stock/move/index', 'ErpStockMove', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-16 18:53:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2625, '�����ȵ���ѯ', 'erp:stock-move:query', 3, 1, 2624, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2626, '�����ȵ�����', 'erp:stock-move:create', 3, 2, 2624, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2627, '�����ȵ�����', 'erp:stock-move:update', 3, 3, 2624, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2628, '�����ȵ�ɾ��', 'erp:stock-move:delete', 3, 4, 2624, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2629, '�����ȵ�����', 'erp:stock-move:export', 3, 5, 2624, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2630, '�����ȵ�����', 'erp:stock-move:update-status', 3, 6, 2624, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:13:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2631, '����̵�', '', 2, 6, 2583, 'check', 'ep:circle-check-filled', 'erp/stock/check/index', 'ErpStockCheck', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-08 08:31:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2632, '����̵㵥��ѯ', 'erp:stock-check:query', 3, 1, 2631, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2633, '����̵㵥����', 'erp:stock-check:create', 3, 2, 2631, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2634, '����̵㵥����', 'erp:stock-check:update', 3, 3, 2631, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2635, '����̵㵥ɾ��', 'erp:stock-check:delete', 3, 4, 2631, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2636, '����̵㵥����', 'erp:stock-check:export', 3, 5, 2631, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2637, '����̵㵥����', 'erp:stock-check:update-status', 3, 6, 2631, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:13:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2638, '���۶���', '', 2, 1, 2617, 'order', 'fa:first-order', 'erp/sale/order/index', 'ErpSaleOrder', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-10 21:59:20', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2639, '���۶�����ѯ', 'erp:sale-order:query', 3, 1, 2638, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2640, '���۶�������', 'erp:sale-order:create', 3, 2, 2638, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2641, '���۶�������', 'erp:sale-order:update', 3, 3, 2638, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2642, '���۶���ɾ��', 'erp:sale-order:delete', 3, 4, 2638, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2643, '���۶�������', 'erp:sale-order:export', 3, 5, 2638, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2644, '���۶�������', 'erp:sale-order:update-status', 3, 6, 2638, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:13:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2645, '�������', '', 1, 50, 2563, 'finance', 'ep:money', '', '', 0, '1', '1', '1', '1', '2024-02-10 08:05:58', '1', '2024-02-10 08:06:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2646, '�����˻�', '', 2, 10, 2645, 'account', 'fa:universal-access', 'erp/finance/account/index', 'ErpAccount', 0, '1', '1', '1', '', '2024-02-10 00:15:07', '1', '2024-02-14 08:24:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2647, '�����˻���ѯ', 'erp:account:query', 3, 1, 2646, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-10 00:15:07', '', '2024-02-10 00:15:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2648, '�����˻�����', 'erp:account:create', 3, 2, 2646, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-10 00:15:07', '', '2024-02-10 00:15:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2649, '�����˻�����', 'erp:account:update', 3, 3, 2646, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-10 00:15:07', '', '2024-02-10 00:15:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2650, '�����˻�ɾ��', 'erp:account:delete', 3, 4, 2646, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-10 00:15:07', '', '2024-02-10 00:15:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2651, '�����˻�����', 'erp:account:export', 3, 5, 2646, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-10 00:15:07', '', '2024-02-10 00:15:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2652, '���۳���', '', 2, 2, 2617, 'out', 'ep:sold-out', 'erp/sale/out/index', 'ErpSaleOut', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-10 22:02:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2653, '���۳����ѯ', 'erp:sale-out:query', 3, 1, 2652, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2654, '���۳��ⴴ��', 'erp:sale-out:create', 3, 2, 2652, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2655, '���۳������', 'erp:sale-out:update', 3, 3, 2652, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2656, '���۳���ɾ��', 'erp:sale-out:delete', 3, 4, 2652, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2657, '���۳��⵼��', 'erp:sale-out:export', 3, 5, 2652, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2658, '���۳�������', 'erp:sale-out:update-status', 3, 6, 2652, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:13:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2659, '�����˻�', '', 2, 3, 2617, 'return', 'fa-solid:bone', 'erp/sale/return/index', 'ErpSaleReturn', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-12 06:12:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2660, '�����˻���ѯ', 'erp:sale-return:query', 3, 1, 2659, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2661, '�����˻�����', 'erp:sale-return:create', 3, 2, 2659, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2662, '�����˻�����', 'erp:sale-return:update', 3, 3, 2659, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:55', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2663, '�����˻�ɾ��', 'erp:sale-return:delete', 3, 4, 2659, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2664, '�����˻�����', 'erp:sale-return:export', 3, 5, 2659, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:12:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2665, '�����˻�����', 'erp:sale-return:update-status', 3, 6, 2659, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-07 11:13:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2666, '�ɹ�����', '', 2, 1, 2602, 'order', 'fa-solid:border-all', 'erp/purchase/order/index', 'ErpPurchaseOrder', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-12 08:51:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2667, '�ɹ�������ѯ', 'erp:purchase-order:query', 3, 1, 2666, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2668, '�ɹ���������', 'erp:purchase-order:create', 3, 2, 2666, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2669, '�ɹ���������', 'erp:purchase-order:update', 3, 3, 2666, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2670, '�ɹ�����ɾ��', 'erp:purchase-order:delete', 3, 4, 2666, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2671, '�ɹ���������', 'erp:purchase-order:export', 3, 5, 2666, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2672, '�ɹ���������', 'erp:purchase-order:update-status', 3, 6, 2666, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2673, '�ɹ����', '', 2, 2, 2602, 'in', 'fa-solid:gopuram', 'erp/purchase/in/index', 'ErpPurchaseIn', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-12 11:19:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2674, '�ɹ�����ѯ', 'erp:purchase-in:query', 3, 1, 2673, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2675, '�ɹ���ⴴ��', 'erp:purchase-in:create', 3, 2, 2673, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2676, '�ɹ�������', 'erp:purchase-in:update', 3, 3, 2673, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2677, '�ɹ����ɾ��', 'erp:purchase-in:delete', 3, 4, 2673, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2678, '�ɹ���⵼��', 'erp:purchase-in:export', 3, 5, 2673, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2679, '�ɹ��������', 'erp:purchase-in:update-status', 3, 6, 2673, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2680, '�ɹ��˻�', '', 2, 3, 2602, 'return', 'ep:minus', 'erp/purchase/return/index', 'ErpPurchaseReturn', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-12 20:51:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2681, '�ɹ��˻���ѯ', 'erp:purchase-return:query', 3, 1, 2680, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2682, '�ɹ��˻�����', 'erp:purchase-return:create', 3, 2, 2680, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2683, '�ɹ��˻�����', 'erp:purchase-return:update', 3, 3, 2680, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2684, '�ɹ��˻�ɾ��', 'erp:purchase-return:delete', 3, 4, 2680, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2685, '�ɹ��˻�����', 'erp:purchase-return:export', 3, 5, 2680, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2686, '�ɹ��˻�����', 'erp:purchase-return:update-status', 3, 6, 2680, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2687, '���', '', 2, 1, 2645, 'payment', 'ep:caret-right', 'erp/finance/payment/index', 'ErpFinancePayment', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-14 08:24:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2688, '�����ѯ', 'erp:finance-payment:query', 3, 1, 2687, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2689, '�������', 'erp:finance-payment:create', 3, 2, 2687, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2690, '�������', 'erp:finance-payment:update', 3, 3, 2687, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2691, '���ɾ��', 'erp:finance-payment:delete', 3, 4, 2687, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2692, '�������', 'erp:finance-payment:export', 3, 5, 2687, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2693, '�������', 'erp:finance-payment:update-status', 3, 6, 2687, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2694, '�տ', '', 2, 2, 2645, 'receipt', 'ep:expand', 'erp/finance/receipt/index', 'ErpFinanceReceipt', 0, '1', '1', '1', '', '2024-02-05 16:08:56', '1', '2024-02-15 19:35:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2695, '�տ��ѯ', 'erp:finance-receipt:query', 3, 1, 2694, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2696, '�տ����', 'erp:finance-receipt:create', 3, 2, 2694, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2697, '�տ����', 'erp:finance-receipt:update', 3, 3, 2694, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:44:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2698, '�տɾ��', 'erp:finance-receipt:delete', 3, 4, 2694, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2699, '�տ����', 'erp:finance-receipt:export', 3, 5, 2694, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2700, '�տ����', 'erp:finance-receipt:update-status', 3, 6, 2694, '', '', '', NULL, 0, '1', '1', '1', '', '2024-02-05 16:08:56', '', '2024-02-12 00:45:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2701, '��������', '', 2, 0, 2397, 'backlog', 'fa-solid:tasks', 'crm/backlog/index', 'CrmBacklog', 0, '1', '1', '1', '1', '2024-02-17 17:17:11', '1', '2024-02-17 17:17:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2702, 'ERP ��ҳ', 'erp:statistics:query', 2, 0, 2563, 'home', 'ep:home-filled', 'erp/home/index.vue', 'ErpHome', 0, '1', '1', '1', '1', '2024-02-18 16:49:40', '1', '2024-02-26 21:12:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2703, '�̻�״̬����', '', 2, 4, 2524, 'business-status', 'fa-solid:charging-station', 'crm/business/status/index', 'CrmBusinessStatus', 0, '1', '1', '1', '1', '2024-02-21 20:15:17', '1', '2024-02-21 20:15:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2704, '�̻�״̬��ѯ', 'crm:business-status:query', 3, 1, 2703, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-21 20:35:36', '1', '2024-02-21 20:36:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2705, '�̻�״̬����', 'crm:business-status:create', 3, 2, 2703, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-21 20:35:57', '1', '2024-02-21 20:35:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2706, '�̻�״̬����', 'crm:business-status:update', 3, 3, 2703, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-21 20:36:21', '1', '2024-02-21 20:36:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2707, '�̻�״̬ɾ��', 'crm:business-status:delete', 3, 4, 2703, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-21 20:36:36', '1', '2024-02-21 20:36:36', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2708, '��ͬ����', '', 2, 5, 2524, 'contract-config', 'ep:connection', 'crm/contract/config/index', 'CrmContractConfig', 0, '1', '1', '1', '1', '2024-02-24 16:44:40', '1', '2024-02-24 16:44:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2709, '�ͻ��������ò�ѯ', 'crm:customer-pool-config:query', 3, 2, 2516, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-24 16:45:19', '1', '2024-02-24 16:45:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2710, '��ͬ���ø���', 'crm:contract-config:update', 3, 1, 2708, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-24 16:45:56', '1', '2024-02-24 16:45:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2711, '��ͬ���ò�ѯ', 'crm:contract-config:query', 3, 2, 2708, '', '', '', '', 0, '1', '1', '1', '1', '2024-02-24 16:46:16', '1', '2024-02-24 16:46:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2712, '�ͻ�����', 'crm:statistics-customer:query', 2, 0, 2560, 'customer', 'ep:avatar', 'views/crm/statistics/customer/index.vue', 'CrmStatisticsCustomer', 0, '1', '1', '1', '1', '2024-03-09 16:43:56', '1', '2024-04-24 19:42:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2713, '�����ҵ�', 'bpm:process-instance-cc:query', 2, 30, 1200, 'copy', 'ep:copy-document', 'bpm/task/copy/index', 'BpmProcessInstanceCopy', 0, '1', '1', '1', '1', '2024-03-17 21:50:23', '1', '2024-04-24 19:55:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2714, '���̷���', '', 2, 3, 1186, 'category', 'fa:object-ungroup', 'bpm/category/index', 'BpmCategory', 0, '1', '1', '1', '', '2024-03-08 02:00:51', '1', '2024-03-21 23:51:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2715, '�����ѯ', 'bpm:category:query', 3, 1, 2714, '', '', '', '', 0, '1', '1', '1', '', '2024-03-08 02:00:51', '1', '2024-03-19 14:36:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2716, '���ഴ��', 'bpm:category:create', 3, 2, 2714, '', '', '', '', 0, '1', '1', '1', '', '2024-03-08 02:00:51', '1', '2024-03-19 14:36:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2717, '�������', 'bpm:category:update', 3, 3, 2714, '', '', '', '', 0, '1', '1', '1', '', '2024-03-08 02:00:51', '1', '2024-03-19 14:36:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2718, '����ɾ��', 'bpm:category:delete', 3, 4, 2714, '', '', '', '', 0, '1', '1', '1', '', '2024-03-08 02:00:51', '1', '2024-03-19 14:36:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2720, '��������', '', 2, 0, 1200, 'create', 'fa-solid:grin-stars', 'bpm/processInstance/create/index', 'BpmProcessInstanceCreate', 0, '1', '0', '1', '1', '2024-03-19 19:46:05', '1', '2024-03-23 19:03:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2721, '����ʵ��', '', 2, 10, 1186, 'process-instance/manager', 'fa:square', 'bpm/processInstance/manager/index', 'BpmProcessInstanceManager', 0, '1', '1', '1', '1', '2024-03-21 23:57:30', '1', '2024-03-21 23:57:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2722, '����ʵ���Ĳ�ѯ������Ա��', 'bpm:process-instance:manager-query', 3, 1, 2721, '', '', '', '', 0, '1', '1', '1', '1', '2024-03-22 08:18:27', '1', '2024-03-22 08:19:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2723, '����ʵ����ȡ��������Ա��', 'bpm:process-instance:cancel-by-admin', 3, 2, 2721, '', '', '', '', 0, '1', '1', '1', '1', '2024-03-22 08:19:25', '1', '2024-03-22 08:19:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2724, '��������', '', 2, 11, 1186, 'process-tasnk', 'ep:collection-tag', 'bpm/task/manager/index', 'BpmManagerTask', 0, '1', '1', '1', '1', '2024-03-22 08:43:22', '1', '2024-03-22 08:43:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2725, '��������Ĳ�ѯ������Ա��', 'bpm:task:mananger-query', 3, 1, 2724, '', '', '', '', 0, '1', '1', '1', '1', '2024-03-22 08:43:49', '1', '2024-03-22 08:43:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2726, '���̼�����', '', 2, 5, 1186, 'process-listener', 'fa:assistive-listening-systems', 'bpm/processListener/index', 'BpmProcessListener', 0, '1', '1', '1', '', '2024-03-09 16:05:34', '1', '2024-03-23 13:13:38', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2727, '���̼�������ѯ', 'bpm:process-listener:query', 3, 1, 2726, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 16:05:34', '', '2024-03-09 16:05:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2728, '���̼���������', 'bpm:process-listener:create', 3, 2, 2726, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 16:05:34', '', '2024-03-09 16:05:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2729, '���̼���������', 'bpm:process-listener:update', 3, 3, 2726, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 16:05:34', '', '2024-03-09 16:05:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2730, '���̼�����ɾ��', 'bpm:process-listener:delete', 3, 4, 2726, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 16:05:34', '', '2024-03-09 16:05:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2731, '���̱��ʽ', '', 2, 6, 1186, 'process-expression', 'fa:wpexplorer', 'bpm/processExpression/index', 'BpmProcessExpression', 0, '1', '1', '1', '', '2024-03-09 22:35:08', '1', '2024-03-23 19:43:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2732, '���̱��ʽ��ѯ', 'bpm:process-expression:query', 3, 1, 2731, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 22:35:08', '', '2024-03-09 22:35:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2733, '���̱��ʽ����', 'bpm:process-expression:create', 3, 2, 2731, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 22:35:08', '', '2024-03-09 22:35:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2734, '���̱��ʽ����', 'bpm:process-expression:update', 3, 3, 2731, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 22:35:08', '', '2024-03-09 22:35:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2735, '���̱��ʽɾ��', 'bpm:process-expression:delete', 3, 4, 2731, '', '', '', NULL, 0, '1', '1', '1', '', '2024-03-09 22:35:08', '', '2024-03-09 22:35:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2736, 'Ա��ҵ��', 'crm:statistics-performance:query', 2, 3, 2560, 'performance', 'ep:dish-dot', 'crm/statistics/performance/index', 'CrmStatisticsPerformance', 0, '1', '1', '1', '1', '2024-04-05 13:49:20', '1', '2024-04-24 19:42:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2737, '�ͻ�����', 'crm:statistics-portrait:query', 2, 4, 2560, 'portrait', 'ep:picture', 'crm/statistics/portrait/index', 'CrmStatisticsPortrait', 0, '1', '1', '1', '1', '2024-04-05 13:57:40', '1', '2024-04-24 19:42:24', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2738, '����©��', 'crm:statistics-funnel:query', 2, 5, 2560, 'funnel', 'ep:grape', 'crm/statistics/funnel/index', 'CrmStatisticsFunnel', 0, '1', '1', '1', '1', '2024-04-13 10:53:26', '1', '2024-04-24 19:39:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2739, '��Ϣ����', '', 1, 7, 1, 'messages', 'ep:chat-dot-round', '', '', 0, '1', '1', '1', '1', '2024-04-22 23:54:30', '1', '2024-04-23 09:36:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2740, '�������', '', 1, 10, 2, 'monitors', 'ep:monitor', '', '', 0, '1', '1', '1', '1', '2024-04-23 00:04:44', '1', '2024-04-23 00:04:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2741, '��ȡ�����ͻ�', 'crm:customer:receive', 3, 1, 2546, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:47:45', '1', '2024-04-24 19:47:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2742, '���乫���ͻ�', 'crm:customer:distribute', 3, 2, 2546, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:48:05', '1', '2024-04-24 19:48:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2743, '��Ʒͳ�Ʋ�ѯ', 'statistics:product:query', 3, 1, 2545, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:50:05', '1', '2024-04-24 19:50:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2744, '��Ʒͳ�Ƶ���', 'statistics:product:export', 3, 2, 2545, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:50:26', '1', '2024-04-24 19:50:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2745, '֧��������ѯ', 'pay:channel:query', 3, 10, 1126, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:53:01', '1', '2024-04-24 19:53:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2746, '֧����������', 'pay:channel:create', 3, 11, 1126, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:53:18', '1', '2024-04-24 19:53:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2747, '֧����������', 'pay:channel:update', 3, 12, 1126, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:53:32', '1', '2024-04-24 19:53:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2748, '֧������ɾ��', 'pay:channel:delete', 3, 13, 1126, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:54:34', '1', '2024-04-24 19:54:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2749, '��Ʒ�ղز�ѯ', 'product:favorite:query', 3, 10, 2014, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:55:47', '1', '2024-04-24 19:55:47', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2750, '��Ʒ�����ѯ', 'product:browse-history:query', 3, 20, 2014, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:57:43', '1', '2024-04-24 19:57:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2751, '�ۺ�ͬ��', 'trade:after-sale:agree', 3, 2, 2073, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:58:40', '1', '2024-04-24 19:58:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2752, '�ۺ�ͬ��', 'trade:after-sale:disagree', 3, 3, 2073, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 19:59:03', '1', '2024-04-24 19:59:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2753, '�ۺ�ȷ���˻�', 'trade:after-sale:receive', 3, 4, 2073, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 20:00:07', '1', '2024-04-24 20:00:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2754, '�ۺ�ȷ���˿�', 'trade:after-sale:refund', 3, 5, 2073, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 20:00:24', '1', '2024-04-24 20:00:24', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2755, 'ɾ����Ŀ', 'report:go-view-project:delete', 3, 2, 2153, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 20:01:37', '1', '2024-04-24 20:01:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2756, '��Ա�ȼ���¼��ѯ', 'member:level-record:query', 3, 10, 2325, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 20:02:32', '1', '2024-04-24 20:02:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2757, '��Ա�����¼��ѯ', 'member:experience-record:query', 3, 11, 2325, '', '', '', '', 0, '1', '1', '1', '1', '2024-04-24 20:02:51', '1', '2024-04-24 20:02:51', '0');
COMMIT;
SET IDENTITY_INSERT system_menu OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
CREATE TABLE system_notice
(
    id          bigint                                NOT NULL PRIMARY KEY IDENTITY,
    title       varchar(50)                           NOT NULL,
    content     text                                  NOT NULL,
    type        smallint                              NOT NULL,
    status      smallint    DEFAULT 0                 NOT NULL,
    creator     varchar(64) DEFAULT ''                NULL,
    create_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64) DEFAULT ''                NULL,
    update_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit         DEFAULT '0'               NOT NULL,
    tenant_id   bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_notice.id IS '����ID';
COMMENT ON COLUMN system_notice.title IS '�������';
COMMENT ON COLUMN system_notice.content IS '��������';
COMMENT ON COLUMN system_notice.type IS '�������ͣ�1֪ͨ 2���棩';
COMMENT ON COLUMN system_notice.status IS '����״̬��0���� 1�رգ�';
COMMENT ON COLUMN system_notice.creator IS '������';
COMMENT ON COLUMN system_notice.create_time IS '����ʱ��';
COMMENT ON COLUMN system_notice.updater IS '������';
COMMENT ON COLUMN system_notice.update_time IS '����ʱ��';
COMMENT ON COLUMN system_notice.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_notice.tenant_id IS '�⻧���';
COMMENT ON TABLE system_notice IS '֪ͨ�����';

-- ----------------------------
-- Records of system_notice
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_notice ON;
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '����Ĺ���', '<p>�°汾����133</p>', 1, 0, 'admin', '2021-01-05 17:03:48', '1', '2022-05-04 21:00:20', '0', 1);
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 'ά��֪ͨ��2018-07-01 ϵͳ�賿ά��', '<p><img src="http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg" alt="" data-href="" style=""/>11112222</p>', 2, 1, 'admin', '2021-01-05 17:03:48', '1', '2023-12-02 20:07:26', '0', 1);
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, '���ǲ��Ա���', '<p>��������123</p>', 1, 0, '110', '2022-02-22 01:01:25', '110', '2022-02-22 01:01:46', '0', 121);
COMMIT;
SET IDENTITY_INSERT system_notice OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_notify_message
-- ----------------------------
CREATE TABLE system_notify_message
(
    id                bigint                                NOT NULL PRIMARY KEY IDENTITY,
    user_id           bigint                                NOT NULL,
    user_type         smallint                              NOT NULL,
    template_id       bigint                                NOT NULL,
    template_code     varchar(64)                           NOT NULL,
    template_nickname varchar(63)                           NOT NULL,
    template_content  varchar(1024)                         NOT NULL,
    template_type     int                                   NOT NULL,
    template_params   varchar(255)                          NOT NULL,
    read_status       bit                                   NOT NULL,
    read_time         datetime    DEFAULT NULL              NULL,
    creator           varchar(64) DEFAULT ''                NULL,
    create_time       datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater           varchar(64) DEFAULT ''                NULL,
    update_time       datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted           bit         DEFAULT '0'               NOT NULL,
    tenant_id         bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_notify_message.id IS '�û�ID';
COMMENT ON COLUMN system_notify_message.user_id IS '�û�id';
COMMENT ON COLUMN system_notify_message.user_type IS '�û�����';
COMMENT ON COLUMN system_notify_message.template_id IS 'ģ����';
COMMENT ON COLUMN system_notify_message.template_code IS 'ģ�����';
COMMENT ON COLUMN system_notify_message.template_nickname IS 'ģ�淢��������';
COMMENT ON COLUMN system_notify_message.template_content IS 'ģ������';
COMMENT ON COLUMN system_notify_message.template_type IS 'ģ������';
COMMENT ON COLUMN system_notify_message.template_params IS 'ģ�����';
COMMENT ON COLUMN system_notify_message.read_status IS '�Ƿ��Ѷ�';
COMMENT ON COLUMN system_notify_message.read_time IS '�Ķ�ʱ��';
COMMENT ON COLUMN system_notify_message.creator IS '������';
COMMENT ON COLUMN system_notify_message.create_time IS '����ʱ��';
COMMENT ON COLUMN system_notify_message.updater IS '������';
COMMENT ON COLUMN system_notify_message.update_time IS '����ʱ��';
COMMENT ON COLUMN system_notify_message.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_notify_message.tenant_id IS '�⻧���';
COMMENT ON TABLE system_notify_message IS 'վ������Ϣ��';

-- ----------------------------
-- Records of system_notify_message
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_notify_message ON;
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 1, 2, 1, 'test', '123', '���� 1���ҿ�ʼ 2 ��', 1, '{"name":"1","what":"2"}', '1', '2023-02-10 00:47:04', '1', '2023-01-28 11:44:08', '1', '2023-02-10 00:47:04', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 1, 2, 1, 'test', '123', '���� 1���ҿ�ʼ 2 ��', 1, '{"name":"1","what":"2"}', '1', '2023-02-10 00:47:04', '1', '2023-01-28 11:45:04', '1', '2023-02-10 00:47:04', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 103, 2, 2, 'register', 'ϵͳ��Ϣ', '��ã���ӭ ���� ������ͥ��', 2, '{"name":"����"}', '0', NULL, '1', '2023-01-28 21:02:20', '1', '2023-01-28 21:02:20', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 1, 2, 1, 'test', '123', '���� ��ܵ���ҿ�ʼ д���� ��', 1, '{"name":"��ܵ","what":"д����"}', '1', '2023-02-10 00:47:04', '1', '2023-01-28 22:21:42', '1', '2023-02-10 00:47:04', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 1, 2, 1, 'test', '123', '���� ��ܵ���ҿ�ʼ д���� ��', 1, '{"name":"��ܵ","what":"д����"}', '1', '2023-01-29 10:52:06', '1', '2023-01-28 22:22:07', '1', '2023-01-29 10:52:06', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 1, 2, 1, 'test', '123', '���� 2���ҿ�ʼ 3 ��', 1, '{"name":"2","what":"3"}', '1', '2023-01-29 10:52:06', '1', '2023-01-28 23:45:21', '1', '2023-01-29 10:52:06', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 1, 2, 2, 'register', 'ϵͳ��Ϣ', '��ã���ӭ 123 ������ͥ��', 2, '{"name":"123"}', '1', '2023-01-29 10:52:06', '1', '2023-01-28 23:50:21', '1', '2023-01-29 10:52:06', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 247, 1, 4, 'brokerage_withdraw_audit_approve', 'system', '����2023-09-28 08:35:46���֣�0.09Ԫ��������ͨ�����', 2, '{"reason":null,"createTime":"2023-09-28 08:35:46","price":"0.09"}', '0', NULL, '1', '2023-09-28 16:36:22', '1', '2023-09-28 16:36:22', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 247, 1, 4, 'brokerage_withdraw_audit_approve', 'system', '����2023-09-30 20:59:40���֣�1.00Ԫ��������ͨ�����', 2, '{"reason":null,"createTime":"2023-09-30 20:59:40","price":"1.00"}', '0', NULL, '1', '2023-10-03 12:11:34', '1', '2023-10-03 12:11:34', '0', 1);
COMMIT;
SET IDENTITY_INSERT system_notify_message OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_notify_template
-- ----------------------------
CREATE TABLE system_notify_template
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(63)                            NOT NULL,
    code        varchar(64)                            NOT NULL,
    nickname    varchar(255)                           NOT NULL,
    content     varchar(1024)                          NOT NULL,
    type        smallint                               NOT NULL,
    params      varchar(255) DEFAULT NULL              NULL,
    status      smallint                               NOT NULL,
    remark      varchar(255) DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_notify_template.id IS '����';
COMMENT ON COLUMN system_notify_template.name IS 'ģ������';
COMMENT ON COLUMN system_notify_template.code IS 'ģ�����';
COMMENT ON COLUMN system_notify_template.nickname IS '����������';
COMMENT ON COLUMN system_notify_template.content IS 'ģ������';
COMMENT ON COLUMN system_notify_template.type IS '����';
COMMENT ON COLUMN system_notify_template.params IS '��������';
COMMENT ON COLUMN system_notify_template.status IS '״̬';
COMMENT ON COLUMN system_notify_template.remark IS '��ע';
COMMENT ON COLUMN system_notify_template.creator IS '������';
COMMENT ON COLUMN system_notify_template.create_time IS '����ʱ��';
COMMENT ON COLUMN system_notify_template.updater IS '������';
COMMENT ON COLUMN system_notify_template.update_time IS '����ʱ��';
COMMENT ON COLUMN system_notify_template.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_notify_template IS 'վ����ģ���';

-- ----------------------------
-- Table structure for system_oauth2_access_token
-- ----------------------------
CREATE TABLE system_oauth2_access_token
(
    id            bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    user_id       bigint                                 NOT NULL,
    user_type     smallint                               NOT NULL,
    user_info     varchar(512)                           NOT NULL,
    access_token  varchar(255)                           NOT NULL,
    refresh_token varchar(32)                            NOT NULL,
    client_id     varchar(255)                           NOT NULL,
    scopes        varchar(255) DEFAULT NULL              NULL,
    expires_time  datetime                               NOT NULL,
    creator       varchar(64)  DEFAULT ''                NULL,
    create_time   datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater       varchar(64)  DEFAULT ''                NULL,
    update_time   datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted       bit          DEFAULT '0'               NOT NULL,
    tenant_id     bigint       DEFAULT 0                 NOT NULL
);

CREATE INDEX idx_system_oauth2_access_token_01 ON system_oauth2_access_token (access_token);
CREATE INDEX idx_system_oauth2_access_token_02 ON system_oauth2_access_token (refresh_token);

COMMENT ON COLUMN system_oauth2_access_token.id IS '���';
COMMENT ON COLUMN system_oauth2_access_token.user_id IS '�û����';
COMMENT ON COLUMN system_oauth2_access_token.user_type IS '�û�����';
COMMENT ON COLUMN system_oauth2_access_token.user_info IS '�û���Ϣ';
COMMENT ON COLUMN system_oauth2_access_token.access_token IS '��������';
COMMENT ON COLUMN system_oauth2_access_token.refresh_token IS 'ˢ������';
COMMENT ON COLUMN system_oauth2_access_token.client_id IS '�ͻ��˱��';
COMMENT ON COLUMN system_oauth2_access_token.scopes IS '��Ȩ��Χ';
COMMENT ON COLUMN system_oauth2_access_token.expires_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_access_token.creator IS '������';
COMMENT ON COLUMN system_oauth2_access_token.create_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_access_token.updater IS '������';
COMMENT ON COLUMN system_oauth2_access_token.update_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_access_token.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_oauth2_access_token.tenant_id IS '�⻧���';
COMMENT ON TABLE system_oauth2_access_token IS 'OAuth2 ��������';

-- ----------------------------
-- Table structure for system_oauth2_approve
-- ----------------------------
CREATE TABLE system_oauth2_approve
(
    id           bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    user_id      bigint                                 NOT NULL,
    user_type    smallint                               NOT NULL,
    client_id    varchar(255)                           NOT NULL,
    scope        varchar(255) DEFAULT ''                NULL,
    approved     bit          DEFAULT '0'               NOT NULL,
    expires_time datetime                               NOT NULL,
    creator      varchar(64)  DEFAULT ''                NULL,
    create_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater      varchar(64)  DEFAULT ''                NULL,
    update_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted      bit          DEFAULT '0'               NOT NULL,
    tenant_id    bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_oauth2_approve.id IS '���';
COMMENT ON COLUMN system_oauth2_approve.user_id IS '�û����';
COMMENT ON COLUMN system_oauth2_approve.user_type IS '�û�����';
COMMENT ON COLUMN system_oauth2_approve.client_id IS '�ͻ��˱��';
COMMENT ON COLUMN system_oauth2_approve.scope IS '��Ȩ��Χ';
COMMENT ON COLUMN system_oauth2_approve.approved IS '�Ƿ����';
COMMENT ON COLUMN system_oauth2_approve.expires_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_approve.creator IS '������';
COMMENT ON COLUMN system_oauth2_approve.create_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_approve.updater IS '������';
COMMENT ON COLUMN system_oauth2_approve.update_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_approve.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_oauth2_approve.tenant_id IS '�⻧���';
COMMENT ON TABLE system_oauth2_approve IS 'OAuth2 ��׼��';

-- ----------------------------
-- Table structure for system_oauth2_client
-- ----------------------------
CREATE TABLE system_oauth2_client
(
    id                             bigint                                  NOT NULL PRIMARY KEY IDENTITY,
    client_id                      varchar(255)                            NOT NULL,
    secret                         varchar(255)                            NOT NULL,
    name                           varchar(255)                            NOT NULL,
    logo                           varchar(255)                            NOT NULL,
    description                    varchar(255)  DEFAULT NULL              NULL,
    status                         smallint                                NOT NULL,
    access_token_validity_seconds  int                                     NOT NULL,
    refresh_token_validity_seconds int                                     NOT NULL,
    redirect_uris                  varchar(255)                            NOT NULL,
    authorized_grant_types         varchar(255)                            NOT NULL,
    scopes                         varchar(255)  DEFAULT NULL              NULL,
    auto_approve_scopes            varchar(255)  DEFAULT NULL              NULL,
    authorities                    varchar(255)  DEFAULT NULL              NULL,
    resource_ids                   varchar(255)  DEFAULT NULL              NULL,
    additional_information         varchar(4096) DEFAULT NULL              NULL,
    creator                        varchar(64)   DEFAULT ''                NULL,
    create_time                    datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater                        varchar(64)   DEFAULT ''                NULL,
    update_time                    datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted                        bit           DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_oauth2_client.id IS '���';
COMMENT ON COLUMN system_oauth2_client.client_id IS '�ͻ��˱��';
COMMENT ON COLUMN system_oauth2_client.secret IS '�ͻ�����Կ';
COMMENT ON COLUMN system_oauth2_client.name IS 'Ӧ����';
COMMENT ON COLUMN system_oauth2_client.logo IS 'Ӧ��ͼ��';
COMMENT ON COLUMN system_oauth2_client.description IS 'Ӧ������';
COMMENT ON COLUMN system_oauth2_client.status IS '״̬';
COMMENT ON COLUMN system_oauth2_client.access_token_validity_seconds IS '�������Ƶ���Ч��';
COMMENT ON COLUMN system_oauth2_client.refresh_token_validity_seconds IS 'ˢ�����Ƶ���Ч��';
COMMENT ON COLUMN system_oauth2_client.redirect_uris IS '���ض���� URI ��ַ';
COMMENT ON COLUMN system_oauth2_client.authorized_grant_types IS '��Ȩ����';
COMMENT ON COLUMN system_oauth2_client.scopes IS '��Ȩ��Χ';
COMMENT ON COLUMN system_oauth2_client.auto_approve_scopes IS '�Զ�ͨ������Ȩ��Χ';
COMMENT ON COLUMN system_oauth2_client.authorities IS 'Ȩ��';
COMMENT ON COLUMN system_oauth2_client.resource_ids IS '��Դ';
COMMENT ON COLUMN system_oauth2_client.additional_information IS '������Ϣ';
COMMENT ON COLUMN system_oauth2_client.creator IS '������';
COMMENT ON COLUMN system_oauth2_client.create_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_client.updater IS '������';
COMMENT ON COLUMN system_oauth2_client.update_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_client.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_oauth2_client IS 'OAuth2 �ͻ��˱�';

-- ----------------------------
-- Records of system_oauth2_client
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_oauth2_client ON;
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (1, 'default', 'admin123', '���Դ��', 'http://test.yudao.iocoder.cn/a5e2e244368878a366b516805a4aabf1.png', '��������', 0, 1800, 2592000, '["https://www.iocoder.cn","https://doc.iocoder.cn"]', '["password","authorization_code","implicit","refresh_token"]', '["user.read","user.write"]', '[]', '["user.read","user.write"]', '[]', '{}', '1', '2022-05-11 21:47:12', '1', '2024-02-22 16:31:52', '0');
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (40, 'test', 'test2', 'biubiu', 'http://test.yudao.iocoder.cn/277a899d573723f1fcdfb57340f00379.png', '��������', 0, 1800, 43200, '["https://www.iocoder.cn"]', '["password","authorization_code","implicit"]', '["user_info","projects"]', '["user_info"]', '[]', '[]', '{}', '1', '2022-05-12 00:28:20', '1', '2023-12-02 21:01:01', '0');
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (41, 'yudao-sso-demo-by-code', 'test', '������Ȩ��ģʽ�����ʵ�� SSO �����¼��', 'http://test.yudao.iocoder.cn/fe4ed36596adad5120036ef61a6d0153654544d44af8dd4ad3ffe8f759933d6f.png', NULL, 0, 1800, 43200, '["http://127.0.0.1:18080"]', '["authorization_code","refresh_token"]', '["user.read","user.write"]', '[]', '[]', '[]', NULL, '1', '2022-09-29 13:28:31', '1', '2022-09-29 13:28:31', '0');
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (42, 'yudao-sso-demo-by-password', 'test', '��������ģʽ�����ʵ�� SSO �����¼��', 'http://test.yudao.iocoder.cn/604bdc695e13b3b22745be704d1f2aa8ee05c5f26f9fead6d1ca49005afbc857.jpeg', NULL, 0, 1800, 43200, '["http://127.0.0.1:18080"]', '["password","refresh_token"]', '["user.read","user.write"]', '[]', '[]', '[]', NULL, '1', '2022-10-04 17:40:16', '1', '2022-10-04 20:31:21', '0');
COMMIT;
SET IDENTITY_INSERT system_oauth2_client OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_oauth2_code
-- ----------------------------
CREATE TABLE system_oauth2_code
(
    id           bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    user_id      bigint                                 NOT NULL,
    user_type    smallint                               NOT NULL,
    code         varchar(32)                            NOT NULL,
    client_id    varchar(255)                           NOT NULL,
    scopes       varchar(255) DEFAULT ''                NULL,
    expires_time datetime                               NOT NULL,
    redirect_uri varchar(255) DEFAULT NULL              NULL,
    state        varchar(255) DEFAULT ''                NULL,
    creator      varchar(64)  DEFAULT ''                NULL,
    create_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater      varchar(64)  DEFAULT ''                NULL,
    update_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted      bit          DEFAULT '0'               NOT NULL,
    tenant_id    bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_oauth2_code.id IS '���';
COMMENT ON COLUMN system_oauth2_code.user_id IS '�û����';
COMMENT ON COLUMN system_oauth2_code.user_type IS '�û�����';
COMMENT ON COLUMN system_oauth2_code.code IS '��Ȩ��';
COMMENT ON COLUMN system_oauth2_code.client_id IS '�ͻ��˱��';
COMMENT ON COLUMN system_oauth2_code.scopes IS '��Ȩ��Χ';
COMMENT ON COLUMN system_oauth2_code.expires_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_code.redirect_uri IS '���ض���� URI ��ַ';
COMMENT ON COLUMN system_oauth2_code.state IS '״̬';
COMMENT ON COLUMN system_oauth2_code.creator IS '������';
COMMENT ON COLUMN system_oauth2_code.create_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_code.updater IS '������';
COMMENT ON COLUMN system_oauth2_code.update_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_code.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_oauth2_code.tenant_id IS '�⻧���';
COMMENT ON TABLE system_oauth2_code IS 'OAuth2 ��Ȩ���';

-- ----------------------------
-- Table structure for system_oauth2_refresh_token
-- ----------------------------
CREATE TABLE system_oauth2_refresh_token
(
    id            bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    user_id       bigint                                 NOT NULL,
    refresh_token varchar(32)                            NOT NULL,
    user_type     smallint                               NOT NULL,
    client_id     varchar(255)                           NOT NULL,
    scopes        varchar(255) DEFAULT NULL              NULL,
    expires_time  datetime                               NOT NULL,
    creator       varchar(64)  DEFAULT ''                NULL,
    create_time   datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater       varchar(64)  DEFAULT ''                NULL,
    update_time   datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted       bit          DEFAULT '0'               NOT NULL,
    tenant_id     bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_oauth2_refresh_token.id IS '���';
COMMENT ON COLUMN system_oauth2_refresh_token.user_id IS '�û����';
COMMENT ON COLUMN system_oauth2_refresh_token.refresh_token IS 'ˢ������';
COMMENT ON COLUMN system_oauth2_refresh_token.user_type IS '�û�����';
COMMENT ON COLUMN system_oauth2_refresh_token.client_id IS '�ͻ��˱��';
COMMENT ON COLUMN system_oauth2_refresh_token.scopes IS '��Ȩ��Χ';
COMMENT ON COLUMN system_oauth2_refresh_token.expires_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_refresh_token.creator IS '������';
COMMENT ON COLUMN system_oauth2_refresh_token.create_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_refresh_token.updater IS '������';
COMMENT ON COLUMN system_oauth2_refresh_token.update_time IS '����ʱ��';
COMMENT ON COLUMN system_oauth2_refresh_token.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_oauth2_refresh_token.tenant_id IS '�⻧���';
COMMENT ON TABLE system_oauth2_refresh_token IS 'OAuth2 ˢ������';

-- ----------------------------
-- Table structure for system_operate_log
-- ----------------------------
CREATE TABLE system_operate_log
(
    id             bigint                                  NOT NULL PRIMARY KEY IDENTITY,
    trace_id       varchar(64)   DEFAULT ''                NULL,
    user_id        bigint                                  NOT NULL,
    user_type      smallint      DEFAULT 0                 NOT NULL,
    type           varchar(50)                             NOT NULL,
    sub_type       varchar(50)                             NOT NULL,
    biz_id         bigint                                  NOT NULL,
    action         varchar(2000) DEFAULT ''                NULL,
    extra          varchar(2000) DEFAULT ''                NULL,
    request_method varchar(16)   DEFAULT ''                NULL,
    request_url    varchar(255)  DEFAULT ''                NULL,
    user_ip        varchar(50)   DEFAULT NULL              NULL,
    user_agent     varchar(200)  DEFAULT NULL              NULL,
    creator        varchar(64)   DEFAULT ''                NULL,
    create_time    datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater        varchar(64)   DEFAULT ''                NULL,
    update_time    datetime      DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted        bit           DEFAULT '0'               NOT NULL,
    tenant_id      bigint        DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_operate_log.id IS '��־����';
COMMENT ON COLUMN system_operate_log.trace_id IS '��·׷�ٱ��';
COMMENT ON COLUMN system_operate_log.user_id IS '�û����';
COMMENT ON COLUMN system_operate_log.user_type IS '�û�����';
COMMENT ON COLUMN system_operate_log.type IS '����ģ������';
COMMENT ON COLUMN system_operate_log.sub_type IS '������';
COMMENT ON COLUMN system_operate_log.biz_id IS '��������ģ����';
COMMENT ON COLUMN system_operate_log.action IS '��������';
COMMENT ON COLUMN system_operate_log.extra IS '��չ�ֶ�';
COMMENT ON COLUMN system_operate_log.request_method IS '���󷽷���';
COMMENT ON COLUMN system_operate_log.request_url IS '�����ַ';
COMMENT ON COLUMN system_operate_log.user_ip IS '�û� IP';
COMMENT ON COLUMN system_operate_log.user_agent IS '����� UA';
COMMENT ON COLUMN system_operate_log.creator IS '������';
COMMENT ON COLUMN system_operate_log.create_time IS '����ʱ��';
COMMENT ON COLUMN system_operate_log.updater IS '������';
COMMENT ON COLUMN system_operate_log.update_time IS '����ʱ��';
COMMENT ON COLUMN system_operate_log.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_operate_log.tenant_id IS '�⻧���';
COMMENT ON TABLE system_operate_log IS '������־��¼ V2 �汾';

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
CREATE TABLE system_post
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    code        varchar(64)                            NOT NULL,
    name        varchar(50)                            NOT NULL,
    sort        int                                    NOT NULL,
    status      smallint                               NOT NULL,
    remark      varchar(500) DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_post.id IS '��λID';
COMMENT ON COLUMN system_post.code IS '��λ����';
COMMENT ON COLUMN system_post.name IS '��λ����';
COMMENT ON COLUMN system_post.sort IS '��ʾ˳��';
COMMENT ON COLUMN system_post.status IS '״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_post.remark IS '��ע';
COMMENT ON COLUMN system_post.creator IS '������';
COMMENT ON COLUMN system_post.create_time IS '����ʱ��';
COMMENT ON COLUMN system_post.updater IS '������';
COMMENT ON COLUMN system_post.update_time IS '����ʱ��';
COMMENT ON COLUMN system_post.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_post.tenant_id IS '�⻧���';
COMMENT ON TABLE system_post IS '��λ��Ϣ��';

-- ----------------------------
-- Records of system_post
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_post ON;
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 'ceo', '���³�', 1, 0, '', 'admin', '2021-01-06 17:03:48', '1', '2023-02-11 15:19:04', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 'se', '��Ŀ����', 2, 0, '', 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 09:18:20', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 'user', '��ͨԱ��', 4, 0, '111', 'admin', '2021-01-05 17:03:48', '1', '2023-12-02 10:04:37', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 'HR', '������Դ', 5, 0, '', '1', '2024-03-24 20:45:40', '1', '2024-03-24 20:45:40', '0', 1);
COMMIT;
SET IDENTITY_INSERT system_post OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
CREATE TABLE system_role
(
    id                  bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name                varchar(30)                            NOT NULL,
    code                varchar(100)                           NOT NULL,
    sort                int                                    NOT NULL,
    data_scope          smallint     DEFAULT 1                 NOT NULL,
    data_scope_dept_ids varchar(500) DEFAULT ''                NULL,
    status              smallint                               NOT NULL,
    type                smallint                               NOT NULL,
    remark              varchar(500) DEFAULT NULL              NULL,
    creator             varchar(64)  DEFAULT ''                NULL,
    create_time         datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater             varchar(64)  DEFAULT ''                NULL,
    update_time         datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted             bit          DEFAULT '0'               NOT NULL,
    tenant_id           bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_role.id IS '��ɫID';
COMMENT ON COLUMN system_role.name IS '��ɫ����';
COMMENT ON COLUMN system_role.code IS '��ɫȨ���ַ���';
COMMENT ON COLUMN system_role.sort IS '��ʾ˳��';
COMMENT ON COLUMN system_role.data_scope IS '���ݷ�Χ��1��ȫ������Ȩ�� 2���Զ�����Ȩ�� 3������������Ȩ�� 4�������ż���������Ȩ�ޣ�';
COMMENT ON COLUMN system_role.data_scope_dept_ids IS '���ݷ�Χ(ָ����������)';
COMMENT ON COLUMN system_role.status IS '��ɫ״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_role.type IS '��ɫ����';
COMMENT ON COLUMN system_role.remark IS '��ע';
COMMENT ON COLUMN system_role.creator IS '������';
COMMENT ON COLUMN system_role.create_time IS '����ʱ��';
COMMENT ON COLUMN system_role.updater IS '������';
COMMENT ON COLUMN system_role.update_time IS '����ʱ��';
COMMENT ON COLUMN system_role.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_role.tenant_id IS '�⻧���';
COMMENT ON TABLE system_role IS '��ɫ��Ϣ��';

-- ----------------------------
-- Records of system_role
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_role ON;
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '��������Ա', 'super_admin', 1, 1, '', 0, 1, '��������Ա', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:21', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '��ͨ��ɫ', 'common', 2, 2, '', 0, 1, '��ͨ��ɫ', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:20', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 'CRM ����Ա', 'crm_admin', 2, 1, '', 0, 1, 'CRM ר����ɫ', '1', '2024-02-24 10:51:13', '1', '2024-02-24 02:51:32', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (101, '�����˺�', 'test', 0, 1, '[]', 0, 2, '�������', '', '2021-01-06 13:49:35', '1', '2024-03-24 22:22:45', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, '�⻧����Ա', 'tenant_admin', 0, 1, '', 0, 1, 'ϵͳ�Զ�����', '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, '�⻧����Ա', 'tenant_admin', 0, 1, '', 0, 1, 'ϵͳ�Զ�����', '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
COMMIT;
SET IDENTITY_INSERT system_role OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
CREATE TABLE system_role_menu
(
    id          bigint                                NOT NULL PRIMARY KEY IDENTITY,
    role_id     bigint                                NOT NULL,
    menu_id     bigint                                NOT NULL,
    creator     varchar(64) DEFAULT ''                NULL,
    create_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64) DEFAULT ''                NULL,
    update_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit         DEFAULT '0'               NOT NULL,
    tenant_id   bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_role_menu.id IS '�������';
COMMENT ON COLUMN system_role_menu.role_id IS '��ɫID';
COMMENT ON COLUMN system_role_menu.menu_id IS '�˵�ID';
COMMENT ON COLUMN system_role_menu.creator IS '������';
COMMENT ON COLUMN system_role_menu.create_time IS '����ʱ��';
COMMENT ON COLUMN system_role_menu.updater IS '������';
COMMENT ON COLUMN system_role_menu.update_time IS '����ʱ��';
COMMENT ON COLUMN system_role_menu.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_role_menu.tenant_id IS '�⻧���';
COMMENT ON TABLE system_role_menu IS '��ɫ�Ͳ˵�������';

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_role_menu ON;
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (263, 109, 1, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (434, 2, 1, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (454, 2, 1093, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (455, 2, 1094, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (460, 2, 1100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (467, 2, 1107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (476, 2, 1117, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (477, 2, 100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (478, 2, 101, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (479, 2, 102, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (480, 2, 1126, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (481, 2, 103, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (483, 2, 104, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (485, 2, 105, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (488, 2, 107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (490, 2, 108, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (492, 2, 109, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (498, 2, 1138, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (523, 2, 1224, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (524, 2, 1225, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (541, 2, 500, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (543, 2, 501, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (675, 2, 2, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (689, 2, 1077, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (690, 2, 1078, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (692, 2, 1083, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (693, 2, 1084, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (699, 2, 1090, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (703, 2, 106, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (704, 2, 110, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (705, 2, 111, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (706, 2, 112, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (707, 2, 113, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1296, 110, 1, '110', '2022-02-23 00:23:55', '110', '2022-02-23 00:23:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1578, 111, 1, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1604, 101, 1216, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1605, 101, 1217, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1606, 101, 1218, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1607, 101, 1219, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1608, 101, 1220, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1609, 101, 1221, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1610, 101, 5, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1611, 101, 1222, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1612, 101, 1118, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1613, 101, 1119, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1614, 101, 1120, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1615, 101, 1185, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1616, 101, 1186, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1617, 101, 1187, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1618, 101, 1188, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1619, 101, 1189, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1620, 101, 1190, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1621, 101, 1191, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1622, 101, 1192, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1623, 101, 1193, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1624, 101, 1194, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1625, 101, 1195, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1626, 101, 1196, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1627, 101, 1197, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1628, 101, 1198, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1629, 101, 1199, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1630, 101, 1200, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1631, 101, 1201, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1632, 101, 1202, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1633, 101, 1207, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1634, 101, 1208, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1635, 101, 1209, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1636, 101, 1210, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1637, 101, 1211, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1638, 101, 1212, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1639, 101, 1213, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1640, 101, 1215, '1', '2022-03-19 21:45:52', '1', '2022-03-19 21:45:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1641, 101, 2, '1', '2022-04-01 22:21:24', '1', '2022-04-01 22:21:24', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1642, 101, 1031, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1643, 101, 1032, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1644, 101, 1033, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1645, 101, 1034, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1646, 101, 1035, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1647, 101, 1050, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1648, 101, 1051, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1649, 101, 1052, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1650, 101, 1053, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1651, 101, 1054, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1652, 101, 1056, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1653, 101, 1057, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1654, 101, 1058, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1655, 101, 1059, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1656, 101, 1060, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1657, 101, 1066, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1658, 101, 1067, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1659, 101, 1070, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1664, 101, 1075, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1666, 101, 1077, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1667, 101, 1078, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1668, 101, 1082, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1669, 101, 1083, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1670, 101, 1084, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1671, 101, 1085, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1672, 101, 1086, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1673, 101, 1087, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1674, 101, 1088, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1675, 101, 1089, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1679, 101, 1237, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1680, 101, 1238, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1681, 101, 1239, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1682, 101, 1240, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1683, 101, 1241, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1684, 101, 1242, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1685, 101, 1243, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1687, 101, 106, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1688, 101, 110, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1689, 101, 111, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1690, 101, 112, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1691, 101, 113, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1692, 101, 114, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1693, 101, 115, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1694, 101, 116, '1', '2022-04-01 22:21:37', '1', '2022-04-01 22:21:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1729, 109, 100, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1730, 109, 101, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1731, 109, 1063, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1732, 109, 1064, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1733, 109, 1001, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1734, 109, 1065, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1735, 109, 1002, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1736, 109, 1003, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1737, 109, 1004, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1738, 109, 1005, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1739, 109, 1006, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1740, 109, 1007, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1741, 109, 1008, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1742, 109, 1009, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1743, 109, 1010, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1744, 109, 1011, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1745, 109, 1012, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1746, 111, 100, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1747, 111, 101, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1748, 111, 1063, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1749, 111, 1064, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1750, 111, 1001, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1751, 111, 1065, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1752, 111, 1002, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1753, 111, 1003, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1754, 111, 1004, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1755, 111, 1005, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1756, 111, 1006, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1757, 111, 1007, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1758, 111, 1008, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1759, 111, 1009, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1760, 111, 1010, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1761, 111, 1011, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1762, 111, 1012, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1763, 109, 100, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1764, 109, 101, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1765, 109, 1063, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1766, 109, 1064, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1767, 109, 1001, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1768, 109, 1065, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1769, 109, 1002, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1770, 109, 1003, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1771, 109, 1004, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1772, 109, 1005, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1773, 109, 1006, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1774, 109, 1007, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1775, 109, 1008, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1776, 109, 1009, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1777, 109, 1010, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1778, 109, 1011, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1779, 109, 1012, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1780, 111, 100, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1781, 111, 101, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1782, 111, 1063, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1783, 111, 1064, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1784, 111, 1001, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1785, 111, 1065, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1786, 111, 1002, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1787, 111, 1003, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1788, 111, 1004, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1789, 111, 1005, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1790, 111, 1006, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1791, 111, 1007, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1792, 111, 1008, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1793, 111, 1009, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1794, 111, 1010, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1795, 111, 1011, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1796, 111, 1012, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1797, 109, 100, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1798, 109, 101, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1799, 109, 1063, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1800, 109, 1064, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1801, 109, 1001, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1802, 109, 1065, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1803, 109, 1002, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1804, 109, 1003, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1805, 109, 1004, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1806, 109, 1005, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1807, 109, 1006, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1808, 109, 1007, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1809, 109, 1008, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1810, 109, 1009, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1811, 109, 1010, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1812, 109, 1011, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1813, 109, 1012, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1814, 111, 100, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1815, 111, 101, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1816, 111, 1063, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1817, 111, 1064, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1818, 111, 1001, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1819, 111, 1065, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1820, 111, 1002, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1821, 111, 1003, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1822, 111, 1004, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1823, 111, 1005, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1824, 111, 1006, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1825, 111, 1007, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1826, 111, 1008, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1827, 111, 1009, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1828, 111, 1010, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1829, 111, 1011, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1830, 111, 1012, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1831, 109, 103, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1832, 109, 1017, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1833, 109, 1018, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1834, 109, 1019, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1835, 109, 1020, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1836, 111, 103, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1837, 111, 1017, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1838, 111, 1018, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1839, 111, 1019, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1840, 111, 1020, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1841, 109, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1842, 109, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1843, 109, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1844, 109, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1845, 109, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1846, 111, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1847, 111, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1848, 111, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1849, 111, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1850, 111, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1991, 2, 1024, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1992, 2, 1025, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1993, 2, 1026, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1994, 2, 1027, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1995, 2, 1028, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1996, 2, 1029, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1997, 2, 1030, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1998, 2, 1031, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1999, 2, 1032, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2000, 2, 1033, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2001, 2, 1034, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2002, 2, 1035, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2003, 2, 1036, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2004, 2, 1037, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2005, 2, 1038, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2006, 2, 1039, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2007, 2, 1040, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2008, 2, 1042, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2009, 2, 1043, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2010, 2, 1045, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2011, 2, 1046, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2012, 2, 1048, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2013, 2, 1050, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2014, 2, 1051, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2015, 2, 1052, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2016, 2, 1053, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2017, 2, 1054, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2018, 2, 1056, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2019, 2, 1057, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2020, 2, 1058, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2021, 2, 2083, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2022, 2, 1059, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2023, 2, 1060, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2024, 2, 1063, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2025, 2, 1064, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2026, 2, 1065, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2027, 2, 1066, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2028, 2, 1067, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2029, 2, 1070, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2034, 2, 1075, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2036, 2, 1082, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2037, 2, 1085, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2038, 2, 1086, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2039, 2, 1087, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2040, 2, 1088, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2041, 2, 1089, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2042, 2, 1091, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2043, 2, 1092, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2044, 2, 1095, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2045, 2, 1096, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2046, 2, 1097, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2047, 2, 1098, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2048, 2, 1101, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2049, 2, 1102, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2050, 2, 1103, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2051, 2, 1104, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2052, 2, 1105, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2053, 2, 1106, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2054, 2, 1108, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2055, 2, 1109, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2061, 2, 1127, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2062, 2, 1128, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2063, 2, 1129, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2064, 2, 1130, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2066, 2, 1132, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2067, 2, 1133, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2068, 2, 1134, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2069, 2, 1135, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2070, 2, 1136, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2071, 2, 1137, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2072, 2, 114, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2073, 2, 1139, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2074, 2, 115, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2075, 2, 1140, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2076, 2, 116, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2077, 2, 1141, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2078, 2, 1142, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2079, 2, 1143, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2080, 2, 1150, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2081, 2, 1161, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2082, 2, 1162, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2083, 2, 1163, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2084, 2, 1164, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2085, 2, 1165, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2086, 2, 1166, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2087, 2, 1173, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2088, 2, 1174, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2089, 2, 1175, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2090, 2, 1176, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2091, 2, 1177, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2092, 2, 1178, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2099, 2, 1226, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2100, 2, 1227, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2101, 2, 1228, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2102, 2, 1229, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2103, 2, 1237, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2104, 2, 1238, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2105, 2, 1239, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2106, 2, 1240, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2107, 2, 1241, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2108, 2, 1242, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2109, 2, 1243, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2116, 2, 1254, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2117, 2, 1255, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2118, 2, 1256, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2119, 2, 1257, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2120, 2, 1258, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2121, 2, 1259, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2122, 2, 1260, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2123, 2, 1261, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2124, 2, 1263, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2125, 2, 1264, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2126, 2, 1265, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2127, 2, 1266, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2128, 2, 1267, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2129, 2, 1001, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2130, 2, 1002, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2131, 2, 1003, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2132, 2, 1004, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2133, 2, 1005, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2134, 2, 1006, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2135, 2, 1007, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2136, 2, 1008, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2137, 2, 1009, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2138, 2, 1010, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2139, 2, 1011, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2140, 2, 1012, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2141, 2, 1013, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2142, 2, 1014, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2143, 2, 1015, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2144, 2, 1016, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2145, 2, 1017, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2146, 2, 1018, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2147, 2, 1019, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2148, 2, 1020, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2149, 2, 1021, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2150, 2, 1022, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2151, 2, 1023, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2152, 2, 1281, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2153, 2, 1282, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2154, 2, 2000, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2155, 2, 2002, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2156, 2, 2003, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2157, 2, 2004, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2158, 2, 2005, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2159, 2, 2006, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2160, 2, 2008, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2161, 2, 2009, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2162, 2, 2010, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2163, 2, 2011, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2164, 2, 2012, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2170, 2, 2019, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2171, 2, 2020, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2172, 2, 2021, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2173, 2, 2022, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2174, 2, 2023, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2175, 2, 2025, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2177, 2, 2027, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2178, 2, 2028, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2179, 2, 2029, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2180, 2, 2014, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2181, 2, 2015, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2182, 2, 2016, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2183, 2, 2017, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2184, 2, 2018, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2188, 101, 1024, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2189, 101, 1, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2190, 101, 1025, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2191, 101, 1026, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2192, 101, 1027, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2193, 101, 1028, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2194, 101, 1029, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2195, 101, 1030, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2196, 101, 1036, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2197, 101, 1037, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2198, 101, 1038, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2199, 101, 1039, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2200, 101, 1040, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2201, 101, 1042, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2202, 101, 1043, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2203, 101, 1045, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2204, 101, 1046, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2205, 101, 1048, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2206, 101, 2083, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2207, 101, 1063, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2208, 101, 1064, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2209, 101, 1065, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2210, 101, 1093, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2211, 101, 1094, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2212, 101, 1095, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2213, 101, 1096, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2214, 101, 1097, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2215, 101, 1098, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2216, 101, 1100, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2217, 101, 1101, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2218, 101, 1102, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2219, 101, 1103, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2220, 101, 1104, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2221, 101, 1105, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2222, 101, 1106, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2223, 101, 2130, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2224, 101, 1107, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2225, 101, 2131, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2226, 101, 1108, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2227, 101, 2132, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2228, 101, 1109, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2229, 101, 2133, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2230, 101, 2134, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2232, 101, 2135, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2234, 101, 2136, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2236, 101, 2137, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2238, 101, 2138, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2240, 101, 2139, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2242, 101, 2140, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2243, 101, 2141, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2244, 101, 2142, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2245, 101, 2143, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2246, 101, 2144, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2247, 101, 2145, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2248, 101, 2146, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2249, 101, 2147, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2250, 101, 100, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2251, 101, 2148, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2252, 101, 101, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2253, 101, 2149, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2254, 101, 102, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2255, 101, 2150, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2256, 101, 103, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2257, 101, 2151, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2258, 101, 104, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2259, 101, 2152, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2260, 101, 105, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2261, 101, 107, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2262, 101, 108, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2263, 101, 109, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2264, 101, 1138, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2265, 101, 1139, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2266, 101, 1140, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2267, 101, 1141, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2268, 101, 1142, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2269, 101, 1143, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2270, 101, 1224, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2271, 101, 1225, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2272, 101, 1226, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2273, 101, 1227, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2274, 101, 1228, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2275, 101, 1229, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2282, 101, 1261, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2283, 101, 1263, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2284, 101, 1264, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2285, 101, 1265, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2286, 101, 1266, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2287, 101, 1267, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2288, 101, 1001, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2289, 101, 1002, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2290, 101, 1003, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2291, 101, 1004, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2292, 101, 1005, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2293, 101, 1006, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2294, 101, 1007, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2295, 101, 1008, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2296, 101, 1009, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2297, 101, 1010, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2298, 101, 1011, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2299, 101, 1012, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2300, 101, 500, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2301, 101, 1013, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2302, 101, 501, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2303, 101, 1014, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2304, 101, 1015, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2305, 101, 1016, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2306, 101, 1017, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2307, 101, 1018, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2308, 101, 1019, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2309, 101, 1020, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2310, 101, 1021, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2311, 101, 1022, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2312, 101, 1023, '1', '2023-02-09 23:49:46', '1', '2023-02-09 23:49:46', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2929, 109, 1224, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2930, 109, 1225, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2931, 109, 1226, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2932, 109, 1227, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2933, 109, 1228, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2934, 109, 1229, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2935, 109, 1138, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2936, 109, 1139, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2937, 109, 1140, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2938, 109, 1141, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2939, 109, 1142, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2940, 109, 1143, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2941, 111, 1224, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2942, 111, 1225, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2943, 111, 1226, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2944, 111, 1227, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2945, 111, 1228, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2946, 111, 1229, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2947, 111, 1138, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2948, 111, 1139, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2949, 111, 1140, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2950, 111, 1141, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2951, 111, 1142, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2952, 111, 1143, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2993, 109, 2, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2994, 109, 1031, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2995, 109, 1032, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2996, 109, 1033, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2997, 109, 1034, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2998, 109, 1035, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2999, 109, 1050, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3000, 109, 1051, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3001, 109, 1052, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3002, 109, 1053, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3003, 109, 1054, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3004, 109, 1056, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3005, 109, 1057, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3006, 109, 1058, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3007, 109, 1059, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3008, 109, 1060, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3009, 109, 1066, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3010, 109, 1067, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3011, 109, 1070, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3012, 109, 1075, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3013, 109, 1076, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3014, 109, 1077, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3015, 109, 1078, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3016, 109, 1082, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3017, 109, 1083, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3018, 109, 1084, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3019, 109, 1085, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3020, 109, 1086, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3021, 109, 1087, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3022, 109, 1088, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3023, 109, 1089, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3024, 109, 1090, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3025, 109, 1091, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3026, 109, 1092, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3027, 109, 106, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3028, 109, 110, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3029, 109, 111, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3030, 109, 112, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3031, 109, 113, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3032, 109, 114, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3033, 109, 115, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3034, 109, 116, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3035, 109, 2472, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3036, 109, 2478, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3037, 109, 2479, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3038, 109, 2480, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3039, 109, 2481, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3040, 109, 2482, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3041, 109, 2483, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3042, 109, 2484, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3043, 109, 2485, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3044, 109, 2486, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3045, 109, 2487, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3046, 109, 2488, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3047, 109, 2489, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3048, 109, 2490, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3049, 109, 2491, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3050, 109, 2492, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3051, 109, 2493, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3052, 109, 2494, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3053, 109, 2495, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3054, 109, 2497, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3055, 109, 1237, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3056, 109, 1238, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3057, 109, 1239, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3058, 109, 1240, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3059, 109, 1241, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3060, 109, 1242, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3061, 109, 1243, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3062, 109, 2525, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3063, 109, 1255, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3064, 109, 1256, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3065, 109, 1257, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3066, 109, 1258, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3067, 109, 1259, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3068, 109, 1260, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3069, 111, 2, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3070, 111, 1031, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3071, 111, 1032, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3072, 111, 1033, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3073, 111, 1034, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3074, 111, 1035, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3075, 111, 1050, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3076, 111, 1051, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3077, 111, 1052, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3078, 111, 1053, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3079, 111, 1054, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3080, 111, 1056, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3081, 111, 1057, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3082, 111, 1058, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3083, 111, 1059, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3084, 111, 1060, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3085, 111, 1066, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3086, 111, 1067, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3087, 111, 1070, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3088, 111, 1075, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3089, 111, 1076, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3090, 111, 1077, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3091, 111, 1078, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3092, 111, 1082, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3093, 111, 1083, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3094, 111, 1084, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3095, 111, 1085, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3096, 111, 1086, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3097, 111, 1087, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3098, 111, 1088, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3099, 111, 1089, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3100, 111, 1090, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3101, 111, 1091, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3102, 111, 1092, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3103, 111, 106, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3104, 111, 110, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3105, 111, 111, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3106, 111, 112, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3107, 111, 113, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3108, 111, 114, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3109, 111, 115, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3110, 111, 116, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3111, 111, 2472, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3112, 111, 2478, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3113, 111, 2479, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3114, 111, 2480, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3115, 111, 2481, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3116, 111, 2482, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3117, 111, 2483, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3118, 111, 2484, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3119, 111, 2485, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3120, 111, 2486, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3121, 111, 2487, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3122, 111, 2488, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3123, 111, 2489, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3124, 111, 2490, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3125, 111, 2491, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3126, 111, 2492, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3127, 111, 2493, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3128, 111, 2494, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3129, 111, 2495, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3130, 111, 2497, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3131, 111, 1237, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3132, 111, 1238, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3133, 111, 1239, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3134, 111, 1240, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3135, 111, 1241, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3136, 111, 1242, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3137, 111, 1243, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3138, 111, 2525, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3139, 111, 1255, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3140, 111, 1256, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3141, 111, 1257, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3142, 111, 1258, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3143, 111, 1259, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3144, 111, 1260, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3221, 109, 102, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3222, 109, 1013, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3223, 109, 1014, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3224, 109, 1015, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3225, 109, 1016, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3226, 111, 102, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3227, 111, 1013, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3228, 111, 1014, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3229, 111, 1015, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3230, 111, 1016, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4163, 109, 5, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4164, 109, 1118, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4165, 109, 1119, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4166, 109, 1120, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4167, 109, 2713, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4168, 109, 2714, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4169, 109, 2715, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4170, 109, 2716, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4171, 109, 2717, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4172, 109, 2718, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4173, 109, 2720, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4174, 109, 1185, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4175, 109, 2721, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4176, 109, 1186, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4177, 109, 2722, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4178, 109, 1187, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4179, 109, 2723, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4180, 109, 1188, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4181, 109, 2724, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4182, 109, 1189, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4183, 109, 2725, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4184, 109, 1190, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4185, 109, 2726, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4186, 109, 1191, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4187, 109, 2727, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4188, 109, 1192, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4189, 109, 2728, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4190, 109, 1193, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4191, 109, 2729, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4192, 109, 1194, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4193, 109, 2730, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4194, 109, 1195, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4195, 109, 2731, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4196, 109, 1196, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4197, 109, 2732, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4198, 109, 1197, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4199, 109, 2733, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4200, 109, 1198, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4201, 109, 2734, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4202, 109, 1199, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4203, 109, 2735, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4204, 109, 1200, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4205, 109, 1201, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4206, 109, 1202, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4207, 109, 1207, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4208, 109, 1208, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4209, 109, 1209, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4210, 109, 1210, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4211, 109, 1211, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4212, 109, 1212, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4213, 109, 1213, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4214, 109, 1215, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4215, 109, 1216, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4216, 109, 1217, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4217, 109, 1218, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4218, 109, 1219, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4219, 109, 1220, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4220, 109, 1221, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4221, 109, 1222, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4222, 111, 5, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4223, 111, 1118, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4224, 111, 1119, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4225, 111, 1120, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4226, 111, 2713, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4227, 111, 2714, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4228, 111, 2715, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4229, 111, 2716, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4230, 111, 2717, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4231, 111, 2718, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4232, 111, 2720, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4233, 111, 1185, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4234, 111, 2721, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4235, 111, 1186, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4236, 111, 2722, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4237, 111, 1187, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4238, 111, 2723, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4239, 111, 1188, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4240, 111, 2724, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4241, 111, 1189, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4242, 111, 2725, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4243, 111, 1190, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4244, 111, 2726, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4245, 111, 1191, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4246, 111, 2727, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4247, 111, 1192, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4248, 111, 2728, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4249, 111, 1193, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4250, 111, 2729, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4251, 111, 1194, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4252, 111, 2730, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4253, 111, 1195, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4254, 111, 2731, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4255, 111, 1196, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4256, 111, 2732, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4257, 111, 1197, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4258, 111, 2733, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4259, 111, 1198, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4260, 111, 2734, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4261, 111, 1199, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4262, 111, 2735, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4263, 111, 1200, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4264, 111, 1201, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4265, 111, 1202, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4266, 111, 1207, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4267, 111, 1208, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4268, 111, 1209, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4269, 111, 1210, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4270, 111, 1211, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4271, 111, 1212, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4272, 111, 1213, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4273, 111, 1215, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4274, 111, 1216, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4275, 111, 1217, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4276, 111, 1218, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4277, 111, 1219, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4278, 111, 1220, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4279, 111, 1221, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4280, 111, 1222, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5777, 101, 2739, '1', '2024-04-30 09:38:37', '1', '2024-04-30 09:38:37', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5778, 101, 2740, '1', '2024-04-30 09:38:37', '1', '2024-04-30 09:38:37', '0', 1);
COMMIT;
SET IDENTITY_INSERT system_role_menu OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_sms_channel
-- ----------------------------
CREATE TABLE system_sms_channel
(
    id           bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    signature    varchar(12)                            NOT NULL,
    code         varchar(63)                            NOT NULL,
    status       smallint                               NOT NULL,
    remark       varchar(255) DEFAULT NULL              NULL,
    api_key      varchar(128)                           NOT NULL,
    api_secret   varchar(128) DEFAULT NULL              NULL,
    callback_url varchar(255) DEFAULT NULL              NULL,
    creator      varchar(64)  DEFAULT ''                NULL,
    create_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater      varchar(64)  DEFAULT ''                NULL,
    update_time  datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted      bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_sms_channel.id IS '���';
COMMENT ON COLUMN system_sms_channel.signature IS '����ǩ��';
COMMENT ON COLUMN system_sms_channel.code IS '��������';
COMMENT ON COLUMN system_sms_channel.status IS '����״̬';
COMMENT ON COLUMN system_sms_channel.remark IS '��ע';
COMMENT ON COLUMN system_sms_channel.api_key IS '���� API ���˺�';
COMMENT ON COLUMN system_sms_channel.api_secret IS '���� API ����Կ';
COMMENT ON COLUMN system_sms_channel.callback_url IS '���ŷ��ͻص� URL';
COMMENT ON COLUMN system_sms_channel.creator IS '������';
COMMENT ON COLUMN system_sms_channel.create_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_channel.updater IS '������';
COMMENT ON COLUMN system_sms_channel.update_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_channel.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_sms_channel IS '��������';

-- ----------------------------
-- Records of system_sms_channel
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_sms_channel ON;
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (2, 'Ballcat', 'ALIYUN', 0, '��Ҫ��Ŷ��ֻ���ҿ����ã�������', 'LTAI5tCnKso2uG3kJ5gRav88', 'fGJ5SNXL7P1NHNRmJ7DJaMJGPyE55C', NULL, '', '2021-03-31 11:53:10', '1', '2023-12-02 22:10:17', '0');
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (4, '��������', 'DEBUG_DING_TALK', 0, '123', '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2021-04-13 00:23:14', '1', '2022-03-27 20:29:49', '0');
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (6, '������ʾ', 'DEBUG_DING_TALK', 0, '������', '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2022-04-10 23:07:59', '1', '2023-12-02 22:10:08', '0');
COMMIT;
SET IDENTITY_INSERT system_sms_channel OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_sms_code
-- ----------------------------
CREATE TABLE system_sms_code
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    mobile      varchar(11)                            NOT NULL,
    code        varchar(6)                             NOT NULL,
    create_ip   varchar(15)                            NOT NULL,
    scene       smallint                               NOT NULL,
    today_index smallint                               NOT NULL,
    used        smallint                               NOT NULL,
    used_time   datetime     DEFAULT NULL              NULL,
    used_ip     varchar(255) DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

CREATE INDEX idx_system_sms_code_01 ON system_sms_code (mobile);

COMMENT ON COLUMN system_sms_code.id IS '���';
COMMENT ON COLUMN system_sms_code.mobile IS '�ֻ���';
COMMENT ON COLUMN system_sms_code.code IS '��֤��';
COMMENT ON COLUMN system_sms_code.create_ip IS '���� IP';
COMMENT ON COLUMN system_sms_code.scene IS '���ͳ���';
COMMENT ON COLUMN system_sms_code.today_index IS '���շ��͵ĵڼ���';
COMMENT ON COLUMN system_sms_code.used IS '�Ƿ�ʹ��';
COMMENT ON COLUMN system_sms_code.used_time IS 'ʹ��ʱ��';
COMMENT ON COLUMN system_sms_code.used_ip IS 'ʹ�� IP';
COMMENT ON COLUMN system_sms_code.creator IS '������';
COMMENT ON COLUMN system_sms_code.create_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_code.updater IS '������';
COMMENT ON COLUMN system_sms_code.update_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_code.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_sms_code.tenant_id IS '�⻧���';
COMMENT ON TABLE system_sms_code IS '�ֻ���֤��';

-- ----------------------------
-- Table structure for system_sms_log
-- ----------------------------
CREATE TABLE system_sms_log
(
    id               bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    channel_id       bigint                                 NOT NULL,
    channel_code     varchar(63)                            NOT NULL,
    template_id      bigint                                 NOT NULL,
    template_code    varchar(63)                            NOT NULL,
    template_type    smallint                               NOT NULL,
    template_content varchar(255)                           NOT NULL,
    template_params  varchar(255)                           NOT NULL,
    api_template_id  varchar(63)                            NOT NULL,
    mobile           varchar(11)                            NOT NULL,
    user_id          bigint       DEFAULT NULL              NULL,
    user_type        smallint     DEFAULT NULL              NULL,
    send_status      smallint     DEFAULT 0                 NOT NULL,
    send_time        datetime     DEFAULT NULL              NULL,
    api_send_code    varchar(63)  DEFAULT NULL              NULL,
    api_send_msg     varchar(255) DEFAULT NULL              NULL,
    api_request_id   varchar(255) DEFAULT NULL              NULL,
    api_serial_no    varchar(255) DEFAULT NULL              NULL,
    receive_status   smallint     DEFAULT 0                 NOT NULL,
    receive_time     datetime     DEFAULT NULL              NULL,
    api_receive_code varchar(63)  DEFAULT NULL              NULL,
    api_receive_msg  varchar(255) DEFAULT NULL              NULL,
    creator          varchar(64)  DEFAULT ''                NULL,
    create_time      datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater          varchar(64)  DEFAULT ''                NULL,
    update_time      datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted          bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_sms_log.id IS '���';
COMMENT ON COLUMN system_sms_log.channel_id IS '�����������';
COMMENT ON COLUMN system_sms_log.channel_code IS '������������';
COMMENT ON COLUMN system_sms_log.template_id IS 'ģ����';
COMMENT ON COLUMN system_sms_log.template_code IS 'ģ�����';
COMMENT ON COLUMN system_sms_log.template_type IS '��������';
COMMENT ON COLUMN system_sms_log.template_content IS '��������';
COMMENT ON COLUMN system_sms_log.template_params IS '���Ų���';
COMMENT ON COLUMN system_sms_log.api_template_id IS '���� API ��ģ����';
COMMENT ON COLUMN system_sms_log.mobile IS '�ֻ���';
COMMENT ON COLUMN system_sms_log.user_id IS '�û����';
COMMENT ON COLUMN system_sms_log.user_type IS '�û�����';
COMMENT ON COLUMN system_sms_log.send_status IS '����״̬';
COMMENT ON COLUMN system_sms_log.send_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_log.api_send_code IS '���� API ���ͽ���ı���';
COMMENT ON COLUMN system_sms_log.api_send_msg IS '���� API ����ʧ�ܵ���ʾ';
COMMENT ON COLUMN system_sms_log.api_request_id IS '���� API ���ͷ��ص�Ψһ���� ID';
COMMENT ON COLUMN system_sms_log.api_serial_no IS '���� API ���ͷ��ص����';
COMMENT ON COLUMN system_sms_log.receive_status IS '����״̬';
COMMENT ON COLUMN system_sms_log.receive_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_log.api_receive_code IS 'API ���ս���ı���';
COMMENT ON COLUMN system_sms_log.api_receive_msg IS 'API ���ս����˵��';
COMMENT ON COLUMN system_sms_log.creator IS '������';
COMMENT ON COLUMN system_sms_log.create_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_log.updater IS '������';
COMMENT ON COLUMN system_sms_log.update_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_log.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_sms_log IS '������־';

-- ----------------------------
-- Table structure for system_sms_template
-- ----------------------------
CREATE TABLE system_sms_template
(
    id              bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    type            smallint                               NOT NULL,
    status          smallint                               NOT NULL,
    code            varchar(63)                            NOT NULL,
    name            varchar(63)                            NOT NULL,
    content         varchar(255)                           NOT NULL,
    params          varchar(255)                           NOT NULL,
    remark          varchar(255) DEFAULT NULL              NULL,
    api_template_id varchar(63)                            NOT NULL,
    channel_id      bigint                                 NOT NULL,
    channel_code    varchar(63)                            NOT NULL,
    creator         varchar(64)  DEFAULT ''                NULL,
    create_time     datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater         varchar(64)  DEFAULT ''                NULL,
    update_time     datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted         bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_sms_template.id IS '���';
COMMENT ON COLUMN system_sms_template.type IS 'ģ������';
COMMENT ON COLUMN system_sms_template.status IS '����״̬';
COMMENT ON COLUMN system_sms_template.code IS 'ģ�����';
COMMENT ON COLUMN system_sms_template.name IS 'ģ������';
COMMENT ON COLUMN system_sms_template.content IS 'ģ������';
COMMENT ON COLUMN system_sms_template.params IS '��������';
COMMENT ON COLUMN system_sms_template.remark IS '��ע';
COMMENT ON COLUMN system_sms_template.api_template_id IS '���� API ��ģ����';
COMMENT ON COLUMN system_sms_template.channel_id IS '�����������';
COMMENT ON COLUMN system_sms_template.channel_code IS '������������';
COMMENT ON COLUMN system_sms_template.creator IS '������';
COMMENT ON COLUMN system_sms_template.create_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_template.updater IS '������';
COMMENT ON COLUMN system_sms_template.update_time IS '����ʱ��';
COMMENT ON COLUMN system_sms_template.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_sms_template IS '����ģ��';

-- ----------------------------
-- Records of system_sms_template
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_sms_template ON;
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (2, 1, 0, 'test_01', '������֤�����', '���ڽ��е�¼����{operation}��������֤����{code}', '["operation","code"]', '���Ա�ע', '4383920', 6, 'DEBUG_DING_TALK', '', '2021-03-31 10:49:38', '1', '2023-12-02 22:32:47', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (3, 1, 0, 'test_02', '����֪ͨ', '������֤��{code}������֤��5��������Ч������й©�����ˣ�', '["code"]', NULL, 'SMS_207945135', 2, 'ALIYUN', '', '2021-03-31 11:56:30', '1', '2021-04-10 01:22:02', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (6, 3, 0, 'test-01', '����ģ��', '������ {name}', '["name"]', 'f������', '4383920', 6, 'DEBUG_DING_TALK', '1', '2021-04-10 01:07:21', '1', '2022-12-10 21:26:09', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (7, 3, 0, 'test-04', '������', '�ϼ�{name}��ţ��{code}', '["name","code"]', '��������', 'suibian', 4, 'DEBUG_DING_TALK', '1', '2021-04-13 00:29:53', '1', '2023-12-02 22:35:34', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (8, 1, 0, 'user-sms-login', 'ǰ̨�û����ŵ�¼', '������֤����{code}', '["code"]', NULL, '4372216', 6, 'DEBUG_DING_TALK', '1', '2021-10-11 08:10:00', '1', '2022-12-10 21:25:59', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (9, 2, 0, 'bpm_task_assigned', '�������������񱻷���', '���յ���һ���µĴ�������{processInstanceName}-{taskName}�������ˣ�{startUserNickname}���������ӣ�{detailUrl}', '["processInstanceName","taskName","startUserNickname","detailUrl"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-21 22:31:19', '1', '2022-01-22 00:03:36', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (10, 2, 0, 'bpm_process_instance_reject', '�������������̱���ͨ��', '�������̱�������ͨ����{processInstanceName}��ԭ��{reason}���鿴���ӣ�{detailUrl}', '["processInstanceName","reason","detailUrl"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:03:31', '1', '2022-05-01 12:33:14', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (11, 2, 0, 'bpm_process_instance_approve', '�������������̱�ͨ��', '�������̱�����ͨ����{processInstanceName}���鿴���ӣ�{detailUrl}', '["processInstanceName","detailUrl"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:04:31', '1', '2022-03-27 20:32:21', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (12, 2, 0, 'demo', '��ʾģ��', '�Ҿ��ǲ���һ����', '[]', NULL, 'biubiubiu', 6, 'DEBUG_DING_TALK', '1', '2022-04-10 23:22:49', '1', '2023-03-24 23:45:07', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (14, 1, 0, 'user-update-mobile', '��Ա�û� - �޸��ֻ�', '������֤��{code}������֤�� 5 ��������Ч������й©�����ˣ�', '["code"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:04', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (15, 1, 0, 'user-update-password', '��Ա�û� - �޸�����', '������֤��{code}������֤�� 5 ��������Ч������й©�����ˣ�', '["code"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:18', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (16, 1, 0, 'user-reset-password', '��Ա�û� - ��������', '������֤��{code}������֤�� 5 ��������Ч������й©�����ˣ�', '["code"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-12-02 22:35:27', '0');
COMMIT;
SET IDENTITY_INSERT system_sms_template OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_social_client
-- ----------------------------
CREATE TABLE system_social_client
(
    id            bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name          varchar(255)                           NOT NULL,
    social_type   smallint                               NOT NULL,
    user_type     smallint                               NOT NULL,
    client_id     varchar(255)                           NOT NULL,
    client_secret varchar(255)                           NOT NULL,
    agent_id      varchar(255) DEFAULT NULL              NULL,
    status        smallint                               NOT NULL,
    creator       varchar(64)  DEFAULT ''                NULL,
    create_time   datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater       varchar(64)  DEFAULT ''                NULL,
    update_time   datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted       bit          DEFAULT '0'               NOT NULL,
    tenant_id     bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_social_client.id IS '���';
COMMENT ON COLUMN system_social_client.name IS 'Ӧ����';
COMMENT ON COLUMN system_social_client.social_type IS '�罻ƽ̨������';
COMMENT ON COLUMN system_social_client.user_type IS '�û�����';
COMMENT ON COLUMN system_social_client.client_id IS '�ͻ��˱��';
COMMENT ON COLUMN system_social_client.client_secret IS '�ͻ�����Կ';
COMMENT ON COLUMN system_social_client.agent_id IS '������';
COMMENT ON COLUMN system_social_client.status IS '״̬';
COMMENT ON COLUMN system_social_client.creator IS '������';
COMMENT ON COLUMN system_social_client.create_time IS '����ʱ��';
COMMENT ON COLUMN system_social_client.updater IS '������';
COMMENT ON COLUMN system_social_client.update_time IS '����ʱ��';
COMMENT ON COLUMN system_social_client.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_social_client.tenant_id IS '�⻧���';
COMMENT ON TABLE system_social_client IS '�罻�ͻ��˱�';

-- ----------------------------
-- Records of system_social_client
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_social_client ON;
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '����', 20, 2, 'dingvrnreaje3yqvzhxg', 'i8E6iZyDvZj51JIb0tYsYfVQYOks9Cq1lgryEjFRqC79P3iJcrxEwT6Qk2QvLrLI', NULL, 0, '', '2023-10-18 11:21:18', '1', '2023-12-20 21:28:26', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '��������������', 20, 2, 'dingtsu9hpepjkbmthhw', 'FP_bnSq_HAHKCSncmJjw5hxhnzs6vaVDSZZn3egj6rdqTQ_hu5tQVJyLMpgCakdP', NULL, 0, '', '2023-10-18 11:21:18', '', '2023-12-20 21:28:26', '1', 121);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, '΢�Ź��ں�', 31, 1, 'wx5b23ba7a5589ecbb', '2a7b3b20c537e52e74afd395eb85f61f', NULL, 0, '', '2023-10-18 16:07:46', '1', '2023-12-20 21:28:23', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (43, '΢��С����', 34, 1, 'wx63c280fe3248a3e7', '6f270509224a7ae1296bbf1c8cb97aed', NULL, 0, '', '2023-10-19 13:37:41', '1', '2023-12-20 21:28:25', '1', 1);
COMMIT;
SET IDENTITY_INSERT system_social_client OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_social_user
-- ----------------------------
CREATE TABLE system_social_user
(
    id             bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    type           smallint                               NOT NULL,
    openid         varchar(32)                            NOT NULL,
    token          varchar(256) DEFAULT NULL              NULL,
    raw_token_info varchar(1024)                          NOT NULL,
    nickname       varchar(32)                            NOT NULL,
    avatar         varchar(255) DEFAULT NULL              NULL,
    raw_user_info  varchar(1024)                          NOT NULL,
    code           varchar(256)                           NOT NULL,
    state          varchar(256) DEFAULT NULL              NULL,
    creator        varchar(64)  DEFAULT ''                NULL,
    create_time    datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater        varchar(64)  DEFAULT ''                NULL,
    update_time    datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted        bit          DEFAULT '0'               NOT NULL,
    tenant_id      bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_social_user.id IS '����(��������)';
COMMENT ON COLUMN system_social_user.type IS '�罻ƽ̨������';
COMMENT ON COLUMN system_social_user.openid IS '�罻 openid';
COMMENT ON COLUMN system_social_user.token IS '�罻 token';
COMMENT ON COLUMN system_social_user.raw_token_info IS 'ԭʼ Token ���ݣ�һ���� JSON ��ʽ';
COMMENT ON COLUMN system_social_user.nickname IS '�û��ǳ�';
COMMENT ON COLUMN system_social_user.avatar IS '�û�ͷ��';
COMMENT ON COLUMN system_social_user.raw_user_info IS 'ԭʼ�û����ݣ�һ���� JSON ��ʽ';
COMMENT ON COLUMN system_social_user.code IS '���һ�ε���֤ code';
COMMENT ON COLUMN system_social_user.state IS '���һ�ε���֤ state';
COMMENT ON COLUMN system_social_user.creator IS '������';
COMMENT ON COLUMN system_social_user.create_time IS '����ʱ��';
COMMENT ON COLUMN system_social_user.updater IS '������';
COMMENT ON COLUMN system_social_user.update_time IS '����ʱ��';
COMMENT ON COLUMN system_social_user.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_social_user.tenant_id IS '�⻧���';
COMMENT ON TABLE system_social_user IS '�罻�û���';

-- ----------------------------
-- Table structure for system_social_user_bind
-- ----------------------------
CREATE TABLE system_social_user_bind
(
    id             bigint                                NOT NULL PRIMARY KEY IDENTITY,
    user_id        bigint                                NOT NULL,
    user_type      smallint                              NOT NULL,
    social_type    smallint                              NOT NULL,
    social_user_id bigint                                NOT NULL,
    creator        varchar(64) DEFAULT ''                NULL,
    create_time    datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater        varchar(64) DEFAULT ''                NULL,
    update_time    datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted        bit         DEFAULT '0'               NOT NULL,
    tenant_id      bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_social_user_bind.id IS '����(��������)';
COMMENT ON COLUMN system_social_user_bind.user_id IS '�û����';
COMMENT ON COLUMN system_social_user_bind.user_type IS '�û�����';
COMMENT ON COLUMN system_social_user_bind.social_type IS '�罻ƽ̨������';
COMMENT ON COLUMN system_social_user_bind.social_user_id IS '�罻�û��ı��';
COMMENT ON COLUMN system_social_user_bind.creator IS '������';
COMMENT ON COLUMN system_social_user_bind.create_time IS '����ʱ��';
COMMENT ON COLUMN system_social_user_bind.updater IS '������';
COMMENT ON COLUMN system_social_user_bind.update_time IS '����ʱ��';
COMMENT ON COLUMN system_social_user_bind.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_social_user_bind.tenant_id IS '�⻧���';
COMMENT ON TABLE system_social_user_bind IS '�罻�󶨱�';

-- ----------------------------
-- Table structure for system_tenant
-- ----------------------------
CREATE TABLE system_tenant
(
    id              bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name            varchar(30)                            NOT NULL,
    contact_user_id bigint       DEFAULT NULL              NULL,
    contact_name    varchar(30)                            NOT NULL,
    contact_mobile  varchar(500) DEFAULT NULL              NULL,
    status          smallint     DEFAULT 0                 NOT NULL,
    website         varchar(256) DEFAULT ''                NULL,
    package_id      bigint                                 NOT NULL,
    expire_time     datetime                               NOT NULL,
    account_count   int                                    NOT NULL,
    creator         varchar(64)  DEFAULT ''                NULL,
    create_time     datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater         varchar(64)  DEFAULT ''                NULL,
    update_time     datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted         bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_tenant.id IS '�⻧���';
COMMENT ON COLUMN system_tenant.name IS '�⻧��';
COMMENT ON COLUMN system_tenant.contact_user_id IS '��ϵ�˵��û����';
COMMENT ON COLUMN system_tenant.contact_name IS '��ϵ��';
COMMENT ON COLUMN system_tenant.contact_mobile IS '��ϵ�ֻ�';
COMMENT ON COLUMN system_tenant.status IS '�⻧״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_tenant.website IS '������';
COMMENT ON COLUMN system_tenant.package_id IS '�⻧�ײͱ��';
COMMENT ON COLUMN system_tenant.expire_time IS '����ʱ��';
COMMENT ON COLUMN system_tenant.account_count IS '�˺�����';
COMMENT ON COLUMN system_tenant.creator IS '������';
COMMENT ON COLUMN system_tenant.create_time IS '����ʱ��';
COMMENT ON COLUMN system_tenant.updater IS '������';
COMMENT ON COLUMN system_tenant.update_time IS '����ʱ��';
COMMENT ON COLUMN system_tenant.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_tenant IS '�⻧��';

-- ----------------------------
-- Records of system_tenant
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_tenant ON;
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, website, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (1, '���Դ��', NULL, '��ܵ', '17321315478', 0, 'www.iocoder.cn', 0, '2099-02-19 17:14:16', 9999, '1', '2021-01-05 17:03:47', '1', '2023-11-06 11:41:41', '0');
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, website, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (121, 'С�⻧', 110, 'С��2', '15601691300', 0, 'zsxq.iocoder.cn', 111, '2024-03-11 00:00:00', 20, '1', '2022-02-22 00:56:14', '1', '2023-11-06 11:41:47', '0');
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, website, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (122, '�����⻧', 113, '���', '15601691300', 0, 'test.iocoder.cn', 111, '2022-04-30 00:00:00', 50, '1', '2022-03-07 21:37:58', '1', '2023-11-06 11:41:53', '0');
COMMIT;
SET IDENTITY_INSERT system_tenant OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_tenant_package
-- ----------------------------
CREATE TABLE system_tenant_package
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(30)                            NOT NULL,
    status      smallint     DEFAULT 0                 NOT NULL,
    remark      varchar(256) DEFAULT ''                NULL,
    menu_ids    varchar(4096)                          NOT NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL
);

COMMENT ON COLUMN system_tenant_package.id IS '�ײͱ��';
COMMENT ON COLUMN system_tenant_package.name IS '�ײ���';
COMMENT ON COLUMN system_tenant_package.status IS '�⻧״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_tenant_package.remark IS '��ע';
COMMENT ON COLUMN system_tenant_package.menu_ids IS '�����Ĳ˵����';
COMMENT ON COLUMN system_tenant_package.creator IS '������';
COMMENT ON COLUMN system_tenant_package.create_time IS '����ʱ��';
COMMENT ON COLUMN system_tenant_package.updater IS '������';
COMMENT ON COLUMN system_tenant_package.update_time IS '����ʱ��';
COMMENT ON COLUMN system_tenant_package.deleted IS '�Ƿ�ɾ��';
COMMENT ON TABLE system_tenant_package IS '�⻧�ײͱ�';

-- ----------------------------
-- Records of system_tenant_package
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_tenant_package ON;
INSERT INTO system_tenant_package (id, name, status, remark, menu_ids, creator, create_time, updater, update_time, deleted) VALUES (111, '��ͨ�ײ�', 0, 'С����', '[1,2,5,1031,1032,1033,1034,1035,1036,1037,1038,1039,1050,1051,1052,1053,1054,1056,1057,1058,1059,1060,1063,1064,1065,1066,1067,1070,1075,1076,1077,1078,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1118,1119,1120,100,101,102,103,106,107,110,111,112,113,1138,114,1139,115,1140,116,1141,1142,1143,2713,2714,2715,2716,2717,2718,2720,1185,2721,1186,2722,1187,2723,1188,2724,1189,2725,1190,2726,1191,2727,2472,1192,2728,1193,2729,1194,2730,1195,2731,1196,2732,1197,2733,2478,1198,2734,2479,1199,2735,2480,1200,2481,1201,2482,1202,2483,2484,2485,2486,2487,1207,2488,1208,2489,1209,2490,1210,2491,1211,2492,1212,2493,1213,2494,2495,1215,1216,2497,1217,1218,1219,1220,1221,1222,1224,1225,1226,1227,1228,1229,1237,1238,1239,1240,1241,1242,1243,2525,1255,1256,1001,1257,1002,1258,1003,1259,1004,1260,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020]', '1', '2022-02-22 00:54:00', '1', '2024-03-30 17:53:17', '0');
COMMIT;
SET IDENTITY_INSERT system_tenant_package OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
CREATE TABLE system_user_post
(
    id          bigint                                NOT NULL PRIMARY KEY IDENTITY,
    user_id     bigint      DEFAULT 0                 NOT NULL,
    post_id     bigint      DEFAULT 0                 NOT NULL,
    creator     varchar(64) DEFAULT ''                NULL,
    create_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64) DEFAULT ''                NULL,
    update_time datetime    DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit         DEFAULT '0'               NOT NULL,
    tenant_id   bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_user_post.id IS 'id';
COMMENT ON COLUMN system_user_post.user_id IS '�û�ID';
COMMENT ON COLUMN system_user_post.post_id IS '��λID';
COMMENT ON COLUMN system_user_post.creator IS '������';
COMMENT ON COLUMN system_user_post.create_time IS '����ʱ��';
COMMENT ON COLUMN system_user_post.updater IS '������';
COMMENT ON COLUMN system_user_post.update_time IS '����ʱ��';
COMMENT ON COLUMN system_user_post.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_user_post.tenant_id IS '�⻧���';
COMMENT ON TABLE system_user_post IS '�û���λ��';

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_user_post ON;
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, 1, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, 100, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, 104, 1, '1', '2022-05-16 19:36:28', '1', '2022-05-16 19:36:28', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (116, 117, 2, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, 118, 1, '1', '2022-07-09 17:44:44', '1', '2022-07-09 17:44:44', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (119, 114, 5, '1', '2024-03-24 20:45:51', '1', '2024-03-24 20:45:51', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (123, 115, 1, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (124, 115, 2, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', '0', 1);
COMMIT;
SET IDENTITY_INSERT system_user_post OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
CREATE TABLE system_user_role
(
    id          bigint                                NOT NULL PRIMARY KEY IDENTITY,
    user_id     bigint                                NOT NULL,
    role_id     bigint                                NOT NULL,
    creator     varchar(64) DEFAULT ''                NULL,
    create_time datetime    DEFAULT CURRENT_TIMESTAMP NULL,
    updater     varchar(64) DEFAULT ''                NULL,
    update_time datetime    DEFAULT CURRENT_TIMESTAMP NULL,
    deleted     bit         DEFAULT '0'               NULL,
    tenant_id   bigint      DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_user_role.id IS '�������';
COMMENT ON COLUMN system_user_role.user_id IS '�û�ID';
COMMENT ON COLUMN system_user_role.role_id IS '��ɫID';
COMMENT ON COLUMN system_user_role.creator IS '������';
COMMENT ON COLUMN system_user_role.create_time IS '����ʱ��';
COMMENT ON COLUMN system_user_role.updater IS '������';
COMMENT ON COLUMN system_user_role.update_time IS '����ʱ��';
COMMENT ON COLUMN system_user_role.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_user_role.tenant_id IS '�⻧���';
COMMENT ON TABLE system_user_role IS '�û��ͽ�ɫ������';

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_user_role ON;
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 1, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:17', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 2, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 100, 101, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 100, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:12', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 100, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:11', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 103, 1, '1', '2022-01-11 13:19:45', '1', '2022-01-11 13:19:45', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (14, 110, 109, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (15, 111, 110, '110', '2022-02-23 13:14:38', '110', '2022-02-23 13:14:38', '0', 121);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (16, 113, 111, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (18, 1, 2, '1', '2022-05-12 20:39:29', '1', '2022-05-12 20:39:29', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (20, 104, 101, '1', '2022-05-28 15:43:57', '1', '2022-05-28 15:43:57', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (22, 115, 2, '1', '2022-07-21 22:08:30', '1', '2022-07-21 22:08:30', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (35, 112, 1, '1', '2024-03-15 20:00:24', '1', '2024-03-15 20:00:24', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (36, 118, 1, '1', '2024-03-17 09:12:08', '1', '2024-03-17 09:12:08', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (38, 114, 101, '1', '2024-03-24 22:23:03', '1', '2024-03-24 22:23:03', '0', 1);
COMMIT;
SET IDENTITY_INSERT system_user_role OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
CREATE TABLE system_users
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    username    varchar(30)                            NOT NULL,
    password    varchar(100) DEFAULT ''                NULL,
    nickname    varchar(30)                            NOT NULL,
    remark      varchar(500) DEFAULT NULL              NULL,
    dept_id     bigint       DEFAULT NULL              NULL,
    post_ids    varchar(255) DEFAULT NULL              NULL,
    email       varchar(50)  DEFAULT ''                NULL,
    mobile      varchar(11)  DEFAULT ''                NULL,
    sex         smallint     DEFAULT 0                 NULL,
    avatar      varchar(512) DEFAULT ''                NULL,
    status      smallint     DEFAULT 0                 NOT NULL,
    login_ip    varchar(50)  DEFAULT ''                NULL,
    login_date  datetime     DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN system_users.id IS '�û�ID';
COMMENT ON COLUMN system_users.username IS '�û��˺�';
COMMENT ON COLUMN system_users.password IS '����';
COMMENT ON COLUMN system_users.nickname IS '�û��ǳ�';
COMMENT ON COLUMN system_users.remark IS '��ע';
COMMENT ON COLUMN system_users.dept_id IS '����ID';
COMMENT ON COLUMN system_users.post_ids IS '��λ�������';
COMMENT ON COLUMN system_users.email IS '�û�����';
COMMENT ON COLUMN system_users.mobile IS '�ֻ�����';
COMMENT ON COLUMN system_users.sex IS '�û��Ա�';
COMMENT ON COLUMN system_users.avatar IS 'ͷ���ַ';
COMMENT ON COLUMN system_users.status IS '�ʺ�״̬��0���� 1ͣ�ã�';
COMMENT ON COLUMN system_users.login_ip IS '����¼IP';
COMMENT ON COLUMN system_users.login_date IS '����¼ʱ��';
COMMENT ON COLUMN system_users.creator IS '������';
COMMENT ON COLUMN system_users.create_time IS '����ʱ��';
COMMENT ON COLUMN system_users.updater IS '������';
COMMENT ON COLUMN system_users.update_time IS '����ʱ��';
COMMENT ON COLUMN system_users.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN system_users.tenant_id IS '�⻧���';
COMMENT ON TABLE system_users IS '�û���Ϣ��';

-- ----------------------------
-- Records of system_users
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT system_users ON;
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 'admin', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '���Դ��', '����Ա', 103, '[1]', 'aoteman@126.com', '18818260277', 2, 'http://test.yudao.iocoder.cn/96c787a2ce88bf6d0ce3cd8b6cf5314e80e7703cd41bf4af8cd2e2909dbd6b6d.png', 0, '0:0:0:0:0:0:0:1', '2024-04-29 21:50:32', 'admin', '2021-01-05 17:03:47', NULL, '2024-04-29 21:50:32', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, 'yudao', '$2a$10$11U48RhyJ5pSBYWSn12AD./ld671.ycSzJHbyrtpeoMeYiw31eo8a', '���', '��Ҫ����', 104, '[1]', 'yudao@iocoder.cn', '15601691300', 1, '', 1, '127.0.0.1', '2022-07-09 23:03:33', '', '2021-01-07 09:07:17', NULL, '2022-07-09 23:03:33', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, 'yuanma', '$2a$10$YMpimV4T6BtDhIaA8jSW.u8UTGBeGhc/qwXP4oxoMr4mOw9.qttt6', 'Դ��', NULL, 106, NULL, 'yuanma@iocoder.cn', '15601701300', 0, '', 0, '0:0:0:0:0:0:0:1', '2024-03-18 21:09:04', '', '2021-01-13 23:50:35', NULL, '2024-03-18 21:09:04', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, 'test', '$2a$04$KhExCYl7lx6eWWZYKsibKOZ8IBJRyuNuCcEOLQ11RYhJKgHmlSwK.', '���Ժ�', NULL, 107, '[1,2]', '111@qq.com', '15601691200', 1, '', 0, '0:0:0:0:0:0:0:1', '2024-03-26 07:11:35', '', '2021-01-21 02:13:53', NULL, '2024-03-26 07:11:35', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, 'admin107', '$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm', '��ܵ', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '', NULL, '1', '2022-02-20 22:59:33', '1', '2022-02-27 08:26:51', '0', 118);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, 'admin108', '$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu', '��ܵ', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '', NULL, '1', '2022-02-20 23:00:50', '1', '2022-02-27 08:26:53', '0', 119);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, 'admin109', '$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK', '��ܵ', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '', NULL, '1', '2022-02-20 23:11:50', '1', '2022-02-27 08:26:56', '0', 120);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, 'admin110', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', 'С��', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '127.0.0.1', '2022-09-25 22:47:33', '1', '2022-02-22 00:56:14', NULL, '2022-09-25 22:47:33', '0', 121);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, 'test', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '�����û�', NULL, NULL, '[]', '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2023-12-30 11:42:17', '110', '2022-02-23 13:14:33', NULL, '2023-12-30 11:42:17', '0', 121);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, 'newobject', '$2a$04$dB0z8Q819fJWz0hbaLe6B.VfHCjYgWx6LFfET5lyz3JwcqlyCkQ4C', '�¶���', NULL, 100, '[]', '', '15601691235', 1, '', 0, '0:0:0:0:0:0:0:1', '2024-03-16 23:11:38', '1', '2022-02-23 19:08:03', NULL, '2024-03-16 23:11:38', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, 'aoteman', '$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO', '���', NULL, NULL, NULL, '', '15601691300', 0, '', 0, '127.0.0.1', '2022-03-19 18:38:51', '1', '2022-03-07 21:37:58', NULL, '2022-03-19 18:38:51', '0', 122);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (114, 'hrmgr', '$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu', 'hr С���', NULL, NULL, '[5]', '', '15601691236', 1, '', 0, '0:0:0:0:0:0:0:1', '2024-03-24 22:21:05', '1', '2022-03-19 21:50:58', NULL, '2024-03-24 22:21:05', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, 'aotemane', '$2a$04$GcyP0Vyzb2F2Yni5PuIK9ueGxM0tkZGMtDwVRwrNbtMvorzbpNsV2', '����', '11222', 102, '[1,2]', '7648@qq.com', '15601691229', 2, '', 0, '', NULL, '1', '2022-04-30 02:55:43', '1', '2024-04-04 09:37:14', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, 'admin123', '$2a$10$WI8Gg/lpZQIrOEZMHqka7OdFaD4Nx.B/qY8ZGTTUKrOJwaHFqibaC', '���Ժ�', '1111', 100, '[2]', '', '15601691234', 1, '', 0, '', NULL, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (118, 'goudan', '$2a$04$OB1SuphCdiLVRpiYRKeqH.8NYS7UIp5vmIv1W7U4w6toiFeOAATVK', '����', NULL, 103, '[1]', '', '15601691239', 1, '', 0, '0:0:0:0:0:0:0:1', '2024-03-17 09:10:27', '1', '2022-07-09 17:44:43', '1', '2024-04-04 09:48:05', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (131, 'hh', '$2a$04$jyH9h6.gaw8mpOjPfHIpx.8as2Rzfcmdlj5rlJFwgCw4rsv/MTb2K', '�Ǻ�', NULL, 100, '[]', '777@qq.com', '15601882312', 1, '', 0, '', NULL, '1', '2024-04-27 08:45:56', '1', '2024-04-27 08:45:56', '0', 1);
COMMIT;
SET IDENTITY_INSERT system_users OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo01_contact
-- ----------------------------
CREATE TABLE yudao_demo01_contact
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(100) DEFAULT ''                NULL,
    sex         smallint                               NOT NULL,
    birthday    datetime                               NOT NULL,
    description varchar(255)                           NOT NULL,
    avatar      varchar(512) DEFAULT NULL              NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN yudao_demo01_contact.id IS '���';
COMMENT ON COLUMN yudao_demo01_contact.name IS '����';
COMMENT ON COLUMN yudao_demo01_contact.sex IS '�Ա�';
COMMENT ON COLUMN yudao_demo01_contact.birthday IS '������';
COMMENT ON COLUMN yudao_demo01_contact.description IS '���';
COMMENT ON COLUMN yudao_demo01_contact.avatar IS 'ͷ��';
COMMENT ON COLUMN yudao_demo01_contact.creator IS '������';
COMMENT ON COLUMN yudao_demo01_contact.create_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo01_contact.updater IS '������';
COMMENT ON COLUMN yudao_demo01_contact.update_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo01_contact.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN yudao_demo01_contact.tenant_id IS '�⻧���';
COMMENT ON TABLE yudao_demo01_contact IS 'ʾ����ϵ�˱�';

-- ----------------------------
-- Records of yudao_demo01_contact
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT yudao_demo01_contact ON;
INSERT INTO yudao_demo01_contact (id, name, sex, birthday, description, avatar, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '����', 2, '2023-11-07 00:00:00', '<p>���������ѽ</p>', 'http://127.0.0.1:28000/admin-api/infra/file/4/get/46f8fa1a37db3f3960d8910ff2fe3962ab3b2db87cf2f8ccb4dc8145b8bdf237.jpeg', '1', '2023-11-15 23:34:30', '1', '2023-11-15 23:47:39', '0', 1);
COMMIT;
SET IDENTITY_INSERT yudao_demo01_contact OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo02_category
-- ----------------------------
CREATE TABLE yudao_demo02_category
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(100) DEFAULT ''                NULL,
    parent_id   bigint                                 NOT NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN yudao_demo02_category.id IS '���';
COMMENT ON COLUMN yudao_demo02_category.name IS '����';
COMMENT ON COLUMN yudao_demo02_category.parent_id IS '�������';
COMMENT ON COLUMN yudao_demo02_category.creator IS '������';
COMMENT ON COLUMN yudao_demo02_category.create_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo02_category.updater IS '������';
COMMENT ON COLUMN yudao_demo02_category.update_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo02_category.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN yudao_demo02_category.tenant_id IS '�⻧���';
COMMENT ON TABLE yudao_demo02_category IS 'ʾ�������';

-- ----------------------------
-- Records of yudao_demo02_category
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT yudao_demo02_category ON;
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '����', 0, '1', '2023-11-15 23:34:30', '1', '2023-11-16 20:24:23', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '����', 0, '1', '2023-11-16 20:24:00', '1', '2023-11-16 20:24:15', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, '�ֹ�', 0, '1', '2023-11-16 20:24:32', '1', '2023-11-16 20:24:32', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 'С����', 2, '1', '2023-11-16 20:24:39', '1', '2023-11-16 20:24:39', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, '����', 2, '1', '2023-11-16 20:24:46', '1', '2023-11-16 20:24:46', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, '11', 3, '1', '2023-11-24 19:29:34', '1', '2023-11-24 19:29:34', '0', 1);
COMMIT;
SET IDENTITY_INSERT yudao_demo02_category OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo03_course
-- ----------------------------
CREATE TABLE yudao_demo03_course
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    student_id  bigint                                 NOT NULL,
    name        varchar(100) DEFAULT ''                NULL,
    score       smallint                               NOT NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN yudao_demo03_course.id IS '���';
COMMENT ON COLUMN yudao_demo03_course.student_id IS 'ѧ�����';
COMMENT ON COLUMN yudao_demo03_course.name IS '����';
COMMENT ON COLUMN yudao_demo03_course.score IS '����';
COMMENT ON COLUMN yudao_demo03_course.creator IS '������';
COMMENT ON COLUMN yudao_demo03_course.create_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo03_course.updater IS '������';
COMMENT ON COLUMN yudao_demo03_course.update_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo03_course.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN yudao_demo03_course.tenant_id IS '�⻧���';
COMMENT ON TABLE yudao_demo03_course IS 'ѧ���γ̱�';

-- ----------------------------
-- Records of yudao_demo03_course
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT yudao_demo03_course ON;
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 2, '����', 66, '1', '2023-11-16 23:21:49', '1', '2023-11-16 23:21:49', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 2, '��ѧ', 22, '1', '2023-11-16 23:21:49', '1', '2023-11-16 23:21:49', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 5, '����', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 5, '�����', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 5, '����', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 5, '�����', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 5, '����', 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 23:47:10', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (11, 5, '�����', 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 23:47:10', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (12, 2, '����', 33, '1', '2023-11-17 00:20:42', '1', '2023-11-16 16:20:45', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (13, 9, '��ѩ', 12, '1', '2023-11-17 13:13:20', '1', '2023-11-17 13:13:20', '0', 1);
COMMIT;
SET IDENTITY_INSERT yudao_demo03_course OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo03_grade
-- ----------------------------
CREATE TABLE yudao_demo03_grade
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    student_id  bigint                                 NOT NULL,
    name        varchar(100) DEFAULT ''                NULL,
    teacher     varchar(255)                           NOT NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN yudao_demo03_grade.id IS '���';
COMMENT ON COLUMN yudao_demo03_grade.student_id IS 'ѧ�����';
COMMENT ON COLUMN yudao_demo03_grade.name IS '����';
COMMENT ON COLUMN yudao_demo03_grade.teacher IS '������';
COMMENT ON COLUMN yudao_demo03_grade.creator IS '������';
COMMENT ON COLUMN yudao_demo03_grade.create_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo03_grade.updater IS '������';
COMMENT ON COLUMN yudao_demo03_grade.update_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo03_grade.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN yudao_demo03_grade.tenant_id IS '�⻧���';
COMMENT ON TABLE yudao_demo03_grade IS 'ѧ���༶��';

-- ----------------------------
-- Records of yudao_demo03_grade
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT yudao_demo03_grade ON;
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 2, '���� 2 ��', '�ܽ���', '1', '2023-11-16 23:21:49', '1', '2023-11-16 23:21:49', '0', 1);
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 5, '��Ϊ', 'ңң����', '1', '2023-11-16 23:22:46', '1', '2023-11-16 23:47:10', '0', 1);
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 9, 'Сͼ', 'С��111', '1', '2023-11-17 13:10:23', '1', '2023-11-17 13:10:23', '0', 1);
COMMIT;
SET IDENTITY_INSERT yudao_demo03_grade OFF;
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo03_student
-- ----------------------------
CREATE TABLE yudao_demo03_student
(
    id          bigint                                 NOT NULL PRIMARY KEY IDENTITY,
    name        varchar(100) DEFAULT ''                NULL,
    sex         smallint                               NOT NULL,
    birthday    datetime                               NOT NULL,
    description varchar(255)                           NOT NULL,
    creator     varchar(64)  DEFAULT ''                NULL,
    create_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater     varchar(64)  DEFAULT ''                NULL,
    update_time datetime     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted     bit          DEFAULT '0'               NOT NULL,
    tenant_id   bigint       DEFAULT 0                 NOT NULL
);

COMMENT ON COLUMN yudao_demo03_student.id IS '���';
COMMENT ON COLUMN yudao_demo03_student.name IS '����';
COMMENT ON COLUMN yudao_demo03_student.sex IS '�Ա�';
COMMENT ON COLUMN yudao_demo03_student.birthday IS '��������';
COMMENT ON COLUMN yudao_demo03_student.description IS '���';
COMMENT ON COLUMN yudao_demo03_student.creator IS '������';
COMMENT ON COLUMN yudao_demo03_student.create_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo03_student.updater IS '������';
COMMENT ON COLUMN yudao_demo03_student.update_time IS '����ʱ��';
COMMENT ON COLUMN yudao_demo03_student.deleted IS '�Ƿ�ɾ��';
COMMENT ON COLUMN yudao_demo03_student.tenant_id IS '�⻧���';
COMMENT ON TABLE yudao_demo03_student IS 'ѧ����';

-- ----------------------------
-- Records of yudao_demo03_student
-- ----------------------------
-- @formatter:off
SET IDENTITY_INSERT yudao_demo03_student ON;
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 'С��', 1, '2023-11-16 00:00:00', '<p>����</p>', '1', '2023-11-16 23:21:49', '1', '2023-11-17 16:49:06', '0', 1);
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, '���', 2, '2023-11-13 00:00:00', '<p>���ڽ�������?</p>', '1', '2023-11-16 23:22:46', '1', '2023-11-17 16:49:07', '0', 1);
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 'С��', 1, '2023-11-07 00:00:00', '<p>������</p>', '1', '2023-11-17 00:04:47', '1', '2023-11-17 16:49:08', '0', 1);
COMMIT;
SET IDENTITY_INSERT yudao_demo03_student OFF;
-- @formatter:on

