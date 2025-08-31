spool nikira-DML-counter-map-entries-recharge.log
set feedback off ;
set serveroutput off ;
--ranger-counter_map_entries.sql----
--To make suspicious recharge and odd value top up for recharge log to use percall counter
update counter_maps set COUNTER_TYPE=6 where RECORD_CONFIG_ID=2 and FUNCTION_ID in(12,13) ;

----ranger-counter_map_entries.sql----------
--Generic Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,1
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id not in (4,5,6 ,7,15,14,17,24, 25, 27,30)
                             and record_configs.tname = 'RECHARGE_LOG');

--Velocity Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,5
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (4)
                             and record_configs.tname = 'RECHARGE_LOG');
--Percall and Service Violation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,6
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (5,6)
                             and record_configs.tname = 'RECHARGE_LOG');
--Overlap Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,4
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (7)
                             and record_configs.tname = 'RECHARGE_LOG');
--Distinct Destionation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,7
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (15)
                             and record_configs.tname = 'RECHARGE_LOG');
--Profile Counter - Subscriber
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
        (select counter_maps_seq.nextval, 16, record_configs.id, functions.id, 11
                from functions, record_configs
       where functions.id in (24, 25)
                        and record_configs.tname = 'RECHARGE_LOG');

-- Profile Field Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,12
                            from field_categories,functions,record_configs
                             where field_categories.category like '%PFOFILE_FIELD_AGGR_TYPE%'
                             and functions.id in (1, 2, 3)
                             and record_configs.tname = 'RECHARGE_LOG');


commit ;

