spool 7.0-migration.log

delete from translations where tr_id = 16 and key = '3' ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 16, 3, 'Reversal') ;

delete from analyst_actions_rules where analyst_action_id in (76, 77, 78, 79, 80, 81, 82, 83, 84) ;
delete from analyst_actions_networks where analyst_action_id in (76, 77, 78, 79, 80, 81, 82, 83, 84) ;
delete from analyst_actions where id in (76, 77, 78, 79, 80, 81, 82, 83, 84) ;

drop SEQUENCE ANALYST_ACTIONS_SEQ ;
CREATE SEQUENCE ANALYST_ACTIONS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 START WITH 100 NOCYCLE CACHE 20 ORDER ;

insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (76, 'Bar International Calling', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (77, 'Bar Outgoing', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (78, 'Bar Roaming', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (79, 'Check Documentation', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (80, 'Check Hotlisted Calls', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (81, 'Check Outgoing Call Volume', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (82, 'Check Subscriber Info', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (83, 'No Action', 'RECOMMENDED_ACTION', '', '', 1,1)  ;
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible) values (84, 'Refer to Collections', 'RECOMMENDED_ACTION', '', '', 1,1)  ;

insert into analyst_actions_networks(analyst_action_id, network_id) (select a.id, n.id from  analyst_actions a, networks n where a. id 
						in (76, 77, 78, 79, 80, 81, 82, 83, 84)) ;

insert into analyst_actions_rules(rule_id, analyst_action_id) (select r.id, a.id from rules r, analyst_actions a where r.category = 'CRMI_ALARM_RULES'
                      and a.category like '%RECOMMENDED_ACTION%' and a.id in (76, 77, 78, 79, 80, 81, 82, 83, 84)) ;

alter table EXPRESSIONS modify RIGHT_FIELD null;
alter table alarm_comments drop constraint FK_AL_CMNTS_US_ID ;

drop index IX_MA_DE_FIELD_ID_MATCH_ID ;
CREATE INDEX IX_MA_DE_FIELD_ID_MATCH_ID ON MATCHED_DETAILS(FIELD_ID, MATCHED_RESULTS_ID) ;


-- Entries for Prepaid Topups
alter table PREPAID_TOP_UPS modify RECHARGE_TYPE NUMBER(2) DEFAULT 1;

insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 17, '3', 'Electronic Recharge') ;

insert into field_configs(id, record_config_id, name,database_field, position, is_visible,
                            data_type, field_id, is_filter, width, translation_id)
    values (FIELD_CONFIGS_SEQ.nextval, 60, 'Recharge Type', 'RECHARGE_TYPE', 6, 1, 1, 7, 1, 2, 17) ;

CREATE OR REPLACE VIEW PREPAID_TOP_UPS_V AS
(
    SELECT PTU.ID, PTU.RATE_PLAN, PTU.MIN_AMOUNT, PTU.MAX_AMOUNT, PTU.DESCRIPTION, JOINMANYROWSIN1(NPTU.NETWORK_ID) AS NETWORK, PTU.RECHARGE_TYPE
    FROM PREPAID_TOP_UPS PTU, NETWORKS_PREPAID_TOP_UPS NPTU
    WHERE PTU.ID = NPTU.PREPAID_TOP_UP_ID
    GROUP BY PTU.ID, PTU.RATE_PLAN, PTU.MIN_AMOUNT, PTU.MAX_AMOUNT, PTU.DESCRIPTION, PTU.RECHARGE_TYPE
) ;

insert into field_categories(id, name, category, data_type) values(2077, 'Recharge Type', '', 1);

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (field_record_config_map_seq.nextval, 2077, 2, '4') ;

insert into translation_indices(id, description) values (98,'Recharge Type') ;

insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '1', 'Voucher Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '2', 'Manual Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '3', 'Electronic Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '4', 'Reversal Recharge') ;
insert into translations(id, tr_id, key, value) values(translations_seq.nextval, 98, '5', 'Unknown Recharge') ;

update field_configs set translation_id = 98 where RECORD_CONFIG_ID = 2 and translation_id = 17 ;

commit ;

quit ;
spool off ;
