------------------------------------------------------
-- Export file for user WEBDBA@JSZC                 --
-- Created by huang_xiantao on 2016/12/30, 11:05:46 --
------------------------------------------------------
DROP TABLE act_ge_bytearray cascade constraints;
DROP TABLE act_ge_property cascade constraints;
DROP TABLE act_hi_actinst cascade constraints;
DROP TABLE act_hi_attachment cascade constraints;
DROP TABLE act_hi_comment cascade constraints;
DROP TABLE act_hi_detail cascade constraints;
DROP TABLE act_hi_identitylink cascade constraints;
DROP TABLE act_hi_procinst cascade constraints;
DROP TABLE act_hi_taskinst cascade constraints;
DROP TABLE act_hi_varinst cascade constraints;
DROP TABLE act_id_group cascade constraints;
DROP TABLE act_id_info cascade constraints;
DROP TABLE act_id_membership cascade constraints;
DROP TABLE act_id_user cascade constraints;
DROP TABLE act_re_deployment cascade constraints;
DROP TABLE act_re_model cascade constraints;
DROP TABLE act_re_procdef cascade constraints;
DROP TABLE act_ru_event_subscr cascade constraints;
DROP TABLE act_ru_execution cascade constraints;
DROP TABLE act_ru_identitylink cascade constraints;
DROP TABLE act_ru_job cascade constraints;
DROP TABLE act_ru_task cascade constraints;
DROP TABLE act_ru_variable cascade constraints;
DROP TABLE ACT_EVT_LOG cascade constraints;
DROP TABLE ACT_PROCDEF_INFO cascade constraints;



create table ACT_RE_DEPLOYMENT
(
  id_          NVARCHAR2(64) not null,
  name_        NVARCHAR2(255),
  category_    NVARCHAR2(255),
  tenant_id_   NVARCHAR2(255) default '',
  deploy_time_ TIMESTAMP(6)
);
alter table ACT_RE_DEPLOYMENT add primary key (ID_);


create table ACT_GE_BYTEARRAY
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  name_          NVARCHAR2(255),
  deployment_id_ NVARCHAR2(64),
  bytes_         BLOB,
  generated_     NUMBER(1)
);
create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY (DEPLOYMENT_ID_);
alter table ACT_GE_BYTEARRAY add primary key (ID_);
alter table ACT_GE_BYTEARRAY add constraint ACT_FK_BYTEARR_DEPL foreign key (DEPLOYMENT_ID_) references ACT_RE_DEPLOYMENT (ID_);
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));
alter table ACT_GE_BYTEARRAY add check (GENERATED_ IN (1,0));


create table ACT_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
);
alter table ACT_GE_PROPERTY add primary key (NAME_);


create table ACT_HI_ACTINST
(
  id_                NVARCHAR2(64) not null,
  proc_def_id_       NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64) not null,
  execution_id_      NVARCHAR2(64) not null,
  act_id_            NVARCHAR2(255) not null,
  task_id_           NVARCHAR2(64),
  call_proc_inst_id_ NVARCHAR2(64),
  act_name_          NVARCHAR2(255),
  act_type_          NVARCHAR2(255) not null,
  assignee_          NVARCHAR2(255),
  start_time_        TIMESTAMP(6) not null,
  end_time_          TIMESTAMP(6),
  duration_          NUMBER(19),
  tenant_id_         NVARCHAR2(255) default ''
);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST (END_TIME_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST (START_TIME_);
alter table ACT_HI_ACTINST add primary key (ID_);


create table ACT_HI_ATTACHMENT
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  user_id_      NVARCHAR2(255),
  name_         NVARCHAR2(255),
  description_  NVARCHAR2(2000),
  type_         NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  url_          NVARCHAR2(2000),
  content_id_   NVARCHAR2(64),
  time_         TIMESTAMP(6)
);
alter table ACT_HI_ATTACHMENT add primary key (ID_);


create table ACT_HI_COMMENT
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255),
  time_         TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  action_       NVARCHAR2(255),
  message_      NVARCHAR2(2000),
  full_msg_     BLOB
);
alter table ACT_HI_COMMENT add primary key (ID_);


