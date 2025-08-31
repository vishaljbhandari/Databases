
SET FEEDBACK OFF
SET VERIFY   OFF

SET TRIMSPOOL ON

SPOOL dbschema_&1

SELECT SUBSTR (RPAD (TO_CHAR (SYSDATE, 'mm/dd/yyyy hh24:mi:ss'), 25), 1, 25) 
       "REPORT DATE AND TIME"
FROM   SYS.dual;

COL local_schema  FORMAT a35 TRUNC HEADING "LOCAL SCHEMA"

SET PAGESIZE  9999
SET LINESIZE  750
SET FEEDBACK  1

SET TERMOUT OFF

PROMPT

REM Object differences
REM ==================

----COL object_name FORMAT a30

PROMPT SUMMARY OF OBJECTS IN SCHEMA

SELECT   object_type, COUNT (*)
FROM
(
SELECT   object_type,
         DECODE (object_type, 
                 'INDEX', DECODE (SUBSTR (object_name, 1, 5), 
                                  'SYS_C', 'SYS_C', object_name), 
                 'LOB',   DECODE (SUBSTR (object_name, 1, 7),
                                  'SYS_LOB', 'SYS_LOB', object_name),
                 object_name)
FROM     user_objects
)
GROUP BY object_type
ORDER BY object_type;

PROMPT TABLES IN THE SCHEMA

----SELECT   table_name, column_name, data_type, data_length,default_length
SELECT   table_name, column_name, data_type , data_length
FROM      user_tab_columns;

REM Index differences
REM =================

PROMPT INDEXES IN THE SCHEMA

SELECT  table_name, index_name, column_name, column_position 
FROM user_ind_columns;

------COL column_position FORMAT 999  HEADING ORDER
SPOOL OFF

SPOOL tables_&1
SET HEADING OFF
	SELECT table_name, num_rows FROM user_tables ORDER BY table_name;
SPOOL OFF

SPOOL indexes_&1
SET HEADING OFF
	SELECT  index_name FROM user_indexes;
SPOOL OFF

SPOOL views_&1
SET HEADING OFF
    SELECT view_name FROM user_views;
SPOOL OFF

SPOOL sequences_&1
SET HEADING OFF
    SELECT  sequence_name FROM user_sequences;
SPOOL OFF

SPOOL tablespaces_&1
SET HEADING OFF
	SELECT tablespace_name FROM dba_tablespaces order by tablespace_name; 
SPOOL OFF

SPOOL obj_partitions_&1
SET HEADING OFF
	SELECT object_name,subobject_name FROM user_objects WHERE object_type = 'TABLE PARTITION' order by object_name ;
SPOOL OFF

SPOOL obj_subpartitions_&1
SET HEADING OFF
    SELECT object_name,subobject_name FROM user_objects WHERE object_type = 'TABLE SUBPARTITION' order by object_name;
SPOOL OFF

SPOOL partitions_&1
SET HEADING OFF
    SELECT unique(object_name) FROM user_objects WHERE object_type = 'TABLE PARTITION' order by object_name;
SPOOL OFF

SPOOL subpartitions_&1
SET HEADING OFF
    SELECT unique(object_name) FROM user_objects WHERE object_type = 'TABLE SUBPARTITION' order by object_name;
SPOOL OFF

SPOOL obj_procedures_&1
SET HEADING OFF
    SELECT object_name, procedure_name  FROM user_procedures order by object_name;
SPOOL OFF

SPOOL procedures_&1
SET HEADING OFF
    SELECT unique(object_name) FROM user_procedures ORDER BY object_name;
SPOOL OFF

SPOOL obj_tables_&1
SET HEADING OFF
	SELECT tablespace_name, table_name FROM user_tables ORDER BY tablespace_name;
SPOOL OFF

SPOOL packages_&1
SET HEADING OFF
	SELECT object_name FROM user_objects WHERE object_type ='PACKAGE' ORDER BY object_name;
SPOOL OFF

SPOOL functions_&1
SET HEADING OFF
	SELECT object_name FROM  user_objects WHERE object_type ='FUNCTION' ORDER BY object_name;
SPOOL OFF

SPOOL obj_ts_partn_name_&1
SET HEADING OFF
	SELECT tablespace_name, partition_name FROM user_tab_partitions WHERE table_name in (SELECT table_name FROM user_tables) ORDER BY tablespace_name;
SPOOL OFF

SPOOL obj_ts_sub_partn_name_&1
SET HEADING OFF
    SELECT tablespace_name, subpartition_name FROM user_tab_subpartitions WHERE table_name in (SELECT table_name FROM user_tables) ORDER BY tablespace_name;
SPOOL OFF

SPOOL user_privs_&1
SET HEADING ON
	SELECT grantee, privilege,owner, table_name  FROM dba_tab_privs  WHERE grantee = upper('&_USER') ORDER BY grantee, owner, table_name, privilege;
SPOOL OFF

SPOOL user_roles_&1
SET HEADING ON
	SELECT * FROM dba_role_privs WHERE grantee = upper('&_USER') ORDER BY grantee, granted_role, admin_option, default_role;
SPOOL OFF

EOF

EXIT
