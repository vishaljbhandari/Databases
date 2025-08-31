SPOOL MIGRATION14032007;

delete from DATE_FORMATTER where FORMATTER_NAME = 'DD_MM_YYYY' ;
insert into DATE_FORMATTER (FORMATTER_NAME,INPUT_FORMAT,OUTPUT_FORMAT) values ('DD_MM_YYYY','%d%m%Y','%Y/%m/%d 00:00:00');

delete from ASCII_DELIMITED_FIELD_INFO where  PARSER_NAME = 'GBXUS_SUB_PARSER' and  FIELD_POSITION in (4,30) ;
insert into ASCII_DELIMITED_FIELD_INFO (PARSER_NAME,FIELD_POSITION,FIELD_NAME) values ('GBXUS_SUB_PARSER',4,'ACCOUNT_DATE_OF_ACTIVATION');
insert into ASCII_DELIMITED_FIELD_INFO (PARSER_NAME,FIELD_POSITION,FIELD_NAME) values ('GBXUS_SUB_PARSER',30,'DATE_OF_ACTIVATION');

delete  from FORMATTER where DATASOURCE_NAME = 'GBXUS_SUBSCRIBERDS' and FIELD_NAME = 'OPTIONAL_FIELD3' ;
insert into FORMATTER (DATASOURCE_NAME,FIELD_NAME,SEQUENCE,FORMATTER_TYPE,FORMATTER_NAME) values ('GBXUS_SUBSCRIBERDS','ACCOUNT_DATE_OF_ACTIVATION',1,4,'DD_MM_YYYY');


-- If DATE_OF_ACTIVATION is empty then replace that with ACCOUNT_DATE_OF_ACTIVATION
insert into BUSINESSRULE (DATASOURCE_NAME,SEQUENCE,BUSINESSRULE_TYPE,BUSINESSRULE_NAME,MODULE_NAME) values ('GBXUS_SUBSCRIBERDS',3,7,'NULL_DATE_OF_ACTIVATION_BR','brexpressionevaluation');
insert into EXPRESSION_RULE (BUSINESSRULE_NAME,RULE_NAME,SEQUENCE) values ('NULL_DATE_OF_ACTIVATION_BR','NULL_DATE_OF_ACTIVATION',1);
insert into EXPRESSION_CONDITIONS (RULE_NAME,SEQUENCE,COMBINING_OPERATOR,BEGIN_GROUP_IND,FIELD_NAME,FIELD_TYPE,OPERATOR,VALUE,END_GROUP_IND) values ('NULL_DATE_OF_ACTIVATION',1,null,null,'DATE_OF_ACTIVATION','C','.EQ.','',null);
insert into EXPRESSION_EVALUATION_ACTIONS (RULE_NAME,EVALUATION_CONDITION,FIELD_NAME,VALUE) values ('NULL_DATE_OF_ACTIVATION','IF','DATE_OF_ACTIVATION','{ACCOUNT_DATE_OF_ACTIVATION}');

delete from VALIDATOR where DATASOURCE_NAME = 'GBXUS_SUBSCRIBERDS' and FIELD_NAME = 'DATE_OF_ACTIVATION' ; 
insert into VALIDATOR (DATASOURCE_NAME,FIELD_NAME,SEQUENCE,VALIDATOR_TYPE,VALIDATOR_NAME) values ('GBXUS_SUBSCRIBERDS','ACCOUNT_DATE_OF_ACTIVATION',1,1,'NOTNULL');


-- Removed the decoding of service_type.
delete from REPLACE_FORMATTER where FORMATTER_NAME in ('GBX_SERVICE_TYPE_CLG_CARD','GBX_SERVICE_TYPE_VDED','GBX_SERVICE_TYPE_V0+', 'GBX_SERVICE_TYPE_V1+', 'GBX_SERVICE_TYPE_VCC','GBX_SERVICE_TYPE_DED', 'GBX_SERVICE_TYPE_VIP') ;

delete from FORMATTER  where FORMATTER_NAME in ('GBX_SERVICE_TYPE_CLG_CARD','GBX_SERVICE_TYPE_VDED','GBX_SERVICE_TYPE_V0+', 'GBX_SERVICE_TYPE_V1+', 'GBX_SERVICE_TYPE_VCC','GBX_SERVICE_TYPE_DED', 'GBX_SERVICE_TYPE_VIP') ;

