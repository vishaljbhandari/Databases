SPOOL nikira-DDL-db-control-panel.sql.log 
SET FEEDBACK OFF;
set serveroutput off ;

CREATE TABLE CONTROL_PANEL_METRIC_INFO (
	ID                  NUMBER(10,0)	NOT NULL,
	KEY_NAME            VARCHAR2(256)	NOT NULL,
	CATEGORY            VARCHAR2(256)	NOT NULL,
	GROUP_INFO          VARCHAR2(256),
	TAG_INFO            VARCHAR2(256),
	TRIGGER_INFO        VARCHAR2(256)
) ;


commit;
spool off
