--������ڵ�
delete from sys_area;
insert into sys_area (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, POWER_CODE, PCODE, SHORTNAME, QYFLAG)
values ('1', '0', '0,', '�й��', 10, '00', '1', '1', sysdate, '1',sysdate, null, '0', '00', null, '���', '1');
--�ֵ��
delete from sys_dict;

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('70', 'test_audit', '������������', 'act_type', '��������', 20, '0', '1', sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71', '1', 'Ԥ������', 'act_category', '���̷���', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('96', '1', '��', 'sex', '�Ա�', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('97', '2', 'Ů', 'sex', '�Ա�', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '����', 'del_flag', 'ɾ�����', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', 'ɾ��', 'del_flag', 'ɾ�����', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '��ʾ', 'show_hide', '��ʾ/����', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '0', '����', 'show_hide', '��ʾ/����', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '��', 'yes_no', '��/��', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '0', '��', 'yes_no', '��/��', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', 'red', '��ɫ', 'color', '��ɫֵ', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', 'green', '��ɫ', 'color', '��ɫֵ', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', 'blue', '��ɫ', 'color', '��ɫֵ', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', 'yellow', '��ɫ', 'color', '��ɫֵ', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', 'orange', '��ɫ', 'color', '��ɫֵ', 50, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', 'default', 'Ĭ������', 'theme', '���ⷽ��', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('13', 'cerulean', '��������', 'theme', '���ⷽ��', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', 'readable', '��ɫ����', 'theme', '���ⷽ��', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', 'united', '��ɫ����', 'theme', '���ⷽ��', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', 'flat', 'Flat����', 'theme', '���ⷽ��', 60, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '1', '����', 'sys_area_type', '��������', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '2', 'ʡ�ݡ�ֱϽ��', 'sys_area_type', '��������', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '3', '����', 'sys_area_type', '��������', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '4', '����', 'sys_area_type', '��������', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '1', '��˾', 'sys_office_type', '��������', 60, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4b7ebfe9a63b489182d769c501b5b6c9', 'warn', 'Ԥ����������', 'act_type', '��������', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f85426dd9c874fab897a8d701025ec14', 'BZD', 'BZD', 'CS_INFO', 'BZD', 10, '0', '1',sysdate, '1',sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37040069910e4198a10fe337b440b5e3', 'FD', 'FD', 'CS_INFO', 'FD', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2410fdaaf98b4b3693c35bc0e5832ee3', 'G', 'G', 'CS_INFO', 'G', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('770641e890c143a0ba216dbee2a70280', 'HZ', 'HZ', 'CS_INFO', 'HZ', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c9ea8307aa14d95a2219301bb9b279a', 'MY', 'MY', 'CS_INFO', 'MY', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('95e4526a816142ce93811ee6649f47c3', 'SD', 'SD', 'CS_INFO', 'SD', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b7ccc487701140c6b0981d171e26ffb2', 'SEC', 'SEC', 'CS_INFO', 'SEC', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f48c1de6014644809e396e5f0cd1fb86', 'W', 'W', 'CS_INFO', 'W', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d5f4fd4bdfdc4653bbbbc2dac720ca90', 'WD', 'WD', 'CS_INFO', 'WD', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19760f98dda0498b812e98fd70fd8b28', 'XE', 'XE', 'CS_INFO', 'XE', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('173a993dc59a4dcda237ac69a89a6dcd', 'ZGHN', '�й����', 'CS_INFO', '�й����', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9012c3e736404aaa9f477200e982d0b0', 'GE', 'GE', 'CS_INFO', 'GE', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ec0a5e2f36d941148a198762cc1e44e5', 'GW', 'GW', 'CS_INFO', 'GW', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ba19c75307e84718b98ca343b174d579', 'SL', 'SL', 'CS_INFO', 'SL', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4b78d731e57c488e863614cb4cb3e395', 'V', 'V', 'CS_INFO', 'V', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40c116b7a94f466e89d0b729d657b539', 'YJNY', 'Զ����Դ', 'CS_INFO', 'Զ����Դ', 9, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('173a993dc59a4dcda237ac69a17a6dcb', 'JHXX', '�����Ϣ', 'CS_INFO', '�����Ϣ', 10, '0', '1', sysdate, '1', sysdate, '���������Ϣ', '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '2', '����', 'sys_office_type', '��������', 70, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('23', '3', 'С��', 'sys_office_type', '��������', 80, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24', '4', '����', 'sys_office_type', '��������', 90, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('25', '1', '�ۺϲ�', 'sys_office_common', '���ͨ�ò���', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('26', '2', '������', 'sys_office_common', '���ͨ�ò���', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '3', '������', 'sys_office_common', '���ͨ�ò���', 50, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('28', '1', 'һ��', 'sys_office_grade', '�����ȼ�', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('29', '2', '����', 'sys_office_grade', '�����ȼ�', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('30', '3', '����', 'sys_office_grade', '�����ȼ�', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('31', '4', '�ļ�', 'sys_office_grade', '�����ȼ�', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('32', '1', '��������', 'sys_data_scope', '���ݷ�Χ', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33', '2', '���ڹ�˾����������', 'sys_data_scope', '���ݷ�Χ', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('34', '3', '���ڹ�˾����', 'sys_data_scope', '���ݷ�Χ', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35', '4', '���ڲ��ż���������', 'sys_data_scope', '���ݷ�Χ', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('36', '5', '���ڲ�������', 'sys_data_scope', '���ݷ�Χ', 50, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37', '8', '����������', 'sys_data_scope', '���ݷ�Χ', 90, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('38', '9', '����ϸ����', 'sys_data_scope', '���ݷ�Χ', 100, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('39', '1', 'ϵͳ����', 'sys_user_type', '�û�����', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40', '2', '���ž���', 'sys_user_type', '�û�����', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('41', '3', '��ͨ�û�', 'sys_user_type', '�û�����', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42', 'basic', '��������', 'cms_theme', 'վ������', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('45', 'article', '����ģ��', 'cms_module', '��Ŀģ��', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('48', 'link', '����ģ��', 'cms_module', '��Ŀģ��', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('50', '0', 'Ĭ��չ�ַ�ʽ', 'cms_show_modes', 'չ�ַ�ʽ', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('51', '1', '����Ŀ�����б�', 'cms_show_modes', 'չ�ַ�ʽ', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52', '2', '��Ŀ��һ������', 'cms_show_modes', 'չ�ַ�ʽ', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53', '0', '����', 'cms_del_flag', '����״̬', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('54', '1', 'ɾ��', 'cms_del_flag', '����״̬', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55', '2', '���', 'cms_del_flag', '����״̬', 15, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56', '1', '��ҳ����ͼ', 'cms_posid', '�Ƽ�λ', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '2', '��Ŀҳ�����Ƽ�', 'cms_posid', '�Ƽ�λ', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '1', '��ѯ', 'cms_guestbook', '���԰����', 10, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '2', '����', 'cms_guestbook', '���԰����', 20, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('60', '3', 'Ͷ��', 'cms_guestbook', '���԰����', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('61', '4', '����', 'cms_guestbook', '���԰����', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67', '1', '������־', 'sys_log_type', '��־����', 30, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '2', '�쳣��־', 'sys_log_type', '��־����', 40, '0', '1',sysdate, '1',sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('93c4ca856e6f4cc482107dc508ee96e9', '4', '�ļ�', 'yjjb', 'Ԥ�������ļ�', 13, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55857d3203794cd69271f06da777c049', '5', '�弶', 'yjjb', 'Ԥ�������弶', 23, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('72d6ce1fc8034113b550feff332d1331', '1', 'һ��', 'yjjb', 'Ԥ������һ��', 10, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cf66c15fc8c44a1fa92b7f93e0ae16b2', '3', '����', 'yjjb', 'Ԥ����������', 12, '0', '1', sysdate, '1', sysdate, null, '0');

insert into sys_dict (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('057b98b1ef1f457d8984e83e122578c2', '2', '����', 'yjjb', 'Ԥ���������', 11, '0', '1', sysdate, '1', sysdate, null, '0');

commit;


--�˵���ʼ��
delete from sys_menu;
insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55', '53', '0,1,27,31,40,53,', '���', 40, null, null, null, '0', 'cms:guestbook:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('50', '40', '0,1,27,31,40,', '���۹���', 40, '/cms/comment/?status=2', null, 'comment', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '56', '0,1,27,40,56,', '�鿴', 30, null, null, null, '0', 'cms:ckfinder:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '56', '0,1,27,40,56,', '�ϴ�', 40, null, null, null, '0', 'cms:ckfinder:upload', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53', '40', '0,1,27,31,40,', '��������', 80, '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '56', '0,1,27,40,56,', '�޸�', 50, null, null, null, '0', 'cms:ckfinder:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('62', '27', '0,1,27,', '���߰칫', 920, '23332', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79', '27', '0,1,27,', '��������', 94000, null, null, null, '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9bb139e9581b4e6286364cf912f1bb16', '1249cf39b8cf4c84a1610fb05d845a6c', '0,1,27,79,3c92c17886944d0687e73e286cada573,1249cf39b8cf4c84a1610fb05d845a6c,', '�鿴', 30, null, null, null, '1', 'test:oaTestAudit:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '2', '0,1,27,2,', '��־��ѯ', 90, '/sys/log', null, ' icon-search', '1', 'sys:log:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('70', '62', '0,1,27,62,', '���̹���', 50, '/act/process', null, 'road', '1', 'act:process:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('72', '62', '0,1,27,62,', 'ģ�͹���', 100, '/act/model', null, 'road', '1', 'act:model:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6b9aa023d57b49938c183c63832b398c', 'd633cd075bd84fa3bf425ed70b7a9812', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,d633cd075bd84fa3bf425ed70b7a9812,', '�鿴', 30, null, null, null, '1', 'dawh:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5906b5b7252249eba91472bc13812ec3', '0ae8d87734854d63826192b1199ce877', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,0ae8d87734854d63826192b1199ce877,', '�鿴', 40, null, null, null, '0', 'daglInfoList:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0bf1a48ea79e496686c20a2030da0d2f', '2e921e3436b54e14beee800347fbc0cd', '0,1,27,2,2e921e3436b54e14beee800347fbc0cd,', '�鿴', 30, null, null, null, '0', 'vendor:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d346d3d54bce41c483b2c62bff9e5556', 'db39ef50d1ed43d58ac1d07c367cbad1', '0,1,27,2,db39ef50d1ed43d58ac1d07c367cbad1,', '�鿴', 30, null, null, null, '0', 'windfiled:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb352f76032f42259d2e1edf117f5106', '123a64ab93e54e6eb5dbf56f1f5a1e17', '0,1,27,2,123a64ab93e54e6eb5dbf56f1f5a1e17,', '�鿴', 30, null, null, null, '0', 'windfan:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b65a941d34e04f4491c74ba7037d38a8', 'db39ef50d1ed43d58ac1d07c367cbad1', '0,1,27,2,db39ef50d1ed43d58ac1d07c367cbad1,', '�޸�', 40, null, null, null, '0', 'pzgl:windFiled:edit', '1',sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b9d97b3aa1de483fa0edbe80e7f26311', '123a64ab93e54e6eb5dbf56f1f5a1e17', '0,1,27,2,123a64ab93e54e6eb5dbf56f1f5a1e17,', '�޸�', 60, null, null, null, '0', 'pzgl:windFan:edit', '1', sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cf999f1107074d15857ce78ba96d2b29', '7fa67b109878400381cd410df6e29bc7', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,7fa67b109878400381cd410df6e29bc7,', '�鿴', 40, null, null, null, '0', 'daglList:view', '1',sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52f886575dc64dc1aed62749d9956639', '2e921e3436b54e14beee800347fbc0cd', '0,1,27,2,2e921e3436b54e14beee800347fbc0cd,', '�޸�', 60, null, null, null, '0', 'pzgl:vendor:edit', '1', sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7e1fa29c561d40f08242c2747b70486f', '10', '0,1,27,2,10,', '�鿴', 70, null, null, null, '0', 'sys:dict:view', '1',sysdate, '1',sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('80', '79', '0,1,27,79,', '��������', 50, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,27,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '�༭', 60, null, null, null, '0', 'test:testData:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,27,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '�鿴', 30, null, null, null, '0', 'test:testData:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,27,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '�鿴', 30, null, null, null, '0', 'test:testDataMain:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,27,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '�༭', 60, null, null, null, '0', 'test:testDataMain:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,27,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '�鿴', 30, null, null, null, '0', 'test:testTree:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,27,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '�༭', 60, null, null, null, '0', 'test:testTree:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '4', '0,1,27,2,4,', '�鿴', 30, null, null, null, '0', 'sys:menu:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '4', '0,1,27,2,4,', '�޸�', 40, null, null, null, '0', 'sys:menu:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', '7', '0,1,27,2,7,', '�鿴', 30, null, null, null, '0', 'sys:role:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', '7', '0,1,27,2,7,', '�޸�', 40, null, null, null, '0', 'sys:role:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9a5635eac41248289f5faefbc3a77ec1', 'd633cd075bd84fa3bf425ed70b7a9812', '0,1,27,b3ac1cffc8344bbc8919132f1fd42987,d633cd075bd84fa3bf425ed70b7a9812,', '�޸�', 40, null, null, null, '0', 'dagl:dawh:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('81', '80', '0,1,27,79,80,', '���ɷ�������', 30, '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('82', '80', '0,1,27,79,80,', 'ҵ�������', 20, '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('85', '76', '0,1,75,76,', '��������', 80, '/../static/map/map-city.html', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0985af56e13e452ea9034594a48ee73c', '85', '0,1,75,76,85,', 'test/OaTestAudit', 5030, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb7c64f10e4443c1a4430eeddbcc9f40', '1249cf39b8cf4c84a1610fb05d845a6c', '0,1,27,79,3c92c17886944d0687e73e286cada573,1249cf39b8cf4c84a1610fb05d845a6c,', '����', 60, null, null, null, '1', 'test:oaTestAudit:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1249cf39b8cf4c84a1610fb05d845a6c', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', 'oaTest����', 120, '/test/oaTestAudit', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c92c17886944d0687e73e286cada573', '79', '0,1,27,79,', '����ʾ��', 120, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', '����', 30, '/test/testData', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', '���ӱ�', 60, '/test/testDataMain', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,27,79,3c92c17886944d0687e73e286cada573,', '���ṹ', 90, '/test/testTree', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '���ܲ˵�', 0, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '27', '0,1,27,', '���ù���', 15, '/sys/user/index', null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '2', '0,1,27,2,', '�˵�����', 30, '/sys/menu/', null, 'list-alt', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', '2', '0,1,27,2,', '��ɫ����', 50, '/sys/role/', null, 'lock', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', '10', '0,1,27,2,10,', '�޸�', 40, null, null, null, '0', 'sys:dict:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', '14', '0,1,27,2,14,', '�鿴', 30, null, null, null, '0', 'sys:area:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', '2', '0,1,27,2,', '�ֵ����', 60, '/sys/dict/', null, 'th-list', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', '14', '0,1,27,2,14,', '�޸�', 40, null, null, null, '0', 'sys:area:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '17', '0,1,27,2,17,', '�鿴', 30, null, null, null, '0', 'sys:office:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', '2', '0,1,27,2,', '�������', 50, '/sys/area/', null, 'th', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '17', '0,1,27,2,17,', '�޸�', 40, null, null, null, '0', 'sys:office:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '20', '0,1,27,2,20,', '�鿴', 30, null, null, null, '0', 'sys:user:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '2', '0,1,27,2,', '��������', 40, '/sys/office/', null, 'th-large', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '20', '0,1,27,2,20,', '�޸�', 40, null, null, null, '0', 'sys:user:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '2', '0,1,27,2,', '�û�����', 30, '/sys/user/index', null, 'user', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('31', '27', '0,1,27,', '���ݹ���', 93000, null, null, null, '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '1', '0,1,', '�ҵ����', 1, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('34', '33', '0,1,27,31,32,33,', '�鿴', 30, null, null, null, '0', 'cms:category:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35', '33', '0,1,27,31,32,33,', '�޸�', 40, null, null, null, '0', 'cms:category:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37', '36', '0,1,27,31,32,36,', '�鿴', 30, null, null, null, '0', 'cms:site:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('38', '36', '0,1,27,31,32,36,', '�޸�', 40, null, null, null, '0', 'cms:site:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('32', '31', '0,1,27,31,', '��Ŀ����', 990, null, null, null, '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33', '32', '0,1,27,31,32', '��Ŀ����', 30, '/cms/category/', null, 'align-justify', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42', '41', '0,1,27,31,40,41,', '����ģ��', 40, '/cms/article/', null, 'file', '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43', '42', '0,1,27,31,40,41,42,', '�鿴', 30, null, null, null, '0', 'cms:article:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('36', '32', '0,1,27,31,32', 'վ������', 40, '/cms/site/', null, 'certificate', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('44', '42', '0,1,27,31,40,41,42,', '�޸�', 40, null, null, null, '0', 'cms:article:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('45', '42', '0,1,27,31,40,41,42,', '���', 50, null, null, null, '0', 'cms:article:audit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('39', '32', '0,1,27,31,32', '�л�վ��', 50, '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40', '31', '0,1,27,31,', '���ݹ���', 500, null, null, null, '1', 'cms:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('41', '40', '0,1,27,31,40,', '���ݷ���', 30, '/cms/', null, 'briefcase', '1', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46', '41', '0,1,27,31,40,41,', '����ģ��', 60, '/cms/link/', null, 'random', '0', null, '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('47', '46', '0,1,27,31,40,41,46,', '�鿴', 30, null, null, null, '0', 'cms:link:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('48', '46', '0,1,27,31,40,41,46,', '�޸�', 40, null, null, null, '0', 'cms:link:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('49', '46', '0,1,27,31,40,41,46,', '���', 50, null, null, null, '0', 'cms:link:audit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('51', '50', '0,1,27,31,40,50,', '�鿴', 30, null, null, null, '0', 'cms:comment:view', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52', '50', '0,1,27,31,40,50,', '���', 40, null, null, null, '0', 'cms:comment:edit', '1', sysdate, '1', sysdate, null, '0');

insert into sys_menu (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('54', '53', '0,1,27,31,40,53,', '�鿴', 30, null, null, null, '0', 'cms:guestbook:view', '1', sysdate, '1', sysdate, null, '0');

--����
delete from sys_office;
insert into sys_office (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42c5b1afce544893b92afa7a44850b85', '5e527994f8f74d529edf183adb6b3db6', '0,5e527994f8f74d529edf183adb6b3db6,', 'ϵͳά��', 30, '1', '00', '2', '1', null, null, null, null, null, null, '1', null, null, '0', sysdate, '0', sysdate, null, '0');

insert into sys_office (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5e527994f8f74d529edf183adb6b3db6', '0', '0,', 'Զ����Դ', 30, '1', '00', '1', '1', null, null, null, null, null, null, '1', null, null, '0', sysdate, '1', sysdate, null, '0');

--�û���ɫ��Ӧ��ϵ
delete from sys_user_role;
insert into sys_user_role (USER_ID, ROLE_ID)
values ('1', 'aed5dd34b3944779ae48479cd3112556');

--��ɫ
delete from sys_role;
insert into sys_role (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('aed5dd34b3944779ae48479cd3112556', '5e527994f8f74d529edf183adb6b3db6', 'ϵͳ����Ա', 'adminManger', 'security-role', '8', '1', '1', '1', sysdate, '1', sysdate, null, '0');
--�û�����
delete from sys_user;
insert into sys_user (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ADDRESS, LONGITUDE, LATITUDE, DEFAULT_POWER, POWER_ARRAY, SHOW_LAND_COMP, EFFECTIVE_DATE, PASSWORD_UPDATE_DATE, FIRM_JC)
values ('1', '5e527994f8f74d529edf183adb6b3db6', '42c5b1afce544893b92afa7a44850b85', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '00001', 'admin', 'admin@163.com', '025-74365282', '18682003823', '1', null, '127.0.0.1', sysdate, '1', '1', sysdate, '1', sysdate, null, '0', '����ʡ�Ϸ��кϷ���ggty', 118.7833440000, 32.0304570000, '00', '00,99', '1', 20, sysdate, 'YJNY');

commit;
