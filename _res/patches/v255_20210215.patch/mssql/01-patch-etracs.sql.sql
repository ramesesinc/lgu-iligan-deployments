alter table bldgrpu add occpermitno varchar(25)
go

alter table rpu add isonline int
go

update rpu set isonline = 0 where isonline is null 
go 






/*=======================================
*
*  QRRPA: Mixed-Use Support
*
=======================================*/
if exists(select * from sysobjects where id = OBJECT_ID('vw_rpu_assessment'))
begin 
  drop view vw_rpu_assessment
end 
go 


create view vw_rpu_assessment as 
select 
	r.objid,
	r.rputype,
	dpc.objid as dominantclass_objid,
	dpc.code as dominantclass_code,
	dpc.name as dominantclass_name,
	dpc.orderno as dominantclass_orderno,
	ra.areasqm,
	ra.areaha,
	ra.marketvalue,
	ra.assesslevel,
	ra.assessedvalue,
	ra.taxable,
	au.code as actualuse_code, 
	au.name  as actualuse_name,
	auc.objid as actualuse_objid,
	auc.code as actualuse_classcode,
	auc.name as actualuse_classname,
	auc.orderno as actualuse_orderno
from rpu r 
inner join propertyclassification dpc on r.classification_objid = dpc.objid
inner join rpu_assessment ra on r.objid = ra.rpuid
inner join landassesslevel au on ra.actualuse_objid = au.objid 
left join propertyclassification auc on au.classification_objid = auc.objid

union 

select 
	r.objid,
	r.rputype,
	dpc.objid as dominantclass_objid,
	dpc.code as dominantclass_code,
	dpc.name as dominantclass_name,
	dpc.orderno as dominantclass_orderno,
	ra.areasqm,
	ra.areaha,
	ra.marketvalue,
	ra.assesslevel,
	ra.assessedvalue,
	ra.taxable,
	au.code as actualuse_code, 
	au.name  as actualuse_name,
	auc.objid as actualuse_objid,
	auc.code as actualuse_classcode,
	auc.name as actualuse_classname,
	auc.orderno as actualuse_orderno
from rpu r 
inner join propertyclassification dpc on r.classification_objid = dpc.objid
inner join rpu_assessment ra on r.objid = ra.rpuid
inner join bldgassesslevel au on ra.actualuse_objid = au.objid 
left join propertyclassification auc on au.classification_objid = auc.objid

union 

select 
	r.objid,
	r.rputype,
	dpc.objid as dominantclass_objid,
	dpc.code as dominantclass_code,
	dpc.name as dominantclass_name,
	dpc.orderno as dominantclass_orderno,
	ra.areasqm,
	ra.areaha,
	ra.marketvalue,
	ra.assesslevel,
	ra.assessedvalue,
	ra.taxable,
	au.code as actualuse_code, 
	au.name  as actualuse_name,
	auc.objid as actualuse_objid,
	auc.code as actualuse_classcode,
	auc.name as actualuse_classname,
	auc.orderno as actualuse_orderno
from rpu r 
inner join propertyclassification dpc on r.classification_objid = dpc.objid
inner join rpu_assessment ra on r.objid = ra.rpuid
inner join machassesslevel au on ra.actualuse_objid = au.objid 
left join propertyclassification auc on au.classification_objid = auc.objid

union 

select 
	r.objid,
	r.rputype,
	dpc.objid as dominantclass_objid,
	dpc.code as dominantclass_code,
	dpc.name as dominantclass_name,
	dpc.orderno as dominantclass_orderno,
	ra.areasqm,
	ra.areaha,
	ra.marketvalue,
	ra.assesslevel,
	ra.assessedvalue,
	ra.taxable,
	au.code as actualuse_code, 
	au.name  as actualuse_name,
	auc.objid as actualuse_objid,
	auc.code as actualuse_classcode,
	auc.name as actualuse_classname,
	auc.orderno as actualuse_orderno
from rpu r 
inner join propertyclassification dpc on r.classification_objid = dpc.objid
inner join rpu_assessment ra on r.objid = ra.rpuid
inner join planttreeassesslevel au on ra.actualuse_objid = au.objid 
left join propertyclassification auc on au.classification_objid = auc.objid

union 

