alter table RECORD_CONFIGS drop column IS_DAY_OF_YEAR_PRESENT;
alter table RECORD_CONFIGS add IS_PARTITIONED NUMBER(1) DEFAULT 0 NOT NULL;
alter table DBWRITER_CONFIGURATIONS add RECORD_COMMIT_COUNT NUMBER(20) DEFAULT 1 NOT NULL;
alter table PREPAID_TOP_UPS drop column RECHARGE_AMOUNT;
commit;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(47,'Case Closed Alarms',23,'STATUS IN (2,4)','MODIFIED_DATE DESC', 1, 0,1, 0) ;

update configurations set value=',' where config_key='CSVFILE.DELIMITER' ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'CSVFILE.DELIMITER_REPLACE_TOKEN', '|') ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'NOTIFICATION.ENABLED', '1') ;

update notification_types set parameters='%ADDRESS% %ALERT_ID% %AGGREGATION_TYPE% %AGGREGATION_VALUE% %RULE_KEY% %SCORE% %THRESHOLD_ID%' where id=1;

update audit_log_event_codes set description = 'Rule Instance Added' where id = 100; 
update audit_log_event_codes set description = 'Rule Instance updated' where id = 101; 
update audit_log_event_codes set description = 'Rule Instance deleted' where id = 102; 
insert into audit_log_event_codes values (103, 'Rule Template Added', 'Rule Template ''$1'' was added' ) ;
insert into audit_log_event_codes values (104, 'Rule Template updated',  'Rule Template ''$1'' was updated' ) ;
insert into audit_log_event_codes values (105, 'Rule Template deleted', 'Rule Template ''$1'' was deleted' ) ;

update translations set value = 'Rule Instance Configuration' where value = 'Rule Configuration'; 
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 20,'2052', 'Rule Template Configuration') ;

update tasks set link = '/hotlist_asn_entities/move_to_asn/41' where name = 'Move To ASN'; 
update tasks set link = '/hotlist_asn_entities/move_to_ignore_list/41' where name = 'Move To Ignore List'; 
update tasks set link = '/hotlist_asn_entities/move_to_common_list/41' where name = 'Move To Common List'; 
update tasks set link = '/hotlist_asn_entities/remove_from_asn/42' where name = 'Remove From ASN'; 

update tasks set link = '/roc_profile/view_roc_profile/3' where link = '/account/view_roc_profile/3' ;
update tasks set link = '/roc_profile/view_roc_profile/12' where link = '/account/view_roc_profile/12' ;
update tasks set link = '/lifestyle_profile/list_fraud_chain/3' where link = '/account/list_fraud_chain/3' ;
 	
update record_configs set is_partitioned = 1 where id = 1;
update record_configs set is_partitioned = 1 where id = 2;
update record_configs set is_partitioned = 1 where id = 7;

delete from configurations where config_key = 'CDR.RECORD.TRANSACTION.COUNT';
delete from configurations where config_key = 'GPRS.RECORD.TRANSACTION.COUNT';

update reports set name = 'AlertSummaryForAGroup' where name = 'AlertSummaryForAGroupForSubscriber';
update reports set display_name = 'International To Local and Long Distance Outgoing Ratio' where name = 'InternationalToLocalAndLongDistanceOutgoingRatio';


insert into translation_indices(id, description) values (61,'Voice Service Types') ;

insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 61, '-176', 'select id as Key, country_code as Value from rater_country_codes');

update tasks set parent_id = (select id from tasks where name ='Add Nick Name Details') where name = 'Upload Nick Name Details';

insert into tasks values (tasks_seq.nextval, GetParentID('ASN Management'), 'Remove From ASN', '/hotlist_asn_entities/remove_from_asn/41', 0, 0) ;


insert into tasks values (tasks_seq.nextval, (select id from tasks where name = 'Account View' and parent_id = parentid),'Modify Subscriber Precheck Entry','/account/edit',0, 0) ;
insert into tasks values (tasks_seq.nextval, (select id from tasks where name = 'Account View' and parent_id = parentid),'Delete Subscriber Precheck Entry','/account/destroy',0, 0) ;

commit;
quit;
