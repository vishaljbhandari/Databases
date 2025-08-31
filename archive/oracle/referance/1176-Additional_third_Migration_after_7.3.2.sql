@NRTRDE@update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='VPMN, NETWORK_ID' where id =514 ;
@NRTRDE@@VOICE@update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='VPMN, NETWORK_ID' where id =121 ;
@NRTRDE@@GPRS@update expandable_field_maps set SOURCE_KEY='VPMN, NETWORK_ID', DEST_KEY='VPMN, NETWORK_ID' where id =125;
update accumulation_field_units set IS_NETWORK_SPECIFIC = 1 where ACCUMULATION_FIELD_ID = 17 ;

insert into table_names values(TABLE_NAMES_SEQ.nextval, 'zone_codes', 'Zone Codes', 'zone_codes.ctl', 'default_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'time_zone_rate_types', 'Time Zone Rate Types', 'time_zone_rate_types.ctl', 'default_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'sdr_rates', 'Sdr Rates','sdr_rates_tmp.ctl', 'sdr_rates_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rate_types', 'Rate Types', 'rate_types.ctl', 'default_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rater_special_numbers_tmp', 'Rater Special Numbers', 'rater_special_numbers_tmp.ctl', 'rater_special_numbers_loader.sh');
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rate_plans', 'Rate Plans', 'rate_plans.ctl', 'default_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'rate_per_calls', 'Rate Per Calls', 'rate_per_calls.ctl', 'default_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'org_dest_links', 'Origination Destination Links', 'org_dest_links.ctl', 'default_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'free_numbers_tmp', 'Free Numbers', 'free_numbers_tmp.ctl', 'free_number_loader.sh') ;
insert into table_names values(TABLE_NAMES_SEQ.nextval, 'default_rates', 'Default Rates', 'default_rates.ctl', 'default_loader.sh') ;
