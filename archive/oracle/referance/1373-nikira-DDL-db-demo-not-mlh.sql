spool nikira-DDL-db-demo-not-mlh.log
set feedback off ;
set serveroutput off ;

CREATE OR REPLACE VIEW SUBSCRIBER_MLH
AS
SELECT S.*, 0 as PARENT_ID, 0 as HIERARCHY_ID
FROM SUBSCRIBER S ;

commit ;

