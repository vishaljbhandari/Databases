update field_record_config_maps set FIELD_ASSOCIATION = (select field_id from field_configs where record_config_id = 2 and name = 'Account Name') where FIELD_CATEGORY_ID = 7 and RECORD_CONFIG_ID = 2;
update reference_types set DESCRIPTION = 'UID' where ID = 226 and DESCRIPTION = 'Subscriber UID';
commit ;
