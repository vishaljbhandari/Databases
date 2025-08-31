spool ranger-counter_map_entries.log 
set feedback off;
set serveroutput off ;

--Generic Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,1
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id not in (4,5,6 ,7,15,14,17,24, 25, 27)
                             and record_configs.tname in ('CDR','RECHARGE_LOG','GPRS_CDR')) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,2,3,2,1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,3,3,2,1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,4,3,2,1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,7,3,2,1) ;

--Velocity Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,5
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (4)
                             and record_configs.tname in ('CDR','RECHARGE_LOG','GPRS_CDR', 'ADJUSTMENT_LOGS', 'CRM_LOGS') ) ;

--Percall and Service Violation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,6
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (5,6)
                             and record_configs.tname in ('CDR','RECHARGE_LOG','GPRS_CDR', 'ADJUSTMENT_LOGS', 'CRM_LOGS')) ;

--Overlap Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,4
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (7)
                             and record_configs.tname in ('CDR','RECHARGE_LOG','GPRS_CDR', 'ADJUSTMENT_LOGS', 'CRM_LOGS') ) ;

--Distinct Destionation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,7
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (15)
                             and record_configs.tname in ('CDR','RECHARGE_LOG','GPRS_CDR', 'ADJUSTMENT_LOGS', 'CRM_LOGS') ) ;

--Invalid Subscriber Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval, 2,record_configs.id, functions.id, 8
                            from functions,record_configs
                             where functions.id in (14 )
                             and record_configs.tname in ('CDR','GPRS_CDR') ) ;

--Profile Counter - Subscriber
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
	(select counter_maps_seq.nextval, 16, record_configs.id, functions.id, 11 
		from functions, record_configs
       where functions.id in (24, 25)
			and record_configs.tname in ('CDR','GPRS_CDR', 'RECHARGE_LOG', 'SUBSCRIBER', 'ACCOUNT') ) ;


-- Profile Field Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,12
                            from field_categories,functions,record_configs
                             where field_categories.category like '%PFOFILE_FIELD_AGGR_TYPE%'
                             and functions.id in (1, 2, 3)
                             and record_configs.tname in ('CDR','RECHARGE_LOG','GPRS_CDR')) ;

--To Support Subscriber for Dispatcher BenchMark Rule
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
	(select counter_maps_seq.nextval, field_categories.id, 3, 0, 1 from field_categories
			where field_categories.category like '%AGGREGATION_TYPE%') ;

--To make suspicious recharge and odd value top up for recharge log to use percall counter  
update counter_maps set COUNTER_TYPE=6 where RECORD_CONFIG_ID=2 and FUNCTION_ID in(12,13) ;


commit ;

