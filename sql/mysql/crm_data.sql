
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (184, '回款审批状态', 'crm_receivable_check_status', 0, '回款审批状态(0 未审核 1 审核通过 2 审核拒绝 3 审核中 4 已撤回)', '1', '2023-10-18 21:44:24', '1', '2023-10-18 21:44:24', b'0', '1970-01-01 00:00:00');

INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (185, '回款-回款方式', 'crm_return_type', 0, '回款-回款方式', '1', '2023-10-18 21:54:10', '1', '2023-10-18 21:54:10', b'0', '1970-01-01 00:00:00');


INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1389, 0, '未审核', '0', 'crm_receivable_check_status', 0, 'default', '', '0 未审核 ', '1', '2023-10-18 21:46:00', '1', '2023-10-18 21:47:16', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1390, 1, '审核通过', '1', 'crm_receivable_check_status', 0, 'default', '', '1 审核通过', '1', '2023-10-18 21:46:18', '1', '2023-10-18 21:47:08', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1391, 2, '审核拒绝', '2', 'crm_receivable_check_status', 0, 'default', '', ' 2 审核拒绝', '1', '2023-10-18 21:46:58', '1', '2023-10-18 21:47:21', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1392, 3, '审核中', '3', 'crm_receivable_check_status', 0, 'default', '', ' 3 审核中', '1', '2023-10-18 21:47:35', '1', '2023-10-18 21:47:35', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1393, 4, '已撤回', '4', 'crm_receivable_check_status', 0, 'default', '', ' 4 已撤回', '1', '2023-10-18 21:47:46', '1', '2023-10-18 21:47:46', b'0');

INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1394, 1, '支票', '1', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:54:29', '1', '2023-10-18 21:54:29', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1395, 2, '现金', '2', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:54:41', '1', '2023-10-18 21:54:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1396, 3, '邮政汇款', '3', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:54:53', '1', '2023-10-18 21:54:53', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1397, 4, '电汇', '4', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:07', '1', '2023-10-18 21:55:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1398, 5, '网上转账', '5', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:24', '1', '2023-10-18 21:55:24', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1399, 6, '支付宝', '6', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:38', '1', '2023-10-18 21:55:38', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1400, 7, '微信支付', '7', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:55:53', '1', '2023-10-18 21:55:53', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1401, 8, '其他', '8', 'crm_return_type', 0, 'default', '', '', '1', '2023-10-18 21:56:06', '1', '2023-10-18 21:56:06', b'0');
