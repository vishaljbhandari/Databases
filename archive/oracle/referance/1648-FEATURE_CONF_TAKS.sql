spool FEATURE_CONF_TAKS.log



---------------------------insert statements ---------------
insert into FEATURE_CONF_TAKS(task_id,id,feature_conf_id) values (4105,FEATURE_CONF_TAKS_SEQ.nextval,(select id from feature_configurations where name = 'EFP_Aggregate_On_Account'));
---------------------------insert statements ---------------
spool off ;
