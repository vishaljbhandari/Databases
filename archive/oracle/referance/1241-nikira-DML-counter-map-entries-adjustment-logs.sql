spool nikira-DML-counter-map-entries-adjustment-logs.log
set feedback off ;
set serveroutput off ;
---ranger-counter_map_entries.sql---
--Velocity Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,5
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (4)
                             and record_configs.tname = 'ADJUSTMENT_LOGS');
--Percall and Service Violation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,6
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (5,6)
                             and record_configs.tname = 'ADJUSTMENT_LOGS');
--Overlap Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,4
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (7)
                             and record_configs.tname = 'ADJUSTMENT_LOGS');
--Distinct Destionation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,7
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (15)
                             and record_configs.tname = 'ADJUSTMENT_LOGS');
commit ;