select 
	r.objid,
	r.rputype,
	dpc.objid as dominantclass_objid,
	dpc.code as dominantclass_code,
	dpc.name as dominantclass_name,
	dpc.orderno as dominantclass_orderno,
	ra.areasqm,
	ra.areaha,
	ra.marketvalue,
	ra.assesslevel,
	ra.assessedvalue,
	ra.taxable,
	au.code as actualuse_code, 
	au.name  as actualuse_name,
	auc.objid as actualuse_objid,
	auc.code as actualuse_classcode,
	auc.name as actualuse_classname,
	auc.orderno as actualuse_orderno
from rpu r 
inner join propertyclassification dpc on r.classification_objid = dpc.objid
inner join rpu_assessment ra on r.objid = ra.rpuid
inner join miscassesslevel au on ra.actualuse_objid = au.objid 
left join propertyclassification auc on au.classification_objid = auc.objid
go 



CREATE TABLE batch_rpttaxcredit (
  objid varchar(50) NOT NULL,
  state varchar(25) NOT NULL,
  txndate date NOT NULL,
  txnno varchar(25) NOT NULL,
  rate decimal(10,2) NOT NULL,
  paymentfrom date DEFAULT NULL,
  paymentto varchar(255) DEFAULT NULL,
  creditedyear int NOT NULL,
  reason varchar(255) NOT NULL,
  validity date NULL,
  PRIMARY KEY (objid)
) 
go

create index ix_state on batch_rpttaxcredit(state)
go
create index ix_txnno on batch_rpttaxcredit(txnno)
go

CREATE TABLE batch_rpttaxcredit_ledger (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NOT NULL,
  state varchar(25) NOT NULL,
  error varchar(255) NULL,
	barangayid varchar(50) not null, 
  PRIMARY KEY (objid)
) 
go


create index ix_parentid on batch_rpttaxcredit_ledger (parentid)
go
create index ix_state on batch_rpttaxcredit_ledger (state)
go
create index ix_barangayid on batch_rpttaxcredit_ledger (barangayid)
go

alter table batch_rpttaxcredit_ledger 
add constraint fk_rpttaxcredit_rptledger_parent foreign key(parentid) references batch_rpttaxcredit(objid)
go

alter table batch_rpttaxcredit_ledger 
add constraint fk_rpttaxcredit_rptledger_rptledger foreign key(objid) references rptledger(objid)
go




CREATE TABLE batch_rpttaxcredit_ledger_posted (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NOT NULL,
  barangayid varchar(50) NOT NULL,
  PRIMARY KEY (objid)
)
go

create index ix_parentid on batch_rpttaxcredit_ledger_posted(parentid)
go
create index ix_barangayid on batch_rpttaxcredit_ledger_posted(barangayid)
go

alter table batch_rpttaxcredit_ledger_posted 
add constraint fk_rpttaxcredit_rptledger_posted_parent foreign key(parentid) references batch_rpttaxcredit(objid)
go

alter table batch_rpttaxcredit_ledger_posted 
add constraint fk_rpttaxcredit_rptledger_posted_rptledger foreign key(objid) references rptledger(objid)
go

create view vw_batch_rpttaxcredit_error
as 
select br.*, rl.tdno
from batch_rpttaxcredit_ledger br 
inner join rptledger rl on br.objid = rl.objid 
where br.state = 'ERROR'
go


CREATE TABLE rpt_syncdata_forsync (
  [objid] varchar(50) NOT NULL,
  [reftype] varchar(50) NOT NULL,
  [refno] varchar(50) NOT NULL,
  [action] varchar(50) NOT NULL,
  [orgid] varchar(50) NOT NULL,
  [dtfiled] datetime NOT NULL,
  [createdby_objid] varchar(50) DEFAULT NULL,
  [createdby_name] varchar(255) DEFAULT NULL,
  [createdby_title] varchar(50) DEFAULT NULL,
  PRIMARY KEY (objid)
)
go 
create index ix_refno on rpt_syncdata_forsync (refno)
go
create index ix_orgid on rpt_syncdata_forsync (orgid)
go

