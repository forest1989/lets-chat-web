
--删除表
DROP TABLE MALL_ORDER CASCADE CONSTRAINTS;
DROP TABLE MALL_ORDER_INFO CASCADE CONSTRAINTS;
DROP TABLE MALL_PRODUCT_INFO CASCADE CONSTRAINTS;
DROP TABLE MALL_SHOPCAR CASCADE CONSTRAINTS;
DROP TABLE HOT_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE OPERATION_MONEY_LOG CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_SPECIFICATIONS CASCADE CONSTRAINTS;
DROP TABLE SHOPPING_ADDRESS CASCADE CONSTRAINTS;

------创建表
create table MALL_ORDER
(
  id                     VARCHAR2(64) not null,
  order_no               VARCHAR2(200) not null,
  user_id                VARCHAR2(64) not null,
  order_status           CHAR(2) not null,
  product_amount_total   NUMBER(38,2) not null,
  order_amount_total     NUMBER(38,2) not null,
  logistics_fee          NUMBER(38,2),
  address_id             VARCHAR2(64) not null,
  logistics_company_name VARCHAR2(200),
  orderlogistics_id      VARCHAR2(200),
  pay_channel            VARCHAR2(64) not null,
  pay_time               TIMESTAMP(6),
  escrow_trade_no        VARCHAR2(200),
  create_date            TIMESTAMP(6) not null,
  remarks                NVARCHAR2(255),
  consign                TIMESTAMP(6),
  columns1               VARCHAR2(200),
  columns2               VARCHAR2(200),
  update_date            TIMESTAMP(6) not null,
  del_flag               CHAR(1) default 0 not null
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
comment on table MALL_ORDER
  is '订单信息';
comment on column MALL_ORDER.id
  is '订单ID
';
comment on column MALL_ORDER.order_no
  is '订单编号
';
comment on column MALL_ORDER.user_id
  is '用户ID（APP_USER表主键ID）
';
comment on column MALL_ORDER.order_status
  is '1-未付款,2-已付款,3-已发货,4-已签收,5-退货申请,6-退货中,7-已退货,8-取消交易(订单状态用系统字典表进行管理)
';
comment on column MALL_ORDER.product_amount_total
  is '商品总价
';
comment on column MALL_ORDER.order_amount_total
  is '订单金额（实际付款金额）
';
comment on column MALL_ORDER.logistics_fee
  is '运费金额
';
comment on column MALL_ORDER.address_id
  is '收货地址编号
';
comment on column MALL_ORDER.logistics_company_name
  is '物流公司名称
';
comment on column MALL_ORDER.orderlogistics_id
  is '订单物流编号
';
comment on column MALL_ORDER.pay_channel
  is '订单支付渠道
';
comment on column MALL_ORDER.pay_time
  is '付款时间
';
comment on column MALL_ORDER.escrow_trade_no
  is '第三方支付流水号
';
comment on column MALL_ORDER.create_date
  is '创建时间(下单时间)
';
comment on column MALL_ORDER.remarks
  is '客户备注
';
comment on column MALL_ORDER.consign
  is '发货时间
';
comment on column MALL_ORDER.columns1
  is '是否开票（预留字段）
';
comment on column MALL_ORDER.columns2
  is '发票编号（预留字段）
';
comment on column MALL_ORDER.update_date
  is '更新时间
';
comment on column MALL_ORDER.del_flag
  is '删除标记（0：正常  1：已删除）
';
alter table MALL_ORDER
  add constraint PK_MALL_ORDER primary key (ID)
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
alter table MALL_ORDER
  add constraint AK_UQ_ORDER_NO_MALL_ORD unique (ORDER_NO)
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

prompt Creating MALL_ORDER_INFO...
create table MALL_ORDER_INFO
(
  id              VARCHAR2(64) not null,
  order_id        VARCHAR2(64) not null,
  product_id      VARCHAR2(64) not null,
  product_count   NUMBER not null,
  del_flag        VARCHAR2(8) default 0 not null,
  spec_name       VARCHAR2(256) not null,
  product_price   NUMBER(38,2) not null,
  product_spec_id VARCHAR2(64) default '' not null
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
comment on table MALL_ORDER_INFO
  is '订单详情信息';
comment on column MALL_ORDER_INFO.id
  is '订单详情信息ID
';
comment on column MALL_ORDER_INFO.order_id
  is '订单ID(MALL_ORDER主键ID)
';
comment on column MALL_ORDER_INFO.product_id
  is '商品ID
';
comment on column MALL_ORDER_INFO.product_count
  is '购买数量
';
comment on column MALL_ORDER_INFO.del_flag
  is '是否删除';
comment on column MALL_ORDER_INFO.spec_name
  is '商品规格名称';
comment on column MALL_ORDER_INFO.product_price
  is '商品价格';
comment on column MALL_ORDER_INFO.product_spec_id
  is '规格id';
alter table MALL_ORDER_INFO
  add constraint PK_MALL_ORDER_INFO primary key (ID)
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

prompt Creating MALL_PRODUCT_INFO...
create table MALL_PRODUCT_INFO
(
  id                 VARCHAR2(64) not null,
  product_no         VARCHAR2(100) not null,
  product_name       VARCHAR2(200) not null,
  product_ico1       VARCHAR2(1000),
  product_ico2       VARCHAR2(1000),
  product_ico3       VARCHAR2(1000),
  product_ico4       VARCHAR2(1000),
  product_ico5       VARCHAR2(1000),
  product_ico6       VARCHAR2(1000),
  product_img1       VARCHAR2(1000),
  product_img2       VARCHAR2(1000),
  product_img3       VARCHAR2(1000),
  specification_id   VARCHAR2(200),
  product_type_id    VARCHAR2(100),
  stock_num          NUMBER,
  stauts             CHAR(1) not null,
  del_flag           CHAR(1) default 0 not null,
  create_by          VARCHAR2(64) not null,
  create_date        TIMESTAMP(6) not null,
  update_date        TIMESTAMP(6),
  update_by          VARCHAR2(64) not null,
  remarks            NVARCHAR2(255),
  product_detail_img VARCHAR2(1000)
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
comment on table MALL_PRODUCT_INFO
  is '商品信息';
comment on column MALL_PRODUCT_INFO.id
  is '商品ID
';
comment on column MALL_PRODUCT_INFO.product_no
  is '商品编号
';
comment on column MALL_PRODUCT_INFO.product_name
  is '商品名称
';
comment on column MALL_PRODUCT_INFO.product_ico1
  is '商品图标1
';
comment on column MALL_PRODUCT_INFO.product_ico2
  is '商品图标2
';
comment on column MALL_PRODUCT_INFO.product_ico3
  is '商品图标3
';
comment on column MALL_PRODUCT_INFO.product_ico4
  is '商品图标4';
comment on column MALL_PRODUCT_INFO.product_ico5
  is '商品图标5
';
comment on column MALL_PRODUCT_INFO.product_ico6
  is '商品图标6
';
comment on column MALL_PRODUCT_INFO.product_img1
  is '商品图片1
';
comment on column MALL_PRODUCT_INFO.product_img2
  is '商品图片2
';
comment on column MALL_PRODUCT_INFO.product_img3
  is '商品图片3';
comment on column MALL_PRODUCT_INFO.specification_id
  is '商品规格ID(多个规格以逗号隔开方式存储)
';
comment on column MALL_PRODUCT_INFO.product_type_id
  is '商品类别ID（商品类别使用系统已有的字典管理模块）
';
comment on column MALL_PRODUCT_INFO.stock_num
  is '库存数量
';
comment on column MALL_PRODUCT_INFO.stauts
  is '商品状态（1：未上架  2：上架  3：已下架 ）
';
comment on column MALL_PRODUCT_INFO.del_flag
  is '删除标记（0：正常  1：已删除）
';
comment on column MALL_PRODUCT_INFO.create_by
  is '创建者
';
comment on column MALL_PRODUCT_INFO.create_date
  is '创建时间
';
comment on column MALL_PRODUCT_INFO.update_date
  is '更新时间
';
comment on column MALL_PRODUCT_INFO.update_by
  is '更新人
';
comment on column MALL_PRODUCT_INFO.remarks
  is '备注信息
';
comment on column MALL_PRODUCT_INFO.product_detail_img
  is '商品描述图片';
alter table MALL_PRODUCT_INFO
  add constraint PK_MALL_PRODUCT_INFO primary key (ID)
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
alter table MALL_PRODUCT_INFO
  add constraint AK_UQ_PRODUCT_NO_MALL_PRO unique (PRODUCT_NO)
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

prompt Creating MALL_SHOPCAR...
create table MALL_SHOPCAR
(
  id              VARCHAR2(64) not null,
  user_id         VARCHAR2(64) not null,
  product_id      VARCHAR2(64) not null,
  product_count   NUMBER not null,
  create_date     TIMESTAMP(6) not null,
  update_date     TIMESTAMP(6) not null,
  del_flag        CHAR(1) default 0 not null,
  product_spec_id VARCHAR2(64) not null
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
comment on table MALL_SHOPCAR
  is '商城购物车';
comment on column MALL_SHOPCAR.id
  is '购物车ID
';
comment on column MALL_SHOPCAR.user_id
  is '用户ID（APP_USER表主键ID）
';
comment on column MALL_SHOPCAR.product_id
  is '商品ID(MALL_PRODUCT_INFO表主键ID)
';
comment on column MALL_SHOPCAR.product_count
  is '购买数量
';
comment on column MALL_SHOPCAR.create_date
  is '创建时间
';
comment on column MALL_SHOPCAR.update_date
  is '更新时间
';
comment on column MALL_SHOPCAR.del_flag
  is '删除标记（0：正常  1：已删除）
';
comment on column MALL_SHOPCAR.product_spec_id
  is '规格id';
alter table MALL_SHOPCAR
  add constraint PK_MALL_SHOPCAR primary key (ID)
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
create table HOT_PRODUCT
(
  id          VARCHAR2(64) not null,
  product_id  VARCHAR2(64) not null,
  start_time  TIMESTAMP(6) not null,
  edn_time    TIMESTAMP(6) not null,
  sort        NUMBER(10) not null,
  create_by   VARCHAR2(64) not null,
  create_date TIMESTAMP(6) not null,
  update_date TIMESTAMP(6) not null,
  update_by   VARCHAR2(64) not null,
  del_flag    CHAR(1) default 0 not null
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
comment on table HOT_PRODUCT
  is '热门优选商品';
comment on column HOT_PRODUCT.id
  is 'ID
';
comment on column HOT_PRODUCT.product_id
  is '商品ID
';
comment on column HOT_PRODUCT.start_time
  is '生效时间
失效时间
';
comment on column HOT_PRODUCT.edn_time
  is '失效时间
';
comment on column HOT_PRODUCT.sort
  is '排列次序
';
comment on column HOT_PRODUCT.create_by
  is '创建者';
comment on column HOT_PRODUCT.create_date
  is '创建时间';
comment on column HOT_PRODUCT.update_date
  is '更新时间';
comment on column HOT_PRODUCT.update_by
  is '创建人';
comment on column HOT_PRODUCT.del_flag
  is '删除标记（0：正常  1：已删除）
';
alter table HOT_PRODUCT
  add constraint PK_HOT_PRODUCT primary key (ID)
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

  create table OPERATION_MONEY_LOG
(
  id             VARCHAR2(64) not null,
  app_user_id    VARCHAR2(64) not null,
  money_total    NUMBER(38,2) not null,
  operation_type CHAR(1) not null,
  update_date    TIMESTAMP(6) not null,
  update_by      VARCHAR2(64) not null,
  create_date    TIMESTAMP(6) not null,
  create_by      VARCHAR2(64) not null,
  del_flag       CHAR(1) default 0 not null
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
comment on table OPERATION_MONEY_LOG
  is '购物币发送/扣除记录';
comment on column OPERATION_MONEY_LOG.id
  is 'ID';
comment on column OPERATION_MONEY_LOG.app_user_id
  is 'APP用户ID（APP_USER表主键ID）';
comment on column OPERATION_MONEY_LOG.money_total
  is '发放/扣除购物币数量';
comment on column OPERATION_MONEY_LOG.operation_type
  is '用户操作状态（0：发放  1：扣除 ）';
comment on column OPERATION_MONEY_LOG.update_date
  is '更新时间';
comment on column OPERATION_MONEY_LOG.update_by
  is '更新人(SYS_USER表主键ID）';
comment on column OPERATION_MONEY_LOG.create_date
  is '创建时间';
comment on column OPERATION_MONEY_LOG.create_by
  is '创建者(SYS_USER表主键ID)';
comment on column OPERATION_MONEY_LOG.del_flag
  is '删除标记（0：正常  1：已删除）';
alter table OPERATION_MONEY_LOG
  add constraint PK_OPERATION_MONEY_LOG primary key (ID)
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

prompt Creating PRODUCT_SPECIFICATIONS...
create table PRODUCT_SPECIFICATIONS
(
  id         VARCHAR2(64) not null,
  product_id VARCHAR2(64) not null,
  spec_name  VARCHAR2(200) not null,
  spec_price NUMBER(38,2) not null,
  del_flag   CHAR(1) not null,
  sort       NUMBER(10) not null,
  stock_num  NUMBER not null
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
comment on table PRODUCT_SPECIFICATIONS
  is '商品规格';
comment on column PRODUCT_SPECIFICATIONS.id
  is '商品规格ID
';
comment on column PRODUCT_SPECIFICATIONS.product_id
  is '商品ID（MALL_PRODUCT_INFO表主键ID）
';
comment on column PRODUCT_SPECIFICATIONS.spec_name
  is '规格名称
';
comment on column PRODUCT_SPECIFICATIONS.spec_price
  is '规格价格
';
comment on column PRODUCT_SPECIFICATIONS.del_flag
  is '删除标记（0：正常  1：已删除）
';
comment on column PRODUCT_SPECIFICATIONS.sort
  is '排序（默认10）';
comment on column PRODUCT_SPECIFICATIONS.stock_num
  is '商品库存数量';
alter table PRODUCT_SPECIFICATIONS
  add constraint PK_PRODUCT_SPECIFICATIONS primary key (ID)
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

prompt Creating SHOPPING_ADDRESS...
create table SHOPPING_ADDRESS
(
  id             VARCHAR2(64) not null,
  user_id        VARCHAR2(64) not null,
  shop_user_name VARCHAR2(200) not null,
  phone          VARCHAR2(50) not null,
  arear          VARCHAR2(200) not null,
  address_detail VARCHAR2(200) not null,
  is_default     CHAR(1),
  create_date    TIMESTAMP(6) not null,
  update_date    TIMESTAMP(6) not null,
  del_flag       CHAR(1) default 0 not null
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
comment on table SHOPPING_ADDRESS
  is '收货地址';
comment on column SHOPPING_ADDRESS.id
  is '收货地址ID
';
comment on column SHOPPING_ADDRESS.user_id
  is '用户ID（APP_USER表主键ID）
';
comment on column SHOPPING_ADDRESS.shop_user_name
  is '收货人
';
comment on column SHOPPING_ADDRESS.phone
  is '收货电话
';
comment on column SHOPPING_ADDRESS.arear
  is '所在地区
';
comment on column SHOPPING_ADDRESS.address_detail
  is '详细地址
';
comment on column SHOPPING_ADDRESS.is_default
  is '是否设为默认收货地址（0：是 1：否）
';
comment on column SHOPPING_ADDRESS.create_date
  is '创建时间
';
comment on column SHOPPING_ADDRESS.update_date
  is '更新时间
';
comment on column SHOPPING_ADDRESS.del_flag
  is '删除标记（0：正常  1：已删除）
';

