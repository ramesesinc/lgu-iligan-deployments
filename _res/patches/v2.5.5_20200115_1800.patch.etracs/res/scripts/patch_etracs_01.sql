create table cashreceipt_plugin (
	objid varchar(50) not null, 
	connection varchar(255) not null, 
	servicename varchar(255) not null,
	constraint pk_objid primary key (objid)
)
go 
create unique index uix_connection on cashreceipt_plugin (connection)
go 

