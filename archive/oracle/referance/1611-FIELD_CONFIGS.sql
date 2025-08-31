spool FIELD_CONFIGS.log



update FIELD_CONFIGS  set reg_exp_id = '15' where  FIELD_ID = '51' and RECORD_CONFIG_ID = '3' ;
update FIELD_CONFIGS  set reg_exp_id = '15' where  FIELD_ID = '51' and RECORD_CONFIG_ID = '98' ;
update FIELD_CONFIGS  set reg_exp_id = '15' where  FIELD_ID = '45' and RECORD_CONFIG_ID = '130' ;
update FIELD_CONFIGS  set reg_exp_id = '15' where  FIELD_ID = '51' and RECORD_CONFIG_ID = '4' ;
update FIELD_CONFIGS  set reg_exp_id = '15' where  FIELD_ID = '51' and RECORD_CONFIG_ID = '99' ;
---------------------------delete statements ---------------
delete from FIELD_CONFIGS where  is_visible = 1 and database_field is null and name = 'OtherPartyNumber' and ds_category is null and query_field is null and record_config_id = 1 and field_id = 26 and is_encrypted = 0 and data_type = 3 and associated_field is null and is_case_sensitive = 0 and is_filter = 0 and live_tree_ds is null and reg_exp_id = 1 and position = 0 and derivative_function = '11' and is_expandable = 0 and translation_id is NULL and width = 32 ;
spool off ;
