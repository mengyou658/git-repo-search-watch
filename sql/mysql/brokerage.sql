-- 增加配置
alter table member_point_config
    add column brokerage_enabled bit default 1 not null comment '是否启用分佣';
alter table member_point_config
    add column brokerage_enabled_condition tinyint default 0 not null comment '分佣模式：0-人人分销 1-指定分销';
alter table member_point_config
    add column brokerage_bind_mode tinyint default 0 not null comment '分销关系绑定模式: 0-没有推广人，1-新用户';
alter table member_point_config
    add column brokerage_post_urls varchar(2000) null comment '分销海报图地址数组';
alter table member_point_config
    add column brokerage_first_percent int not null comment '一级返佣比例';
alter table member_point_config
    add column brokerage_second_percent int not null comment '二级返佣比例';
alter table member_point_config
    add column brokerage_withdraw_min_price int not null comment '用户提现最低金额';
alter table member_point_config
    add column brokerage_bank_names varchar(200) not null comment '提现银行（字典类型=brokerage_bank_name）';
alter table member_point_config
    add column brokerage_frozen_days int default 7 not null comment '佣金冻结时间(天)';
alter table member_point_config
    add column brokerage_withdraw_type varchar(32) default '1,2,3,4' not null comment '提现方式：1-钱包；2-银行卡；3-微信；4-支付宝';

-- 用户表增加分销相关字段
alter table member_user
    add column brokerage_user_id bigint not null comment '推广员编号';
alter table member_user
    add column brokerage_bind_time datetime null comment '推广员绑定时间';
alter table member_user
    add column brokerage_enabled bit default 1 not null comment '是否成为推广员';
alter table member_user
    add column brokerage_time datetime null comment '成为分销员时间';
alter table member_user
    add column brokerage_price int default 0 not null comment '可用佣金';
alter table member_user
    add column frozen_brokerage_price int default 0 not null comment '冻结佣金';

create index idx_invite_user_id on member_user (brokerage_user_id) comment '推广员编号';
create index idx_agent on member_user (brokerage_enabled) comment '是否成为推广员';


create table member_brokerage_record
(
    id            int auto_increment comment '编号'
        primary key,
    user_id       bigint                                                           not null comment '用户编号',
    biz_id        varchar(64)                            default ''                not null comment '业务编号',
    biz_type      tinyint                                default 0                 not null comment '业务类型：0-订单，1-提现',
    title         varchar(64)                            default ''                not null comment '标题',
    price         int                                    default 0                 not null comment '金额',
    total_price   int                                    default 0                 not null comment '当前总佣金',
    description   varchar(500)                           default ''                not null comment '说明',
    status        tinyint                                default 0                 not null comment '状态：0-待结算，1-已结算，2-已取消',
    frozen_days   int                                    default 0                 not null comment '冻结时间（天）',
    unfreeze_time datetime                                                         null comment '解冻时间',
    creator       varchar(64) collate utf8mb4_general_ci default ''                null comment '创建者',
    create_time   datetime                               default CURRENT_TIMESTAMP not null comment '创建时间',
    updater       varchar(64) collate utf8mb4_general_ci default ''                null comment '更新者',
    update_time   datetime                               default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    deleted       bit                                    default b'0'              not null comment '是否删除',
    tenant_id     bigint                                 default 0                 not null comment '租户编号'
)
    comment '佣金记录';

create index idx_user_id on member_brokerage_record (user_id) comment '用户编号';
create index idx_biz on member_brokerage_record (biz_type, biz_id) comment '业务';
create index idx_status on member_brokerage_record (status) comment '状态';


create table member_brokerage_withdraw
(
    id                  int auto_increment comment '编号'
        primary key,
    user_id             bigint                                                           not null comment '用户编号',
    price               int                                    default 0                 not null comment '提现金额',
    fee_price           int                                    default 0                 not null comment '提现手续费',
    total_price         int                                    default 0                 not null comment '当前总佣金',
    type                tinyint                                default 0                 not null comment '提现类型：1-钱包；2-银行卡；3-微信；4-支付宝',
    name                varchar(64)                                                      null comment '真实姓名',
    account_no          varchar(64)                                                      null comment '账号',
    bank_name           varchar(100)                                                     null comment '银行名称',
    bank_address        varchar(200)                                                     null comment '开户地址',
    account_qr_code_url varchar(512)                                                     null comment '收款码',
    status              tinyint(2)                             default 0                 not null comment '状态：0-审核中，10-审核通过 20-审核不通过；预留：11 - 提现成功；21-提现失败',
    audit_reason        varchar(128)                                                     null comment '审核驳回原因',
    audit_time          datetime                                                         null comment '审核时间',
    remark              varchar(500)                                                     null comment '备注',
    creator             varchar(64) collate utf8mb4_general_ci default ''                null comment '创建者',
    create_time         datetime                               default CURRENT_TIMESTAMP not null comment '创建时间',
    updater             varchar(64) collate utf8mb4_general_ci default ''                null comment '更新者',
    update_time         datetime                               default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    deleted             bit                                    default b'0'              not null comment '是否删除',
    tenant_id           bigint                                 default 0                 not null comment '租户编号'
)
    comment '佣金提现';

