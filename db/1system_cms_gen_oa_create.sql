DROP TABLE cms_article_data CASCADE CONSTRAINTS;
DROP TABLE cms_article CASCADE CONSTRAINTS;
DROP TABLE cms_comment CASCADE CONSTRAINTS;
DROP TABLE cms_link CASCADE CONSTRAINTS;
DROP TABLE cms_category CASCADE CONSTRAINTS;
DROP TABLE cms_guestbook  CASCADE CONSTRAINTS;
DROP TABLE cms_site  CASCADE CONSTRAINTS;
DROP TABLE QRTZ_JOBSOAINFO  CASCADE CONSTRAINTS;

-- Create table
create table CMS_ARTICLE
(
  id                  VARCHAR2(64) not null,
  category_id         VARCHAR2(64) not null,
  title               VARCHAR2(255) not null,
  link                VARCHAR2(255),
  color               VARCHAR2(50),
  image               VARCHAR2(255),
  keywords            VARCHAR2(255),
  description         VARCHAR2(255),
  weight              NUMBER(10) default 0,
  weight_date         TIMESTAMP(6),
  hits                NUMBER(10) default 0,
  posid               VARCHAR2(10),
  custom_content_view VARCHAR2(255),
  view_config         CLOB,
  create_by           VARCHAR2(64),
  create_date         TIMESTAMP(6),
  update_by           VARCHAR2(64),
  update_date         TIMESTAMP(6),
  remarks             VARCHAR2(255),
  del_flag            CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 4M
    next 1M
    minextents 1
  );
-- Add comments to the table 
comment on table CMS_ARTICLE
  is '文章表';
-- Add comments to the columns 
comment on column CMS_ARTICLE.id
  is '编号';
comment on column CMS_ARTICLE.category_id
  is '栏目编号';
comment on column CMS_ARTICLE.title
  is '标题';
comment on column CMS_ARTICLE.link
  is '文章链接';
comment on column CMS_ARTICLE.color
  is '标题颜色';
comment on column CMS_ARTICLE.image
  is '文章图片';
comment on column CMS_ARTICLE.keywords
  is '关键字';
comment on column CMS_ARTICLE.description
  is '描述、摘要';
comment on column CMS_ARTICLE.weight
  is '权重，越大越靠前';
comment on column CMS_ARTICLE.weight_date
  is '权重期限';
comment on column CMS_ARTICLE.hits
  is '点击数';
comment on column CMS_ARTICLE.posid
  is '推荐位，多选';
comment on column CMS_ARTICLE.custom_content_view
  is '自定义内容视图';
comment on column CMS_ARTICLE.view_config
  is '视图配置';
comment on column CMS_ARTICLE.create_by
  is '创建者';
comment on column CMS_ARTICLE.create_date
  is '创建时间';
comment on column CMS_ARTICLE.update_by
  is '更新者';
comment on column CMS_ARTICLE.update_date
  is '更新时间';
comment on column CMS_ARTICLE.remarks
  is '备注信息';
