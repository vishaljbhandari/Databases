
spool nikira-DML-stat-rule-agg-type-imei.log
set feedback off;
set serveroutput off ;
insert into profile_field_entities(id, description, record_config_id, field_id, element_datastream_ids, element_pseudofunction_ids) values(3, 'IMEI', 202, 0, '1,7', '1,2,3,4,5,6,39,40') ;

commit ;

