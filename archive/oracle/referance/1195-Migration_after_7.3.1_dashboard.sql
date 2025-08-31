set feedback off ;
set serveroutput on ;
spool Migration_after_7.3.1_dashboard.log
update DASHBOARD_SERVER set DER_NAME='ROC Fraud Management Server' where DER_ID=3;
@ ../dashboard.sql
commit;