CREATE TABLE rpt_syncdata (
  [objid] varchar(50) NOT NULL,
  [state] varchar(25) NOT NULL,
  [refid] varchar(50) NOT NULL,
  [reftype] varchar(50) NOT NULL,
  [refno] varchar(50) NOT NULL,
  [action] varchar(50) NOT NULL,
  [dtfiled] datetime NOT NULL,
  [orgid] varchar(50) NOT NULL,
  [remote_orgid] varchar(50) DEFAULT NULL,
  [remote_orgcode] varchar(5) DEFAULT NULL,
  [remote_orgclass] varchar(25) DEFAULT NULL,
  [sender_objid] varchar(50) DEFAULT NULL,
  [sender_name] varchar(255) DEFAULT NULL,
  [sender_title] varchar(80) DEFAULT NULL,
  PRIMARY KEY (objid)
)
go

create index ix_state on rpt_syncdata (state)
go
create index ix_refid on rpt_syncdata (refid)
go
create index ix_refno on rpt_syncdata (refno)
go
create index ix_orgid on rpt_syncdata (orgid)
go

CREATE TABLE rpt_syncdata_item (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NOT NULL,
  state varchar(25) NOT NULL,
  refid varchar(50) NOT NULL,
  reftype varchar(50) NOT NULL,
  refno varchar(50) NOT NULL,
  action varchar(50) NOT NULL,
  idx int NOT NULL,
  info text,
  PRIMARY KEY (objid)
)
go 

create index ix_parentid on rpt_syncdata_item (parentid)
go
create index ix_state on rpt_syncdata_item (state)
go
create index ix_refid on rpt_syncdata_item (refid)
go
create index ix_refno on rpt_syncdata_item (refno)
go


alter table rpt_syncdata_item
  add CONSTRAINT FK_parentid_rpt_syncdata 
  FOREIGN KEY (parentid) REFERENCES rpt_syncdata (objid)
go 

CREATE TABLE rpt_syncdata_error (
  [objid] varchar(50) NOT NULL,
  [filekey] varchar(1000) NOT NULL,
  [error] text,
  [refid] varchar(50) NOT NULL,
  [reftype] varchar(50) NOT NULL,
  [refno] varchar(50) NOT NULL,
  [action] varchar(50) NOT NULL,
  [idx] int NOT NULL,
  [info] text,
  [parent] text,
  [remote_orgid] varchar(50) DEFAULT NULL,
  [remote_orgcode] varchar(5) DEFAULT NULL,
  [remote_orgclass] varchar(50) DEFAULT NULL,
  PRIMARY KEY (objid)
)
go 

create index ix_refid on rpt_syncdata_error (refid)
go
create index ix_refno on rpt_syncdata_error (refno)
go
create index ix_filekey on rpt_syncdata_error (filekey)
go
create index ix_remote_orgid on rpt_syncdata_error (remote_orgid)
go
create index ix_remote_orgcode on rpt_syncdata_error (remote_orgcode)
go

INSERT INTO sys_var ([name], [value], [description], [datatype], [category]) 
VALUES ('assesser_new_sync_lgus', NULL, 'List of LGUs using new sync facility', NULL, 'ASSESSOR')
go 





ALTER TABLE rpt_syncdata_forsync ADD remote_orgid VARCHAR(15)
go 

INSERT INTO sys_var ([name], [value], [description], [datatype], [category]) 
VALUES ('fileserver_upload_task_active', '0', 'Activate / Deactivate upload task', 'boolean', 'SYSTEM')
go 



INSERT INTO sys_var ([name], [value], [description], [datatype], [category]) 
VALUES ('fileserver_download_task_active', '0', 'Activate / Deactivate download task', 'boolean', 'SYSTEM')
go



CREATE TABLE rpt_syncdata_completed (
  [objid] varchar(255) NOT NULL,
  [idx] int DEFAULT NULL,
  [action] varchar(100) DEFAULT NULL,
  [refno] varchar(50) DEFAULT NULL,
  [refid] varchar(50) DEFAULT NULL,
  [reftype] varchar(50) DEFAULT NULL,
  [parent_orgid] varchar(50) DEFAULT NULL,
  [sender_name] varchar(255) DEFAULT NULL,
  [sender_title] varchar(255) DEFAULT NULL,
  [dtcreated] datetime DEFAULT NULL,
  PRIMARY KEY (objid)
)
go 

CREATE INDEX ix_refno ON rpt_syncdata_completed (refno)
go
CREATE INDEX ix_refid ON rpt_syncdata_completed (refid)
go
CREATE INDEX ix_parent_orgid ON rpt_syncdata_completed (parent_orgid)
go

