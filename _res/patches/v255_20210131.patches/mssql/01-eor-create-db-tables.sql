
CREATE DATABASE eor 
go 

USE eor
go 

-- ----------------------------
-- Table structure for eor
-- ----------------------------
CREATE TABLE eor (
  objid varchar(50) NOT NULL,
  receiptno varchar(50) NULL,
  receiptdate date NULL,
  txndate datetime NULL,
  state varchar(10) NULL,
  partnerid varchar(50) NULL,
  txntype varchar(20) NULL,
  traceid varchar(50) NULL,
  tracedate datetime NULL,
  refid varchar(50) NULL,
  paidby varchar(255) NULL,
  paidbyaddress varchar(255) NULL,
  payer_objid varchar(50) NULL,
  paymethod varchar(20) NULL,
  paymentrefid varchar(50) NULL,
  remittanceid varchar(50) NULL,
  remarks varchar(255) NULL,
  amount decimal(16,4) NULL,
  lockid varchar(50) NULL,
  constraint pk_eor PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_for_email
-- ----------------------------
CREATE TABLE eor_for_email (
  objid varchar(50) NOT NULL,
  txndate datetime NULL,
  email varchar(255) NULL,
  mobileno varchar(50) NULL,
  state int NULL,
  dtsent datetime NULL,
  errmsg varchar(255) NULL,
  constraint pk_eor_for_email PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_item
-- ----------------------------
CREATE TABLE eor_item (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  item_objid varchar(50) NULL,
  item_code varchar(100) NULL,
  item_title varchar(100) NULL,
  amount decimal(16,4) NULL,
  remarks varchar(255) NULL,
  item_fund_objid varchar(50) NULL,
  constraint pk_eor_item PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_manual_post
-- ----------------------------
CREATE TABLE eor_manual_post (
  objid varchar(50) NOT NULL,
  state varchar(10) NULL,
  paymentorderno varchar(50) NULL,
  amount decimal(16,4) NULL,
  txntype varchar(50) NULL,
  paymentpartnerid varchar(50) NULL,
  traceid varchar(50) NULL,
  tracedate datetime NULL,
  reason text NULL,
  createdby_objid varchar(50) NULL,
  createdby_name varchar(255) NULL,
  dtcreated datetime NULL,
  constraint pk_eor_manual_post PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_number
-- ----------------------------
CREATE TABLE eor_number (
  objid varchar(255) NOT NULL,
  currentno int NOT NULL DEFAULT '1',
  constraint pk_eor_number PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_paymentorder
-- ----------------------------
CREATE TABLE eor_paymentorder (
  objid varchar(50) NOT NULL,
  txndate datetime NULL,
  txntype varchar(50) NULL,
  txntypename varchar(100) NULL,
  payer_objid varchar(50) NULL,
  payer_name varchar(800) NULL,
  paidby varchar(800),
  paidbyaddress varchar(255) NULL,
  particulars varchar(500) NULL,
  amount decimal(16,2) NULL,
  expirydate date NULL,
  refid varchar(50) NULL,
  refno varchar(50) NULL,
  info varchar(MAX) NULL,
  origin varchar(100) NULL,
  controlno varchar(50) NULL,
  locationid varchar(25) NULL,
  items varchar(MAX) NULL,
  state varchar(32) NULL,
  email varchar(255) NULL,
  mobileno varchar(25) NULL,
  constraint pk_eor_paymentorder PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_paymentorder_cancelled
-- ----------------------------
CREATE TABLE eor_paymentorder_cancelled (
  objid varchar(50) NOT NULL,
  txndate datetime NULL,
  txntype varchar(50) NULL,
  txntypename varchar(100) NULL,
  payer_objid varchar(50) NULL,
  payer_name varchar(800) NULL,
  paidby varchar(800),
  paidbyaddress varchar(255) NULL,
  particulars varchar(500) NULL,
  amount decimal(16,2) NULL,
  expirydate date NULL,
  refid varchar(50) NULL,
  refno varchar(50) NULL,
  info varchar(MAX) NULL,
  origin varchar(100) NULL,
  controlno varchar(50) NULL,
  locationid varchar(25) NULL,
  items varchar(MAX) NULL,
  state varchar(10) NULL,
  email varchar(255) NULL,
  mobileno varchar(50) NULL,
  constraint pk_eor_paymentorder_cancelled PRIMARY KEY (objid) 
) 
go

-- ----------------------------
-- Table structure for eor_paymentorder_paid
-- ----------------------------
CREATE TABLE eor_paymentorder_paid (
  objid varchar(50) NOT NULL,
  txndate datetime NULL,
  txntype varchar(50) NULL,
  txntypename varchar(100) NULL,
  payer_objid varchar(50) NULL,
  payer_name varchar(800) NULL,
  paidby varchar(800),
  paidbyaddress varchar(255) NULL,
  particulars varchar(500) NULL,
  amount decimal(16,2) NULL,
  expirydate date NULL,
  refid varchar(50) NULL,
  refno varchar(50) NULL,
  info varchar(MAX) NULL,
  origin varchar(100) NULL,
  controlno varchar(50) NULL,
  locationid varchar(25) NULL,
  items varchar(MAX) NULL,
  state varchar(10) NULL,
  email varchar(255) NULL,
  mobileno varchar(50) NULL,
  constraint pk_eor_paymentorder_paid PRIMARY KEY (objid) 
) 
go

-- ----------------------------
-- Table structure for eor_payment_error
-- ----------------------------
CREATE TABLE eor_payment_error (
  objid varchar(50) NOT NULL,
  txndate datetime NOT NULL,
  paymentrefid varchar(50) NOT NULL,
  errmsg varchar(MAX) NOT NULL,
  errdetail varchar(MAX) NULL,
  errcode int NULL,
  laststate int NULL,
  constraint pk_eor_payment_error PRIMARY KEY (objid) 
) 
go

-- ----------------------------
-- Table structure for eor_remittance
-- ----------------------------
CREATE TABLE eor_remittance (
  objid varchar(50) NOT NULL,
  state varchar(50) NULL,
  controlno varchar(50) NULL,
  partnerid varchar(50) NULL,
  controldate date NULL,
  dtcreated datetime NULL,
  createdby_objid varchar(50) NULL,
  createdby_name varchar(255) NULL,
  amount decimal(16,4) NULL,
  dtposted datetime NULL,
  postedby_objid varchar(50) NULL,
  postedby_name varchar(255) NULL,
  lockid varchar(50) NULL,
  constraint pk_eor_remittance PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_remittance_fund
-- ----------------------------
CREATE TABLE eor_remittance_fund (
  objid varchar(100) NOT NULL,
  remittanceid varchar(50) NULL,
  fund_objid varchar(50) NULL,
  fund_code varchar(50) NULL,
  fund_title varchar(255) NULL,
  amount decimal(16,4) NULL,
  bankaccount_objid varchar(50) NULL,
  bankaccount_title varchar(255) NULL,
  bankaccount_bank_name varchar(255) NULL,
  validation_refno varchar(50) NULL,
  validation_refdate date NULL,
  constraint pk_eor_remittance_fund PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for eor_share
-- ----------------------------
CREATE TABLE eor_share (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NOT NULL,
  refitem_objid varchar(50) NULL,
  refitem_code varchar(25) NULL,
  refitem_title varchar(255) NULL,
  payableitem_objid varchar(50) NULL,
  payableitem_code varchar(25) NULL,
  payableitem_title varchar(255) NULL,
  amount decimal(16,4) NULL,
  share decimal(16,2) NULL,
  receiptitemid varchar(50) NULL,
  constraint pk_eor_share PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for epayment_plugin
-- ----------------------------
CREATE TABLE epayment_plugin (
  objid varchar(50) NOT NULL,
  connection varchar(50) NULL,
  servicename varchar(255) NULL,
  constraint pk_epayment_plugin PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for jev
-- ----------------------------
CREATE TABLE jev (
  objid varchar(150) NOT NULL,
  jevno varchar(50) NULL,
  jevdate date NULL,
  fundid varchar(50) NULL,
  dtposted datetime NULL,
  txntype varchar(50) NULL,
  refid varchar(50) NULL,
  refno varchar(50) NULL,
  reftype varchar(50) NULL,
  amount decimal(16,4) NULL,
  state varchar(32) NULL,
  postedby_objid varchar(50) NULL,
  postedby_name varchar(255) NULL,
  verifiedby_objid varchar(50) NULL,
  verifiedby_name varchar(255) NULL,
  dtverified datetime NULL,
  batchid varchar(50) NULL,
  refdate date NULL,
  constraint pk_jev PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for jevitem
-- ----------------------------
CREATE TABLE jevitem (
  objid varchar(150) NOT NULL,
  jevid varchar(150) NULL,
  accttype varchar(50) NULL,
  acctid varchar(50) NULL,
  acctcode varchar(32) NULL,
  acctname varchar(255) NULL,
  dr decimal(16,4) NULL,
  cr decimal(16,4) NULL,
  particulars varchar(255) NULL,
  itemrefid varchar(255) NULL,
  constraint pk_jevitem PRIMARY KEY (objid) 
) 
go

-- ----------------------------
-- Table structure for paymentpartner
-- ----------------------------
CREATE TABLE paymentpartner (
  objid varchar(50) NOT NULL,
  code varchar(50) NULL,
  name varchar(100) NULL,
  branch varchar(255) NULL,
  contact varchar(255) NULL,
  mobileno varchar(32) NULL,
  phoneno varchar(32) NULL,
  email varchar(255) NULL,
  indexno varchar(3) NULL,
  constraint pk_paymentpartner PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for sys_email_queue
-- ----------------------------
CREATE TABLE sys_email_queue (
  objid varchar(50) NOT NULL,
  refid varchar(50) NOT NULL,
  state int NOT NULL,
  reportid varchar(50) NULL,
  dtsent datetime NOT NULL,
  to varchar(255) NOT NULL,
  subject varchar(255) NOT NULL,
  message varchar(MAX) NOT NULL,
  errmsg varchar(MAX) NULL,
  connection varchar(50) NULL,
  constraint pk_sys_email_queue PRIMARY KEY (objid) 
) 
go

-- ----------------------------
-- Table structure for sys_email_template
-- ----------------------------
CREATE TABLE sys_email_template (
  objid varchar(50) NOT NULL,
  subject varchar(255) NOT NULL,
  message varchar(MAX) NOT NULL,
  constraint pk_sys_email_template PRIMARY KEY (objid)
) 
go

-- ----------------------------
-- Table structure for unpostedpayment
-- ----------------------------
CREATE TABLE unpostedpayment (
  objid varchar(50) NOT NULL,
  txndate datetime NOT NULL,
  txntype varchar(50) NOT NULL,
  txntypename varchar(150) NOT NULL,
  paymentrefid varchar(50) NOT NULL,
  amount decimal(16,2) NOT NULL,
  orgcode varchar(20) NOT NULL,
  partnerid varchar(50) NOT NULL,
  traceid varchar(100) NOT NULL,
  tracedate datetime NOT NULL,
  refno varchar(50) NULL,
  origin varchar(50) NULL,
  paymentorder varchar(MAX) NULL,
  errmsg varchar(MAX) NOT NULL,
  errdetail varchar(MAX) NULL,
  constraint pk_unpostedpayment PRIMARY KEY (objid)
) 
go



INSERT INTO paymentpartner (objid, code, name, branch, contact, mobileno, phoneno, email, indexno) 
VALUES ('DBP', '101', 'DEVELOPMENT BANK OF THE PHILIPPINES', NULL, NULL, NULL, NULL, NULL, '101');

INSERT INTO paymentpartner (objid, code, name, branch, contact, mobileno, phoneno, email, indexno) 
VALUES ('LBP', '102', 'LAND BANK OF THE PHILIPPINES', NULL, NULL, NULL, NULL, NULL, '102');