create index idx_user_id on member_brokerage_withdraw (user_id) comment '用户编号';
create index idx_audit_status on member_brokerage_withdraw (status) comment '状态';

-- 增加字典
insert into system_dict_type(type, name)
values ('brokerage_enabled_condition', '分佣模式');
insert into system_dict_data(dict_type, label, value, sort, remark)
values ('brokerage_enabled_condition', '人人分销', 0, 0, '所有用户都可以分销'),
       ('brokerage_enabled_condition', '指定分销', 1, 1, '仅可后台手动设置推广员');

insert into system_dict_type(type, name)
values ('brokerage_bind_mode', '分销关系绑定模式');
insert into system_dict_data(dict_type, label, value, sort, remark)
values ('brokerage_bind_mode', '没有推广人', 0, 0, '只要用户没有推广人，随时都可以绑定推广关系'),
       ('brokerage_bind_mode', '新用户', 1, 1, '仅新用户注册时才能绑定推广关系');

insert into system_dict_type(type, name)
values ('brokerage_withdraw_type', '佣金提现类型');
insert into system_dict_data(dict_type, label, value, sort)
values ('brokerage_withdraw_type', '钱包', 1, 1),
       ('brokerage_withdraw_type', '银行卡', 2, 2),
       ('brokerage_withdraw_type', '微信', 3, 3),
       ('brokerage_withdraw_type', '支付宝', 4, 4);

insert into system_dict_type(type, name)
values ('brokerage_record_biz_type', '佣金记录业务类型');
insert into system_dict_data(dict_type, label, value, sort)
values ('brokerage_record_biz_type', '订单返佣', 0, 0),
       ('brokerage_record_biz_type', '申请提现', 1, 1);

insert into system_dict_type(type, name)
values ('brokerage_record_status', '佣金记录状态');
insert into system_dict_data(dict_type, label, value, sort)
values ('brokerage_record_status', '待结算', 0, 0),
       ('brokerage_record_status', '已结算', 1, 1),
       ('brokerage_record_status', '已取消', 2, 2);

insert into system_dict_type(type, name)
values ('brokerage_withdraw_status', '佣金提现状态');
insert into system_dict_data(dict_type, label, value, sort)
values ('brokerage_withdraw_status', '审核中', 0, 0),
       ('brokerage_withdraw_status', '审核通过', 10, 10),
       ('brokerage_withdraw_status', '提现成功', 11, 11),
       ('brokerage_withdraw_status', '审核不通过', 20, 20),
       ('brokerage_withdraw_status', '提现失败', 21, 21);

insert into system_dict_type(type, name)
values ('brokerage_bank_name', '佣金提现银行');
insert into system_dict_data(dict_type, label, value, sort)
values ('brokerage_bank_name', '工商银行', 0, 0),
       ('brokerage_bank_name', '建设银行', 1, 1),
       ('brokerage_bank_name', '农业银行', 2, 2),
       ('brokerage_bank_name', '中国银行', 3, 3),
       ('brokerage_bank_name', '交通银行', 4, 4),
       ('brokerage_bank_name', '招商银行', 5, 5);

-- 增加菜单：分销员管理
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status, component_name)
VALUES ('分销员', '', 2, 7, 2262, 'brokerage', 'user', 'member/brokerage/user/index', 0, 'MemberBrokerageUser');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- 按钮 SQL
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status)
VALUES ('分销员查询', 'member:brokerage-user:query', 3, 1, @parentId, '', '', '', 0);
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status)
VALUES ('分销员创建', 'member:brokerage-user:create', 3, 2, @parentId, '', '', '', 0);
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status)
VALUES ('分销员更新', 'member:brokerage-user:update', 3, 3, @parentId, '', '', '', 0);
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status)
VALUES ('分销员删除', 'member:brokerage-user:delete', 3, 4, @parentId, '', '', '', 0);

-- 增加菜单：佣金记录
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status, component_name)
VALUES ('佣金记录', '', 2, 8, 2262, 'brokerage-record', 'list', 'member/brokerage/record/index', 0,
        'MemberBrokerageRecord');
-- 按钮父菜单ID
-- 暂时只支持 MySQL。如果你是 Oracle、PostgreSQL、SQLServer 的话，需要手动修改 @parentId 的部分的代码
SELECT @parentId := LAST_INSERT_ID();
-- 按钮 SQL
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status)
VALUES ('佣金记录查询', 'member:member-brokerage-record:query', 3, 1, @parentId, '', 'table', '', 0);

-- 增加菜单：佣金提现
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status, component_name)
VALUES ('佣金提现', '', 2, 9, 2262, 'brokerage-withdraw', '', 'member/brokerage/withdraw/index', 0,
        'MemberBrokerageWithdraw');

-- 按钮父菜单ID
-- 暂时只支持 MySQL。如果你是 Oracle、PostgreSQL、SQLServer 的话，需要手动修改 @parentId 的部分的代码
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
INSERT INTO system_menu(name, permission, type, sort, parent_id, path, icon, component, status)
VALUES ('佣金提现查询', 'member:brokerage-withdraw:query', 3, 1, @parentId, '', '', '', 0);
