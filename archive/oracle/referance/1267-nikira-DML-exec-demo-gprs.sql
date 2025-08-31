spool nikira-DML-exec-demo-gprs.log
set feedback off ;
set serveroutput off ;
-- Generated from ./ranger-gprs-exec-demo.sql.in by setup.sh at Wed Mar 10 14:27:35 UTC 2010

-- ****** GPRS Services ******
insert into SERVICE (ID, DESCRIPTION) values (128, 'MMS Incoming');
insert into SERVICE (ID, DESCRIPTION) values (256, 'MMS Outgoing');
insert into SERVICE (ID, DESCRIPTION) values (512, 'GPRS Data');

delete from cause_for_session_closing ;

insert into cause_for_session_closing values (0, 'Normal Release') ;
insert into cause_for_session_closing values (4, 'Abnormal Release') ;
insert into cause_for_session_closing values (5, 'CAMEL Init call Release') ;
insert into cause_for_session_closing values (16, 'Volume Limit') ;
insert into cause_for_session_closing values (17, 'Time Limit') ;
insert into cause_for_session_closing values (18, 'SGSN Change') ;
insert into cause_for_session_closing values (19, 'Max Change') ;
insert into cause_for_session_closing values (20, 'Management Intervention') ;

commit ;

