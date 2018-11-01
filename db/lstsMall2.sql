
--ɾ����
DROP TABLE MALL_ORDER CASCADE CONSTRAINTS;
DROP TABLE MALL_ORDER_INFO CASCADE CONSTRAINTS;
DROP TABLE MALL_PRODUCT_INFO CASCADE CONSTRAINTS;
DROP TABLE MALL_SHOPCAR CASCADE CONSTRAINTS;
DROP TABLE HOT_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE OPERATION_MONEY_LOG CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_SPECIFICATIONS CASCADE CONSTRAINTS;
DROP TABLE SHOPPING_ADDRESS CASCADE CONSTRAINTS;

------������
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
  is '������Ϣ';
comment on column MALL_ORDER.id
  is '����ID
';
comment on column MALL_ORDER.order_no
  is '�������
';
comment on column MALL_ORDER.user_id
  is '�û�ID��APP_USER������ID��
';
comment on column MALL_ORDER.order_status
  is '1-δ����,2-�Ѹ���,3-�ѷ���,4-��ǩ��,5-�˻�����,6-�˻���,7-���˻�,8-ȡ������(����״̬��ϵͳ�ֵ����й���)
';
comment on column MALL_ORDER.product_amount_total
  is '��Ʒ�ܼ�
';
comment on column MALL_ORDER.order_amount_total
  is '������ʵ�ʸ����
';
comment on column MALL_ORDER.logistics_fee
  is '�˷ѽ��
';
comment on column MALL_ORDER.address_id
  is '�ջ���ַ���
';
comment on column MALL_ORDER.logistics_company_name
  is '������˾����
';
comment on column MALL_ORDER.orderlogistics_id
  is '�����������
';
comment on column MALL_ORDER.pay_channel
  is '����֧������
';
comment on column MALL_ORDER.pay_time
  is '����ʱ��
';
comment on column MALL_ORDER.escrow_trade_no
  is '������֧����ˮ��
';
comment on column MALL_ORDER.create_date
  is '����ʱ��(�µ�ʱ��)
';
comment on column MALL_ORDER.remarks
  is '�ͻ���ע
';
comment on column MALL_ORDER.consign
  is '����ʱ��
';
comment on column MALL_ORDER.columns1
  is '�Ƿ�Ʊ��Ԥ���ֶΣ�
';
comment on column MALL_ORDER.columns2
  is '��Ʊ��ţ�Ԥ���ֶΣ�
';
comment on column MALL_ORDER.update_date
  is '����ʱ��
';
comment on column MALL_ORDER.del_flag
  is 'ɾ����ǣ�0������  1����ɾ����
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
  is '����������Ϣ';
comment on column MALL_ORDER_INFO.id
  is '����������ϢID
';
comment on column MALL_ORDER_INFO.order_id
  is '����ID(MALL_ORDER����ID)
';
comment on column MALL_ORDER_INFO.product_id
  is '��ƷID
';
comment on column MALL_ORDER_INFO.product_count
  is '��������
';
comment on column MALL_ORDER_INFO.del_flag
  is '�Ƿ�ɾ��';
comment on column MALL_ORDER_INFO.spec_name
  is '��Ʒ�������';
comment on column MALL_ORDER_INFO.product_price
  is '��Ʒ�۸�';
comment on column MALL_ORDER_INFO.product_spec_id
  is '���id';
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
  is '��Ʒ��Ϣ';
comment on column MALL_PRODUCT_INFO.id
  is '��ƷID
';
comment on column MALL_PRODUCT_INFO.product_no
  is '��Ʒ���
';
comment on column MALL_PRODUCT_INFO.product_name
  is '��Ʒ����
';
comment on column MALL_PRODUCT_INFO.product_ico1
  is '��Ʒͼ��1
';
comment on column MALL_PRODUCT_INFO.product_ico2
  is '��Ʒͼ��2
';
comment on column MALL_PRODUCT_INFO.product_ico3
  is '��Ʒͼ��3
';
comment on column MALL_PRODUCT_INFO.product_ico4
  is '��Ʒͼ��4';
comment on column MALL_PRODUCT_INFO.product_ico5
  is '��Ʒͼ��5
';
comment on column MALL_PRODUCT_INFO.product_ico6
  is '��Ʒͼ��6
';
comment on column MALL_PRODUCT_INFO.product_img1
  is '��ƷͼƬ1
';
comment on column MALL_PRODUCT_INFO.product_img2
  is '��ƷͼƬ2
';
comment on column MALL_PRODUCT_INFO.product_img3
  is '��ƷͼƬ3';
comment on column MALL_PRODUCT_INFO.specification_id
  is '��Ʒ���ID(�������Զ��Ÿ�����ʽ�洢)
';
comment on column MALL_PRODUCT_INFO.product_type_id
  is '��Ʒ���ID����Ʒ���ʹ��ϵͳ���е��ֵ����ģ�飩
';
comment on column MALL_PRODUCT_INFO.stock_num
  is '�������
';
comment on column MALL_PRODUCT_INFO.stauts
  is '��Ʒ״̬��1��δ�ϼ�  2���ϼ�  3�����¼� ��
';
comment on column MALL_PRODUCT_INFO.del_flag
  is 'ɾ����ǣ�0������  1����ɾ����
';
comment on column MALL_PRODUCT_INFO.create_by
  is '������
';
comment on column MALL_PRODUCT_INFO.create_date
  is '����ʱ��
';
comment on column MALL_PRODUCT_INFO.update_date
  is '����ʱ��
';
comment on column MALL_PRODUCT_INFO.update_by
  is '������
';
comment on column MALL_PRODUCT_INFO.remarks
  is '��ע��Ϣ
';
comment on column MALL_PRODUCT_INFO.product_detail_img
  is '��Ʒ����ͼƬ';
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
  is '�̳ǹ��ﳵ';
comment on column MALL_SHOPCAR.id
  is '���ﳵID
';
comment on column MALL_SHOPCAR.user_id
  is '�û�ID��APP_USER������ID��
';
comment on column MALL_SHOPCAR.product_id
  is '��ƷID(MALL_PRODUCT_INFO������ID)
';
comment on column MALL_SHOPCAR.product_count
  is '��������
';
comment on column MALL_SHOPCAR.create_date
  is '����ʱ��
';
comment on column MALL_SHOPCAR.update_date
  is '����ʱ��
';
comment on column MALL_SHOPCAR.del_flag
  is 'ɾ����ǣ�0������  1����ɾ����
';
comment on column MALL_SHOPCAR.product_spec_id
  is '���id';
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
  is '������ѡ��Ʒ';
comment on column HOT_PRODUCT.id
  is 'ID
';
comment on column HOT_PRODUCT.product_id
  is '��ƷID
';
comment on column HOT_PRODUCT.start_time
  is '��Чʱ��
ʧЧʱ��
';
comment on column HOT_PRODUCT.edn_time
  is 'ʧЧʱ��
';
comment on column HOT_PRODUCT.sort
  is '���д���
';
comment on column HOT_PRODUCT.create_by
  is '������';
comment on column HOT_PRODUCT.create_date
  is '����ʱ��';
comment on column HOT_PRODUCT.update_date
  is '����ʱ��';
comment on column HOT_PRODUCT.update_by
  is '������';
comment on column HOT_PRODUCT.del_flag
  is 'ɾ����ǣ�0������  1����ɾ����
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
  is '����ҷ���/�۳���¼';
comment on column OPERATION_MONEY_LOG.id
  is 'ID';
comment on column OPERATION_MONEY_LOG.app_user_id
  is 'APP�û�ID��APP_USER������ID��';
comment on column OPERATION_MONEY_LOG.money_total
  is '����/�۳����������';
comment on column OPERATION_MONEY_LOG.operation_type
  is '�û�����״̬��0������  1���۳� ��';
comment on column OPERATION_MONEY_LOG.update_date
  is '����ʱ��';
comment on column OPERATION_MONEY_LOG.update_by
  is '������(SYS_USER������ID��';
comment on column OPERATION_MONEY_LOG.create_date
  is '����ʱ��';
comment on column OPERATION_MONEY_LOG.create_by
  is '������(SYS_USER������ID)';
comment on column OPERATION_MONEY_LOG.del_flag
  is 'ɾ����ǣ�0������  1����ɾ����';
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
  is '��Ʒ���';
comment on column PRODUCT_SPECIFICATIONS.id
  is '��Ʒ���ID
';
comment on column PRODUCT_SPECIFICATIONS.product_id
  is '��ƷID��MALL_PRODUCT_INFO������ID��
';
comment on column PRODUCT_SPECIFICATIONS.spec_name
  is '�������
';
comment on column PRODUCT_SPECIFICATIONS.spec_price
  is '���۸�
';
comment on column PRODUCT_SPECIFICATIONS.del_flag
  is 'ɾ����ǣ�0������  1����ɾ����
';
comment on column PRODUCT_SPECIFICATIONS.sort
  is '����Ĭ��10��';
comment on column PRODUCT_SPECIFICATIONS.stock_num
  is '��Ʒ�������';
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
  is '�ջ���ַ';
comment on column SHOPPING_ADDRESS.id
  is '�ջ���ַID
';
comment on column SHOPPING_ADDRESS.user_id
  is '�û�ID��APP_USER������ID��
';
comment on column SHOPPING_ADDRESS.shop_user_name
  is '�ջ���
';
comment on column SHOPPING_ADDRESS.phone
  is '�ջ��绰
';
comment on column SHOPPING_ADDRESS.arear
  is '���ڵ���
';
comment on column SHOPPING_ADDRESS.address_detail
  is '��ϸ��ַ
';
comment on column SHOPPING_ADDRESS.is_default
  is '�Ƿ���ΪĬ���ջ���ַ��0���� 1����
';
comment on column SHOPPING_ADDRESS.create_date
  is '����ʱ��
';
comment on column SHOPPING_ADDRESS.update_date
  is '����ʱ��
';
comment on column SHOPPING_ADDRESS.del_flag
  is 'ɾ����ǣ�0������  1����ɾ����
';

