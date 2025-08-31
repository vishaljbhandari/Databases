spool nikira-DML-not-rtf.log
set feedback off ;
set serveroutput off ;

insert into configurations(id, config_key, value) values(configurations_seq.nextval,'IS_RTF_ENABLED','0') ;
commit ;

