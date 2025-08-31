spool nikira-DML-db-stats_online.log
SET FEEDBACK OFF;
set serveroutput off ;

insert into configurations values(configurations_seq.nextval, 'STATS_RULE_ONLINE.DEFAULT_ELEMENT_DURATION', '86400', 1) ;
insert into configurations values(configurations_seq.nextval, 'STATISTICAL_ONLINE_GRANULE_SIZE', '7200', 1) ;
commit ;
spool off ;