comment on column CMS_ARTICLE.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index CMS_ARTICLE_CATEGORY_ID on CMS_ARTICLE (CATEGORY_ID)
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
create index CMS_ARTICLE_CREATE_BY on CMS_ARTICLE (CREATE_BY)
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
create index CMS_ARTICLE_DEL_FLAG on CMS_ARTICLE (DEL_FLAG)
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
create index CMS_ARTICLE_KEYWORDS on CMS_ARTICLE (KEYWORDS)
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
create index CMS_ARTICLE_TITLE on CMS_ARTICLE (TITLE)
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
create index CMS_ARTICLE_UPDATE_DATE on CMS_ARTICLE (UPDATE_DATE)
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
create index CMS_ARTICLE_WEIGHT on CMS_ARTICLE (WEIGHT)
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
alter table CMS_ARTICLE
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
create table CMS_ARTICLE_DATA
(
  id            VARCHAR2(64) not null,
  content       CLOB,
  copyfrom      VARCHAR2(255),
  relation      VARCHAR2(255),
  allow_comment CHAR(1)
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
-- Add comments to the table 
comment on table CMS_ARTICLE_DATA
  is '文章详表';
-- Add comments to the columns 
comment on column CMS_ARTICLE_DATA.id
  is '编号';
comment on column CMS_ARTICLE_DATA.content
  is '文章内容';
comment on column CMS_ARTICLE_DATA.copyfrom
  is '文章来源';
comment on column CMS_ARTICLE_DATA.relation
  is '相关文章';
comment on column CMS_ARTICLE_DATA.allow_comment
  is '是否允许评论';
-- Create/Recreate primary, unique and foreign key constraints 
alter table CMS_ARTICLE_DATA
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
create table CMS_CATEGORY
(
  id                  VARCHAR2(64) not null,
  parent_id           VARCHAR2(64) not null,
  parent_ids          VARCHAR2(2000) not null,
  site_id             VARCHAR2(64) default '1',
  office_id           VARCHAR2(64),
  module              VARCHAR2(20),
  name                VARCHAR2(100) not null,
  image               VARCHAR2(255),
  href                VARCHAR2(255),
  target              VARCHAR2(20),
  description         VARCHAR2(255),
  keywords            VARCHAR2(255),
  sort                NUMBER(10) default 30,
  in_menu             CHAR(1) default '1',
  in_list             CHAR(1) default '1',
  show_modes          CHAR(1) default '0',
  allow_comment       CHAR(1),
  is_audit            CHAR(1),
  custom_list_view    VARCHAR2(255),
  custom_content_view VARCHAR2(255),
  view_config         CLOB,
  create_by           VARCHAR2(64),
  create_date         TIMESTAMP(6),
  update_by           VARCHAR2(64),
  update_date         TIMESTAMP(6),
  remarks             VARCHAR2(255),
  del_flag            CHAR(1) default '0' not null
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
-- Add comments to the table 
comment on table CMS_CATEGORY
  is '栏目表';
-- Add comments to the columns 
comment on column CMS_CATEGORY.id
  is '编号';
comment on column CMS_CATEGORY.parent_id
  is '父级编号';
comment on column CMS_CATEGORY.parent_ids
  is '所有父级编号';
comment on column CMS_CATEGORY.site_id
  is '站点编号';
comment on column CMS_CATEGORY.office_id
  is '归属机构';
comment on column CMS_CATEGORY.module
  is '栏目模块';
comment on column CMS_CATEGORY.name
  is '栏目名称';
comment on column CMS_CATEGORY.image
  is '栏目图片';
comment on column CMS_CATEGORY.href
  is '链接';
comment on column CMS_CATEGORY.target
  is '目标';
comment on column CMS_CATEGORY.description
  is '描述';
comment on column CMS_CATEGORY.keywords
  is '关键字';
comment on column CMS_CATEGORY.sort
  is '排序（升序）';
comment on column CMS_CATEGORY.in_menu
  is '是否在导航中显示';
comment on column CMS_CATEGORY.in_list
  is '是否在分类页中显示列表';
comment on column CMS_CATEGORY.show_modes
  is '展现方式';
comment on column CMS_CATEGORY.allow_comment
  is '是否允许评论';
comment on column CMS_CATEGORY.is_audit
  is '是否需要审核';
comment on column CMS_CATEGORY.custom_list_view
  is '自定义列表视图';
comment on column CMS_CATEGORY.custom_content_view
  is '自定义内容视图';
comment on column CMS_CATEGORY.view_config
  is '视图配置';
comment on column CMS_CATEGORY.create_by
  is '创建者';
comment on column CMS_CATEGORY.create_date
  is '创建时间';
comment on column CMS_CATEGORY.update_by
  is '更新者';
comment on column CMS_CATEGORY.update_date
  is '更新时间';
comment on column CMS_CATEGORY.remarks
  is '备注信息';
comment on column CMS_CATEGORY.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index CMS_CATEGORY_DEL_FLAG on CMS_CATEGORY (DEL_FLAG)
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
create index CMS_CATEGORY_MODULE on CMS_CATEGORY (MODULE)
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
create index CMS_CATEGORY_NAME on CMS_CATEGORY (NAME)
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
create index CMS_CATEGORY_OFFICE_ID on CMS_CATEGORY (OFFICE_ID)
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
create index CMS_CATEGORY_PARENT_ID on CMS_CATEGORY (PARENT_ID)
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
create index CMS_CATEGORY_PARENT_IDS on CMS_CATEGORY (PARENT_IDS)
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
create index CMS_CATEGORY_SITE_ID on CMS_CATEGORY (SITE_ID)
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
create index CMS_CATEGORY_SORT on CMS_CATEGORY (SORT)
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
alter table CMS_CATEGORY
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
create table CMS_COMMENT
(
  id            VARCHAR2(64) not null,
  category_id   VARCHAR2(64) not null,
  content_id    VARCHAR2(64) not null,
  title         VARCHAR2(255),
  content       VARCHAR2(255),
  name          VARCHAR2(100),
  ip            VARCHAR2(100),
  create_date   TIMESTAMP(6) not null,
  audit_user_id VARCHAR2(64),
  audit_date    TIMESTAMP(6),
  del_flag      CHAR(1) default '0' not null
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
-- Add comments to the table 
comment on table CMS_COMMENT
  is '评论表';
-- Add comments to the columns 
comment on column CMS_COMMENT.id
  is '编号';
comment on column CMS_COMMENT.category_id
  is '栏目编号';
comment on column CMS_COMMENT.content_id
  is '栏目内容的编号';
comment on column CMS_COMMENT.title
  is '栏目内容的标题';
comment on column CMS_COMMENT.content
  is '评论内容';
comment on column CMS_COMMENT.name
  is '评论姓名';
comment on column CMS_COMMENT.ip
  is '评论IP';
comment on column CMS_COMMENT.create_date
  is '评论时间';
comment on column CMS_COMMENT.audit_user_id
  is '审核人';
comment on column CMS_COMMENT.audit_date
  is '审核时间';
comment on column CMS_COMMENT.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index CMS_COMMENT_CATEGORY_ID on CMS_COMMENT (CATEGORY_ID)
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
create index CMS_COMMENT_CONTENT_ID on CMS_COMMENT (CONTENT_ID)
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
create index CMS_COMMENT_STATUS on CMS_COMMENT (DEL_FLAG)
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
alter table CMS_COMMENT
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
create table CMS_GUESTBOOK
(
  id          VARCHAR2(64) not null,
  type        CHAR(1) not null,
  content     VARCHAR2(255) not null,
  name        VARCHAR2(100) not null,
  email       VARCHAR2(100) not null,
  phone       VARCHAR2(100) not null,
  workunit    VARCHAR2(100) not null,
  ip          VARCHAR2(100) not null,
  create_date TIMESTAMP(6) not null,
  re_user_id  VARCHAR2(64),
  re_date     TIMESTAMP(6),
  re_content  VARCHAR2(100),
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
-- Add comments to the table 
comment on table CMS_GUESTBOOK
  is '留言板';
-- Add comments to the columns 
comment on column CMS_GUESTBOOK.id
  is '编号';
comment on column CMS_GUESTBOOK.type
  is '留言分类';
comment on column CMS_GUESTBOOK.content
  is '留言内容';
comment on column CMS_GUESTBOOK.name
  is '姓名';
comment on column CMS_GUESTBOOK.email
  is '邮箱';
comment on column CMS_GUESTBOOK.phone
  is '电话';
comment on column CMS_GUESTBOOK.workunit
  is '单位';
comment on column CMS_GUESTBOOK.ip
  is 'IP';
comment on column CMS_GUESTBOOK.create_date
  is '留言时间';
comment on column CMS_GUESTBOOK.re_user_id
  is '回复人';
comment on column CMS_GUESTBOOK.re_date
  is '回复时间';
comment on column CMS_GUESTBOOK.re_content
  is '回复内容';
comment on column CMS_GUESTBOOK.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index CMS_GUESTBOOK_DEL_FLAG on CMS_GUESTBOOK (DEL_FLAG)
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
alter table CMS_GUESTBOOK
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
create table CMS_LINK
(
  id          VARCHAR2(64) not null,
  category_id VARCHAR2(64) not null,
  title       VARCHAR2(255) not null,
  color       VARCHAR2(50),
  image       VARCHAR2(255),
  href        VARCHAR2(255),
  weight      NUMBER(10) default 0,
  weight_date TIMESTAMP(6),
  create_by   VARCHAR2(64),
  create_date TIMESTAMP(6),
  update_by   VARCHAR2(64),
  update_date TIMESTAMP(6),
  remarks     VARCHAR2(255),
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
-- Add comments to the table 
comment on table CMS_LINK
  is '友情链接';
-- Add comments to the columns 
comment on column CMS_LINK.id
  is '编号';
comment on column CMS_LINK.category_id
  is '栏目编号';
comment on column CMS_LINK.title
  is '链接名称';
comment on column CMS_LINK.color
  is '标题颜色';
comment on column CMS_LINK.image
  is '链接图片';
comment on column CMS_LINK.href
  is '链接地址';
comment on column CMS_LINK.weight
  is '权重，越大越靠前';
comment on column CMS_LINK.weight_date
  is '权重期限';
comment on column CMS_LINK.create_by
  is '创建者';
comment on column CMS_LINK.create_date
  is '创建时间';
comment on column CMS_LINK.update_by
  is '更新者';
comment on column CMS_LINK.update_date
  is '更新时间';
comment on column CMS_LINK.remarks
  is '备注信息';
comment on column CMS_LINK.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index CMS_LINK_CATEGORY_ID on CMS_LINK (CATEGORY_ID)
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
create index CMS_LINK_CREATE_BY on CMS_LINK (CREATE_BY)
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
create index CMS_LINK_DEL_FLAG on CMS_LINK (DEL_FLAG)
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
create index CMS_LINK_TITLE on CMS_LINK (TITLE)
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
create index CMS_LINK_UPDATE_DATE on CMS_LINK (UPDATE_DATE)
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
create index CMS_LINK_WEIGHT on CMS_LINK (WEIGHT)
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
alter table CMS_LINK
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
create table CMS_SITE
(
  id                VARCHAR2(64) not null,
  name              VARCHAR2(100) not null,
  title             VARCHAR2(100) not null,
  logo              VARCHAR2(255),
  domain            VARCHAR2(255),
  description       VARCHAR2(255),
  keywords          VARCHAR2(255),
  theme             VARCHAR2(255) default 'default',
  copyright         CLOB,
  custom_index_view VARCHAR2(255),
  create_by         VARCHAR2(64),
  create_date       TIMESTAMP(6),
  update_by         VARCHAR2(64),
  update_date       TIMESTAMP(6),
  remarks           VARCHAR2(255),
  del_flag          CHAR(1) default '0' not null
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
-- Add comments to the table 
comment on table CMS_SITE
  is '站点表';
-- Add comments to the columns 
comment on column CMS_SITE.id
  is '编号';
comment on column CMS_SITE.name
  is '站点名称';
comment on column CMS_SITE.title
  is '站点标题';
comment on column CMS_SITE.logo
  is '站点Logo';
comment on column CMS_SITE.domain
  is '站点域名';
comment on column CMS_SITE.description
  is '描述';
comment on column CMS_SITE.keywords
  is '关键字';
comment on column CMS_SITE.theme
  is '主题';
comment on column CMS_SITE.copyright
  is '版权信息';
comment on column CMS_SITE.custom_index_view
  is '自定义站点首页视图';
comment on column CMS_SITE.create_by
  is '创建者';
comment on column CMS_SITE.create_date
  is '创建时间';
comment on column CMS_SITE.update_by
  is '更新者';
comment on column CMS_SITE.update_date
  is '更新时间';
comment on column CMS_SITE.remarks
  is '备注信息';
comment on column CMS_SITE.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index CMS_SITE_DEL_FLAG on CMS_SITE (DEL_FLAG)
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
alter table CMS_SITE
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



DROP TABLE gen_scheme  CASCADE CONSTRAINTS;
DROP TABLE gen_table_column  CASCADE CONSTRAINTS;
DROP TABLE gen_table  CASCADE CONSTRAINTS;
DROP TABLE gen_template  CASCADE CONSTRAINTS;

-- Create table
create table GEN_SCHEME
(
  id                   VARCHAR2(64) not null,
  name                 NVARCHAR2(200),
  category             VARCHAR2(2000),
  package_name         VARCHAR2(500),
  module_name          VARCHAR2(30),
  sub_module_name      VARCHAR2(30),
  function_name        NVARCHAR2(500),
  function_name_simple NVARCHAR2(100),
  function_author      NVARCHAR2(100),
  gen_table_id         VARCHAR2(200),
  create_by            VARCHAR2(64),
  create_date          TIMESTAMP(6),
  update_by            VARCHAR2(64),
  update_date          TIMESTAMP(6),
  remarks              NVARCHAR2(255),
  del_flag             CHAR(1) default '0' not null
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
-- Add comments to the table 
comment on table GEN_SCHEME
  is '生成方案';
-- Add comments to the columns 
comment on column GEN_SCHEME.id
  is '编号';
comment on column GEN_SCHEME.name
  is '名称';
comment on column GEN_SCHEME.category
  is '分类';
comment on column GEN_SCHEME.package_name
  is '生成包路径';
comment on column GEN_SCHEME.module_name
  is '生成模块名';
comment on column GEN_SCHEME.sub_module_name
  is '生成子模块名';
comment on column GEN_SCHEME.function_name
  is '生成功能名';
comment on column GEN_SCHEME.function_name_simple
  is '生成功能名（简写）';
comment on column GEN_SCHEME.function_author
  is '生成功能作者';
comment on column GEN_SCHEME.gen_table_id
  is '生成表编号';
comment on column GEN_SCHEME.create_by
  is '创建者';
comment on column GEN_SCHEME.create_date
  is '创建时间';
comment on column GEN_SCHEME.update_by
  is '更新者';
comment on column GEN_SCHEME.update_date
  is '更新时间';
comment on column GEN_SCHEME.remarks
  is '备注信息';
comment on column GEN_SCHEME.del_flag
  is '删除标记（0：正常；1：删除）';
-- Create/Recreate indexes 
create index GEN_SCHEME_DEL_FLAG on GEN_SCHEME (DEL_FLAG)
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
alter table GEN_SCHEME
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
create table GEN_TABLE
(
  id              VARCHAR2(64) not null,
  name            NVARCHAR2(200),
  comments        NVARCHAR2(500),
  class_name      VARCHAR2(100),
  parent_table    VARCHAR2(200),
  parent_table_fk VARCHAR2(100),
  create_by       VARCHAR2(64),
  create_date     TIMESTAMP(6),
  update_by       VARCHAR2(64),
  update_date     TIMESTAMP(6),
  remarks         NVARCHAR2(255),
  del_flag        CHAR(1) default '0' not null
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
-- Add comments to the table 
comment on table GEN_TABLE
  is '业务表';
-- Add comments to the columns 
comment on column GEN_TABLE.id
  is '编号';
comment on column GEN_TABLE.name
  is '名称';
comment on column GEN_TABLE.comments
  is '描述';
comment on column GEN_TABLE.class_name
  is '实体类名称';
comment on column GEN_TABLE.parent_table
  is '关联父表';
comment on column GEN_TABLE.parent_table_fk
  is '关联父表外键';
comment on column GEN_TABLE.create_by
  is '创建者';
comment on column GEN_TABLE.create_date
  is '创建时间';
comment on column GEN_TABLE.update_by
  is '更新者';
comment on column GEN_TABLE.update_date
  is '更新时间';
comment on column GEN_TABLE.remarks
  is '备注信息';
comment on column GEN_TABLE.del_flag
  is '删除标记（0：正常；1：删除）';
-- Create/Recreate indexes 
create index GEN_TABLE_DEL_FLAG on GEN_TABLE (DEL_FLAG)
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
create index GEN_TABLE_NAME on GEN_TABLE (NAME)
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
alter table GEN_TABLE
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
create table GEN_TABLE_COLUMN
(
  id           VARCHAR2(64) not null,
  gen_table_id VARCHAR2(64),
  name         NVARCHAR2(200),
  comments     NVARCHAR2(500),
  jdbc_type    VARCHAR2(100),
  java_type    VARCHAR2(500),
  java_field   VARCHAR2(200),
  is_pk        CHAR(1),
  is_null      CHAR(1),
  is_insert    CHAR(1),
  is_edit      CHAR(1),
  is_list      CHAR(1),
  is_query     CHAR(1),
  query_type   VARCHAR2(200),
  show_type    VARCHAR2(200),
  dict_type    VARCHAR2(200),
  settings     NVARCHAR2(2000),
  sort         NUMBER,
  create_by    VARCHAR2(64),
  create_date  TIMESTAMP(6),
  update_by    VARCHAR2(64),
  update_date  TIMESTAMP(6),
  remarks      NVARCHAR2(255),
  del_flag     CHAR(1) default '0' not null
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 5M
    next 1M
    minextents 1
  );
-- Add comments to the table 
comment on table GEN_TABLE_COLUMN
  is '业务表字段';
-- Add comments to the columns 
comment on column GEN_TABLE_COLUMN.id
  is '编号';
comment on column GEN_TABLE_COLUMN.gen_table_id
  is '归属表编号';
comment on column GEN_TABLE_COLUMN.name
  is '名称';
comment on column GEN_TABLE_COLUMN.comments
  is '描述';
comment on column GEN_TABLE_COLUMN.jdbc_type
  is '列的数据类型的字节长度';
comment on column GEN_TABLE_COLUMN.java_type
  is 'JAVA类型';
comment on column GEN_TABLE_COLUMN.java_field
  is 'JAVA字段名';
comment on column GEN_TABLE_COLUMN.is_pk
  is '是否主键';
comment on column GEN_TABLE_COLUMN.is_null
  is '是否可为空';
comment on column GEN_TABLE_COLUMN.is_insert
  is '是否为插入字段';
comment on column GEN_TABLE_COLUMN.is_edit
  is '是否编辑字段';
comment on column GEN_TABLE_COLUMN.is_list
  is '是否列表字段';
comment on column GEN_TABLE_COLUMN.is_query
  is '是否查询字段';
comment on column GEN_TABLE_COLUMN.query_type
  is '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）';
comment on column GEN_TABLE_COLUMN.show_type
  is '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）';
comment on column GEN_TABLE_COLUMN.dict_type
  is '字典类型';
comment on column GEN_TABLE_COLUMN.settings
  is '其它设置（扩展字段JSON）';
comment on column GEN_TABLE_COLUMN.sort
  is '排序（升序）';
comment on column GEN_TABLE_COLUMN.create_by
  is '创建者';
comment on column GEN_TABLE_COLUMN.create_date
  is '创建时间';
comment on column GEN_TABLE_COLUMN.update_by
  is '更新者';
comment on column GEN_TABLE_COLUMN.update_date
  is '更新时间';
comment on column GEN_TABLE_COLUMN.remarks
  is '备注信息';
comment on column GEN_TABLE_COLUMN.del_flag
  is '删除标记（0：正常；1：删除）';
-- Create/Recreate indexes 
create index GEN_TABLE_COLUMN_DEL_FLAG on GEN_TABLE_COLUMN (DEL_FLAG)
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
create index GEN_TABLE_COLUMN_NAME on GEN_TABLE_COLUMN (NAME)
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
create index GEN_TABLE_COLUMN_SORT on GEN_TABLE_COLUMN (SORT)
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
create index GEN_TABLE_COLUMN_TABLE_ID on GEN_TABLE_COLUMN (GEN_TABLE_ID)
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
alter table GEN_TABLE_COLUMN
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
create table GEN_TEMPLATE
(
  id          VARCHAR2(64) not null,
  name        NVARCHAR2(200),
  category    VARCHAR2(2000),
  file_path   VARCHAR2(500),
  file_name   VARCHAR2(200),
  content     CLOB,
  create_by   VARCHAR2(64),
  create_date TIMESTAMP(6),
  update_by   VARCHAR2(64),
  update_date TIMESTAMP(6),
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
-- Add comments to the table 
comment on table GEN_TEMPLATE
  is '代码模板表';
-- Add comments to the columns 
comment on column GEN_TEMPLATE.id
  is '编号';
comment on column GEN_TEMPLATE.name
  is '名称';
comment on column GEN_TEMPLATE.category
  is '分类';
comment on column GEN_TEMPLATE.file_path
  is '生成文件路径';
comment on column GEN_TEMPLATE.file_name
  is '生成文件名';
comment on column GEN_TEMPLATE.content
  is '内容';
comment on column GEN_TEMPLATE.create_by
  is '创建者';
comment on column GEN_TEMPLATE.create_date
  is '创建时间';
comment on column GEN_TEMPLATE.update_by
  is '更新者';
comment on column GEN_TEMPLATE.update_date
  is '更新时间';
comment on column GEN_TEMPLATE.remarks
  is '备注信息';
comment on column GEN_TEMPLATE.del_flag
  is '删除标记（0：正常；1：删除）';
-- Create/Recreate indexes 
create index GEN_TEMPLATE_DEL_FALG on GEN_TEMPLATE (DEL_FLAG)
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
alter table GEN_TEMPLATE
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
  
  
  
 DROP TABLE oa_leave CASCADE CONSTRAINTS;
DROP TABLE oa_notify_record CASCADE CONSTRAINTS;
DROP TABLE oa_notify CASCADE CONSTRAINTS;
DROP TABLE OA_TEST_AUDIT CASCADE CONSTRAINTS;


-- Create table
create table OA_LEAVE
(
  id                  VARCHAR2(64) not null,
  process_instance_id VARCHAR2(64),
  start_time          TIMESTAMP(6),
  end_time            TIMESTAMP(6),
  leave_type          VARCHAR2(20),
  reason              NVARCHAR2(255),
  apply_time          TIMESTAMP(6),
  reality_start_time  TIMESTAMP(6),
  reality_end_time    TIMESTAMP(6),
  create_by           VARCHAR2(64) not null,
  create_date         TIMESTAMP(6) not null,
  update_by           VARCHAR2(64) not null,
  update_date         TIMESTAMP(6) not null,
  remarks             NVARCHAR2(255),
  del_flag            CHAR(1) default '0' not null
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
-- Add comments to the table 
comment on table OA_LEAVE
  is '请假流程表';
-- Add comments to the columns 
comment on column OA_LEAVE.id
  is '编号';
comment on column OA_LEAVE.process_instance_id
  is '流程实例编号';
comment on column OA_LEAVE.start_time
  is '开始时间';
comment on column OA_LEAVE.end_time
  is '结束时间';
comment on column OA_LEAVE.leave_type
  is '请假类型';
comment on column OA_LEAVE.reason
  is '请假理由';
comment on column OA_LEAVE.apply_time
  is '申请时间';
comment on column OA_LEAVE.reality_start_time
  is '实际开始时间';
comment on column OA_LEAVE.reality_end_time
  is '实际结束时间';
comment on column OA_LEAVE.create_by
  is '创建者';
comment on column OA_LEAVE.create_date
  is '创建时间';
comment on column OA_LEAVE.update_by
  is '更新者';
comment on column OA_LEAVE.update_date
  is '更新时间';
comment on column OA_LEAVE.remarks
  is '备注信息';
comment on column OA_LEAVE.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index OA_LEAVE_CREATE_BY on OA_LEAVE (CREATE_BY)
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
create index OA_LEAVE_DEL_FLAG on OA_LEAVE (DEL_FLAG)
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
create index OA_LEAVE_PROCESS_INSTANCE_ID on OA_LEAVE (PROCESS_INSTANCE_ID)
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
alter table OA_LEAVE
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
create table OA_NOTIFY
(
  id          VARCHAR2(64) not null,
  type        CHAR(1),
  title       NVARCHAR2(200),
  content     NVARCHAR2(2000),
  files       NVARCHAR2(2000),
  status      CHAR(1),
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
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table OA_NOTIFY
  is '通知通告';
-- Add comments to the columns 
comment on column OA_NOTIFY.id
  is '编号';
comment on column OA_NOTIFY.type
  is '类型';
comment on column OA_NOTIFY.title
  is '标题';
comment on column OA_NOTIFY.content
  is '内容';
comment on column OA_NOTIFY.files
  is '附件';
comment on column OA_NOTIFY.status
  is '状态';
comment on column OA_NOTIFY.create_by
  is '创建者';
comment on column OA_NOTIFY.create_date
  is '创建时间';
comment on column OA_NOTIFY.update_by
  is '更新者';
comment on column OA_NOTIFY.update_date
  is '更新时间';
comment on column OA_NOTIFY.remarks
  is '备注信息';
comment on column OA_NOTIFY.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index OA_NOTIFY_DEL_FLAG on OA_NOTIFY (DEL_FLAG)
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
alter table OA_NOTIFY
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
create table OA_NOTIFY_RECORD
(
  id           VARCHAR2(64) not null,
  oa_notify_id VARCHAR2(64),
  user_id      VARCHAR2(64),
  read_flag    CHAR(1) default '0',
  read_date    DATE
)
tablespace WEBDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table OA_NOTIFY_RECORD
  is '通知通告发送记录';
-- Add comments to the columns 
comment on column OA_NOTIFY_RECORD.id
  is '编号';
comment on column OA_NOTIFY_RECORD.oa_notify_id
  is '通知通告ID';
comment on column OA_NOTIFY_RECORD.user_id
  is '接受人';
comment on column OA_NOTIFY_RECORD.read_flag
  is '阅读标记';
comment on column OA_NOTIFY_RECORD.read_date
  is '阅读时间';
-- Create/Recreate indexes 
create index OA_NOTIFY_RECORD_NOTIFY_ID on OA_NOTIFY_RECORD (OA_NOTIFY_ID)
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
create index OA_NOTIFY_RECORD_READ_FLAG on OA_NOTIFY_RECORD (READ_FLAG)
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
create index OA_NOTIFY_RECORD_USER_ID on OA_NOTIFY_RECORD (USER_ID)
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
alter table OA_NOTIFY_RECORD
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
create table OA_TEST_AUDIT
(
  id             VARCHAR2(64) not null,
  proc_ins_id    VARCHAR2(64),
  user_id        VARCHAR2(64),
  office_id      VARCHAR2(64),
  post           NVARCHAR2(255),
  age            CHAR(1),
  edu            NVARCHAR2(255),
  content        NVARCHAR2(255),
  olda           VARCHAR2(255),
  oldb           VARCHAR2(255),
  oldc           VARCHAR2(255),
  newa           VARCHAR2(255),
  newb           VARCHAR2(255),
  newc           VARCHAR2(255),
  add_num        VARCHAR2(255),
  exe_date       VARCHAR2(255),
  hr_text        NVARCHAR2(255),
  lead_text      NVARCHAR2(255),
  main_lead_text NVARCHAR2(255),
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
    initial 2M
    next 8K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table OA_TEST_AUDIT
  is '审批流程测试表';
-- Add comments to the columns 
comment on column OA_TEST_AUDIT.id
  is '编号';
comment on column OA_TEST_AUDIT.proc_ins_id
  is '流程实例ID';
comment on column OA_TEST_AUDIT.user_id
  is '变动用户';
comment on column OA_TEST_AUDIT.office_id
  is '归属部门';
comment on column OA_TEST_AUDIT.post
  is '岗位';
comment on column OA_TEST_AUDIT.age
  is '性别';
comment on column OA_TEST_AUDIT.edu
  is '学历';
comment on column OA_TEST_AUDIT.content
  is '调整原因';
comment on column OA_TEST_AUDIT.olda
  is '现行标准 薪酬档级';
comment on column OA_TEST_AUDIT.oldb
  is '现行标准 月工资额';
comment on column OA_TEST_AUDIT.oldc
  is '现行标准 年薪总额';
comment on column OA_TEST_AUDIT.newa
  is '调整后标准 薪酬档级';
comment on column OA_TEST_AUDIT.newb
  is '调整后标准 月工资额';
comment on column OA_TEST_AUDIT.newc
  is '调整后标准 年薪总额';
comment on column OA_TEST_AUDIT.add_num
  is '月增资';
comment on column OA_TEST_AUDIT.exe_date
  is '执行时间';
comment on column OA_TEST_AUDIT.hr_text
  is '人力资源部门意见';
comment on column OA_TEST_AUDIT.lead_text
  is '分管领导意见';
comment on column OA_TEST_AUDIT.main_lead_text
  is '集团主要领导意见';
comment on column OA_TEST_AUDIT.create_by
  is '创建者';
comment on column OA_TEST_AUDIT.create_date
  is '创建时间';
comment on column OA_TEST_AUDIT.update_by
  is '更新者';
comment on column OA_TEST_AUDIT.update_date
  is '更新时间';
comment on column OA_TEST_AUDIT.remarks
  is '备注信息';
comment on column OA_TEST_AUDIT.del_flag
  is '删除标记';
-- Create/Recreate indexes 
create index OA_TEST_AUDIT_DEL_FLAG on OA_TEST_AUDIT (DEL_FLAG)
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
alter table OA_TEST_AUDIT
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
create table QRTZ_JOBSOAINFO
(
  corporationid VARCHAR2(10) not null,
  end_time      VARCHAR2(14) not null
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
alter table QRTZ_JOBSOAINFO
  add constraint PK_QRTZ_JOBSOAINFO primary key (CORPORATIONID, END_TIME)
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

  