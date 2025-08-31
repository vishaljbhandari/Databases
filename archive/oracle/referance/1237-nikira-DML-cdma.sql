spool nikira-DML-cdma.log
set feedback off ;
set serveroutput off ;
----Cleanup Package Configurations---
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'INSTALLATION.CDMA','1');

insert into translations(id, tr_id, key, value) values (26, 5, '2', 'CDMA') ;

commit ;

