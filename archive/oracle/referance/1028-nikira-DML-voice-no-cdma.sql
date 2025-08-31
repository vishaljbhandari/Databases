spool nikira-DML-cdma.log
set feedback off ;
set serveroutput off ;
----Cleanup Package Configurations---
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'INSTALLATION.CDMA','0');

commit ;

