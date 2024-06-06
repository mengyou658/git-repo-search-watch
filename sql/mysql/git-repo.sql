drop table if exists `repo_watch_config`;
CREATE TABLE `repo_watch_config` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_key` varchar(100) NOT NULL DEFAULT '' COMMENT '参数键名',
  `value` varchar(2000) NOT NULL DEFAULT '' COMMENT '参数键值',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

drop table if exists `repo_watch_result`;
CREATE TABLE `repo_watch_result` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint NOT NULL DEFAULT '0' COMMENT '任务ID：外键repo_watch_task.id.name.one2many.left',
  `repo_id` varchar(60) DEFAULT NULL COMMENT '仓库ID',
  `repo_url` varchar(500) DEFAULT NULL COMMENT '仓库URL',
  `repo_ssh_url` varchar(500) DEFAULT NULL COMMENT '仓库SSHURL',
  `repo_lang` varchar(50) DEFAULT NULL COMMENT '仓库开发语言',
  `repo_name` varchar(300) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `repo_desc` varchar(300) DEFAULT '' COMMENT '仓库描述',
  `repo_local_clone` varchar(300) DEFAULT NULL COMMENT '仓库本地克隆',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4 COMMENT='仓库监控结果表';


drop table if exists `repo_watch_task`;
CREATE TABLE `repo_watch_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '名称',
  `repo_type` tinyint NOT NULL DEFAULT '0' COMMENT '仓库类型：0=GitHub，1=Gitee',
  `clone_type` tinyint NOT NULL DEFAULT '0' COMMENT '克隆类型：0=本地，1=阿里云Codeup',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '类型：0=搜索，1=趋势',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态：0=启用，1=禁用',
  `work_status` tinyint NOT NULL DEFAULT '0' COMMENT '运行状态：0=空闲中，1=运行中',
  `keywords` varchar(500) NOT NULL DEFAULT 'language:Java' COMMENT '关键词',
  `keyword_lang` varchar(500) DEFAULT NULL COMMENT '开发语言：Go=Go,Rust=Rust,Javascript=Javascript,Vue=Vue',
  `keyword_negative` varchar(500) DEFAULT NULL COMMENT '排除关键词',
  `repo_limit` int DEFAULT '50' COMMENT '仓库搜索数据限制',
  `repo_clone_flag` tinyint DEFAULT NULL COMMENT '是否克隆仓库',
  `repo_clone_path` varchar(300) DEFAULT NULL COMMENT '仓库克隆路径',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='仓库监控任务表';
