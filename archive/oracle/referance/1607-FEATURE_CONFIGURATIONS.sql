spool FEATURE_CONFIGURATIONS.log



---------------------------insert statements ---------------
insert into FEATURE_CONFIGURATIONS(name,status,id,feature_id) values ('Online_Aggregate_on_SubscriberUID',1,FEATURE_CONFIGURATIONS_SEQ.nextval,2);
---------------------------insert statements ---------------
insert into FEATURE_FP_ENTITIES_MAPS(fp_entity_id,id,feature_conf_id) values (6011,FEATURE_FP_ENTITIES_MAPS_SEQ.nextval,FEATURE_CONFIGURATIONS_SEQ.currval);
---------------------------insert statements ---------------
insert into FEATURE_CONFIGURATIONS(name,status,id,feature_id) values ('Offline_Aggregate_on_SubscriberUID',1,FEATURE_CONFIGURATIONS_SEQ.nextval,3);
---------------------------insert statements ---------------
insert into FEATURE_FP_ENTITIES_MAPS(fp_entity_id,id,feature_conf_id) values (6011,FEATURE_FP_ENTITIES_MAPS_SEQ.nextval,FEATURE_CONFIGURATIONS_SEQ.currval);
---------------------------insert statements ---------------
insert into FEATURE_CONFIGURATIONS(name,status,id,feature_id) values ('EFP_Aggregate_On_Account',0,FEATURE_CONFIGURATIONS_SEQ.nextval,4);
---------------------------insert statements ---------------
insert into FEATURE_FP_ENTITIES_MAPS(fp_entity_id,id,feature_conf_id) values (7,FEATURE_FP_ENTITIES_MAPS_SEQ.nextval,FEATURE_CONFIGURATIONS_SEQ.currval);

spool off ;
