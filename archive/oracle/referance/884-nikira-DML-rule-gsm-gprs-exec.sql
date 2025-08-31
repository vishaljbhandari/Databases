spool nikira-DML-rule-gsm-gprs-exec.log
set feedback off ;
set serveroutput off ;

insert into filter_tokens(id, filter_id, expression_id, contained_filter_id) values(4, 3, 4, null) ;
commit ;

