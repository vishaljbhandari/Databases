spool nikira-DML-counter-map-entries-gprs.log
set feedback off ;
set serveroutput off ;
--------ranger-counter_map_entries.sql-----
--Generic Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,1
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id not in (4,5,6 ,7,15,14,17,24, 25, 27,30)
                             and record_configs.tname = 'GPRS_CDR') ;

--Velocity Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,5
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (4)
                             and record_configs.tname = 'GPRS_CDR');

--Percall and Service Violation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,6
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (5,6)
                             and record_configs.tname = 'GPRS_CDR');
--Overlap Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,4
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (7)
                             and record_configs.tname = 'GPRS_CDR');
--Distinct Destionation Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,7
                            from field_categories,functions,record_configs
                             where field_categories.category like '%AGGREGATION_TYPE%'
                             and functions.id in (15)
                             and record_configs.tname = 'GPRS_CDR');
--Invalid Subscriber Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval, 2,record_configs.id, functions.id, 8
                            from functions,record_configs
                             where functions.id in (14 )
                             and record_configs.tname = 'GPRS_CDR' ) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval, 4,record_configs.id, functions.id, 8
                            from functions,record_configs
                             where functions.id in (14 )
                             and record_configs.tname = 'GPRS_CDR' ) ;
--Profile Counter - Subscriber
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
        (select counter_maps_seq.nextval, 16, record_configs.id, functions.id, 11
                from functions, record_configs
       where functions.id in (24, 25)
                        and record_configs.tname = 'GPRS_CDR');
-- Profile Field Counter
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type)
                        (select counter_maps_seq.nextval,field_categories.id,record_configs.id,functions.id,12
                            from field_categories,functions,record_configs
                             where field_categories.category like '%PFOFILE_FIELD_AGGR_TYPE%'
                             and functions.id in (1, 2, 3)
                             and record_configs.tname = 'GPRS_CDR') ;


commit ;

