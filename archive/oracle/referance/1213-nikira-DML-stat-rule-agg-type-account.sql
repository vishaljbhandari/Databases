spool nikira-DML-stat-rule-agg-type-account.log

set feedback off;
set serveroutput off ;

insert into fp_entities(id, entity_type, description, record_view_config_id, display_record_view_id, field_id,record_config_id,instance_key,ONDEMAND_INDEX_CATEGORY_ID,REFERENCE_CATEGORY_ID, element_datastream_ids, element_pseudofunction_ids, category) values(7,7,'Account',4,0,0,4,'',0,0,'1,2,7','1,2,3,4,5,6,39,40,48,50,51,52', 'SR_ONLY') ;

insert into PROFILE_USER_CONFIGS (entity_type,PROFILE_USER_TYPE,GRANULE_RUN_INTERVALS) values (7,1,1) ; 

commit ;