create table ACT_HI_DETAIL
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255) not null,
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  act_inst_id_  NVARCHAR2(64),
  name_         NVARCHAR2(255) not null,
  var_type_     NVARCHAR2(64),
  rev_          INTEGER,
  time_         TIMESTAMP(6) not null,
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL (ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL (NAME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL (PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL (TASK_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL (TIME_);
alter table ACT_HI_DETAIL add primary key (ID_);


create table ACT_HI_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64)
);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK (TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK (USER_ID_);
alter table ACT_HI_IDENTITYLINK add primary key (ID_);


create table ACT_HI_PROCINST
(
  id_                        NVARCHAR2(64) not null,
  proc_inst_id_              NVARCHAR2(64) not null,
  business_key_              NVARCHAR2(255),
  proc_def_id_               NVARCHAR2(64) not null,
  start_time_                TIMESTAMP(6) not null,
  end_time_                  TIMESTAMP(6),
  duration_                  NUMBER(19),
  start_user_id_             NVARCHAR2(255),
  start_act_id_              NVARCHAR2(255),
  end_act_id_                NVARCHAR2(255),
  super_process_instance_id_ NVARCHAR2(64),
  delete_reason_             NVARCHAR2(2000),
  tenant_id_                 NVARCHAR2(255) default '',
  name_                      NVARCHAR2(255)
);
create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST (END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST (BUSINESS_KEY_);
alter table ACT_HI_PROCINST add primary key (ID_);
alter table ACT_HI_PROCINST add unique (PROC_INST_ID_);


create table ACT_HI_TASKINST
(
  id_             NVARCHAR2(64) not null,
  proc_def_id_    NVARCHAR2(64),
  task_def_key_   NVARCHAR2(255),
  proc_inst_id_   NVARCHAR2(64),
  execution_id_   NVARCHAR2(64),
  parent_task_id_ NVARCHAR2(64),
  name_           NVARCHAR2(255),
  description_    NVARCHAR2(2000),
  owner_          NVARCHAR2(255),
  assignee_       NVARCHAR2(255),
  start_time_     TIMESTAMP(6) not null,
  claim_time_     TIMESTAMP(6),
  end_time_       TIMESTAMP(6),
  duration_       NUMBER(19),
  delete_reason_  NVARCHAR2(2000),
  priority_       INTEGER,
  due_date_       TIMESTAMP(6),
  form_key_       NVARCHAR2(255),
  category_       NVARCHAR2(255),
  tenant_id_      NVARCHAR2(255) default ''
);
alter table ACT_HI_TASKINST add primary key (ID_);


create table ACT_HI_VARINST
(
  id_                NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64),
  execution_id_      NVARCHAR2(64),
  task_id_           NVARCHAR2(64),
  name_              NVARCHAR2(255) not null,
  var_type_          NVARCHAR2(100),
  rev_               INTEGER,
  bytearray_id_      NVARCHAR2(64),
  double_            NUMBER(*,10),
  long_              NUMBER(19),
  text_              NVARCHAR2(2000),
  text2_             NVARCHAR2(2000),
  create_time_       TIMESTAMP(6),
  last_updated_time_ TIMESTAMP(6)
);
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST (NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST (PROC_INST_ID_);
alter table ACT_HI_VARINST  add primary key (ID_);


create table ACT_ID_GROUP
(
  id_   NVARCHAR2(64) not null,
  rev_  INTEGER,
  name_ NVARCHAR2(255),
  type_ NVARCHAR2(255)
);
alter table ACT_ID_GROUP add primary key (ID_);


create table ACT_ID_INFO
(
  id_        NVARCHAR2(64) not null,
  rev_       INTEGER,
  user_id_   NVARCHAR2(64),
  type_      NVARCHAR2(64),
  key_       NVARCHAR2(255),
  value_     NVARCHAR2(255),
  password_  BLOB,
  parent_id_ NVARCHAR2(255)
);
alter table ACT_ID_INFO add primary key (ID_);


create table ACT_ID_USER
(
  id_         NVARCHAR2(64) not null,
  rev_        INTEGER,
  first_      NVARCHAR2(255),
  last_       NVARCHAR2(255),
  email_      NVARCHAR2(255),
  pwd_        NVARCHAR2(255),
  picture_id_ NVARCHAR2(64)
);
alter table ACT_ID_USER add primary key (ID_);


create table ACT_ID_MEMBERSHIP
(
  user_id_  NVARCHAR2(64) not null,
  group_id_ NVARCHAR2(64) not null
);
create index ACT_IDX_MEMB_GROUP on ACT_ID_MEMBERSHIP (GROUP_ID_);
create index ACT_IDX_MEMB_USER on ACT_ID_MEMBERSHIP (USER_ID_);
alter table ACT_ID_MEMBERSHIP add primary key (USER_ID_, GROUP_ID_);
alter table ACT_ID_MEMBERSHIP add constraint ACT_FK_MEMB_GROUP foreign key (GROUP_ID_) references ACT_ID_GROUP (ID_);
alter table ACT_ID_MEMBERSHIP add constraint ACT_FK_MEMB_USER foreign key (USER_ID_) references ACT_ID_USER (ID_);


create table ACT_RE_MODEL
(
  id_                           NVARCHAR2(64) not null,
  rev_                          INTEGER,
  name_                         NVARCHAR2(255),
  key_                          NVARCHAR2(255),
  category_                     NVARCHAR2(255),
  create_time_                  TIMESTAMP(6),
  last_update_time_             TIMESTAMP(6),
  version_                      INTEGER,
  meta_info_                    NVARCHAR2(2000),
  deployment_id_                NVARCHAR2(64),
  editor_source_value_id_       NVARCHAR2(64),
  editor_source_extra_value_id_ NVARCHAR2(64),
  tenant_id_                    NVARCHAR2(255) default ''
);
alter table ACT_RE_MODEL add primary key (ID_);


create table ACT_RE_PROCDEF
(
  id_                 NVARCHAR2(64) not null,
  rev_                INTEGER,
  category_           NVARCHAR2(255),
  name_               NVARCHAR2(255),
  key_                NVARCHAR2(255) not null,
  version_            INTEGER not null,
  deployment_id_      NVARCHAR2(64),
  resource_name_      NVARCHAR2(2000),
  dgrm_resource_name_ VARCHAR2(4000),
  description_        NVARCHAR2(2000),
  has_start_form_key_ NUMBER(1),
  suspension_state_   INTEGER,
  tenant_id_          NVARCHAR2(255) default '',
  has_graphical_notation_ NUMBER(1)
);
alter table ACT_RE_PROCDEF add primary key (ID_);
alter table ACT_RE_PROCDEF add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_);
alter table ACT_RE_PROCDEF add check (HAS_START_FORM_KEY_ IN (1,0));
alter table ACT_RE_PROCDEF add check (HAS_GRAPHICAL_NOTATION_ IN (1,0));


create table ACT_RU_EVENT_SUBSCR
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  event_type_    NVARCHAR2(255) not null,
  event_name_    NVARCHAR2(255),
  execution_id_  NVARCHAR2(64),
  proc_inst_id_  NVARCHAR2(64),
  activity_id_   NVARCHAR2(64),
  configuration_ NVARCHAR2(255),
  created_       TIMESTAMP(6) not null,
  proc_def_id_   NVARCHAR2(64),
  tenant_id_     NVARCHAR2(255) default ''
);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR (CONFIGURATION_);
alter table ACT_RU_EVENT_SUBSCR add primary key (ID_);


create table ACT_RU_EXECUTION
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  proc_inst_id_     NVARCHAR2(64),
  business_key_     NVARCHAR2(255),
  parent_id_        NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  super_exec_       NVARCHAR2(64),
  act_id_           NVARCHAR2(255),
  is_active_        NUMBER(1),
  is_concurrent_    NUMBER(1),
  is_scope_         NUMBER(1),
  is_event_scope_   NUMBER(1),
  suspension_state_ INTEGER,
  cached_ent_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  name_             NVARCHAR2(255),
  lock_time_        TIMESTAMP(6)
);
create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION (BUSINESS_KEY_);
create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION (PARENT_ID_);
create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION (PROC_DEF_ID_);
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION (PROC_INST_ID_);
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION (SUPER_EXEC_);
alter table ACT_RU_EXECUTION add primary key (ID_);
alter table ACT_RU_EXECUTION add constraint ACT_FK_EXE_PARENT foreign key (PARENT_ID_) references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION add constraint ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_) references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_EXECUTION add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION  add constraint ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION  add check (IS_ACTIVE_ IN (1,0));
alter table ACT_RU_EXECUTION  add check (IS_CONCURRENT_ IN (1,0));
alter table ACT_RU_EXECUTION  add check (IS_SCOPE_ IN (1,0));
alter table ACT_RU_EXECUTION  add check (IS_EVENT_SCOPE_ IN (1,0));

