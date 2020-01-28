
delete from cashreceipt_rpt_share_forposting
go 


insert into cashreceipt_rpt_share_forposting (
	objid, receiptid, rptledgerid, txndate, error
)
select 
	cr.objid + '*' + rl.tdno as objid,
	cr.objid as receiptid,
	rp.refid as rptledgerid,
	cr.txndate,
	0 as error
from cashreceipt cr 
inner join remittance r on cr.remittanceid = r.objid 
inner join collectionvoucher cv on r.collectionvoucherid = cv.objid 
inner join rptpayment rp on cr.objid = rp.receiptid
inner join rptledger rl on rp.refid = rl.objid 
left join cashreceipt_void v on cr.objid = v.receiptid 
where cv.controldate >= '2019-04-01' 
	and cv.controldate < '2019-05-01'
	and v.objid is null 
go 	