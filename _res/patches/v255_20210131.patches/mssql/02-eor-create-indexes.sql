
USE eor
go 

create UNIQUE index uix_eor_receiptno on eor (receiptno)
go 
create index ix_receiptdate on eor (receiptdate)
go 
create index ix_txndate on eor (txndate)
go 
create index ix_partnerid on eor (partnerid)
go 
create index ix_traceid on eor (traceid)
go 
create index ix_refid on eor (refid)
go 
create index ix_paidby on eor (paidby)
go 
create index ix_payer_objid on eor (payer_objid)
go 
create index ix_paymentrefid on eor (paymentrefid)
go 
create index ix_remittanceid on eor (remittanceid)
go 
create index ix_lockid on eor (lockid)
go 


create index ix_parentid on eor_item (parentid)
go 
create index ix_item_objid on eor_item (item_objid)
go 
create index ix_item_fund_objid on eor_item (item_fund_objid)
go 



create UNIQUE index uix_paymentorderno on eor_manual_post (paymentorderno)
go 


create index ix_state on eor_paymentorder (state)
go 
create index ix_txndate on eor_paymentorder (txndate)
go 
create index ix_txntype on eor_paymentorder (txntype)
go 
create index ix_payer_name on eor_paymentorder (payer_name)
go 
create index ix_paidby on eor_paymentorder (paidby)
go 
create index ix_refid on eor_paymentorder (refid)
go 
create index ix_refno on eor_paymentorder (refno)
go 
create index ix_controlno on eor_paymentorder (controlno)
go 
create index ix_locationid on eor_paymentorder (locationid)
go 


create index ix_state on eor_paymentorder_cancelled (state)
go 
create index ix_txndate on eor_paymentorder_cancelled (txndate)
go 
create index ix_txntype on eor_paymentorder_cancelled (txntype)
go 
create index ix_payer_name on eor_paymentorder_cancelled (payer_name)
go 
create index ix_paidby on eor_paymentorder_cancelled (paidby)
go 
create index ix_refid on eor_paymentorder_cancelled (refid)
go 
create index ix_refno on eor_paymentorder_cancelled (refno)
go 
create index ix_controlno on eor_paymentorder_cancelled (controlno)
go 
create index ix_locationid on eor_paymentorder_cancelled (locationid)
go 


create index ix_state on eor_paymentorder_paid (state)
go 
create index ix_txndate on eor_paymentorder_paid (txndate)
go 
create index ix_txntype on eor_paymentorder_paid (txntype)
go 
create index ix_payer_name on eor_paymentorder_paid (payer_name)
go 
create index ix_paidby on eor_paymentorder_paid (paidby)
go 
create index ix_refid on eor_paymentorder_paid (refid)
go 
create index ix_refno on eor_paymentorder_paid (refno)
go 
create index ix_controlno on eor_paymentorder_paid (controlno)
go 
create index ix_locationid on eor_paymentorder_paid (locationid)
go 



CREATE UNIQUE index ix_paymentrefid on eor_payment_error (paymentrefid)
go 
create index ix_txndate on eor_payment_error (txndate)
go 



create index ix_state on eor_remittance (state)
go 
create index ix_controlno on eor_remittance (controlno)
go 
create index ix_partnerid on eor_remittance (partnerid)
go 
create index ix_controldate on eor_remittance (controldate)
go 
create index ix_dtcreated on eor_remittance (dtcreated)
go 
create index ix_createdby_objid on eor_remittance (createdby_objid)
go 
create index ix_createdby_name on eor_remittance (createdby_name)
go 
create index ix_dtposted on eor_remittance (dtposted)
go 
create index ix_postedby_objid on eor_remittance (postedby_objid)
go 
create index ix_postedby_name on eor_remittance (postedby_name)
go 



create index ix_remittanceid on eor_remittance_fund (remittanceid)
go 


create index ix_parentid on eor_share (parentid)
go 
create index ix_refitem_objid on eor_share (refitem_objid)
go 
create index ix_refitem_title on eor_share (refitem_title)
go 
create index ix_payableitem_objid on eor_share (payableitem_objid)
go 
create index ix_payableitem_title on eor_share (payableitem_title)
go 
create index ix_receiptitemid on eor_share (receiptitemid)
go 



create index ix_batchid on jev (batchid)
go 
create index ix_dtposted on jev (dtposted)
go 
create index ix_dtverified on jev (dtverified)
go 
create index ix_fundid on jev (fundid)
go 
create index ix_jevdate on jev (jevdate)
go 
create index ix_jevno on jev (jevno)
go 
create index ix_postedby_objid on jev (postedby_objid)
go 
create index ix_refdate on jev (refdate)
go 
create index ix_refid on jev (refid)
go 
create index ix_refno on jev (refno)
go 
create index ix_reftype on jev (reftype)
go 
create index ix_verifiedby_objid on jev (verifiedby_objid)
go 




create index ix_jevid on jevitem (jevid)
go 
create index ix_ledgertype on jevitem (accttype)
go 
create index ix_acctid on jevitem (acctid)
go 
create index ix_acctcode on jevitem (acctcode)
go 
create index ix_acctname on jevitem (acctname)
go 
create index ix_itemrefid on jevitem (itemrefid)
go 



create index ix_refid on sys_email_queue (refid)
go 
create index ix_state on sys_email_queue (state)
go 
create index ix_reportid on sys_email_queue (reportid)
go 
create index ix_dtsent on sys_email_queue (dtsent)
go 



create UNIQUE index uix_paymentrefid on unpostedpayment (paymentrefid)
go 
CREATE INDEX ix_txndate ON unpostedpayment (txndate)
go 
CREATE INDEX ix_txntype ON unpostedpayment (txntype)
go 
CREATE INDEX ix_partnerid ON unpostedpayment (partnerid)
go 
CREATE INDEX ix_traceid ON unpostedpayment (traceid)
go 
CREATE INDEX ix_tracedate ON unpostedpayment (tracedate)
go 
CREATE INDEX ix_refno ON unpostedpayment (refno)
go 
CREATE INDEX ix_origin ON unpostedpayment (origin)
go 

