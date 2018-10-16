/* Drop Indexes */
DROP INDEX sys_area_parent_id;
DROP INDEX sys_area_parent_ids;
DROP INDEX sys_area_del_flag;
DROP INDEX sys_dict_value;
DROP INDEX sys_dict_label;
DROP INDEX sys_dict_del_flag;
DROP INDEX sys_log_create_by;
DROP INDEX sys_log_request_uri;
DROP INDEX sys_log_type;
DROP INDEX sys_log_create_date;
DROP INDEX sys_mdict_parent_id;
DROP INDEX sys_mdict_parent_ids;
DROP INDEX sys_mdict_del_flag;
DROP INDEX sys_menu_parent_id;
DROP INDEX sys_menu_parent_ids;
DROP INDEX sys_menu_del_flag;
DROP INDEX sys_office_parent_id;
DROP INDEX sys_office_parent_ids;
DROP INDEX sys_office_del_flag;
DROP INDEX sys_office_type;
DROP INDEX sys_role_del_flag;
DROP INDEX sys_role_enname;
DROP INDEX sys_user_office_id;
DROP INDEX sys_user_login_name;
DROP INDEX sys_user_company_id;
DROP INDEX sys_user_update_date;
DROP INDEX sys_user_del_flag;
/* Drop Tables */

DROP TABLE sys_user_role CASCADE CONSTRAINTS;
DROP TABLE sys_user CASCADE CONSTRAINTS;
DROP TABLE sys_role_office CASCADE CONSTRAINTS;
DROP TABLE sys_office CASCADE CONSTRAINTS;
DROP TABLE sys_area CASCADE CONSTRAINTS;
DROP TABLE sys_dict CASCADE CONSTRAINTS;
DROP TABLE sys_log CASCADE CONSTRAINTS;
DROP TABLE sys_mdict CASCADE CONSTRAINTS;
DROP TABLE sys_role_menu CASCADE CONSTRAINTS;
DROP TABLE sys_menu CASCADE CONSTRAINTS;
DROP TABLE sys_role CASCADE CONSTRAINTS;

-- Create table
create table SYS_AREA
(
  id          VARCHAR2(64) not null,
  parent_id   VARCHAR2(64) not null,
  parent_ids  VARCHAR2(2000) not null,
  name        NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  code        VARCHAR2(100),
  type        CHAR(1),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null,
  power_code  VARCHAR2(100),
  pcode       VARCHAR2(100),
  shortname   VARCHAR2(100),
  qyflag      CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index SYS_AREA_DEL_FLAG on SYS_AREA (DEL_FLAG)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_AREA_PARENT_ID on SYS_AREA (PARENT_ID)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_AREA_PARENT_IDS on SYS_AREA (PARENT_IDS)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_AREA
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
-- Create table
create table SYS_DICT
(
  id          VARCHAR2(64) not null,
  value       VARCHAR2(100) not null,
  label       VARCHAR2(100) not null,
  type        VARCHAR2(100) not null,
  description NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  parent_id   VARCHAR2(64) default '0',
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index SYS_DICT_DEL_FLAG on SYS_DICT (DEL_FLAG)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_DICT_LABEL on SYS_DICT (LABEL)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_DICT_VALUE on SYS_DICT (VALUE)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_DICT
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
-- Create table
create table SYS_LOG
(
  id          VARCHAR2(64) not null,
  type        CHAR(1) default '1',
  title       NVARCHAR2(500),
  create_by   VARCHAR2(64),
  create_date TIMESTAMP(6),
  remote_addr VARCHAR2(255),
  user_agent  VARCHAR2(255),
  request_uri VARCHAR2(255),
  method      VARCHAR2(5),
  params      CLOB,
  exception   CLOB
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 8M
    next 1M
    minextents 1
  );
-- Create/Recreate indexes 
create index SYS_LOG_CREATE_BY on SYS_LOG (CREATE_BY)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 832K
    next 1M
    minextents 1
  );
create index SYS_LOG_CREATE_DATE on SYS_LOG (CREATE_DATE)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
  );
create index SYS_LOG_REQUEST_URI on SYS_LOG (REQUEST_URI)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
  );
create index SYS_LOG_TYPE on SYS_LOG (TYPE)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 640K
    next 1M
    minextents 1
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_LOG
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
  );

-- Create table
create table SYS_MDICT
(
  id          VARCHAR2(64) not null,
  parent_id   VARCHAR2(64) not null,
  parent_ids  VARCHAR2(2000) not null,
  name        NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  description NVARCHAR2(100),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 1M
    minextents 1
  );
-- Create/Recreate indexes 
create index SYS_MDICT_DEL_FLAG on SYS_MDICT (DEL_FLAG)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
  );
create index SYS_MDICT_PARENT_ID on SYS_MDICT (PARENT_ID)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
  );
create index SYS_MDICT_PARENT_IDS on SYS_MDICT (PARENT_IDS)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_MDICT
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
  );

