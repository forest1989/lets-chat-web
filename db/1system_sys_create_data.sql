--区域根节点
delete from sys_area;
insert into sys_area (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, POWER_CODE, PCODE, SHORTNAME, QYFLAG)
values ('1', '0', '0,', '中广核', 10, '00', '1', '1', sysdate, '1',sysdate, null, '0', '00', null, '广核', '1');
--字典表
delete from sys_dict;

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', 20, '0', '1', sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71', '1', '预警流程', 'act_category', '流程分类', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('96', '1', '男', 'sex', '性别', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('97', '2', '女', 'sex', '性别', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '正常', 'del_flag', '删除标记', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '删除', 'del_flag', '删除标记', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '显示', 'show_hide', '显示/隐藏', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '0', '隐藏', 'show_hide', '显示/隐藏', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '是', 'yes_no', '是/否', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '0', '否', 'yes_no', '是/否', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', 'red', '红色', 'color', '颜色值', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', 'green', '绿色', 'color', '颜色值', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', 'blue', '蓝色', 'color', '颜色值', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', 'yellow', '黄色', 'color', '颜色值', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', 'orange', '橙色', 'color', '颜色值', 50, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', 'default', '默认主题', 'theme', '主题方案', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', 'readable', '橙色主题', 'theme', '主题方案', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', 'united', '红色主题', 'theme', '主题方案', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', 'flat', 'Flat主题', 'theme', '主题方案', 60, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '1', '国家', 'sys_area_type', '区域类型', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '3', '地市', 'sys_area_type', '区域类型', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '4', '区县', 'sys_area_type', '区域类型', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '1', '公司', 'sys_office_type', '机构类型', 60, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4b7ebfe9a63b489182d769c501b5b6c9', 'warn', '预警工单流程', 'act_type', '流程类型', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f85426dd9c874fab897a8d701025ec14', 'BZD', 'BZD', 'CS_INFO', 'BZD', 10, '0', '1',sysdate, '1',sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37040069910e4198a10fe337b440b5e3', 'FD', 'FD', 'CS_INFO', 'FD', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2410fdaaf98b4b3693c35bc0e5832ee3', 'G', 'G', 'CS_INFO', 'G', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('770641e890c143a0ba216dbee2a70280', 'HZ', 'HZ', 'CS_INFO', 'HZ', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c9ea8307aa14d95a2219301bb9b279a', 'MY', 'MY', 'CS_INFO', 'MY', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('95e4526a816142ce93811ee6649f47c3', 'SD', 'SD', 'CS_INFO', 'SD', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b7ccc487701140c6b0981d171e26ffb2', 'SEC', 'SEC', 'CS_INFO', 'SEC', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f48c1de6014644809e396e5f0cd1fb86', 'W', 'W', 'CS_INFO', 'W', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d5f4fd4bdfdc4653bbbbc2dac720ca90', 'WD', 'WD', 'CS_INFO', 'WD', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19760f98dda0498b812e98fd70fd8b28', 'XE', 'XE', 'CS_INFO', 'XE', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('173a993dc59a4dcda237ac69a89a6dcd', 'ZGHN', '中广核能', 'CS_INFO', '中广核能', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9012c3e736404aaa9f477200e982d0b0', 'GE', 'GE', 'CS_INFO', 'GE', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ec0a5e2f36d941148a198762cc1e44e5', 'GW', 'GW', 'CS_INFO', 'GW', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ba19c75307e84718b98ca343b174d579', 'SL', 'SL', 'CS_INFO', 'SL', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4b78d731e57c488e863614cb4cb3e395', 'V', 'V', 'CS_INFO', 'V', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40c116b7a94f466e89d0b729d657b539', 'YJNY', '远景能源', 'CS_INFO', '远景能源', 9, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('173a993dc59a4dcda237ac69a17a6dcb', 'JHXX', '金辉信息', 'CS_INFO', '金辉信息', 10, '0', '1', sysdate, '1', sysdate, '风机厂商信息', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '2', '部门', 'sys_office_type', '机构类型', 70, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('23', '3', '小组', 'sys_office_type', '机构类型', 80, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24', '4', '其它', 'sys_office_type', '机构类型', 90, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', 50, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('28', '1', '一级', 'sys_office_grade', '机构等级', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('29', '2', '二级', 'sys_office_grade', '机构等级', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('30', '3', '三级', 'sys_office_grade', '机构等级', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('31', '4', '四级', 'sys_office_grade', '机构等级', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('32', '1', '所有数据', 'sys_data_scope', '数据范围', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', 100, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('39', '1', '系统管理', 'sys_user_type', '用户类型', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40', '2', '部门经理', 'sys_user_type', '用户类型', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('41', '3', '普通用户', 'sys_user_type', '用户类型', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42', 'basic', '基础主题', 'cms_theme', '站点主题', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('45', 'article', '文章模型', 'cms_module', '栏目模型', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('48', 'link', '链接模型', 'cms_module', '栏目模型', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53', '0', '发布', 'cms_del_flag', '内容状态', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('54', '1', '删除', 'cms_del_flag', '内容状态', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55', '2', '审核', 'cms_del_flag', '内容状态', 15, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56', '1', '首页焦点图', 'cms_posid', '推荐位', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '1', '咨询', 'cms_guestbook', '留言板分类', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '2', '建议', 'cms_guestbook', '留言板分类', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('60', '3', '投诉', 'cms_guestbook', '留言板分类', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('61', '4', '其它', 'cms_guestbook', '留言板分类', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67', '1', '接入日志', 'sys_log_type', '日志类型', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '2', '异常日志', 'sys_log_type', '日志类型', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('93c4ca856e6f4cc482107dc508ee96e9', '4', '四级', 'yjjb', '预警级别四级', 13, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55857d3203794cd69271f06da777c049', '5', '五级', 'yjjb', '预警级别五级', 23, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('72d6ce1fc8034113b550feff332d1331', '1', '一级', 'yjjb', '预警级别一级', 10, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cf66c15fc8c44a1fa92b7f93e0ae16b2', '3', '三级', 'yjjb', '预警级别三级', 12, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('057b98b1ef1f457d8984e83e122578c2', '2', '二级', 'yjjb', '预警级别二级', 11, '0', '1', sysdate, '1', sysdate, null, '0');

commit;


--菜单初始化
delete from sys_menu;
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55', '53', '0,1,27,31,40,53,', '审核', 40, null, null, null, '0', 'cms:guestbook:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('50', '40', '0,1,27,31,40,', '评论管理', 40, '/cms/comment/?status=2', null, 'comment', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '56', '0,1,27,40,56,', '查看', 30, null, null, null, '0', 'cms:ckfinder:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '56', '0,1,27,40,56,', '上传', 40, null, null, null, '0', 'cms:ckfinder:upload', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53', '40', '0,1,27,31,40,', '公共留言', 80, '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '56', '0,1,27,40,56,', '修改', 50, null, null, null, '0', 'cms:ckfinder:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('62', '27', '0,1,27,', '在线办公', 920, '23332', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79', '27', '0,1,27,', '代码生成', 94000, null, null, null, '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9bb139e9581b4e6286364cf912f1bb16', '1249cf39b8cf4c84a1610fb05d845a6c', '0,1,27,79,3c92c17886944d0687e73e286cada573,1249cf39b8cf4c84a1610fb05d845a6c,', '查看', 30, null, null, null, '1', 'test:oaTestAudit:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '2', '0,1,27,2,', '日志查询', 90, '/sys/log', null, ' icon-search', '1', 'sys:log:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('70', '62', '0,1,27,62,', '流程管理', 50, '/act/process', null, 'road', '1', 'act:process:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('72', '62', '0,1,27,62,', '模型管理', 100, '/act/model', null, 'road', '1', 'act:model:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6b9aa023d57b49938c183c63832b398c', 'd633cd075bd84fa3bf425ed70b7a9812', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,d633cd075bd84fa3bf425ed70b7a9812,', '查看', 30, null, null, null, '1', 'dawh:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5906b5b7252249eba91472bc13812ec3', '0ae8d87734854d63826192b1199ce877', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,0ae8d87734854d63826192b1199ce877,', '查看', 40, null, null, null, '0', 'daglInfoList:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0bf1a48ea79e496686c20a2030da0d2f', '2e921e3436b54e14beee800347fbc0cd', '0,1,27,2,2e921e3436b54e14beee800347fbc0cd,', '查看', 30, null, null, null, '0', 'vendor:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d346d3d54bce41c483b2c62bff9e5556', 'db39ef50d1ed43d58ac1d07c367cbad1', '0,1,27,2,db39ef50d1ed43d58ac1d07c367cbad1,', '查看', 30, null, null, null, '0', 'windfiled:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb352f76032f42259d2e1edf117f5106', '123a64ab93e54e6eb5dbf56f1f5a1e17', '0,1,27,2,123a64ab93e54e6eb5dbf56f1f5a1e17,', '查看', 30, null, null, null, '0', 'windfan:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b65a941d34e04f4491c74ba7037d38a8', 'db39ef50d1ed43d58ac1d07c367cbad1', '0,1,27,2,db39ef50d1ed43d58ac1d07c367cbad1,', '修改', 40, null, null, null, '0', 'pzgl:windFiled:edit', '1',sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b9d97b3aa1de483fa0edbe80e7f26311', '123a64ab93e54e6eb5dbf56f1f5a1e17', '0,1,27,2,123a64ab93e54e6eb5dbf56f1f5a1e17,', '修改', 60, null, null, null, '0', 'pzgl:windFan:edit', '1', sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cf999f1107074d15857ce78ba96d2b29', '7fa67b109878400381cd410df6e29bc7', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,7fa67b109878400381cd410df6e29bc7,', '查看', 40, null, null, null, '0', 'daglList:view', '1',sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52f886575dc64dc1aed62749d9956639', '2e921e3436b54e14beee800347fbc0cd', '0,1,27,2,2e921e3436b54e14beee800347fbc0cd,', '修改', 60, null, null, null, '0', 'pzgl:vendor:edit', '1', sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7e1fa29c561d40f08242c2747b70486f', '10', '0,1,27,2,10,', '查看', 70, null, null, null, '0', 'sys:dict:view', '1',sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('80', '79', '0,1,27,79,', '代码生成', 50, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,27,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', 60, null, null, null, '0', 'test:testData:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,27,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', 30, null, null, null, '0', 'test:testData:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,27,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', 30, null, null, null, '0', 'test:testDataMain:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,27,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', 60, null, null, null, '0', 'test:testDataMain:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,27,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', 30, null, null, null, '0', 'test:testTree:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,27,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', 60, null, null, null, '0', 'test:testTree:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '4', '0,1,27,2,4,', '查看', 30, null, null, null, '0', 'sys:menu:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '4', '0,1,27,2,4,', '修改', 40, null, null, null, '0', 'sys:menu:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', '7', '0,1,27,2,7,', '查看', 30, null, null, null, '0', 'sys:role:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', '7', '0,1,27,2,7,', '修改', 40, null, null, null, '0', 'sys:role:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9a5635eac41248289f5faefbc3a77ec1', 'd633cd075bd84fa3bf425ed70b7a9812', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,d633cd075bd84fa3bf425ed70b7a9812,', '修改', 40, null, null, null, '0', 'dagl:dawh:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('81', '80', '0,1,27,79,80,', '生成方案配置', 30, '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('82', '80', '0,1,27,79,80,', '业务表配置', 20, '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('85', '76', '0,1,75,76,', '行政区域', 80, '/../static/map/map-city.html', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0985af56e13e452ea9034594a48ee73c', '85', '0,1,75,76,85,', 'test/OaTestAudit', 5030, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb7c64f10e4443c1a4430eeddbcc9f40', '1249cf39b8cf4c84a1610fb05d845a6c', '0,1,27,79,3c92c17886944d0687e73e286cada573,1249cf39b8cf4c84a1610fb05d845a6c,', '新增', 60, null, null, null, '1', 'test:oaTestAudit:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1249cf39b8cf4c84a1610fb05d845a6c', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', 'oaTest生成', 120, '/test/oaTestAudit', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c92c17886944d0687e73e286cada573', '79', '0,1,27,79,', '生成示例', 120, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', '单表', 30, '/test/testData', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', '主子表', 60, '/test/testDataMain', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', '树结构', 90, '/test/testTree', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '功能菜单', 0, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '27', '0,1,27,', '配置管理', 15, '/sys/user/index', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '2', '0,1,27,2,', '菜单管理', 30, '/sys/menu/', null, 'list-alt', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', '2', '0,1,27,2,', '角色管理', 50, '/sys/role/', null, 'lock', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', '10', '0,1,27,2,10,', '修改', 40, null, null, null, '0', 'sys:dict:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', '14', '0,1,27,2,14,', '查看', 30, null, null, null, '0', 'sys:area:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', '2', '0,1,27,2,', '字典管理', 60, '/sys/dict/', null, 'th-list', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', '14', '0,1,27,2,14,', '修改', 40, null, null, null, '0', 'sys:area:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '17', '0,1,27,2,17,', '查看', 30, null, null, null, '0', 'sys:office:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', '2', '0,1,27,2,', '区域管理', 50, '/sys/area/', null, 'th', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '17', '0,1,27,2,17,', '修改', 40, null, null, null, '0', 'sys:office:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '20', '0,1,27,2,20,', '查看', 30, null, null, null, '0', 'sys:user:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '2', '0,1,27,2,', '机构管理', 40, '/sys/office/', null, 'th-large', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '20', '0,1,27,2,20,', '修改', 40, null, null, null, '0', 'sys:user:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '2', '0,1,27,2,', '用户管理', 30, '/sys/user/index', null, 'user', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('31', '27', '0,1,27,', '内容管理', 93000, null, null, null, '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '1', '0,1,', '我的面板', 1, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('34', '33', '0,1,27,31,32,33,', '查看', 30, null, null, null, '0', 'cms:category:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35', '33', '0,1,27,31,32,33,', '修改', 40, null, null, null, '0', 'cms:category:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37', '36', '0,1,27,31,32,36,', '查看', 30, null, null, null, '0', 'cms:site:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('38', '36', '0,1,27,31,32,36,', '修改', 40, null, null, null, '0', 'cms:site:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('32', '31', '0,1,27,31,', '栏目设置', 990, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33', '32', '0,1,27,31,32', '栏目管理', 30, '/cms/category/', null, 'align-justify', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42', '41', '0,1,27,31,40,41,', '文章模型', 40, '/cms/article/', null, 'file', '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43', '42', '0,1,27,31,40,41,42,', '查看', 30, null, null, null, '0', 'cms:article:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('36', '32', '0,1,27,31,32', '站点设置', 40, '/cms/site/', null, 'certificate', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('44', '42', '0,1,27,31,40,41,42,', '修改', 40, null, null, null, '0', 'cms:article:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('45', '42', '0,1,27,31,40,41,42,', '审核', 50, null, null, null, '0', 'cms:article:audit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('39', '32', '0,1,27,31,32', '切换站点', 50, '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40', '31', '0,1,27,31,', '内容管理', 500, null, null, null, '1', 'cms:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('41', '40', '0,1,27,31,40,', '内容发布', 30, '/cms/', null, 'briefcase', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46', '41', '0,1,27,31,40,41,', '链接模型', 60, '/cms/link/', null, 'random', '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('47', '46', '0,1,27,31,40,41,46,', '查看', 30, null, null, null, '0', 'cms:link:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('48', '46', '0,1,27,31,40,41,46,', '修改', 40, null, null, null, '0', 'cms:link:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('49', '46', '0,1,27,31,40,41,46,', '审核', 50, null, null, null, '0', 'cms:link:audit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('51', '50', '0,1,27,31,40,50,', '查看', 30, null, null, null, '0', 'cms:comment:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52', '50', '0,1,27,31,40,50,', '审核', 40, null, null, null, '0', 'cms:comment:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('54', '53', '0,1,27,31,40,53,', '查看', 30, null, null, null, '0', 'cms:guestbook:view', '1', sysdate, '1', sysdate, null, '0');

--机构
delete from sys_office;
insert into sys_office (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42c5b1afce544893b92afa7a44850b85', '5e527994f8f74d529edf183adb6b3db6', '0,5e527994f8f74d529edf183adb6b3db6,', '系统维护', 30, '1', '00', '2', '1', null, null, null, null, null, null, '1', null, null, '0', sysdate, '0', sysdate, null, '0');

insert into sys_office (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5e527994f8f74d529edf183adb6b3db6', '0', '0,', '远景能源', 30, '1', '00', '1', '1', null, null, null, null, null, null, '1', null, null, '0', sysdate, '1', sysdate, null, '0');

--用户角色对应关系
delete from sys_user_role;
insert into sys_user_role (USER_ID, ROLE_ID)
values ('1', 'aed5dd34b3944779ae48479cd3112556');

--角色
delete from sys_role;
insert into sys_role (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('aed5dd34b3944779ae48479cd3112556', '5e527994f8f74d529edf183adb6b3db6', '系统管理员', 'adminManger', 'security-role', '8', '1', '1', '1', sysdate, '1', sysdate, null, '0');
--用户数据
delete from sys_user;
insert into sys_user (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ADDRESS, LONGITUDE, LATITUDE, DEFAULT_POWER, POWER_ARRAY, SHOW_LAND_COMP, EFFECTIVE_DATE, PASSWORD_UPDATE_DATE, FIRM_JC)
values ('1', '5e527994f8f74d529edf183adb6b3db6', '42c5b1afce544893b92afa7a44850b85', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '00001', 'admin', 'admin@163.com', '025-74365282', '18682003823', '1', null, '127.0.0.1', sysdate, '1', '1', sysdate, '1', sysdate, null, '0', '安徽省合肥市合肥市ggty', 118.7833440000, 32.0304570000, '00', '00,99', '1', 20, sysdate, 'YJNY');

commit;
