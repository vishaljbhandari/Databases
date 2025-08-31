spool FP_ENTITIES.log



update FP_ENTITIES  set entity_type = 24,category = 'FP_SR',display_record_view_id = 4098,ondemand_index_category_id = 7,field_id = 1,reference_category_id = 24 where  DESCRIPTION = 'Account' ;
---------------------------insert statements ---------------
insert into FP_ENTITIES(entity_type,where_clause,record_view_config_id,category,record_config_id,display_record_view_id,ondemand_index_category_id,field_id,id,description,element_datastream_ids,element_pseudofunction_ids,indexed_column,reference_category_id,instance_key) values ('6011','1=1',3,'SR_ONLY',3,0,0,0,6011,'Subscriber UID','1,2,7,505','1,2,3,4,5,6,39,40,48,50,51,52','ID',0,'');
spool off ;
