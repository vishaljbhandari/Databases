spool nikira-DDL-rtf-db-1.log
set feedback off ;
set serveroutput off ;

--Used to map NFR/FRD as entity groups--

CREATE TABLE RTF_ENTITY_GROUPS(
        ID                                      NUMBER(20) NOT NULL,
        NAME                            VARCHAR2(256),
        ENTITY_TYPE             NUMBER(20),
        DATASET_TYPE            NUMBER(20),
        GROUP_REFERENCE         NUMBER(20),
        CONSTRAINT PK_ENTITY_GRP_ID PRIMARY KEY(ID)
) ;

--Details of datasets used in RTF--

CREATE TABLE RTF_DATASET_TYPES(
        ID                      NUMBER(20) NOT NULL,
        NAME                                    VARCHAR2(256),
        DESCRIPTION                             VARCHAR2(1024),
        SHOW_DATE_COMPONENT             NUMBER(2),
        CONSTRAINT PK_DTST_TYP_ID PRIMARY KEY(ID)
) ;

--configurations per datastream, show_date_component indicates whether date component will be displayed in test configuration screen or not.

CREATE TABLE RTF_DS_INFO(
        RECORD_CONFIG_ID        NUMBER(20),
        SHOW_DATE_COMPONENT             NUMBER(2)
) ;

--contains group count per group per dataset type for different entities (account / subscriber)

CREATE TABLE RTF_ENTITY_GROUP_SUMMARY (
        GROUP_ID                        NUMBER(20) NOT NULL,
        GROUP_COUNT             NUMBER(20) NOT NULL,
        RECORD_CONFIG_ID        NUMBER(20),
        DATASET_TYPE            NUMBER(20)
) ;

--group map table used in random sample generation. indicates which entity belongs to which group.
commit;
spool off

