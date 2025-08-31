spool nikira-DML-counter-map-entries-subscriber.log
set feedback off ;
set serveroutput off ;
----ranger-counter_map_entries.sql----
--To Support Subscriber for Dispatcher BenchMark Rule
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
        (select counter_maps_seq.nextval, field_categories.id, 3, 0, 1 from field_categories
                        where field_categories.category like '%AGGREGATION_TYPE%') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,
2,3,2,1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,
3,3,2,1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,
4,3,2,1) ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values(counter_maps_seq.nextval,
7,3,2,1) ;
--Profile Counter - Subscriber
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
        (select counter_maps_seq.nextval, 16, record_configs.id, functions.id, 11
                from functions, record_configs
       where functions.id in (24, 25)
                        and record_configs.tname = 'SUBSCRIBER');


commit ;