-- Create table
create table SYS_MENU
(
  id          VARCHAR2(64) not null,
  parent_id   VARCHAR2(64) not null,
  parent_ids  VARCHAR2(2000) not null,
  name        NVARCHAR2(100) not null,
  sort        NUMBER(10) not null,
  href        VARCHAR2(2000),
  target      VARCHAR2(20),
  icon        VARCHAR2(100),
  is_show     CHAR(1) not null,
  permission  VARCHAR2(200),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 8K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index SYS_MENU_DEL_FLAG on SYS_MENU (DEL_FLAG)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_MENU_PARENT_ID on SYS_MENU (PARENT_ID)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_MENU_PARENT_IDS on SYS_MENU (PARENT_IDS)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_MENU
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

 -- Create table
create table SYS_OFFICE
(
  id             VARCHAR2(64) not null,
  parent_id      VARCHAR2(64) not null,
  parent_ids     VARCHAR2(2000) not null,
  name           NVARCHAR2(100) not null,
  sort           NUMBER(10) not null,
  area_id        VARCHAR2(64) not null,
  code           VARCHAR2(100),
  type           CHAR(1) not null,
  grade          CHAR(1) not null,
  address        NVARCHAR2(255),
  zip_code       VARCHAR2(100),
  master         NVARCHAR2(100),
  phone          NVARCHAR2(200),
  fax            NVARCHAR2(200),
  email          NVARCHAR2(200),
  useable        VARCHAR2(64),
  primary_person VARCHAR2(64),
  deputy_person  VARCHAR2(64),
  create_by      VARCHAR2(64) not null,
  create_date    TIMESTAMP(6) not null,
  update_by      VARCHAR2(64) not null,
  update_date    TIMESTAMP(6) not null,
  remarks        NVARCHAR2(255),
  del_flag       CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index SYS_OFFICE_DEL_FLAG on SYS_OFFICE (DEL_FLAG)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_OFFICE_PARENT_ID on SYS_OFFICE (PARENT_ID)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_OFFICE_PARENT_IDS on SYS_OFFICE (PARENT_IDS)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_OFFICE_TYPE on SYS_OFFICE (TYPE)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_OFFICE
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table SYS_ROLE
(
  id          VARCHAR2(64) not null,
  office_id   VARCHAR2(64),
  name        NVARCHAR2(100) not null,
  enname      VARCHAR2(255),
  role_type   VARCHAR2(255),
  data_scope  CHAR(1),
  is_sys      VARCHAR2(64),
  useable     VARCHAR2(64),
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  update_date TIMESTAMP(6) not null,
  remarks     NVARCHAR2(255),
  del_flag    CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index SYS_ROLE_DEL_FLAG on SYS_ROLE (DEL_FLAG)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_ROLE_ENNAME on SYS_ROLE (ENNAME)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_ROLE
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table SYS_ROLE_MENU
(
  role_id VARCHAR2(64) not null,
  menu_id VARCHAR2(64) not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_ROLE_MENU
  add primary key (ROLE_ID, MENU_ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table SYS_ROLE_OFFICE
(
  role_id   VARCHAR2(64) not null,
  office_id VARCHAR2(64) not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_ROLE_OFFICE
  add primary key (ROLE_ID, OFFICE_ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
  );

-- Create table
create table SYS_USER
(
  id                   VARCHAR2(64) not null,
  company_id           VARCHAR2(64) not null,
  office_id            VARCHAR2(64) not null,
  login_name           VARCHAR2(100) not null,
  password             VARCHAR2(100) not null,
  no                   VARCHAR2(100),
  name                 NVARCHAR2(100) not null,
  email                NVARCHAR2(200),
  phone                VARCHAR2(200),
  mobile               VARCHAR2(200),
  user_type            CHAR(1),
  photo                VARCHAR2(1000),
  login_ip             VARCHAR2(100),
  login_date           TIMESTAMP(6),
  login_flag           VARCHAR2(64),
  create_by            VARCHAR2(64) not null,
  create_date          TIMESTAMP(6) not null,
  update_by            VARCHAR2(64) not null,
  update_date          TIMESTAMP(6) not null,
  remarks              NVARCHAR2(255),
  del_flag             CHAR(1) default '0' not null,
  address              VARCHAR2(100),
  longitude            NUMBER(20,10),
  latitude             NUMBER(20,10),
  default_power        VARCHAR2(64),
  power_array          VARCHAR2(1024),
  show_land_comp       CHAR(1),
  effective_date       NUMBER,
  password_update_date TIMESTAMP(6),
  firm_jc              VARCHAR2(64)
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index SYS_USER_COMPANY_ID on SYS_USER (COMPANY_ID)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_USER_DEL_FLAG on SYS_USER (DEL_FLAG)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_USER_LOGIN_NAME on SYS_USER (LOGIN_NAME)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_USER_OFFICE_ID on SYS_USER (OFFICE_ID)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SYS_USER_UPDATE_DATE on SYS_USER (UPDATE_DATE)
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_USER
  add primary key (ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table SYS_USER_ROLE
(
  user_id VARCHAR2(64) not null,
  role_id VARCHAR2(64) not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_USER_ROLE
  add primary key (USER_ID, ROLE_ID)
  using index 
  tablespace WEBDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

