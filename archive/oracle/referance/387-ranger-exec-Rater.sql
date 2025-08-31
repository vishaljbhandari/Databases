set feedback off
delete from weekend ;
delete from ds_configuration where id in
('RATER.UTC.OFFSET','RATER.VISITING.NETWORK.VPLMNID','RATER.VISITING.NETWORK.UTC.OFFSET', 'RATER.ROUNDOFF.CHARGEABLEUNITS');

insert into ds_configuration values ('RATER.UTC.OFFSET','+0530');
insert into ds_configuration values ('RATER.VISITING.NETWORK.VPLMNID','ABC');
insert into ds_configuration values ('RATER.VISITING.NETWORK.UTC.OFFSET','+0600');

insert into weekend values(4,'SA') ;
insert into weekend values(5,'SU') ;

delete from service_category;
insert into service_category (code, description) values('PF', 'Wireline Postpaid');
insert into service_category (code, description) values('PP', 'Wireline Prepaid');
insert into service_category (code, description) values('OU', 'Outroamer');
insert into service_category (code, description) values('IN', 'Inroamer');
insert into service_category (code, description) values('IV', 'Invalid Subscriber');
insert into service_category (code, description) values('GS', 'Wireless Postpaid');

insert into ds_configuration values('RATER.ROUNDOFF.CHARGEABLEUNITS', '1') ;
insert into zone_code values('Default Zone Code', 'Default Zone Code') ;
commit;
exit;
