spool nikira-DML-task-not-fingerprint.log
set feedback off ;
set serveroutput off ;

------- Task Entries For Life Style Profile  Start ------

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) (select tasks_seq.nextval, '4',( select id from tasks where instr(link, '/account/index/'||record_view_configs.id) =1), 'View Profile', '/lifestyle_profile/list_profile/'||id ,0 ,0 from record_view_configs where is_visible = 1 and record_config_id = 3 and id != 45) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) (select tasks_seq.nextval, '4',( select id from tasks where instr(link,'/account/index/'||record_view_configs.id) =1), 'View FraudChain', '/lifestyle_profile/list_fraud_chain/'||id ,0 ,0 from record_view_configs where is_visible = 1 and record_config_id = 3) ;

insert into tasks (ID, PACKAGE_IDS,PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '4',(select id from tasks where instr(link, '/account/index/102') =1),'View Profile','/lifestyle_profile/list_profile/102',0, 0) ; 

insert into tasks (ID, PACKAGE_IDS,PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '4',(select id from tasks where instr(link, '/account/index/102') =1),'View FraudChain','/lifestyle_profile/list_fraud_chain/102',0, 0) ;     

------- Task Entries For Life Style Profile  End ------


commit ;

