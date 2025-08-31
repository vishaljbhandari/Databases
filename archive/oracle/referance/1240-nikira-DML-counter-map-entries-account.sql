spool nikira-DML-counter-map-entries-account.log
set feedback off ;
set serveroutput off ;
--ranger-counter_map_entries.sql---
--Profile Counter - Subscriber
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
        (select counter_maps_seq.nextval, 16, record_configs.id, functions.id, 11
                from functions, record_configs
       where functions.id in (24, 25)
                        and record_configs.tname = 'ACCOUNT') ;

commit ;