update EXPRESSION_CONDITIONS set VALUE = 'V0+' where VALUE = 'VOIP 0+' and FIELD_NAME = 'GBX_SERVICE_TYPE' ; 
update EXPRESSION_CONDITIONS set VALUE = 'V1+' where VALUE = 'VOIP 1+' and FIELD_NAME = 'GBX_SERVICE_TYPE' ; 
update EXPRESSION_CONDITIONS set VALUE = 'VDED' where VALUE = 'VOIP Dedicated' and FIELD_NAME = 'GBX_SERVICE_TYPE' ; 
update EXPRESSION_CONDITIONS set VALUE = 'DED' where VALUE = 'Dedicated' and FIELD_NAME = 'GBX_SERVICE_TYPE' ; 
update EXPRESSION_CONDITIONS set VALUE = 'VIP' where VALUE = 'IP Addresses' and FIELD_NAME = 'GBX_SERVICE_TYPE' ; 
update EXPRESSION_CONDITIONS set VALUE = 'VCC' where VALUE = 'VOIP Calling Card' and FIELD_NAME = 'GBX_SERVICE_TYPE' ; 
update EXPRESSION_CONDITIONS set VALUE = 'ClgCard' where VALUE = 'Calling Card' and FIELD_NAME = 'GBX_SERVICE_TYPE' ; 

alter table SUBSCRIBER add RATE_PLAN VARCHAR2(64);
update field_configs set database_field = 'RATE_PLAN' where field_id = 27 and record_config_id = 3 ;
update field_configs set associated_field = '' where field_id = 27 and record_config_id = 3 ;
update field_configs set is_visible = 0 where field_id = 13 and record_config_id = 4 ;
update field_configs set is_filter = 0 where field_id = 13 and record_config_id = 4 ;

drop sequence reports_seq ;

create sequence reports_seq nomaxvalue nocycle start with 1024 ;

insert into reports (id,name,display_name,category,description,is_network_based) values (reports_seq.nextval,'serverstatus','Server Status','Summary','Server Status Report',1) ;
insert into reports (id,name,display_name,category,description,is_network_based) values (reports_seq.nextval,'AlertSummaryForAGroup','Alert Summary For A Group For Subscribers', 'Alerts','This Report shows the count of alerts for the given subscriber group',1) ;

insert into tasks values (tasks_seq.nextval, 12, 'Alert Summary For A Group For Subscribers', '', 0,0)  ;
insert into tasks values (tasks_seq.nextval, 12, 'Server Status', '', 0,0)  ;

insert into ranger_groups_tasks (task_id, ranger_group_id) select t.id,g.id from tasks t,ranger_groups g where t.name = 'Alert Summary For A Group For Subscribers' ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select t.id,g.id from tasks t,ranger_groups g where t.name = 'Server Status' ;

insert into reports (id,name,display_name,category,description,is_network_based) values (reports_seq.nextval,'CaseUserDetailsReport','Case User Details Report','Summary','This report shows Cases for a particular user',1) ;
update reports set display_name = 'Rulewise Fraud Alarm Statistics Pie' where display_name = 'Rulewise Fraud AlarmStatistics Pie';
update tasks set name = 'Rulewise Fraud Alarm Statistics Pie' where name = 'RulewisefraudAlarmStatisticsPie';
update reports set display_name = 'Rulewise Fraud Alarm Statistics Bar' where display_name = 'Rulewise FraudAlarm Statistics Bar';
update tasks set name = 'Rulewise Fraud Alarm Statistics Bar' where name = 'RulewisefraudAlarmStatisticsBar';

update reports set display_name = 'Groupwise Fraud Alarm Statistics Pie' where display_name = 'Groupwise Fraud Alarm Statistics Pie';
update tasks set name = 'Groupwise Fraud Alarm Statistics Pie' where name = 'GroupwisefraudAlarmStatisticsPie';
update reports set display_name = 'Groupwise Fraud Alarm Statistics Bar' where display_name = 'Groupwise Fraud Alarms Statistics Bar';
update tasks set name = 'Groupwise Fraud Alarm Statistics Bar' where name = 'Groupwise Fraud Alarms Statistics Bar Chart';
update reports set display_name = 'High Risk Destinations Cellsite' where display_name = 'High Risk Destinations CellSite' ;
update tasks set name = 'High Risk Destinations Cellsite' where name = 'High Risk Destinations CellSite';

insert into scheduler_command_maps (module_name, command, is_parameter_required, network_id) values ('High Risk Destination Summary', '/disk14/nikira/NikiraRoot/bin/highriskdestinationsummary.sh,HighRiskDestSummaryPid', 1, 0); 
insert into scheduler_parameters (module_name, parameter, data_type, display_name) values ('High Risk Destination Summary', 'SummaryDate', 4, 'Summary Date') ;

update scheduler_command_maps set module_name = 'Lifestyle Profile Generation For Bulk Subscriber' where module_name = 'Lifestyle Profile Generation' ;
update reports set is_schedulable = 0 ; 
update field_configs set data_type = 3, reg_exp_id = 10, translation_id = null where id = 41 and record_config_id = 1 ;
alter table alarm_comments drop column user_comment  ;
alter table alarm_comments add  user_comment varchar(256) ;
@rangerdefs.sql
@highriskdestination_summary_procedure.sql

commit ;
quit ;
