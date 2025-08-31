spool USER_OPTIONS.log

---------------------------insert statements ---------------
insert into USER_OPTIONS(is_read_only,role_id,is_enabled,id,value,user_id,option_id) values ('0','0','1',USER_OPTIONS_SEQ.nextval,'0','radmin','AccountManualProfileMatchRuleID');
---------------------------insert statements ---------------
insert into USER_OPTIONS(is_read_only,role_id,is_enabled,id,value,user_id,option_id) values ('0','1','1',USER_OPTIONS_SEQ.nextval,'0','default','AccountManualProfileMatchRuleID');
---------------------------insert statements ---------------
insert into USER_OPTIONS(is_read_only,role_id,is_enabled,id,value,user_id,option_id) values ('0','2','1',USER_OPTIONS_SEQ.nextval,'0','system','AccountManualProfileMatchRuleID');
---------------------------insert statements ---------------
insert into USER_OPTIONS(is_read_only,role_id,is_enabled,id,value,user_id,option_id) values ('0','2','1',USER_OPTIONS_SEQ.nextval,'0','nadmin','AccountManualProfileMatchRuleID');
spool off ;
