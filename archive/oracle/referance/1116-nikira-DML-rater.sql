spool nikira-DML-rater.log
set feedback off ;
set serveroutput off ;

delete from weekends ;
delete from service_categories;
delete from zone_codes ;
delete from configurations where config_key in
('RATER.UTC.OFFSET','RATER.VISITING.NETWORK.VPLMNID','RATER.VISITING.NETWORK.UTC.OFFSET', 'RATER.ROUNDOFF.CHARGEABLEUNITS','RATER.SPECIALNUMBER.PULSE');

insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'RATER.UTC.OFFSET','+0530');
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'RATER.VISITING.NETWORK.VPLMNID','ABC');
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'RATER.VISITING.NETWORK.UTC.OFFSET','+0600');

insert into weekends values(weekends_seq.nextval, 6,'SA') ;
insert into weekends values(weekends_seq.nextval, 0,'SU') ;

insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'PF', 'Wireline Postpaid');
insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'PP', 'Wireline Prepaid');
insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'GS', 'Wireless Postpaid');
insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'TF', 'Wireless Prepaid');
insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'OU', 'Outroamer');
insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'IN', 'Inroamer');

insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'IV', 'Invalid Subscriber');

insert into service_categories (id, code, description) values(service_categories_seq.nextval, 'NR', 'NRTRDE Record');

insert into service_categories values (service_categories_seq.nextval, 'SL', 'SubscriberLess') ;

insert into configurations (id, config_key, value) values(configurations_seq.nextval, 'RATER.ROUNDOFF.CHARGEABLEUNITS', '1') ;
insert into configurations (id, config_key, value) values(configurations_seq.nextval, 'RATER.SPECIALNUMBER.PULSE', '60') ;

insert into zone_codes values(zone_codes_seq.nextval, 'Default Zone Code', 'Default Zone Code') ;

commit ;

