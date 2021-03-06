
USE eor
go 

alter table eor add CONSTRAINT fk_eor_remittanceid 
  FOREIGN KEY (remittanceid) REFERENCES eor_remittance (objid)
go 

alter table eor_item add CONSTRAINT fk_eoritem_eor 
  FOREIGN KEY (parentid) REFERENCES eor (objid)
go 

alter table eor_remittance_fund add CONSTRAINT fk_eor_remittance_fund_remittanceid
  FOREIGN KEY (remittanceid) REFERENCES eor_remittance (objid)
go 


alter table eor_share add constraint fk_eor_share_parentid 
  foreign key (parentid) references eor (objid) 
go 

alter table eor_share add constraint fk_eor_share_receiptitemid 
  foreign key (receiptitemid) references eor_item (objid) 
go 


alter table jevitem add CONSTRAINT fk_jevitem_jevid 
  FOREIGN KEY (jevid) REFERENCES jev (objid)
go 


