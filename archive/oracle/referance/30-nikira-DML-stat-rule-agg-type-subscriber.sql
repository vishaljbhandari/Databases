
spool nikira-DML-stat-rule-agg-type-subscriber.log
set feedback off;
set serveroutput off ;

insert into profile_field_entities(id, description, record_config_id, field_id, element_datastream_ids, element_pseudofunction_ids) values(2, 'Subscriber', 3, 47, '1,2,7', '1,2,3,4,5,6,39,40,48') ;

commit ;

