update configurations set value='0,2' where config_key='CLUCENE_GENERATION.SUBSCRIBER_TYPE' ;
update field_configs set ds_category=replace(ds_category,'SMM.PRECHECK','') where record_config_id=3 and field_id=12 ;
update hotlist_groups set name='Suspected' , description='Suspected FCN' where id=2 ;
commit;
exit;
/
