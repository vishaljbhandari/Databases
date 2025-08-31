update CONFIGURATIONS  set value = 'http://127.0.0.1:8080/ControlPanelWS/webservice/cp/rest/updateCheck' where  CONFIG_KEY = 'ROC_CONTROL_PANEL.URL' ;

---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values ('1','CLEANUP.MISSEDXDR.ENABLED', CONFIGURATIONS_SEQ.nextval,'N');
---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values ('1','CLEANUP.MISSEDXDR.INTERVAL_IN_DAYS', CONFIGURATIONS_SEQ.nextval,'90');

---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values ('1','GOOGLEMAP_BASE_URL', CONFIGURATIONS_SEQ.nextval,'http://maps.google.com/maps/api/js?');
---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values ('1','STREET_VIEW_PRIVATE_KEY', CONFIGURATIONS_SEQ.nextval,'xxx');
---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values ('1','VISUALIZATION_SESSION_COUNT', CONFIGURATIONS_SEQ.nextval,'10');
---------------------------insert statements ---------------
insert into CONFIGURATIONS(is_visible,config_key,id,value) values ('1','VISUALIZATION_THRESHOLD_COUNT', CONFIGURATIONS_SEQ.nextval,'30000');


insert into DURATION_TYPES(name,type_id,priority) values ('Call Collision','-6','6');

update translations set value = 'select id as Key, description as Value from SERVICE_NUMBER_TYPES where id != 0 and status = 1' where tr_id =(select id from translation_indices where description ='Service Number Type For Subscriber');

update translations set value = 'select id as Key, description as Value from SERVICE_NUMBER_TYPES where status = 1' where tr_id =(select id from translation_indices where description ='Service Number Type');

update THRESHOLDS  set duration_type_id = '-6',duration = '5'  where  RULE_VERSION = '0' and RULE_KEY = '3711' and AGGREGATION_TYPE = '2' and THRESHOLD_ID = '0';

update THRESHOLDS  set duration_type_id = '-6',duration = '5'  where  RULE_VERSION = '0' and RULE_KEY = '3732' and AGGREGATION_TYPE = '2' and THRESHOLD_ID = '0';


insert into SCHEDULER_COMMAND_MAPS(command,job_name,is_network_based,is_mandatory,is_parameter_required) values ('cleanup_missed_xdr.rb,CleanupMissedXdrPID','Missed XDR Cleanup','0','1','0');

insert into COUNTER_MANAGER_MAPPINGS(counter_type_id,record_config_id,counter_detail_id,aggregation_type_id,rule_mode) values ('12','3','102','6014','0');

---------------------------insert statements ---------------
insert into FEATURE_TASK_MAPS(task_id,id,feature_id) values ('38', FEATURE_TASK_MAPS_SEQ.nextval,'1');
---------------------------insert statements ---------------
insert into FEATURE_TASK_MAPS(task_id,id,feature_id) values ('55', FEATURE_TASK_MAPS_SEQ.nextval,'1');

---------------------------delete statements ---------------
delete from RECORD_CONFIG_TASK_MAPS where  record_config_id = '70' and task_id = '12' and id = '9' ;

---------------------------delete statements ---------------
delete from FEATURE_PSEUDO_FUNCTN_MAPS where  id = '2' and pseudo_function_id = '26' and feature_id = '7' ;

commit;
