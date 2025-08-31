spool nikira-DML-stat-rule-agg-type-other-party-number.log

set feedback off;
set serveroutput off ;

insert into fp_entities(id, entity_type, description, record_view_config_id, display_record_view_id, field_id,record_config_id,instance_key,ONDEMAND_INDEX_CATEGORY_ID,REFERENCE_CATEGORY_ID, element_datastream_ids, element_pseudofunction_ids, category) values(44,44,'OtherParty Number',201,0,0,201,'',0,0, '1', '1,2,6,40,47,50,51,52', 'SR_ONLY') ;

insert into PROFILE_USER_CONFIGS (entity_type,PROFILE_USER_TYPE,GRANULE_RUN_INTERVALS) values (44,1,1) ; 

commit ;


