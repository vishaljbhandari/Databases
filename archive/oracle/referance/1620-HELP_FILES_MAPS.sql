spool HELP_FILES_MAPS.log



update HELP_FILES_MAPS  set help_file = 'editing_internal_user_configuration.htm' where  KEY = 'E_FINGERPRINT_CFG_EDIT_IU' ;
---------------------------insert statements ---------------
insert into HELP_FILES_MAPS(help_file,id,key) values ('change_decision_alad.htm',HELP_FILES_MAPS_SEQ.nextval,'CHANGE_DECISION');
---------------------------insert statements ---------------
insert into HELP_FILES_MAPS(help_file,id,key) values ('editing_account_configuration.htm',HELP_FILES_MAPS_SEQ.nextval,'E_FINGERPRINT_CFG_EDIT_ACC');
---------------------------insert statements ---------------
insert into HELP_FILES_MAPS(help_file,id,key) values ('home_page_subscriber_config_hpgs.htm',HELP_FILES_MAPS_SEQ.nextval,'E_FINGERPRINT_CFG_SHOW_ACC');

insert into HELP_FILES_MAPS(help_file,id,key) values ('visualization_overview.htm',HELP_FILES_MAPS_SEQ.nextval,'LINK_ANALYSIS');
spool off ;
