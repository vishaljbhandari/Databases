spool nikira-DML-voice-pstn.log
set serveroutput off ;
set feedback off ;

insert into configurations (id, config_key, value) values (configurations_seq.nextval,'INSTALLATION.FIXED','1');
commit ;