create table ACT_RU_TASK
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  execution_id_     NVARCHAR2(64),
  proc_inst_id_     NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  name_             NVARCHAR2(255),
  parent_task_id_   NVARCHAR2(64),
  description_      NVARCHAR2(2000),
  task_def_key_     NVARCHAR2(255),
  owner_            NVARCHAR2(255),
  assignee_         NVARCHAR2(255),
  delegation_       NVARCHAR2(64),
  priority_         INTEGER,
  create_time_      TIMESTAMP(6),
  due_date_         TIMESTAMP(6),
  category_         NVARCHAR2(255),
  suspension_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  form_key_         NVARCHAR2(255)
);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK (CREATE_TIME_);
create index ACT_IDX_TASK_EXEC on ACT_RU_TASK (EXECUTION_ID_);
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK (PROC_DEF_ID_);
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK (PROC_INST_ID_);
alter table ACT_RU_TASK  add primary key (ID_);
alter table ACT_RU_TASK  add constraint ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_TASK  add constraint ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_TASK  add constraint ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)  references ACT_RU_EXECUTION (ID_);


create table ACT_RU_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64)
);
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK (GROUP_ID_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK (USER_ID_);
create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK (TASK_ID_);
alter table ACT_RU_IDENTITYLINK  add primary key (ID_);
alter table ACT_RU_IDENTITYLINK  add constraint ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_IDENTITYLINK  add constraint ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_IDENTITYLINK  add constraint ACT_FK_TSKASS_TASK foreign key (TASK_ID_)  references ACT_RU_TASK (ID_);


create table ACT_RU_JOB
(
  id_                  NVARCHAR2(64) not null,
  rev_                 INTEGER,
  type_                NVARCHAR2(255) not null,
  lock_exp_time_       TIMESTAMP(6),
  lock_owner_          NVARCHAR2(255),
  exclusive_           NUMBER(1),
  execution_id_        NVARCHAR2(64),
  process_instance_id_ NVARCHAR2(64),
  proc_def_id_         NVARCHAR2(64),
  retries_             INTEGER,
  exception_stack_id_  NVARCHAR2(64),
  exception_msg_       NVARCHAR2(2000),
  duedate_             TIMESTAMP(6),
  repeat_              NVARCHAR2(255),
  handler_type_        NVARCHAR2(255),
  handler_cfg_         NVARCHAR2(2000),
  tenant_id_           NVARCHAR2(255) default ''
);
create index ACT_IDX_JOB_EXCEPTION on ACT_RU_JOB (EXCEPTION_STACK_ID_);
alter table ACT_RU_JOB  add primary key (ID_);
alter table ACT_RU_JOB  add constraint ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_JOB  add check (EXCLUSIVE_ IN (1,0));

create table ACT_RU_VARIABLE
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  type_         NVARCHAR2(255) not null,
  name_         NVARCHAR2(255) not null,
  execution_id_ NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE (TASK_ID_);
create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE (BYTEARRAY_ID_);
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE (EXECUTION_ID_);
create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE (PROC_INST_ID_);
alter table ACT_RU_VARIABLE  add primary key (ID_);
alter table ACT_RU_VARIABLE  add constraint ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_VARIABLE  add constraint ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_VARIABLE  add constraint ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)  references ACT_RU_EXECUTION (ID_);

-- Create table
create table ACT_EVT_LOG
(
  log_nr_       NUMBER(19) not null,
  type_         NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  time_stamp_   TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  data_         BLOB,
  lock_owner_   NVARCHAR2(255),
  lock_time_    TIMESTAMP(6),
  is_processed_ NUMBER(3) default 0
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ACT_EVT_LOG  add primary key (LOG_NR_);

-- Create table
create table ACT_PROCDEF_INFO
(
  id_           NVARCHAR2(64) not null,
  proc_def_id_  NVARCHAR2(64) not null,
  rev_          INTEGER,
  info_json_id_ NVARCHAR2(64)
);
-- Create/Recreate indexes 
create index ACT_IDX_PROCDEF_INFO_JSON on ACT_PROCDEF_INFO (INFO_JSON_ID_);
create index ACT_IDX_PROCDEF_INFO_PROC on ACT_PROCDEF_INFO (PROC_DEF_ID_);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ACT_PROCDEF_INFO  add primary key (ID_);
alter table ACT_PROCDEF_INFO  add constraint ACT_UNIQ_INFO_PROCDEF unique (PROC_DEF_ID_);
