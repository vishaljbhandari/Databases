SPOOL dashboard_ddl.log  
set serveroutput off 
SET FEEDBACK OFF 
DROP TABLE ACTION CASCADE CONSTRAINTS
/

--
-- ACTION  (Table) 
--
CREATE TABLE ACTION
(
  ACN_ID                 NUMBER(10)             NOT NULL,
  TRG_ID                 NUMBER(10)             NOT NULL,
  ACT_ID                 NUMBER(10)             NOT NULL,
  ACN_CONFIGURED_PIG_ID  NUMBER(10)             NOT NULL,
  ACN_RUNNING_PIG_ID     NUMBER(10)                 NULL,
  ACN_NAME               NVARCHAR2(255)         NOT NULL,
  ACN_ORDER_NO           NUMBER(10)             NOT NULL,
  ACN_DELETE_FL          CHAR(1)                NOT NULL,
  ACN_VERSION_ID         NUMBER(10)             NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE ACTION_PIN CASCADE CONSTRAINTS
/

--
-- ACTION_PIN  (Table) 
--
CREATE TABLE ACTION_PIN
(
  ANP_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  ACT_ID          NUMBER(10)                    NOT NULL,
  ANP_NAME        NVARCHAR2(255)                NOT NULL,
  ANP_INPUT_FL    CHAR(1)                       NOT NULL,
  ANP_ORDER_NO    NUMBER(10)                    NOT NULL,
  ANP_DELETE_FL   CHAR(1)                       NOT NULL,
  ANP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ACTION_PIN_CONNECTION CASCADE CONSTRAINTS
/

--
-- ACTION_PIN_CONNECTION  (Table) 
--
CREATE TABLE ACTION_PIN_CONNECTION
(
  APC_ID           NUMBER(10)                   NOT NULL,
  APC_FROM_ACN_ID  NUMBER(10)                       NULL,
  APC_FROM_ANP_ID  NUMBER(10)                       NULL,
  APC_FROM_TRG_ID  NUMBER(10)                       NULL,
  APC_FROM_TRP_ID  NUMBER(10)                       NULL,
  APC_TO_ACN_ID    NUMBER(10)                   NOT NULL,
  APC_TO_ANP_ID    NUMBER(10)                   NOT NULL,
  APC_DELETE_FL    CHAR(1)                      NOT NULL,
  APC_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE ACTION_TYPE CASCADE CONSTRAINTS
/

--
-- ACTION_TYPE  (Table) 
--
CREATE TABLE ACTION_TYPE
(
  ACT_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  ACT_NAME        NVARCHAR2(255)                NOT NULL,
  ACT_DELETE_FL   CHAR(1)                       NOT NULL,
  ACT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ALERT_DFN CASCADE CONSTRAINTS
/

--
-- ALERT_DFN  (Table) 
--
CREATE TABLE ALERT_DFN
(
  ALD_ID          NUMBER(10)                    NOT NULL,
  ALG_ID          NUMBER(10)                    NOT NULL,
  ASV_ID          NUMBER(10)                    NOT NULL,
  ALD_ALERT_NO    NUMBER(10)                    NOT NULL,
  ALD_ALERT_TEXT  NVARCHAR2(255)                NOT NULL,
  ALD_DELETE_FL   CHAR(1)                       NOT NULL,
  ALD_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ALERT_DFN_NOTIFY_TEAM CASCADE CONSTRAINTS
/

--
-- ALERT_DFN_NOTIFY_TEAM  (Table) 
--
CREATE TABLE ALERT_DFN_NOTIFY_TEAM
(
  ADT_ID          NUMBER(10)                    NOT NULL,
  ALD_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  ADT_DELETE_FL   CHAR(1)                       NOT NULL,
  ADT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ALERT_DFN_NOTIFY_USER CASCADE CONSTRAINTS
/

--
-- ALERT_DFN_NOTIFY_USER  (Table) 
--
CREATE TABLE ALERT_DFN_NOTIFY_USER
(
  ADU_ID          NUMBER(10)                    NOT NULL,
  ALD_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  ADU_DELETE_FL   CHAR(1)                       NOT NULL,
  ADU_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ALERT_GROUP CASCADE CONSTRAINTS
/

--
-- ALERT_GROUP  (Table) 
--
CREATE TABLE ALERT_GROUP
(
  ALG_ID             NUMBER(10)                 NOT NULL,
  ALG_NAME           NVARCHAR2(255)             NOT NULL,
  ALG_SYSTEM_FL      CHAR(1)                    NOT NULL,
  ALG_GUIDE_ENT_ID   NUMBER(10)                 NOT NULL,
  ALG_RESULT_ENT_ID  NUMBER(10)                     NULL,
  ALG_RESULT_CMP_ID  NUMBER(10)                     NULL,
  ALG_DELETE_FL      CHAR(1)                    NOT NULL,
  ALG_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE ALERT_GROUP_NOTIFY_TEAM CASCADE CONSTRAINTS
/

--
-- ALERT_GROUP_NOTIFY_TEAM  (Table) 
--
CREATE TABLE ALERT_GROUP_NOTIFY_TEAM
(
  AGT_ID          NUMBER(10)                    NOT NULL,
  ALG_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  AGT_DELETE_FL   CHAR(1)                       NOT NULL,
  AGT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ALERT_GROUP_NOTIFY_USER CASCADE CONSTRAINTS
/

--
-- ALERT_GROUP_NOTIFY_USER  (Table) 
--
CREATE TABLE ALERT_GROUP_NOTIFY_USER
(
  AGU_ID          NUMBER(10)                    NOT NULL,
  ALG_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  AGU_DELETE_FL   CHAR(1)                       NOT NULL,
  AGU_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ALERT_INST CASCADE CONSTRAINTS
/

--
-- ALERT_INST  (Table) 
--
CREATE TABLE ALERT_INST
(
  ALI_ID           NUMBER(10)                   NOT NULL,
  ALD_ID           NUMBER(10)                   NOT NULL,
  ALI_GUIDE_PK     NUMBER(10)                   NOT NULL,
  ALI_RESULT_PK    NUMBER(10)                       NULL,
  ALI_RAISED_DTTM  TIMESTAMP(6)                 NOT NULL,
  ALI_PARAM1       NVARCHAR2(255)                   NULL,
  ALI_PARAM2       NVARCHAR2(255)                   NULL,
  ALI_PARAM3       NVARCHAR2(255)                   NULL,
  ALI_PARAM4       NVARCHAR2(255)                   NULL,
  ALI_PARAM5       NVARCHAR2(255)                   NULL,
  SEG_ID           NUMBER(10)                       NULL,
  ALI_DELETE_FL    CHAR(1)                      NOT NULL,
  ALI_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE ALERT_SEVERITY CASCADE CONSTRAINTS
/

--
-- ALERT_SEVERITY  (Table) 
--
CREATE TABLE ALERT_SEVERITY
(
  ASV_ID          NUMBER(10)                    NOT NULL,
  ASV_NAME        NVARCHAR2(255)                NOT NULL,
  ASV_ORDER_NO    NUMBER(10)                    NOT NULL,
  IMG_ID          NUMBER(10)                        NULL,
  ASV_DELETE_FL   CHAR(1)                       NOT NULL,
  ASV_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE APPLICATION_TBL CASCADE CONSTRAINTS
/

--
-- APPLICATION_TBL  (Table) 
--
CREATE TABLE APPLICATION_TBL
(
  APP_ID          NUMBER(10)                    NOT NULL,
  APP_NAME        NVARCHAR2(255)                NOT NULL,
  APP_LOGO_PATH   NVARCHAR2(255)                    NULL,
  APP_DELETE_FL   CHAR(1)                       NOT NULL,
  APP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE APPLICATION_USER CASCADE CONSTRAINTS
/

--
-- APPLICATION_USER  (Table) 
--
CREATE TABLE APPLICATION_USER
(
  APU_ID              NUMBER(10)                NOT NULL,
  APP_ID              NUMBER(10)                NOT NULL,
  USR_ID              NUMBER(10)                NOT NULL,
  APU_STARTUP_UAI_ID  NUMBER(10)                    NULL,
  APU_STARTUP_HELPER  NUMBER(10)                    NULL,
  APU_ACCESS_FL       CHAR(1)                   NOT NULL,
  APU_DELETE_FL       CHAR(1)                   NOT NULL,
  APU_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE AUDIT_LEVEL CASCADE CONSTRAINTS
/

--
-- AUDIT_LEVEL  (Table) 
--
CREATE TABLE AUDIT_LEVEL
(
  AUL_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  AUL_LEVEL       NUMBER(10)                    NOT NULL,
  AUL_DELETE_FL   CHAR(1)                       NOT NULL,
  AUL_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE AUTO_SQL CASCADE CONSTRAINTS
/

--
-- AUTO_SQL  (Table) 
--
CREATE TABLE AUTO_SQL
(
  ASQ_ID           NUMBER(10)                   NOT NULL,
  ASQ_MAX_ROWS     NUMBER(10)                       NULL,
  ASQ_DISTINCT_FL  CHAR(1)                      NOT NULL,
  ASQ_DELETE_FL    CHAR(1)                      NOT NULL,
  ASQ_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE AUTO_SQL_FROM CASCADE CONSTRAINTS
/

--
-- AUTO_SQL_FROM  (Table) 
--
CREATE TABLE AUTO_SQL_FROM
(
  ASF_ID           NUMBER(10)                   NOT NULL,
  ASQ_ID           NUMBER(10)                   NOT NULL,
  ASF_TABLE_NAME   NVARCHAR2(255)               NOT NULL,
  ASF_TABLE_ALIAS  NVARCHAR2(255)                   NULL,
  ASF_ORDER_NO     NUMBER(10)                   NOT NULL,
  ASF_JOIN_TYPE    NVARCHAR2(255)                   NULL,
  ASF_COLUMN1      NVARCHAR2(255)                   NULL,
  ASF_OPERATOR     NVARCHAR2(255)                   NULL,
  ASF_COLUMN2      NVARCHAR2(255)                   NULL,
  ASF_DELETE_FL    CHAR(1)                      NOT NULL,
  ASF_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE AUTO_SQL_ORDER_BY CASCADE CONSTRAINTS
/

--
-- AUTO_SQL_ORDER_BY  (Table) 
--
CREATE TABLE AUTO_SQL_ORDER_BY
(
  ASO_ID             NUMBER(10)                 NOT NULL,
  ASQ_ID             NUMBER(10)                 NOT NULL,
  ASS_ID             NUMBER(10)                     NULL,
  ASO_DESCENDING_FL  CHAR(1)                    NOT NULL,
  ASO_ORDER_NO       NUMBER(10)                 NOT NULL,
  ASO_DELETE_FL      CHAR(1)                    NOT NULL,
  ASO_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE AUTO_SQL_SELECT CASCADE CONSTRAINTS
/

--
-- AUTO_SQL_SELECT  (Table) 
--
CREATE TABLE AUTO_SQL_SELECT
(
  ASS_ID                   NUMBER(10)           NOT NULL,
  ASQ_ID                   NUMBER(10)           NOT NULL,
  ASS_ACTUAL_COLUMN_NAME   NVARCHAR2(255)       NOT NULL,
  ASS_DISPLAY_COLUMN_NAME  NVARCHAR2(255)       NOT NULL,
  ASS_COLUMN_TYPE_NAME     NVARCHAR2(255)       NOT NULL,
  ASS_COLUMN_S_Q_L_TYPE    NUMBER(10)           NOT NULL,
  ASS_AGGREGATE            NVARCHAR2(255)           NULL,
  ASS_ORDER_NO             NUMBER(10)           NOT NULL,
  ASS_DELETE_FL            CHAR(1)              NOT NULL,
  ASS_VERSION_ID           NUMBER(10)           NOT NULL,
  PTN_ID                   NUMBER(10)           NOT NULL
)
/


DROP TABLE AUTO_SQL_WHERE CASCADE CONSTRAINTS
/

--
-- AUTO_SQL_WHERE  (Table) 
--
CREATE TABLE AUTO_SQL_WHERE
(
  ASW_ID                        NUMBER(10)      NOT NULL,
  ASQ_ID                        NUMBER(10)      NOT NULL,
  ASW_OPERATOR                  NVARCHAR2(255)      NULL,
  ASW_EXPRESSION1               NVARCHAR2(255)  NOT NULL,
  ASW_EXPRESSION1_DISPLAY_NAME  NVARCHAR2(255)  NOT NULL,
  ASW_COLUM1_INDENT             NVARCHAR2(255)      NULL,
  ASW_EXPRESSION_OPERATOR       NVARCHAR2(255)  NOT NULL,
  ASW_EXPRESSION1_DATA_TYPE     NVARCHAR2(255)  NOT NULL,
  ASW_EXPRESSION1_S_Q_L_TYPE    NUMBER(10)      NOT NULL,
  ASW_EXPRESSION2               NVARCHAR2(255)  NOT NULL,
  ASW_EXPRESSION2_DISPLAY_NAME  NVARCHAR2(255)  NOT NULL,
  ASW_COLUM2_INDENT             NVARCHAR2(255)      NULL,
  ASW_EXPRESSION2_DATA_TYPE     NVARCHAR2(255)  NOT NULL,
  ASW_EXPRESSION2_S_Q_L_TYPE    NUMBER(10)      NOT NULL,
  ASF_ID                        NUMBER(10)          NULL,
  ASW_ORDER_NO                  NUMBER(10)      NOT NULL,
  ASW_DELETE_FL                 CHAR(1)         NOT NULL,
  ASW_VERSION_ID                NUMBER(10)      NOT NULL,
  PTN_ID                        NUMBER(10)      NOT NULL
)
/


DROP TABLE BAND CASCADE CONSTRAINTS
/

--
-- BAND  (Table) 
--
CREATE TABLE BAND
(
  BND_ID                  NUMBER(10)            NOT NULL,
  EST_ID                  NUMBER(10)            NOT NULL,
  BDT_ID                  NUMBER(10)            NOT NULL,
  CMP_ID                  NUMBER(10)                NULL,
  BND_NAME                NVARCHAR2(255)        NOT NULL,
  BND_POINT_TO_POINT_FL   CHAR(1)               NOT NULL,
  BND_EXTERNAL_REFERENCE  NVARCHAR2(255)            NULL,
  BND_DELETE_FL           CHAR(1)               NOT NULL,
  BND_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE BAND_TYPE CASCADE CONSTRAINTS
/

--
-- BAND_TYPE  (Table) 
--
CREATE TABLE BAND_TYPE
(
  BDT_ID          NUMBER(10)                    NOT NULL,
  BDT_NAME        NVARCHAR2(255)                NOT NULL,
  BDT_CLASS_CD    NVARCHAR2(255)                NOT NULL,
  BDT_DELETE_FL   CHAR(1)                       NOT NULL,
  BDT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE BUSINESS_OBJECTS_GROUP CASCADE CONSTRAINTS
/

--
-- BUSINESS_OBJECTS_GROUP  (Table) 
--
CREATE TABLE BUSINESS_OBJECTS_GROUP
(
  BOG_ID          NUMBER(10)                    NOT NULL,
  BOS_ID          NUMBER(10)                    NOT NULL,
  BOG_NAME        NVARCHAR2(255)                NOT NULL,
  BOG_DELETE_FL   CHAR(1)                       NOT NULL,
  BOG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE BUSINESS_OBJECTS_REPORT CASCADE CONSTRAINTS
/

--
-- BUSINESS_OBJECTS_REPORT  (Table) 
--
CREATE TABLE BUSINESS_OBJECTS_REPORT
(
  BOR_ID          NUMBER(10)                    NOT NULL,
  BOG_ID          NUMBER(10)                    NOT NULL,
  BOR_NAME        NVARCHAR2(255)                NOT NULL,
  BOR_TYPE        NVARCHAR2(255)                NOT NULL,
  BOR_DOC_NO      NUMBER(10)                    NOT NULL,
  BOR_DELETE_FL   CHAR(1)                       NOT NULL,
  BOR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE BUSINESS_OBJECTS_SERVER CASCADE CONSTRAINTS
/

--
-- BUSINESS_OBJECTS_SERVER  (Table) 
--
CREATE TABLE BUSINESS_OBJECTS_SERVER
(
  BOS_ID              NUMBER(10)                NOT NULL,
  BOS_NAME            NVARCHAR2(255)            NOT NULL,
  BOS_CMS_NAME        NVARCHAR2(255)            NOT NULL,
  BOS_ADDRESS         NVARCHAR2(255)            NOT NULL,
  BOS_PORT            NUMBER(10)                    NULL,
  BOS_AUTHENTICATION  NVARCHAR2(255)            NOT NULL,
  BOS_USERNAME        NVARCHAR2(255)            NOT NULL,
  BOS_PASSWORD        NVARCHAR2(255)                NULL,
  BOS_DELETE_FL       CHAR(1)                   NOT NULL,
  BOS_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE BUSINESS_OBJECTS_UNIVERSE CASCADE CONSTRAINTS
/

--
-- BUSINESS_OBJECTS_UNIVERSE  (Table) 
--
CREATE TABLE BUSINESS_OBJECTS_UNIVERSE
(
  BOV_ID                  NUMBER(10)            NOT NULL,
  BOS_ID                  NUMBER(10)            NOT NULL,
  BOV_UNIVERSE_NAME       NVARCHAR2(255)        NOT NULL,
  BOV_UNIVERSE_FOLDER     NVARCHAR2(255)            NULL,
  BOV_DEFAULT_CONNECTION  NVARCHAR2(255)        NOT NULL,
  BOV_DASHBOARD_FL        CHAR(1)               NOT NULL,
  BOV_DELETE_FL           CHAR(1)               NOT NULL,
  BOV_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE CACHE_STRATEGY CASCADE CONSTRAINTS
/

--
-- CACHE_STRATEGY  (Table) 
--
CREATE TABLE CACHE_STRATEGY
(
  CST_ID            NUMBER(10)                  NOT NULL,
  CST_CACHE_CLASS   NVARCHAR2(255)              NOT NULL,
  CST_OBJECT_CLASS  NVARCHAR2(255)              NOT NULL,
  CST_CACHE_KEY     NVARCHAR2(255)                  NULL,
  CMP_ID            NUMBER(10)                  NOT NULL,
  CST_TIMEOUT_MINS  NUMBER(10)                  NOT NULL,
  CST_DELETE_FL     CHAR(1)                     NOT NULL,
  CST_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE CASE_DFN CASCADE CONSTRAINTS
/

--
-- CASE_DFN  (Table) 
--
CREATE TABLE CASE_DFN
(
  CDN_ID                   NUMBER(10)           NOT NULL,
  CDN_NAME                 NVARCHAR2(255)       NOT NULL,
  CDN_DUE_DTTM_MULTIPLIER  NUMBER(10)               NULL,
  CDN_DUE_DTTM_PERIOD      NVARCHAR2(255)           NULL,
  CDN_NEW_FL               CHAR(1)              NOT NULL,
  CDN_EXTERNAL_REFERENCE   NVARCHAR2(255)           NULL,
  CDN_DELETE_FL            CHAR(1)              NOT NULL,
  CDN_VERSION_ID           NUMBER(10)           NOT NULL,
  PTN_ID                   NUMBER(10)           NOT NULL
)
/


DROP TABLE CASE_DFN_ITEM CASCADE CONSTRAINTS
/

--
-- CASE_DFN_ITEM  (Table) 
--
CREATE TABLE CASE_DFN_ITEM
(
  CDI_ID                   NUMBER(10)           NOT NULL,
  CDN_ID                   NUMBER(10)           NOT NULL,
  CDI_NAME                 NVARCHAR2(255)       NOT NULL,
  CDI_DUE_DTTM_MULTIPLIER  NUMBER(10)               NULL,
  CDI_DUE_DTTM_PERIOD      NVARCHAR2(255)           NULL,
  CIP_ID                   NUMBER(10)           NOT NULL,
  CDI_EXTERNAL_REFERENCE   NVARCHAR2(255)           NULL,
  TIN_ID                   NUMBER(10)               NULL,
  CDI_DELETE_FL            CHAR(1)              NOT NULL,
  CDI_VERSION_ID           NUMBER(10)           NOT NULL,
  PTN_ID                   NUMBER(10)           NOT NULL
)
/


DROP TABLE CASE_DFN_ITEM_ALERT CASCADE CONSTRAINTS
/

--
-- CASE_DFN_ITEM_ALERT  (Table) 
--
CREATE TABLE CASE_DFN_ITEM_ALERT
(
  CDA_ID          NUMBER(10)                    NOT NULL,
  CDI_ID          NUMBER(10)                    NOT NULL,
  ALD_ID          NUMBER(10)                    NOT NULL,
  CDA_GUIDE_PK    NUMBER(10)                        NULL,
  CDA_DELETE_FL   CHAR(1)                       NOT NULL,
  CDA_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_DFN_ITEM_STEP CASCADE CONSTRAINTS
/

--
-- CASE_DFN_ITEM_STEP  (Table) 
--
CREATE TABLE CASE_DFN_ITEM_STEP
(
  CDS_ID                  NUMBER(10)            NOT NULL,
  CDI_ID                  NUMBER(10)            NOT NULL,
  CMP_ID                  NUMBER(10)            NOT NULL,
  PDG_ID                  NUMBER(10)                NULL,
  CDS_NAME                NVARCHAR2(255)        NOT NULL,
  CDS_INITIAL_FL          CHAR(1)               NOT NULL,
  CDS_AUTOMATIC_FL        CHAR(1)               NOT NULL,
  CDS_RESOLVED_FL         CHAR(1)               NOT NULL,
  CDS_EXTERNAL_REFERENCE  NVARCHAR2(255)            NULL,
  CDS_ALLOCATE_CMP_ID     NUMBER(10)                NULL,
  CDS_DELETE_FL           CHAR(1)               NOT NULL,
  CDS_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE CASE_DFN_ITEM_STEP_TEAM CASCADE CONSTRAINTS
/

--
-- CASE_DFN_ITEM_STEP_TEAM  (Table) 
--
CREATE TABLE CASE_DFN_ITEM_STEP_TEAM
(
  CTT_ID          NUMBER(10)                    NOT NULL,
  CDS_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  CTT_BROWSE_FL   CHAR(1)                       NOT NULL,
  CTT_EDIT_FL     CHAR(1)                       NOT NULL,
  CTT_DELETE_FL   CHAR(1)                       NOT NULL,
  CTT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_DFN_ITEM_TEAM CASCADE CONSTRAINTS
/

--
-- CASE_DFN_ITEM_TEAM  (Table) 
--
CREATE TABLE CASE_DFN_ITEM_TEAM
(
  CMT_ID          NUMBER(10)                    NOT NULL,
  CDI_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  CMT_BROWSE_FL   CHAR(1)                       NOT NULL,
  CMT_NEW_FL      CHAR(1)                       NOT NULL,
  CMT_EDIT_FL     CHAR(1)                       NOT NULL,
  CMT_REMOVE_FL   CHAR(1)                       NOT NULL,
  CMT_ASSIGN_CD   NVARCHAR2(255)                NOT NULL,
  CMT_DELETE_FL   CHAR(1)                       NOT NULL,
  CMT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_DFN_ITEM_TRANSITION CASCADE CONSTRAINTS
/

--
-- CASE_DFN_ITEM_TRANSITION  (Table) 
--
CREATE TABLE CASE_DFN_ITEM_TRANSITION
(
  CDT_ID           NUMBER(10)                   NOT NULL,
  CDT_FROM_CDS_ID  NUMBER(10)                   NOT NULL,
  CDT_TO_CDS_ID    NUMBER(10)                       NULL,
  CDT_DELETE_FL    CHAR(1)                      NOT NULL,
  CDT_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE CASE_DFN_NOTIFY_TEAM CASCADE CONSTRAINTS
/

--
-- CASE_DFN_NOTIFY_TEAM  (Table) 
--
CREATE TABLE CASE_DFN_NOTIFY_TEAM
(
  CNT_ID          NUMBER(10)                    NOT NULL,
  CDN_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  CNT_DELETE_FL   CHAR(1)                       NOT NULL,
  CNT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_DFN_NOTIFY_USER CASCADE CONSTRAINTS
/

--
-- CASE_DFN_NOTIFY_USER  (Table) 
--
CREATE TABLE CASE_DFN_NOTIFY_USER
(
  CDU_ID          NUMBER(10)                    NOT NULL,
  CDN_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  CDU_DELETE_FL   CHAR(1)                       NOT NULL,
  CDU_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_DFN_TEAM CASCADE CONSTRAINTS
/

--
-- CASE_DFN_TEAM  (Table) 
--
CREATE TABLE CASE_DFN_TEAM
(
  CAT_ID          NUMBER(10)                    NOT NULL,
  CDN_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  CAT_BROWSE_FL   CHAR(1)                       NOT NULL,
  CAT_NEW_FL      CHAR(1)                       NOT NULL,
  CAT_EDIT_FL     CHAR(1)                       NOT NULL,
  CAT_REMOVE_FL   CHAR(1)                       NOT NULL,
  CAT_ASSIGN_CD   NVARCHAR2(255)                NOT NULL,
  CAT_DELETE_FL   CHAR(1)                       NOT NULL,
  CAT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_ESCALATION CASCADE CONSTRAINTS
/

--
-- CASE_ESCALATION  (Table) 
--
CREATE TABLE CASE_ESCALATION
(
  CEN_ID                    NUMBER(10)          NOT NULL,
  CDS_ID                    NUMBER(10)          NOT NULL,
  CEN_LEVEL                 NUMBER(10)          NOT NULL,
  CEN_DUE_DTTM_MULTIPLIER   NUMBER(10)          NOT NULL,
  CEN_DUE_DTTM_PERIOD       NVARCHAR2(255)      NOT NULL,
  CEN_ON_ESCALATION_TEA_ID  NUMBER(10)              NULL,
  CEN_ON_ESCALATION_USR_ID  NUMBER(10)              NULL,
  CIP_ID                    NUMBER(10)              NULL,
  CEN_DELETE_FL             CHAR(1)             NOT NULL,
  CEN_VERSION_ID            NUMBER(10)          NOT NULL,
  PTN_ID                    NUMBER(10)          NOT NULL
)
/


DROP TABLE CASE_ESC_NOTIFY_TEAM CASCADE CONSTRAINTS
/

--
-- CASE_ESC_NOTIFY_TEAM  (Table) 
--
CREATE TABLE CASE_ESC_NOTIFY_TEAM
(
  CET_ID          NUMBER(10)                    NOT NULL,
  CEN_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  CET_DELETE_FL   CHAR(1)                       NOT NULL,
  CET_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_ESC_NOTIFY_USER CASCADE CONSTRAINTS
/

--
-- CASE_ESC_NOTIFY_USER  (Table) 
--
CREATE TABLE CASE_ESC_NOTIFY_USER
(
  CEU_ID          NUMBER(10)                    NOT NULL,
  CEN_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  CEU_DELETE_FL   CHAR(1)                       NOT NULL,
  CEU_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_INST CASCADE CONSTRAINTS
/

--
-- CASE_INST  (Table) 
--
CREATE TABLE CASE_INST
(
  CIT_ID                  NUMBER(10)            NOT NULL,
  CDN_ID                  NUMBER(10)            NOT NULL,
  CIT_CASE_NO             NUMBER(19)            NOT NULL,
  CIT_DESC                NVARCHAR2(255)        NOT NULL,
  CIT_OWNER_USR_ID        NUMBER(10)                NULL,
  CIT_DUE_DTTM            TIMESTAMP(6)              NULL,
  CIT_CREATED_USR_ID      NUMBER(10)                NULL,
  CIT_CREATED_DTTM        TIMESTAMP(6)          NOT NULL,
  CIT_OPENED_USR_ID       NUMBER(10)                NULL,
  CIT_OPENED_DTTM         TIMESTAMP(6)              NULL,
  CIT_CLOSED_USR_ID       NUMBER(10)                NULL,
  CIT_CLOSED_DTTM         TIMESTAMP(6)              NULL,
  CIT_EXTERNAL_REFERENCE  NVARCHAR2(255)            NULL,
  CIT_DELETE_FL           CHAR(1)               NOT NULL,
  CIT_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE CASE_INST_HISTORY CASCADE CONSTRAINTS
/

--
-- CASE_INST_HISTORY  (Table) 
--
CREATE TABLE CASE_INST_HISTORY
(
  CTH_ID          NUMBER(10)                    NOT NULL,
  CIT_ID          NUMBER(10)                    NOT NULL,
  CTH_DTTM        TIMESTAMP(6)                  NOT NULL,
  CTH_CODE        NVARCHAR2(255)                NOT NULL,
  USR_ID          NUMBER(10)                        NULL,
  CTH_DELETE_FL   CHAR(1)                       NOT NULL,
  CTH_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_INST_ITEM CASCADE CONSTRAINTS
/

--
-- CASE_INST_ITEM  (Table) 
--
CREATE TABLE CASE_INST_ITEM
(
  CII_ID                  NUMBER(10)            NOT NULL,
  CIT_ID                  NUMBER(10)            NOT NULL,
  CDI_ID                  NUMBER(10)            NOT NULL,
  CII_CURRENT_CDS_ID      NUMBER(10)            NOT NULL,
  CIP_ID                  NUMBER(10)            NOT NULL,
  ALI_ID                  NUMBER(10)                NULL,
  CII_DESC                NVARCHAR2(255)        NOT NULL,
  CII_ASSIGNED_TEA_ID     NUMBER(10)                NULL,
  CII_ASSIGNED_USR_ID     NUMBER(10)                NULL,
  CII_DUE_DTTM            TIMESTAMP(6)              NULL,
  CII_CREATED_USR_ID      NUMBER(10)                NULL,
  CII_CREATED_DTTM        TIMESTAMP(6)          NOT NULL,
  CII_OPENED_USR_ID       NUMBER(10)                NULL,
  CII_OPENED_DTTM         TIMESTAMP(6)              NULL,
  CII_CLOSED_USR_ID       NUMBER(10)                NULL,
  CII_CLOSED_DTTM         TIMESTAMP(6)              NULL,
  CII_CLOSED_BY_CASE_FL   CHAR(1)               NOT NULL,
  CII_EXTERNAL_REFERENCE  NVARCHAR2(255)            NULL,
  CII_COST_FIELD          NUMBER(19)                NULL,
  CII_ESCALATION_LEVEL    NUMBER(10)                NULL,
  CII_EXTRA1              NVARCHAR2(255)            NULL,
  CII_EXTRA2              NVARCHAR2(255)            NULL,
  CII_EXTRA3              NVARCHAR2(255)            NULL,
  CII_EXTRA4              NVARCHAR2(255)            NULL,
  CII_EXTRA5              NVARCHAR2(255)            NULL,
  CII_CANCELLED_FL        CHAR(1)               NOT NULL,
  CII_CASE_ITEM_NO        NUMBER(10)            NOT NULL,
  CII_RECOVERED_COST      NUMBER(19)                NULL,
  CII_DELETE_FL           CHAR(1)               NOT NULL,
  CII_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE CASE_INST_ITEM_HISTORY CASCADE CONSTRAINTS
/

--
-- CASE_INST_ITEM_HISTORY  (Table) 
--
CREATE TABLE CASE_INST_ITEM_HISTORY
(
  CIH_ID               NUMBER(10)               NOT NULL,
  CII_ID               NUMBER(10)               NOT NULL,
  CIH_DTTM             TIMESTAMP(6)             NOT NULL,
  CIH_CODE             NVARCHAR2(255)           NOT NULL,
  USR_ID               NUMBER(10)                   NULL,
  CIH_ASSIGNED_TEA_ID  NUMBER(10)                   NULL,
  CIH_ASSIGNED_USR_ID  NUMBER(10)                   NULL,
  CIH_DELETE_FL        CHAR(1)                  NOT NULL,
  CIH_VERSION_ID       NUMBER(10)               NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE CASE_INST_ITEM_NOTE CASCADE CONSTRAINTS
/

--
-- CASE_INST_ITEM_NOTE  (Table) 
--
CREATE TABLE CASE_INST_ITEM_NOTE
(
  CIN_ID          NUMBER(10)                    NOT NULL,
  CII_ID          NUMBER(10)                    NOT NULL,
  LST_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  CIN_DTTM        TIMESTAMP(6)                  NOT NULL,
  CIN_DELETE_FL   CHAR(1)                       NOT NULL,
  CIN_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_INST_ITEM_STEP CASCADE CONSTRAINTS
/

--
-- CASE_INST_ITEM_STEP  (Table) 
--
CREATE TABLE CASE_INST_ITEM_STEP
(
  CIS_ID            NUMBER(10)                  NOT NULL,
  CII_ID            NUMBER(10)                  NOT NULL,
  CDS_ID            NUMBER(10)                  NOT NULL,
  CIS_ORDER_NO      NUMBER(10)                  NOT NULL,
  CIS_START_USR_ID  NUMBER(10)                      NULL,
  CIS_START_DTTM    TIMESTAMP(6)                    NULL,
  CIS_END_USR_ID    NUMBER(10)                      NULL,
  CIS_END_DTTM      TIMESTAMP(6)                    NULL,
  LST_ID            NUMBER(10)                      NULL,
  PIG_ID            NUMBER(10)                      NULL,
  CIS_DELETE_FL     CHAR(1)                     NOT NULL,
  CIS_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE CASE_INST_NOTE CASCADE CONSTRAINTS
/

--
-- CASE_INST_NOTE  (Table) 
--
CREATE TABLE CASE_INST_NOTE
(
  CTN_ID          NUMBER(10)                    NOT NULL,
  CIT_ID          NUMBER(10)                    NOT NULL,
  LST_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  CTN_DTTM        TIMESTAMP(6)                  NOT NULL,
  CTN_DELETE_FL   CHAR(1)                       NOT NULL,
  CTN_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CASE_ITEM_PRIORITY CASCADE CONSTRAINTS
/

--
-- CASE_ITEM_PRIORITY  (Table) 
--
CREATE TABLE CASE_ITEM_PRIORITY
(
  CIP_ID          NUMBER(10)                    NOT NULL,
  CIP_NAME        NVARCHAR2(255)                NOT NULL,
  CIP_ORDER_NO    NUMBER(10)                    NOT NULL,
  IMG_ID          NUMBER(10)                        NULL,
  CIP_DELETE_FL   CHAR(1)                       NOT NULL,
  CIP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CHANGED_CLASS CASCADE CONSTRAINTS
/

--
-- CHANGED_CLASS  (Table) 
--
CREATE TABLE CHANGED_CLASS
(
  CDC_ID                 NUMBER(10)             NOT NULL,
  CDC_CLASS              NVARCHAR2(255)         NOT NULL,
  CDC_LAST_CHANGED_DTTM  TIMESTAMP(6)           NOT NULL,
  CDC_DELETE_FL          CHAR(1)                NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE CHART CASCADE CONSTRAINTS
/

--
-- CHART  (Table) 
--
CREATE TABLE CHART
(
  CHR_ID                      NUMBER(10)        NOT NULL,
  CSB_ID                      NUMBER(10)        NOT NULL,
  DER_ID                      NUMBER(10)        NOT NULL,
  ASQ_ID                      NUMBER(10)            NULL,
  CHR_LINKED_CHR_ID           NUMBER(10)            NULL,
  CHR_NAME                    NVARCHAR2(255)    NOT NULL,
  CHR_DESCRIPTION             NVARCHAR2(255)        NULL,
  CHR_QUERY_LST_ID            NUMBER(10)        NOT NULL,
  CHR_USAGE_QUERY_FL          CHAR(1)           NOT NULL,
  CHR_X_AXIS_LABEL            NVARCHAR2(255)        NULL,
  CHR_PRIMARY_Y_AXIS_LABEL    NVARCHAR2(255)        NULL,
  CHR_SECONDARY_Y_AXIS_LABEL  NVARCHAR2(255)        NULL,
  CHR_AUTO_FL                 CHAR(1)           NOT NULL,
  CHR_FREEZE_REFRESH_FL       CHAR(1)           NOT NULL,
  CHR_DELETE_FL               CHAR(1)           NOT NULL,
  CHR_VERSION_ID              NUMBER(10)        NOT NULL,
  PTN_ID                      NUMBER(10)        NOT NULL
)
/


DROP TABLE CHART_PROPERTY_GROUP CASCADE CONSTRAINTS
/

--
-- CHART_PROPERTY_GROUP  (Table) 
--
CREATE TABLE CHART_PROPERTY_GROUP
(
  CPG_ID          NUMBER(10)                    NOT NULL,
  CHR_ID          NUMBER(10)                    NOT NULL,
  CPG_PIG_ID      NUMBER(10)                        NULL,
  CPG_PDG_KEY     NVARCHAR2(255)                NOT NULL,
  CPG_TAG_NAME    NVARCHAR2(255)                NOT NULL,
  CPG_DELETE_FL   CHAR(1)                       NOT NULL,
  CPG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CHART_RANGE CASCADE CONSTRAINTS
/

--
-- CHART_RANGE  (Table) 
--
CREATE TABLE CHART_RANGE
(
  CCR_ID          NUMBER(10)                    NOT NULL,
  CHR_ID          NUMBER(10)                    NOT NULL,
  CCR_MAX_RANGE   NUMBER(10)                    NOT NULL,
  CCR_MIN_RANGE   NUMBER(10)                    NOT NULL,
  CCR_MIN_LABEL   NVARCHAR2(255)                    NULL,
  CCR_MAX_LABEL   NVARCHAR2(255)                    NULL,
  CCR_COLOR       NVARCHAR2(255)                    NULL,
  CCR_COLOR_FL    CHAR(1)                           NULL,
  CCR_DELETE_FL   CHAR(1)                       NOT NULL,
  CCR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CHART_SERIES CASCADE CONSTRAINTS
/

--
-- CHART_SERIES  (Table) 
--
CREATE TABLE CHART_SERIES
(
  CHS_ID          NUMBER(10)                    NOT NULL,
  CHR_ID          NUMBER(10)                    NOT NULL,
  CHS_COLUMN      NVARCHAR2(255)                NOT NULL,
  CHS_LABEL       NVARCHAR2(255)                    NULL,
  CHS_AXIS_TYPE   NUMBER(10)                        NULL,
  CHS_DELETE_FL   CHAR(1)                       NOT NULL,
  CHS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CHART_SERIES_TYPE CASCADE CONSTRAINTS
/

--
-- CHART_SERIES_TYPE  (Table) 
--
CREATE TABLE CHART_SERIES_TYPE
(
  TYP_ID          NUMBER(10)                    NOT NULL,
  TYP_NAME        NVARCHAR2(255)                NOT NULL,
  TYP_DELETE_FL   CHAR(1)                       NOT NULL,
  TYP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CHART_SUB_TYPE CASCADE CONSTRAINTS
/

--
-- CHART_SUB_TYPE  (Table) 
--
CREATE TABLE CHART_SUB_TYPE
(
  CSB_ID                  NUMBER(10)            NOT NULL,
  TYP_ID                  NUMBER(10)            NOT NULL,
  CSB_NAME                NVARCHAR2(255)        NOT NULL,
  CHT_ID                  NUMBER(10)            NOT NULL,
  CMP_ID                  NUMBER(10)            NOT NULL,
  CSB_SWF                 NVARCHAR2(255)        NOT NULL,
  CSB_DEFAULT_DATA_X_M_L  NVARCHAR2(255)            NULL,
  CSB_DESCRIPTION         NVARCHAR2(255)            NULL,
  CSB_DELETE_FL           CHAR(1)               NOT NULL,
  CSB_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE CHART_SUB_TYPE_PROP CASCADE CONSTRAINTS
/

--
-- CHART_SUB_TYPE_PROP  (Table) 
--
CREATE TABLE CHART_SUB_TYPE_PROP
(
  CSP_ID            NUMBER(10)                  NOT NULL,
  CSB_ID            NUMBER(10)                  NOT NULL,
  CSP_DISPLAY_NAME  NVARCHAR2(255)              NOT NULL,
  CSP_PDG_KEY       NVARCHAR2(255)              NOT NULL,
  CSP_TAG_NAME      NVARCHAR2(255)              NOT NULL,
  CSP_DELETE_FL     CHAR(1)                     NOT NULL,
  CSP_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE CHART_TYPE CASCADE CONSTRAINTS
/

--
-- CHART_TYPE  (Table) 
--
CREATE TABLE CHART_TYPE
(
  CHT_ID           NUMBER(10)                   NOT NULL,
  CHT_NAME         NVARCHAR2(255)               NOT NULL,
  CHT_DESCRIPTION  NVARCHAR2(255)                   NULL,
  CHT_DELETE_FL    CHAR(1)                      NOT NULL,
  CHT_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE COLLECTED_FILE CASCADE CONSTRAINTS
/

--
-- COLLECTED_FILE  (Table) 
--
CREATE TABLE COLLECTED_FILE
(
  CLF_ID           NUMBER(10)                   NOT NULL,
  FCN_ID           NUMBER(10)                   NOT NULL,
  FIL_ID           NUMBER(10)                   NOT NULL,
  CLF_POLLED_DTTM  TIMESTAMP(6)                 NOT NULL,
  CLF_START_DTTM   TIMESTAMP(6)                     NULL,
  CLF_END_DTTM     TIMESTAMP(6)                     NULL,
  CLF_STATUS       NVARCHAR2(255)               NOT NULL,
  CLF_DELETE_FL    CHAR(1)                      NOT NULL,
  CLF_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE COMPONENT CASCADE CONSTRAINTS
/

--
-- COMPONENT  (Table) 
--
CREATE TABLE COMPONENT
(
  CMP_ID                NUMBER(10)              NOT NULL,
  CPT_ID                NUMBER(10)              NOT NULL,
  PDG_ID                NUMBER(10)                  NULL,
  CMP_NAME              NVARCHAR2(255)          NOT NULL,
  CMP_CLIENT_COMPONENT  NVARCHAR2(255)              NULL,
  CMP_SERVER_COMPONENT  NVARCHAR2(255)              NULL,
  CMP_DELETE_FL         CHAR(1)                 NOT NULL,
  CMP_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE COMPONENT_TYPE CASCADE CONSTRAINTS
/

--
-- COMPONENT_TYPE  (Table) 
--
CREATE TABLE COMPONENT_TYPE
(
  CPT_ID          NUMBER(10)                    NOT NULL,
  CPT_NAME        NVARCHAR2(255)                NOT NULL,
  CPT_TYPE_CD     NVARCHAR2(255)                NOT NULL,
  CPT_DELETE_FL   CHAR(1)                       NOT NULL,
  CPT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CONTEXT CASCADE CONSTRAINTS
/

--
-- CONTEXT  (Table) 
--
CREATE TABLE CONTEXT
(
  CXT_ID          NUMBER(10)                    NOT NULL,
  CXT_NAME        NVARCHAR2(255)                NOT NULL,
  CXT_DELETE_FL   CHAR(1)                       NOT NULL,
  CXT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE COUNTRY CASCADE CONSTRAINTS
/

--
-- COUNTRY  (Table) 
--
CREATE TABLE COUNTRY
(
  CTR_ID          NUMBER(10)                    NOT NULL,
  CTR_ISO_CD      NVARCHAR2(255)                NOT NULL,
  CTR_NAME        NVARCHAR2(255)                NOT NULL,
  CTR_DELETE_FL   CHAR(1)                       NOT NULL,
  CTR_DIAL_CODE   NVARCHAR2(255)                NOT NULL,
  CTR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CURRENCY CASCADE CONSTRAINTS
/

--
-- CURRENCY  (Table) 
--
CREATE TABLE CURRENCY
(
  CUR_ID          NUMBER(10)                    NOT NULL,
  CUR_NAME        NVARCHAR2(255)                NOT NULL,
  CUR_ISO_CD      NVARCHAR2(255)                NOT NULL,
  CUR_CULTURE     NVARCHAR2(255)                NOT NULL,
  CUR_DELETE_FL   CHAR(1)                       NOT NULL,
  CUR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE CUSTOM_OBJECT CASCADE CONSTRAINTS
/

--
-- CUSTOM_OBJECT  (Table) 
--
CREATE TABLE CUSTOM_OBJECT
(
  COS_ID                NUMBER(10)              NOT NULL,
  COG_ID                NUMBER(10)              NOT NULL,
  COS_NAME              NVARCHAR2(255)          NOT NULL,
  COS_TYPE              NVARCHAR2(255)              NULL,
  COS_HORIZONTAL_POS    NVARCHAR2(255)              NULL,
  COS_VERTICAL_POS      NVARCHAR2(255)              NULL,
  COS_RADIUS            NVARCHAR2(255)              NULL,
  COS_START_ANGLE       NVARCHAR2(255)              NULL,
  COS_END_ANGLE         NVARCHAR2(255)              NULL,
  COS_FILL_AS_GRADIENT  NVARCHAR2(255)              NULL,
  COS_FILL_COLOR        NVARCHAR2(255)              NULL,
  COS_FILL_PATTERN      NVARCHAR2(255)              NULL,
  COS_FILL_ALPHA        NVARCHAR2(255)              NULL,
  COS_FILL_RATIO        NVARCHAR2(255)              NULL,
  COS_FILL_DEGREE       NVARCHAR2(255)              NULL,
  COS_COLOR             NVARCHAR2(255)              NULL,
  COS_BORDER_COLOR      NVARCHAR2(255)              NULL,
  COS_LABEL             NVARCHAR2(255)              NULL,
  COS_ALIGN             NVARCHAR2(255)              NULL,
  COS_FONT_FACE         NVARCHAR2(255)              NULL,
  COS_IS_BOLD           NVARCHAR2(255)              NULL,
  COS_FONT_COLOR        NVARCHAR2(255)              NULL,
  COS_DELETE_FL         CHAR(1)                 NOT NULL,
  COS_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE CUSTOM_OBJECT_GROUP CASCADE CONSTRAINTS
/

--
-- CUSTOM_OBJECT_GROUP  (Table) 
--
CREATE TABLE CUSTOM_OBJECT_GROUP
(
  COG_ID                NUMBER(10)              NOT NULL,
  CSB_ID                NUMBER(10)              NOT NULL,
  COG_NAME              NVARCHAR2(255)          NOT NULL,
  COG_HORIZONTAL_POS    NVARCHAR2(255)              NULL,
  COG_VERTICAL_POS      NVARCHAR2(255)              NULL,
  COG_SHOW_BELOW_CHART  NVARCHAR2(255)              NULL,
  COG_DELETE_FL         CHAR(1)                 NOT NULL,
  COG_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE DASHBOARD CASCADE CONSTRAINTS
/

--
-- DASHBOARD  (Table) 
--
CREATE TABLE DASHBOARD
(
  DBD_ID                NUMBER(10)              NOT NULL,
  LYT_ID                NUMBER(10)              NOT NULL,
  DBD_NAME              NVARCHAR2(255)          NOT NULL,
  DBD_REFRESH_INTERVAL  NUMBER(10)                  NULL,
  DBD_DESCRIPTION       NVARCHAR2(255)              NULL,
  DBD_FAVOURITE_FL      CHAR(1)                 NOT NULL,
  DBD_DELETE_FL         CHAR(1)                 NOT NULL,
  DBD_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE DASHBOARD_SECTION CASCADE CONSTRAINTS
/

--
-- DASHBOARD_SECTION  (Table) 
--
CREATE TABLE DASHBOARD_SECTION
(
  DBS_ID               NUMBER(10)               NOT NULL,
  DBD_ID               NUMBER(10)               NOT NULL,
  CHR_ID               NUMBER(10)                   NULL,
  DBS_PREVIOUS_CHR_ID  NUMBER(10)                   NULL,
  DBS_LOCATION         NUMBER(10)               NOT NULL,
  DBS_DELETE_FL        CHAR(1)                  NOT NULL,
  DBS_VERSION_ID       NUMBER(10)               NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE DASHBOARD_SERVER CASCADE CONSTRAINTS
/

--
-- DASHBOARD_SERVER  (Table) 
--
CREATE TABLE DASHBOARD_SERVER
(
  DER_ID                  NUMBER(10)            NOT NULL,
  DPR_ID                  NUMBER(10)            NOT NULL,
  DSC_ID                  NUMBER(10)                NULL,
  DER_NAME                NVARCHAR2(255)        NOT NULL,
  DER_D_S_TYPE_FL         CHAR(1)               NOT NULL,
  DER_USER_NAME           NVARCHAR2(255)            NULL,
  DER_PASSWORD            NVARCHAR2(255)            NULL,
  DER_URL                 NVARCHAR2(255)            NULL,
  DER_DRIVER_CLASS        NVARCHAR2(255)            NULL,
  DER_APP_DATABASE_TYPE   NVARCHAR2(255)            NULL,
  DER_PERSPECTIVE_PIG_ID  NUMBER(10)                NULL,
  DER_DELETE_FL           CHAR(1)               NOT NULL,
  DER_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE DATA_INTEGRITY_CHECK CASCADE CONSTRAINTS
/

--
-- DATA_INTEGRITY_CHECK  (Table) 
--
CREATE TABLE DATA_INTEGRITY_CHECK
(
  DIC_ID               NUMBER(10)               NOT NULL,
  FIL_ID               NUMBER(10)               NOT NULL,
  DIC_CURR_SEQ_NUMBER  NUMBER(10)                   NULL,
  DIC_PREV_SEQ_NUMBER  NUMBER(10)                   NULL,
  DIC_ERROR_CODE       NUMBER(10)               NOT NULL,
  DIC_DELETE_FL        CHAR(1)                  NOT NULL,
  DIC_VERSION_ID       NUMBER(10)               NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE DATA_SOURCE_CONNECTION CASCADE CONSTRAINTS
/

--
-- DATA_SOURCE_CONNECTION  (Table) 
--
CREATE TABLE DATA_SOURCE_CONNECTION
(
  DSC_ID          NUMBER(10)                    NOT NULL,
  DSL_ID          NUMBER(10)                    NOT NULL,
  PIG_ID          NUMBER(10)                    NOT NULL,
  DSC_NAME        NVARCHAR2(255)                NOT NULL,
  DSC_DELETE_FL   CHAR(1)                       NOT NULL,
  DSC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DATA_SOURCE_LOCATION CASCADE CONSTRAINTS
/

--
-- DATA_SOURCE_LOCATION  (Table) 
--
CREATE TABLE DATA_SOURCE_LOCATION
(
  DSL_ID          NUMBER(10)                    NOT NULL,
  DSY_ID          NUMBER(10)                    NOT NULL,
  PIG_ID          NUMBER(10)                    NOT NULL,
  DSL_NAME        NVARCHAR2(255)                NOT NULL,
  DSL_DELETE_FL   CHAR(1)                       NOT NULL,
  DSL_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DATA_SOURCE_PERSPECTIVE CASCADE CONSTRAINTS
/

--
-- DATA_SOURCE_PERSPECTIVE  (Table) 
--
CREATE TABLE DATA_SOURCE_PERSPECTIVE
(
  DPR_ID              NUMBER(10)                NOT NULL,
  DPR_NAME            NVARCHAR2(255)            NOT NULL,
  DPR_SERVER_PACKAGE  NVARCHAR2(255)            NOT NULL,
  DPR_PDG_KEY         NVARCHAR2(255)            NOT NULL,
  DPR_DELETE_FL       CHAR(1)                   NOT NULL,
  DPR_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE DATA_SOURCE_TYPE CASCADE CONSTRAINTS
/

--
-- DATA_SOURCE_TYPE  (Table) 
--
CREATE TABLE DATA_SOURCE_TYPE
(
  DSY_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  PIG_ID          NUMBER(10)                    NOT NULL,
  DSY_NAME        NVARCHAR2(255)                NOT NULL,
  DSY_DELETE_FL   CHAR(1)                       NOT NULL,
  DSY_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DATE_ALLOCATED_NUMBER CASCADE CONSTRAINTS
/

--
-- DATE_ALLOCATED_NUMBER  (Table) 
--
CREATE TABLE DATE_ALLOCATED_NUMBER
(
  DAN_ID          NUMBER(10)                    NOT NULL,
  SNG_ID          NUMBER(10)                    NOT NULL,
  DAN_DTTM        TIMESTAMP(6)                  NOT NULL,
  DAN_NUMBER      NUMBER(19)                    NOT NULL,
  DAN_DELETE_FL   CHAR(1)                       NOT NULL,
  DAN_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DAY_GROUP CASCADE CONSTRAINTS
/

--
-- DAY_GROUP  (Table) 
--
CREATE TABLE DAY_GROUP
(
  DGP_ID          NUMBER(10)                    NOT NULL,
  DGP_NAME        NVARCHAR2(255)                NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  DGP_EXTRA1      NVARCHAR2(255)                    NULL,
  DGP_EXTRA2      NVARCHAR2(255)                    NULL,
  DGP_EXTRA3      NVARCHAR2(255)                    NULL,
  DGP_EXTRA4      NVARCHAR2(255)                    NULL,
  DGP_EXTRA5      NVARCHAR2(255)                    NULL,
  DGP_EXTRA6      NVARCHAR2(255)                    NULL,
  DGP_EXTRA7      NVARCHAR2(255)                    NULL,
  DGP_EXTRA8      NVARCHAR2(255)                    NULL,
  DGP_EXTRA9      NVARCHAR2(255)                    NULL,
  DGP_EXTRA10     NVARCHAR2(255)                    NULL,
  DGP_DELETE_FL   CHAR(1)                       NOT NULL,
  DGP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DAY_GROUP_DATE CASCADE CONSTRAINTS
/

--
-- DAY_GROUP_DATE  (Table) 
--
CREATE TABLE DAY_GROUP_DATE
(
  DGD_ID          NUMBER(10)                    NOT NULL,
  DGP_ID          NUMBER(10)                    NOT NULL,
  DGD_NAME        NVARCHAR2(255)                NOT NULL,
  DGD_DT          TIMESTAMP(6)                  NOT NULL,
  DGD_DELETE_FL   CHAR(1)                       NOT NULL,
  DGD_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DAY_GROUP_LIST CASCADE CONSTRAINTS
/

--
-- DAY_GROUP_LIST  (Table) 
--
CREATE TABLE DAY_GROUP_LIST
(
  DGL_ID          NUMBER(10)                    NOT NULL,
  DGL_DELETE_FL   CHAR(1)                       NOT NULL,
  DGL_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DAY_GROUP_LIST_MEMBER CASCADE CONSTRAINTS
/

--
-- DAY_GROUP_LIST_MEMBER  (Table) 
--
CREATE TABLE DAY_GROUP_LIST_MEMBER
(
  DGM_ID          NUMBER(10)                    NOT NULL,
  DGL_ID          NUMBER(10)                    NOT NULL,
  DGP_ID          NUMBER(10)                    NOT NULL,
  DGM_ORDER_NO    NUMBER(10)                    NOT NULL,
  TSG_ID          NUMBER(10)                    NOT NULL,
  DGM_DELETE_FL   CHAR(1)                       NOT NULL,
  DGM_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DEFAULT_GRID CASCADE CONSTRAINTS
/

--
-- DEFAULT_GRID  (Table) 
--
CREATE TABLE DEFAULT_GRID
(
  DGR_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  DGR_DELETE_FL   CHAR(1)                       NOT NULL,
  DGR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DEFAULT_GRID_COLUMN CASCADE CONSTRAINTS
/

--
-- DEFAULT_GRID_COLUMN  (Table) 
--
CREATE TABLE DEFAULT_GRID_COLUMN
(
  DGC_ID             NUMBER(10)                 NOT NULL,
  DGR_ID             NUMBER(10)                 NOT NULL,
  DGC_LABEL          NVARCHAR2(255)                 NULL,
  DGC_ORDER_NO       NUMBER(10)                 NOT NULL,
  DGC_TYPE           NVARCHAR2(255)             NOT NULL,
  DGC_VISIBLE_FL     CHAR(1)                    NOT NULL,
  DGC_SORT           NVARCHAR2(255)             NOT NULL,
  DGC_TEXT_ALIGN     NVARCHAR2(255)             NOT NULL,
  DGC_DATA_PROPERTY  NVARCHAR2(255)             NOT NULL,
  DGC_NULL_DISPLAY   NVARCHAR2(255)                 NULL,
  DGC_DELETE_FL      CHAR(1)                    NOT NULL,
  DGC_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE DEFAULT_TABLE_FILTER CASCADE CONSTRAINTS
/

--
-- DEFAULT_TABLE_FILTER  (Table) 
--
CREATE TABLE DEFAULT_TABLE_FILTER
(
  DTF_ID          NUMBER(10)                    NOT NULL,
  TIN_ID          NUMBER(10)                    NOT NULL,
  DTF_DELETE_FL   CHAR(1)                       NOT NULL,
  DTF_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DEFAULT_TABLE_FILTER_COL CASCADE CONSTRAINTS
/

--
-- DEFAULT_TABLE_FILTER_COL  (Table) 
--
CREATE TABLE DEFAULT_TABLE_FILTER_COL
(
  DFC_ID          NUMBER(10)                    NOT NULL,
  DTF_ID          NUMBER(10)                    NOT NULL,
  TCL_ID          NUMBER(10)                    NOT NULL,
  DFC_LABEL       NVARCHAR2(255)                NOT NULL,
  DFC_ORDER_NO    NUMBER(10)                    NOT NULL,
  DFC_VISIBLE_FL  CHAR(1)                       NOT NULL,
  DFC_DELETE_FL   CHAR(1)                       NOT NULL,
  DFC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DEFAULT_TABLE_GRID CASCADE CONSTRAINTS
/

--
-- DEFAULT_TABLE_GRID  (Table) 
--
CREATE TABLE DEFAULT_TABLE_GRID
(
  DTG_ID          NUMBER(10)                    NOT NULL,
  TIN_ID          NUMBER(10)                    NOT NULL,
  CXT_ID          NUMBER(10)                        NULL,
  DTG_DELETE_FL   CHAR(1)                       NOT NULL,
  DTG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DEFAULT_TABLE_GRID_COLUMN CASCADE CONSTRAINTS
/

--
-- DEFAULT_TABLE_GRID_COLUMN  (Table) 
--
CREATE TABLE DEFAULT_TABLE_GRID_COLUMN
(
  DTC_ID            NUMBER(10)                  NOT NULL,
  DTG_ID            NUMBER(10)                  NOT NULL,
  TCL_ID            NUMBER(10)                  NOT NULL,
  DTC_LABEL         NVARCHAR2(255)                  NULL,
  DTC_WIDTH         NUMBER(10)                  NOT NULL,
  DTC_ORDER_NO      NUMBER(10)                  NOT NULL,
  DTC_TYPE          NVARCHAR2(255)              NOT NULL,
  DTC_VISIBLE_FL    CHAR(1)                     NOT NULL,
  DTC_SORT          NVARCHAR2(255)              NOT NULL,
  DTC_TEXT_ALIGN    NVARCHAR2(255)              NOT NULL,
  DTC_NULL_DISPLAY  NVARCHAR2(255)                  NULL,
  DTC_DELETE_FL     CHAR(1)                     NOT NULL,
  DTC_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE DUPLICATE_CONFIG CASCADE CONSTRAINTS
/

--
-- DUPLICATE_CONFIG  (Table) 
--
CREATE TABLE DUPLICATE_CONFIG
(
  DCF_ID               NUMBER(10)               NOT NULL,
  TBD_ID               NUMBER(10)               NOT NULL,
  DCF_FLAG_TCL_ID      NUMBER(10)               NOT NULL,
  DCF_HASHCODE_TCL_ID  NUMBER(10)               NOT NULL,
  DCF_ID_TCL_ID        NUMBER(10)               NOT NULL,
  DCF_NAME             NVARCHAR2(255)           NOT NULL,
  DCF_DELETE_FL        CHAR(1)                  NOT NULL,
  DCF_VERSION_ID       NUMBER(10)               NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE DUPLICATE_FIELD CASCADE CONSTRAINTS
/

--
-- DUPLICATE_FIELD  (Table) 
--
CREATE TABLE DUPLICATE_FIELD
(
  DFD_ID          NUMBER(10)                    NOT NULL,
  DCF_ID          NUMBER(10)                    NOT NULL,
  TCL_ID          NUMBER(10)                    NOT NULL,
  DFD_DELETE_FL   CHAR(1)                       NOT NULL,
  DFD_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE DUPLICATE_TABLE CASCADE CONSTRAINTS
/

--
-- DUPLICATE_TABLE  (Table) 
--
CREATE TABLE DUPLICATE_TABLE
(
  DTB_ID          NUMBER(10)                    NOT NULL,
  DCF_ID          NUMBER(10)                    NOT NULL,
  TIN_ID          NUMBER(10)                    NOT NULL,
  DTB_DELETE_FL   CHAR(1)                       NOT NULL,
  DTB_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ELEMENT CASCADE CONSTRAINTS
/

--
-- ELEMENT  (Table) 
--
CREATE TABLE ELEMENT
(
  ELT_ID              NUMBER(10)                NOT NULL,
  EST_ID              NUMBER(10)                NOT NULL,
  EGP_ID              NUMBER(10)                NOT NULL,
  CTR_ID              NUMBER(10)                NOT NULL,
  ELT_NAME            NVARCHAR2(255)            NOT NULL,
  ELT_DISPLAY         NVARCHAR2(255)            NOT NULL,
  ELT_FROM_DTTM       TIMESTAMP(6)              NOT NULL,
  ELT_TO_DTTM         TIMESTAMP(6)              NOT NULL,
  ELT_DIGITS          NVARCHAR2(255)            NOT NULL,
  ELT_PARENT_ELT_ID   NUMBER(10)                    NULL,
  ELT_MATCHABLE_FL    CHAR(1)                   NOT NULL,
  ELT_MATCH_WHOLE_FL  CHAR(1)                   NOT NULL,
  ELT_VERSION_ID      NUMBER(10)                NOT NULL,
  ELT_DELETE_FL       CHAR(1)                   NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE ELEMENT_CONNECTION CASCADE CONSTRAINTS
/

--
-- ELEMENT_CONNECTION  (Table) 
--
CREATE TABLE ELEMENT_CONNECTION
(
  ECT_ID           NUMBER(10)                   NOT NULL,
  BND_ID           NUMBER(10)                   NOT NULL,
  ECT_FROM_ELT_ID  NUMBER(10)                       NULL,
  ECT_TO_ELT_ID    NUMBER(10)                   NOT NULL,
  ECT_VERSION_ID   NUMBER(10)                   NOT NULL,
  ECT_DELETE_FL    CHAR(1)                      NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE ELEMENT_REPORT_GROUP CASCADE CONSTRAINTS
/

--
-- ELEMENT_REPORT_GROUP  (Table) 
--
CREATE TABLE ELEMENT_REPORT_GROUP
(
  EGP_ID          NUMBER(10)                    NOT NULL,
  EGP_NAME        NVARCHAR2(255)                NOT NULL,
  EGP_DELETE_FL   CHAR(1)                       NOT NULL,
  EGP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ELEMENT_SET CASCADE CONSTRAINTS
/

--
-- ELEMENT_SET  (Table) 
--
CREATE TABLE ELEMENT_SET
(
  EST_ID          NUMBER(10)                    NOT NULL,
  EST_NAME        NVARCHAR2(255)                NOT NULL,
  EST_DELETE_FL   CHAR(1)                       NOT NULL,
  EST_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ENTITY_ACTION_GROUP CASCADE CONSTRAINTS
/

--
-- ENTITY_ACTION_GROUP  (Table) 
--
CREATE TABLE ENTITY_ACTION_GROUP
(
  EAG_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  EAG_CODE        NVARCHAR2(255)                NOT NULL,
  EAG_DELETE_FL   CHAR(1)                       NOT NULL,
  EAG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ENTITY_EXPORT CASCADE CONSTRAINTS
/

--
-- ENTITY_EXPORT  (Table) 
--
CREATE TABLE ENTITY_EXPORT
(
  EXP_ID             NUMBER(10)                 NOT NULL,
  EXP_NAME           NVARCHAR2(255)             NOT NULL,
  EXP_LAST_RAN_DTTM  TIMESTAMP(6)                   NULL,
  FIL_ID             NUMBER(10)                 NOT NULL,
  EXP_IMPORT_FL      CHAR(1)                    NOT NULL,
  EXP_DELETE_FL      CHAR(1)                    NOT NULL,
  EXP_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE ENTITY_EXPORT_GROUP CASCADE CONSTRAINTS
/

--
-- ENTITY_EXPORT_GROUP  (Table) 
--
CREATE TABLE ENTITY_EXPORT_GROUP
(
  EEG_ID          NUMBER(10)                    NOT NULL,
  EXP_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  EEG_DELETE_FL   CHAR(1)                       NOT NULL,
  EEG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ENTITY_EXPORT_ITEM CASCADE CONSTRAINTS
/

--
-- ENTITY_EXPORT_ITEM  (Table) 
--
CREATE TABLE ENTITY_EXPORT_ITEM
(
  EEI_ID          NUMBER(10)                    NOT NULL,
  EEG_ID          NUMBER(10)                    NOT NULL,
  EEI_OBJECT_PK   NUMBER(10)                    NOT NULL,
  EEI_DISPLAY     NVARCHAR2(255)                    NULL,
  EEI_INCLUDE_FL  CHAR(1)                       NOT NULL,
  EEI_ACTION      NVARCHAR2(255)                    NULL,
  EEI_DATA1       NVARCHAR2(255)                    NULL,
  EEI_DATA2       NVARCHAR2(255)                    NULL,
  EEI_DATA3       NVARCHAR2(255)                    NULL,
  EEI_DATA4       NVARCHAR2(255)                    NULL,
  EEI_DATA5       NVARCHAR2(255)                    NULL,
  EEI_DELETE_FL   CHAR(1)                       NOT NULL,
  EEI_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ENTITY_GUID CASCADE CONSTRAINTS
/

--
-- ENTITY_GUID  (Table) 
--
CREATE TABLE ENTITY_GUID
(
  EGD_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  EGD_GUID        NVARCHAR2(255)                NOT NULL,
  EGD_OBJECT_PK   NUMBER(10)                    NOT NULL,
  EGD_DELETE_FL   CHAR(1)                       NOT NULL,
  EGD_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ENTITY_NUMBER_GROUP CASCADE CONSTRAINTS
/

--
-- ENTITY_NUMBER_GROUP  (Table) 
--
CREATE TABLE ENTITY_NUMBER_GROUP
(
  ENG_ID               NUMBER(10)               NOT NULL,
  ENT_ID               NUMBER(10)               NOT NULL,
  ENG_NUMBER_PROPERTY  NVARCHAR2(255)           NOT NULL,
  SNG_ID               NUMBER(10)                   NULL,
  ENG_SNG_KEY          NVARCHAR2(255)               NULL,
  ENG_DELETE_FL        CHAR(1)                  NOT NULL,
  ENG_VERSION_ID       NUMBER(10)               NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE ENTITY_TBL CASCADE CONSTRAINTS
/

--
-- ENTITY_TBL  (Table) 
--
CREATE TABLE ENTITY_TBL
(
  ENT_ID              NUMBER(10)                NOT NULL,
  ENT_ENTITY          NVARCHAR2(255)            NOT NULL,
  ENT_DISPLAY         NVARCHAR2(255)            NOT NULL,
  ENT_CACHE_FL        CHAR(1)                   NOT NULL,
  ENT_ALLOW_NOTES_FL  CHAR(1)                   NOT NULL,
  ENT_DELETE_FL       CHAR(1)                   NOT NULL,
  ENT_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE EVENT_ERROR_MESSAGE CASCADE CONSTRAINTS
/

--
-- EVENT_ERROR_MESSAGE  (Table) 
--
CREATE TABLE EVENT_ERROR_MESSAGE
(
  EEM_ID          NUMBER(10)                    NOT NULL,
  EMG_ID          NUMBER(10)                    NOT NULL,
  EEM_ERROR_NO    NUMBER(10)                    NOT NULL,
  EEM_ERROR_TEXT  NVARCHAR2(255)                NOT NULL,
  EEM_DELETE_FL   CHAR(1)                       NOT NULL,
  EEM_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE EVENT_ERROR_MESSAGE_GROUP CASCADE CONSTRAINTS
/

--
-- EVENT_ERROR_MESSAGE_GROUP  (Table) 
--
CREATE TABLE EVENT_ERROR_MESSAGE_GROUP
(
  EMG_ID          NUMBER(10)                    NOT NULL,
  EMG_CODE        NVARCHAR2(255)                NOT NULL,
  EMG_DELETE_FL   CHAR(1)                       NOT NULL,
  EMG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE EVENT_STATISTICS CASCADE CONSTRAINTS
/

--
-- EVENT_STATISTICS  (Table) 
--
CREATE TABLE EVENT_STATISTICS
(
  EVS_ID          NUMBER(10)                    NOT NULL,
  SFL_ID          NUMBER(10)                    NOT NULL,
  EVS_EVT_DTTM    TIMESTAMP(6)                  NOT NULL,
  EVS_DELETE_FL   CHAR(1)                       NOT NULL,
  EVS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE EVENT_STATISTICS_STAGE CASCADE CONSTRAINTS
/

--
-- EVENT_STATISTICS_STAGE  (Table) 
--
CREATE TABLE EVENT_STATISTICS_STAGE
(
  ESS_ID             NUMBER(10)                 NOT NULL,
  EVS_ID             NUMBER(10)                 NOT NULL,
  STS_ID             NUMBER(10)                 NOT NULL,
  ESY_ID             NUMBER(10)                 NOT NULL,
  ESS_RECORDS        NUMBER(10)                 NOT NULL,
  ESS_USAGE          NUMBER(19)                 NOT NULL,
  ESS_CREATED_DTTM   TIMESTAMP(6)               NOT NULL,
  ESS_MODIFIED_DTTM  TIMESTAMP(6)               NOT NULL,
  ESS_DELETE_FL      CHAR(1)                    NOT NULL,
  ESS_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE EVENT_STATISTICS_TYPE CASCADE CONSTRAINTS
/

--
-- EVENT_STATISTICS_TYPE  (Table) 
--
CREATE TABLE EVENT_STATISTICS_TYPE
(
  ESY_ID          NUMBER(10)                    NOT NULL,
  ESY_CODE        NVARCHAR2(255)                NOT NULL,
  ESY_NAME        NVARCHAR2(255)                NOT NULL,
  ESY_DELETE_FL   CHAR(1)                       NOT NULL,
  ESY_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE EXTERNAL_ALERT CASCADE CONSTRAINTS
/

--
-- EXTERNAL_ALERT  (Table) 
--
CREATE TABLE EXTERNAL_ALERT
(
  EXA_ID          NUMBER(10)                    NOT NULL,
  EXA_ALERT_NO    NUMBER(10)                    NOT NULL,
  EXA_GUIDE_PK    NUMBER(10)                    NOT NULL,
  EXA_RESULT_PK   NUMBER(10)                        NULL,
  EXA_PARAM1      NVARCHAR2(255)                    NULL,
  EXA_PARAM2      NVARCHAR2(255)                    NULL,
  EXA_PARAM3      NVARCHAR2(255)                    NULL,
  EXA_PARAM4      NVARCHAR2(255)                    NULL,
  EXA_PARAM5      NVARCHAR2(255)                    NULL,
  EXA_DELETE_FL   CHAR(1)                       NOT NULL,
  EXA_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE EXTRA_ARGS_DFN CASCADE CONSTRAINTS
/

--
-- EXTRA_ARGS_DFN  (Table) 
--
CREATE TABLE EXTRA_ARGS_DFN
(
  EAD_ID            NUMBER(10)                  NOT NULL,
  ENT_ID            NUMBER(10)                  NOT NULL,
  EAD_NAME          NVARCHAR2(255)              NOT NULL,
  EAD_TYPE          NVARCHAR2(255)              NOT NULL,
  EAD_ORDER_NO      NUMBER(10)                  NOT NULL,
  EAD_MANDATORY_FL  CHAR(1)                     NOT NULL,
  EAD_DELETE_FL     CHAR(1)                     NOT NULL,
  EAD_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE EXTRA_ARGS_INST CASCADE CONSTRAINTS
/

--
-- EXTRA_ARGS_INST  (Table) 
--
CREATE TABLE EXTRA_ARGS_INST
(
  EAV_ID          NUMBER(10)                    NOT NULL,
  EAD_ID          NUMBER(10)                    NOT NULL,
  EAV_OBJECT_PK   NUMBER(10)                    NOT NULL,
  EAV_VALUE       NVARCHAR2(255)                    NULL,
  EAV_DELETE_FL   CHAR(1)                       NOT NULL,
  EAV_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE EXTRA_CONTROL CASCADE CONSTRAINTS
/

--
-- EXTRA_CONTROL  (Table) 
--
CREATE TABLE EXTRA_CONTROL
(
  EXC_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  EXC_NAME        NVARCHAR2(255)                NOT NULL,
  EXC_DELETE_FL   CHAR(1)                       NOT NULL,
  EXC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE FILE_COLLECTION CASCADE CONSTRAINTS
/

--
-- FILE_COLLECTION  (Table) 
--
CREATE TABLE FILE_COLLECTION
(
  FCN_ID                         NUMBER(10)     NOT NULL,
  FCN_NAME                       NVARCHAR2(255) NOT NULL,
  FLS_ID                         NUMBER(10)     NOT NULL,
  RSH_ID                         NUMBER(10)     NOT NULL,
  FCN_PATH                       NVARCHAR2(255) NOT NULL,
  FCN_FILELIST_MASK              NVARCHAR2(255) NOT NULL,
  FCN_VALIDATION_MASK            NVARCHAR2(255)     NULL,
  FCN_FSN_MASK                   NVARCHAR2(255)     NULL,
  FCN_FSN_START_NO               NVARCHAR2(255)     NULL,
  FCN_FSN_END_NO                 NVARCHAR2(255)     NULL,
  FCN_FSN_RESTART_NO             NVARCHAR2(255)     NULL,
  FCN_FSN_INCREMENT              NVARCHAR2(255)     NULL,
  FCN_FSN_NUMBER_BASE            NUMBER(10)         NULL,
  FCN_FSN_LAST_NO                NUMBER(10)         NULL,
  FCN_VALIDATE_FSN_FL            CHAR(1)        NOT NULL,
  FCN_PENDING_FL                 CHAR(1)        NOT NULL,
  FCN_MAXIMUM_RETRIES            NUMBER(10)         NULL,
  FCN_RETRY_SECS                 NUMBER(10)     NOT NULL,
  FCN_POLL_COUNT                 NUMBER(10)     NOT NULL,
  FCN_LAST_POLL_DTTM             TIMESTAMP(6)   NOT NULL,
  FCN_FORCE_NEXT_POLL_FL         CHAR(1)        NOT NULL,
  FCN_COMPRESSION_CMP_ID         NUMBER(10)         NULL,
  TOK_ID                         NUMBER(10)     NOT NULL,
  FCN_OUTPUT_PATH                NVARCHAR2(255) NOT NULL,
  FCN_COLLECTED_ACTION           NVARCHAR2(255)     NULL,
  FCN_MOVE_PATH                  NVARCHAR2(255)     NULL,
  FCN_RENAME_PREFIX              NVARCHAR2(255)     NULL,
  FCN_RENAME_SUFFIX              NVARCHAR2(255)     NULL,
  FCN_VALIDATE_RSN_FL            CHAR(1)        NOT NULL,
  FCN_RSN_START_NO               NUMBER(10)         NULL,
  FCN_RSN_END_NO                 NUMBER(10)         NULL,
  FCN_TARGET_STS_ID              NUMBER(10)         NULL,
  FCN_VALIDATE_SETTLING_TIME     NUMBER(10)         NULL,
  FCN_STATUS                     NVARCHAR2(255) NOT NULL,
  FCN_DETECT_DUPLICATE_FILE_FL   CHAR(1)        NOT NULL,
  FCN_PROCESS_DUPLICATE_FILE_FL  CHAR(1)        NOT NULL,
  FCN_DELETE_FL                  CHAR(1)        NOT NULL,
  FCN_VERSION_ID                 NUMBER(10)     NOT NULL,
  PTN_ID                         NUMBER(10)     NOT NULL
)
/


DROP TABLE FILE_FIRST_LAST_SEQUENCE CASCADE CONSTRAINTS
/

--
-- FILE_FIRST_LAST_SEQUENCE  (Table) 
--
CREATE TABLE FILE_FIRST_LAST_SEQUENCE
(
  FFL_ID                NUMBER(10)              NOT NULL,
  FIL_ID                NUMBER(10)              NOT NULL,
  FCN_ID                NUMBER(10)              NOT NULL,
  FFL_FIRST_SEQ_NUMBER  NUMBER(10)              NOT NULL,
  FFL_LAST_SEQ_TIME     TIMESTAMP(6)            NOT NULL,
  FFL_LAST_SEQ_NUMBER   NUMBER(10)              NOT NULL,
  FFL_FIRST_SEQ_TIME    TIMESTAMP(6)            NOT NULL,
  FFL_START_FL          CHAR(1)                 NOT NULL,
  FFL_DELETE_FL         CHAR(1)                 NOT NULL,
  FFL_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE FILE_PARSE_STATISTIC CASCADE CONSTRAINTS
/

--
-- FILE_PARSE_STATISTIC  (Table) 
--
CREATE TABLE FILE_PARSE_STATISTIC
(
  FPS_ID                    NUMBER(10)          NOT NULL,
  FIL_ID                    NUMBER(10)          NOT NULL,
  FPS_TOTAL_INPUT_RECORDS   NUMBER(19)          NOT NULL,
  FPS_TOTAL_OUTPUT_RECORDS  NUMBER(19)          NOT NULL,
  FPS_TOTAL_INPUT_USAGE     NUMBER(19)              NULL,
  FPS_TOTAL_OUTPUT_USAGE    NUMBER(19)              NULL,
  FPS_FIRST_RECORD_DTTM     TIMESTAMP(6)            NULL,
  FPS_LAST_RECORD_DTTM      TIMESTAMP(6)            NULL,
  FPS_EARLIEST_RECORD_DTTM  TIMESTAMP(6)            NULL,
  FPS_LATEST_RECORD_DTTM    TIMESTAMP(6)            NULL,
  FPS_FIRST_RECORD_SEQ_NUM  NUMBER(19)              NULL,
  FPS_LAST_RECORD_SEQ_NUM   NUMBER(19)              NULL,
  FPS_FIRST_BLOCK_SEQ_NUM   NUMBER(19)              NULL,
  FPS_LAST_BLOCK_SEQ_NUM    NUMBER(19)              NULL,
  FPS_DELETE_FL             CHAR(1)             NOT NULL,
  FPS_VERSION_ID            NUMBER(10)          NOT NULL,
  PTN_ID                    NUMBER(10)          NOT NULL
)
/


DROP TABLE FILE_PARSE_STAT_TYPE CASCADE CONSTRAINTS
/

--
-- FILE_PARSE_STAT_TYPE  (Table) 
--
CREATE TABLE FILE_PARSE_STAT_TYPE
(
  FSY_ID                    NUMBER(10)          NOT NULL,
  FPS_ID                    NUMBER(10)          NOT NULL,
  FSY_INPUT_RECORD_TYPE_FL  CHAR(1)             NOT NULL,
  FSY_RECORD_TYPE           NVARCHAR2(255)      NOT NULL,
  FSY_TOTAL_RECORDS         NUMBER(19)          NOT NULL,
  FSY_TOTAL_USAGE           NUMBER(19)              NULL,
  FSY_DELETE_FL             CHAR(1)             NOT NULL,
  FSY_VERSION_ID            NUMBER(10)          NOT NULL,
  PTN_ID                    NUMBER(10)          NOT NULL
)
/


DROP TABLE FILE_SOURCE CASCADE CONSTRAINTS
/

--
-- FILE_SOURCE  (Table) 
--
CREATE TABLE FILE_SOURCE
(
  FLS_ID                  NUMBER(10)            NOT NULL,
  FLS_NAME                NVARCHAR2(255)        NOT NULL,
  FLS_MAXIMUM_CONCURRENT  NUMBER(10)            NOT NULL,
  FLS_STABILITY_SECS      NUMBER(10)                NULL,
  CMP_ID                  NUMBER(10)            NOT NULL,
  FLS_CONFIGURED_PIG_ID   NUMBER(10)            NOT NULL,
  FLS_RUNNING_PIG_ID      NUMBER(10)            NOT NULL,
  FLS_STATUS              NVARCHAR2(255)        NOT NULL,
  FLS_DELETE_FL           CHAR(1)               NOT NULL,
  FLS_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE FILE_TBL CASCADE CONSTRAINTS
/

--
-- FILE_TBL  (Table) 
--
CREATE TABLE FILE_TBL
(
  FIL_ID                   NUMBER(10)           NOT NULL,
  TOK_ID                   NUMBER(10)           NOT NULL,
  MAC_ID                   NUMBER(10)               NULL,
  FIL_RELATIVE_PATH        NVARCHAR2(255)       NOT NULL,
  FIL_FILENAME             NVARCHAR2(255)       NOT NULL,
  FIL_LENGTH               NUMBER(19)               NULL,
  FIL_SEQUENCE_NO          NVARCHAR2(255)           NULL,
  FIL_SEQUENCE_NO_INT      NUMBER(10)               NULL,
  FIL_RECORDS              NUMBER(19)               NULL,
  FIL_UNIQUE_KEY           NVARCHAR2(255)           NULL,
  FIL_HASH_VALUE           NVARCHAR2(255)           NULL,
  FIL_DUPLICATE_FL         CHAR(1)              NOT NULL,
  FIL_DUPLICATE_FILE_LINK  NUMBER(10)               NULL,
  FIL_DELETE_FL            CHAR(1)              NOT NULL,
  FIL_VERSION_ID           NUMBER(10)           NOT NULL,
  PTN_ID                   NUMBER(10)           NOT NULL
)
/


DROP TABLE FREQUENCY_GROUP CASCADE CONSTRAINTS
/

--
-- FREQUENCY_GROUP  (Table) 
--
CREATE TABLE FREQUENCY_GROUP
(
  FRG_ID          NUMBER(10)                    NOT NULL,
  FRG_NAME        NVARCHAR2(255)                NOT NULL,
  FRG_DELETE_FL   CHAR(1)                       NOT NULL,
  FRG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE FREQUENCY_GROUP_COMPONENT CASCADE CONSTRAINTS
/

--
-- FREQUENCY_GROUP_COMPONENT  (Table) 
--
CREATE TABLE FREQUENCY_GROUP_COMPONENT
(
  FGC_ID          NUMBER(10)                    NOT NULL,
  FRG_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  FGC_DELETE_FL   CHAR(1)                       NOT NULL,
  FGC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE GENERATED_REPORT CASCADE CONSTRAINTS
/

--
-- GENERATED_REPORT  (Table) 
--
CREATE TABLE GENERATED_REPORT
(
  GNR_ID          NUMBER(10)                    NOT NULL,
  RPT_ID          NUMBER(10)                    NOT NULL,
  GNR_NAME        NVARCHAR2(255)                NOT NULL,
  GNR_DELETE_FL   CHAR(1)                       NOT NULL,
  GNR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE GRID CASCADE CONSTRAINTS
/

--
-- GRID  (Table) 
--
CREATE TABLE GRID
(
  GRD_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  GRD_DELETE_FL   CHAR(1)                       NOT NULL,
  GRD_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE GRID_COLUMN CASCADE CONSTRAINTS
/

--
-- GRID_COLUMN  (Table) 
--
CREATE TABLE GRID_COLUMN
(
  GRC_ID             NUMBER(10)                 NOT NULL,
  GRD_ID             NUMBER(10)                 NOT NULL,
  GRC_LABEL          NVARCHAR2(255)                 NULL,
  GRC_ORDER_NO       NUMBER(10)                 NOT NULL,
  GRC_TYPE           NVARCHAR2(255)             NOT NULL,
  GRC_VISIBLE_FL     CHAR(1)                    NOT NULL,
  GRC_SORT           NVARCHAR2(255)             NOT NULL,
  GRC_TEXT_ALIGN     NVARCHAR2(255)             NOT NULL,
  GRC_DATA_PROPERTY  NVARCHAR2(255)             NOT NULL,
  GRC_NULL_DISPLAY   NVARCHAR2(255)                 NULL,
  GRC_DELETE_FL      CHAR(1)                    NOT NULL,
  GRC_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE IMAGE_GROUP CASCADE CONSTRAINTS
/

--
-- IMAGE_GROUP  (Table) 
--
CREATE TABLE IMAGE_GROUP
(
  IGP_ID          NUMBER(10)                    NOT NULL,
  IGP_NAME        NVARCHAR2(255)                NOT NULL,
  IGP_DELETE_FL   CHAR(1)                       NOT NULL,
  IGP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE IMAGE_TBL CASCADE CONSTRAINTS
/

--
-- IMAGE_TBL  (Table) 
--
CREATE TABLE IMAGE_TBL
(
  IMG_ID          NUMBER(10)                    NOT NULL,
  IGP_ID          NUMBER(10)                    NOT NULL,
  IMG_NAME        NVARCHAR2(255)                NOT NULL,
  IMG_FILENAME    NVARCHAR2(255)                NOT NULL,
  IMG_DELETE_FL   CHAR(1)                       NOT NULL,
  IMG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE IMAGE_VIEWER CASCADE CONSTRAINTS
/

--
-- IMAGE_VIEWER  (Table) 
--
CREATE TABLE IMAGE_VIEWER
(
  IMA_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  IMG_ID          NUMBER(10)                        NULL,
  IMA_EXTENSION   NVARCHAR2(255)                NOT NULL,
  IMA_NAME        NVARCHAR2(255)                NOT NULL,
  IMA_DELETE_FL   CHAR(1)                       NOT NULL,
  IMA_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE INSTALL_VERSION CASCADE CONSTRAINTS
/

--
-- INSTALL_VERSION  (Table) 
--
CREATE TABLE INSTALL_VERSION
(
  IVN_ID             NUMBER(10)                 NOT NULL,
  IVN_PARENT_IVN_ID  NUMBER(10)                     NULL,
  IVN_NAME           NVARCHAR2(255)             NOT NULL,
  IVN_MAJOR_VER      NUMBER(10)                 NOT NULL,
  IVN_MINOR_VER      NUMBER(10)                 NOT NULL,
  IVN_REVISION_VER   NUMBER(10)                 NOT NULL,
  IVN_DELETE_FL      CHAR(1)                    NOT NULL,
  IVN_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE INTERFACE_GROUP CASCADE CONSTRAINTS
/

--
-- INTERFACE_GROUP  (Table) 
--
CREATE TABLE INTERFACE_GROUP
(
  IFG_ID          NUMBER(10)                    NOT NULL,
  IFG_NAME        NVARCHAR2(255)                NOT NULL,
  IMG_ID          NUMBER(10)                        NULL,
  IFG_DELETE_FL   CHAR(1)                       NOT NULL,
  IFG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE INTERFACE_TBL CASCADE CONSTRAINTS
/

--
-- INTERFACE_TBL  (Table) 
--
CREATE TABLE INTERFACE_TBL
(
  IFE_ID                  NUMBER(10)            NOT NULL,
  IFG_ID                  NUMBER(10)            NOT NULL,
  IFY_ID                  NUMBER(10)            NOT NULL,
  IFE_ARG1_VALUE          NVARCHAR2(255)            NULL,
  IFE_ARG2_VALUE          NVARCHAR2(255)            NULL,
  IFE_ARG3_VALUE          NVARCHAR2(255)            NULL,
  IFE_ARG4_VALUE          NVARCHAR2(255)            NULL,
  IFE_ARG5_VALUE          NVARCHAR2(255)            NULL,
  CMP_ID                  NUMBER(10)                NULL,
  IFE_NAME                NVARCHAR2(255)        NOT NULL,
  IFE_ARG_COUNT           NUMBER(10)            NOT NULL,
  IFE_ARG1_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG1_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG1_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG2_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG2_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG2_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG3_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG3_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG3_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG4_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG4_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG4_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG5_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG5_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG5_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG6_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG6_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG6_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG7_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG7_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG7_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG8_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG8_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG8_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG9_NAME           NVARCHAR2(255)            NULL,
  IFE_ARG9_MANDATORY_FL   CHAR(1)               NOT NULL,
  IFE_ARG9_EXTRA          NVARCHAR2(255)            NULL,
  IFE_ARG10_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG10_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG10_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG11_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG11_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG11_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG12_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG12_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG12_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG13_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG13_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG13_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG14_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG14_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG14_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG15_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG15_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG15_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG16_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG16_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG16_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG17_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG17_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG17_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG18_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG18_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG18_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG19_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG19_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG19_EXTRA         NVARCHAR2(255)            NULL,
  IFE_ARG20_NAME          NVARCHAR2(255)            NULL,
  IFE_ARG20_MANDATORY_FL  CHAR(1)               NOT NULL,
  IFE_ARG20_EXTRA         NVARCHAR2(255)            NULL,
  IFE_DELETE_FL           CHAR(1)               NOT NULL,
  IFE_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE INTERFACE_TYPE CASCADE CONSTRAINTS
/

--
-- INTERFACE_TYPE  (Table) 
--
CREATE TABLE INTERFACE_TYPE
(
  IFY_ID          NUMBER(10)                    NOT NULL,
  IFY_CODE        NVARCHAR2(255)                NOT NULL,
  IFY_NAME        NVARCHAR2(255)                NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  IFY_DELETE_FL   CHAR(1)                       NOT NULL,
  IFY_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE LAYOUT CASCADE CONSTRAINTS
/

--
-- LAYOUT  (Table) 
--
CREATE TABLE LAYOUT
(
  LYT_ID          NUMBER(10)                    NOT NULL,
  LYT_NAME        NVARCHAR2(255)                NOT NULL,
  LYT_IMAGE_URL   NVARCHAR2(255)                    NULL,
  LYT_URL         NVARCHAR2(255)                NOT NULL,
  LYT_DELETE_FL   CHAR(1)                       NOT NULL,
  LYT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE LONG_STRING CASCADE CONSTRAINTS
/

--
-- LONG_STRING  (Table) 
--
CREATE TABLE LONG_STRING
(
  LST_ID          NUMBER(10)                    NOT NULL,
  LST_DELETE_FL   CHAR(1)                       NOT NULL,
  LST_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE LONG_STRING_ITEM CASCADE CONSTRAINTS
/

--
-- LONG_STRING_ITEM  (Table) 
--
CREATE TABLE LONG_STRING_ITEM
(
  LSI_ID          NUMBER(10)                    NOT NULL,
  LST_ID          NUMBER(10)                    NOT NULL,
  LSI_ORDER_NO    NUMBER(10)                    NOT NULL,
  LSI_STRING      NVARCHAR2(255)                NOT NULL,
  LSI_DELETE_FL   CHAR(1)                       NOT NULL,
  LSI_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE MACHINE_ADDRESS CASCADE CONSTRAINTS
/

--
-- MACHINE_ADDRESS  (Table) 
--
CREATE TABLE MACHINE_ADDRESS
(
  MAD_ID            NUMBER(10)                  NOT NULL,
  MAC_ID            NUMBER(10)                  NOT NULL,
  MAD_HOST_ADDRESS  NVARCHAR2(255)                  NULL,
  MAD_ORDER_NO      NUMBER(10)                  NOT NULL,
  MAD_DELETE_FL     CHAR(1)                     NOT NULL,
  MAD_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE MACHINE_TBL CASCADE CONSTRAINTS
/

--
-- MACHINE_TBL  (Table) 
--
CREATE TABLE MACHINE_TBL
(
  MAC_ID          NUMBER(10)                    NOT NULL,
  MAC_NAME        NVARCHAR2(255)                NOT NULL,
  MAC_DELETE_FL   CHAR(1)                       NOT NULL,
  MAC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE MISSING_FILE CASCADE CONSTRAINTS
/

--
-- MISSING_FILE  (Table) 
--
CREATE TABLE MISSING_FILE
(
  MSF_ID          NUMBER(10)                    NOT NULL,
  FCN_ID          NUMBER(10)                    NOT NULL,
  MSF_FILE_SEQ    NUMBER(10)                    NOT NULL,
  MSF_TIME        TIMESTAMP(6)                  NOT NULL,
  MSF_DELETE_FL   CHAR(1)                       NOT NULL,
  MSF_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


--
-- ACTION_PIN_AK  (Index) 
--
--  Dependencies: 
--   ACTION_PIN (Table)
--
CREATE UNIQUE INDEX ACTION_PIN_AK ON ACTION_PIN
(ACT_ID, ANP_NAME)
/


--
-- ACTION_PIN_CONNECTION_AK  (Index) 
--
--  Dependencies: 
--   ACTION_PIN_CONNECTION (Table)
--
CREATE UNIQUE INDEX ACTION_PIN_CONNECTION_AK ON ACTION_PIN_CONNECTION
(APC_TO_ACN_ID, APC_TO_ANP_ID)
/


--
-- ACTION_PIN_CONNECTION_PK  (Index) 
--
--  Dependencies: 
--   ACTION_PIN_CONNECTION (Table)
--
CREATE UNIQUE INDEX ACTION_PIN_CONNECTION_PK ON ACTION_PIN_CONNECTION
(APC_ID)
/


--
-- ACTION_PIN_PK  (Index) 
--
--  Dependencies: 
--   ACTION_PIN (Table)
--
CREATE UNIQUE INDEX ACTION_PIN_PK ON ACTION_PIN
(ANP_ID)
/


--
-- ACTION_PIN_SS1  (Index) 
--
--  Dependencies: 
--   ACTION_PIN (Table)
--
CREATE UNIQUE INDEX ACTION_PIN_SS1 ON ACTION_PIN
(ACT_ID, ANP_INPUT_FL, ANP_ORDER_NO)
/


--
-- ACTION_PK  (Index) 
--
--  Dependencies: 
--   ACTION (Table)
--
CREATE UNIQUE INDEX ACTION_PK ON ACTION
(ACN_ID)
/


--
-- ACTION_SS1  (Index) 
--
--  Dependencies: 
--   ACTION (Table)
--
CREATE UNIQUE INDEX ACTION_SS1 ON ACTION
(TRG_ID, ACN_ORDER_NO)
/


--
-- ACTION_SS2  (Index) 
--
--  Dependencies: 
--   ACTION (Table)
--
CREATE UNIQUE INDEX ACTION_SS2 ON ACTION
(TRG_ID, ACN_NAME)
/


--
-- ACTION_TYPE_AK  (Index) 
--
--  Dependencies: 
--   ACTION_TYPE (Table)
--
CREATE UNIQUE INDEX ACTION_TYPE_AK ON ACTION_TYPE
(ACT_NAME)
/


--
-- ACTION_TYPE_PK  (Index) 
--
--  Dependencies: 
--   ACTION_TYPE (Table)
--
CREATE UNIQUE INDEX ACTION_TYPE_PK ON ACTION_TYPE
(ACT_ID)
/


--
-- ALERT_DFN_AK  (Index) 
--
--  Dependencies: 
--   ALERT_DFN (Table)
--
CREATE UNIQUE INDEX ALERT_DFN_AK ON ALERT_DFN
(ALD_ALERT_NO)
/


--
-- ALERT_DFN_NOTIFY_TEAM_PK  (Index) 
--
--  Dependencies: 
--   ALERT_DFN_NOTIFY_TEAM (Table)
--
CREATE UNIQUE INDEX ALERT_DFN_NOTIFY_TEAM_PK ON ALERT_DFN_NOTIFY_TEAM
(ADT_ID)
/


--
-- ALERT_DFN_NOTIFY_TEAM_SS1  (Index) 
--
--  Dependencies: 
--   ALERT_DFN_NOTIFY_TEAM (Table)
--
CREATE UNIQUE INDEX ALERT_DFN_NOTIFY_TEAM_SS1 ON ALERT_DFN_NOTIFY_TEAM
(ALD_ID, TEA_ID)
/


--
-- ALERT_DFN_NOTIFY_USER_PK  (Index) 
--
--  Dependencies: 
--   ALERT_DFN_NOTIFY_USER (Table)
--
CREATE UNIQUE INDEX ALERT_DFN_NOTIFY_USER_PK ON ALERT_DFN_NOTIFY_USER
(ADU_ID)
/


--
-- ALERT_DFN_NOTIFY_USER_SS1  (Index) 
--
--  Dependencies: 
--   ALERT_DFN_NOTIFY_USER (Table)
--
CREATE UNIQUE INDEX ALERT_DFN_NOTIFY_USER_SS1 ON ALERT_DFN_NOTIFY_USER
(ALD_ID, USR_ID)
/


--
-- ALERT_DFN_PK  (Index) 
--
--  Dependencies: 
--   ALERT_DFN (Table)
--
CREATE UNIQUE INDEX ALERT_DFN_PK ON ALERT_DFN
(ALD_ID)
/


--
-- ALERT_DFN_SS1  (Index) 
--
--  Dependencies: 
--   ALERT_DFN (Table)
--
CREATE INDEX ALERT_DFN_SS1 ON ALERT_DFN
(ALD_ALERT_TEXT)
/


--
-- ALERT_GROUP_AK  (Index) 
--
--  Dependencies: 
--   ALERT_GROUP (Table)
--
CREATE UNIQUE INDEX ALERT_GROUP_AK ON ALERT_GROUP
(ALG_NAME)
/


--
-- ALERT_GROUP_NOTIFY_TEAM_PK  (Index) 
--
--  Dependencies: 
--   ALERT_GROUP_NOTIFY_TEAM (Table)
--
CREATE UNIQUE INDEX ALERT_GROUP_NOTIFY_TEAM_PK ON ALERT_GROUP_NOTIFY_TEAM
(AGT_ID)
/


--
-- ALERT_GROUP_NOTIFY_TEAM_SS1  (Index) 
--
--  Dependencies: 
--   ALERT_GROUP_NOTIFY_TEAM (Table)
--
CREATE UNIQUE INDEX ALERT_GROUP_NOTIFY_TEAM_SS1 ON ALERT_GROUP_NOTIFY_TEAM
(ALG_ID, TEA_ID)
/


--
-- ALERT_GROUP_NOTIFY_USER_PK  (Index) 
--
--  Dependencies: 
--   ALERT_GROUP_NOTIFY_USER (Table)
--
CREATE UNIQUE INDEX ALERT_GROUP_NOTIFY_USER_PK ON ALERT_GROUP_NOTIFY_USER
(AGU_ID)
/


--
-- ALERT_GROUP_NOTIFY_USER_SS1  (Index) 
--
--  Dependencies: 
--   ALERT_GROUP_NOTIFY_USER (Table)
--
CREATE UNIQUE INDEX ALERT_GROUP_NOTIFY_USER_SS1 ON ALERT_GROUP_NOTIFY_USER
(ALG_ID, USR_ID)
/


--
-- ALERT_GROUP_PK  (Index) 
--
--  Dependencies: 
--   ALERT_GROUP (Table)
--
CREATE UNIQUE INDEX ALERT_GROUP_PK ON ALERT_GROUP
(ALG_ID)
/


--
-- ALERT_INST_AK  (Index) 
--
--  Dependencies: 
--   ALERT_INST (Table)
--
CREATE INDEX ALERT_INST_AK ON ALERT_INST
(ALI_ID, ALI_RAISED_DTTM)
/


--
-- ALERT_INST_PK  (Index) 
--
--  Dependencies: 
--   ALERT_INST (Table)
--
CREATE UNIQUE INDEX ALERT_INST_PK ON ALERT_INST
(ALI_ID)
/


--
-- ALERT_SEVERITY_PK  (Index) 
--
--  Dependencies: 
--   ALERT_SEVERITY (Table)
--
CREATE UNIQUE INDEX ALERT_SEVERITY_PK ON ALERT_SEVERITY
(ASV_ID)
/


--
-- ALERT_SEVERITY_SS1  (Index) 
--
--  Dependencies: 
--   ALERT_SEVERITY (Table)
--
CREATE UNIQUE INDEX ALERT_SEVERITY_SS1 ON ALERT_SEVERITY
(ASV_NAME)
/


--
-- ALERT_SEVERITY_SS2  (Index) 
--
--  Dependencies: 
--   ALERT_SEVERITY (Table)
--
CREATE UNIQUE INDEX ALERT_SEVERITY_SS2 ON ALERT_SEVERITY
(ASV_ORDER_NO)
/


--
-- APPLICATION_TBL_AK  (Index) 
--
--  Dependencies: 
--   APPLICATION_TBL (Table)
--
CREATE UNIQUE INDEX APPLICATION_TBL_AK ON APPLICATION_TBL
(APP_NAME)
/


--
-- APPLICATION_TBL_PK  (Index) 
--
--  Dependencies: 
--   APPLICATION_TBL (Table)
--
CREATE UNIQUE INDEX APPLICATION_TBL_PK ON APPLICATION_TBL
(APP_ID)
/


--
-- APPLICATION_USER_PK  (Index) 
--
--  Dependencies: 
--   APPLICATION_USER (Table)
--
CREATE UNIQUE INDEX APPLICATION_USER_PK ON APPLICATION_USER
(APU_ID)
/


--
-- APPLICATION_USER_SS1  (Index) 
--
--  Dependencies: 
--   APPLICATION_USER (Table)
--
CREATE UNIQUE INDEX APPLICATION_USER_SS1 ON APPLICATION_USER
(APP_ID, USR_ID)
/


--
-- AUDIT_LEVEL_PK  (Index) 
--
--  Dependencies: 
--   AUDIT_LEVEL (Table)
--
CREATE UNIQUE INDEX AUDIT_LEVEL_PK ON AUDIT_LEVEL
(AUL_ID)
/


--
-- AUDIT_LEVEL_SS1  (Index) 
--
--  Dependencies: 
--   AUDIT_LEVEL (Table)
--
CREATE UNIQUE INDEX AUDIT_LEVEL_SS1 ON AUDIT_LEVEL
(ENT_ID)
/


--
-- AUTO_SQL_FROM_AK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_FROM (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_FROM_AK ON AUTO_SQL_FROM
(ASQ_ID, ASF_ORDER_NO)
/


--
-- AUTO_SQL_FROM_PK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_FROM (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_FROM_PK ON AUTO_SQL_FROM
(ASF_ID)
/


--
-- AUTO_SQL_FROM_SS1  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_FROM (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_FROM_SS1 ON AUTO_SQL_FROM
(ASQ_ID, ASF_TABLE_ALIAS)
/


--
-- AUTO_SQL_ORDER_BY_AK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_ORDER_BY (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_ORDER_BY_AK ON AUTO_SQL_ORDER_BY
(ASQ_ID, ASO_ORDER_NO)
/


--
-- AUTO_SQL_ORDER_BY_PK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_ORDER_BY (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_ORDER_BY_PK ON AUTO_SQL_ORDER_BY
(ASO_ID)
/


--
-- AUTO_SQL_PK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_PK ON AUTO_SQL
(ASQ_ID)
/


--
-- AUTO_SQL_SELECT_AK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_SELECT (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_SELECT_AK ON AUTO_SQL_SELECT
(ASQ_ID, ASS_ORDER_NO)
/


--
-- AUTO_SQL_SELECT_PK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_SELECT (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_SELECT_PK ON AUTO_SQL_SELECT
(ASS_ID)
/


--
-- AUTO_SQL_WHERE_AK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_WHERE (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_WHERE_AK ON AUTO_SQL_WHERE
(ASQ_ID, ASW_ORDER_NO)
/


--
-- AUTO_SQL_WHERE_PK  (Index) 
--
--  Dependencies: 
--   AUTO_SQL_WHERE (Table)
--
CREATE UNIQUE INDEX AUTO_SQL_WHERE_PK ON AUTO_SQL_WHERE
(ASW_ID)
/


--
-- BAND_AK  (Index) 
--
--  Dependencies: 
--   BAND (Table)
--
CREATE UNIQUE INDEX BAND_AK ON BAND
(BND_NAME, EST_ID)
/


--
-- BAND_PK  (Index) 
--
--  Dependencies: 
--   BAND (Table)
--
CREATE UNIQUE INDEX BAND_PK ON BAND
(BND_ID)
/


--
-- BAND_SS1  (Index) 
--
--  Dependencies: 
--   BAND (Table)
--
CREATE UNIQUE INDEX BAND_SS1 ON BAND
(EST_ID, BND_NAME)
/


--
-- BAND_TYPE_AK  (Index) 
--
--  Dependencies: 
--   BAND_TYPE (Table)
--
CREATE UNIQUE INDEX BAND_TYPE_AK ON BAND_TYPE
(BDT_NAME)
/


--
-- BAND_TYPE_PK  (Index) 
--
--  Dependencies: 
--   BAND_TYPE (Table)
--
CREATE UNIQUE INDEX BAND_TYPE_PK ON BAND_TYPE
(BDT_ID)
/


--
-- BUSINESS_OBJECTS_GROUP_AK  (Index) 
--
--  Dependencies: 
--   BUSINESS_OBJECTS_GROUP (Table)
--
CREATE UNIQUE INDEX BUSINESS_OBJECTS_GROUP_AK ON BUSINESS_OBJECTS_GROUP
(BOG_NAME)
/


--
-- BUSINESS_OBJECTS_GROUP_PK  (Index) 
--
--  Dependencies: 
--   BUSINESS_OBJECTS_GROUP (Table)
--
CREATE UNIQUE INDEX BUSINESS_OBJECTS_GROUP_PK ON BUSINESS_OBJECTS_GROUP
(BOG_ID)
/


--
-- BUSINESS_OBJECTS_REPORT_PK  (Index) 
--
--  Dependencies: 
--   BUSINESS_OBJECTS_REPORT (Table)
--
CREATE UNIQUE INDEX BUSINESS_OBJECTS_REPORT_PK ON BUSINESS_OBJECTS_REPORT
(BOR_ID)
/


--
-- BUSINESS_OBJECTS_SERVER_AK  (Index) 
--
--  Dependencies: 
--   BUSINESS_OBJECTS_SERVER (Table)
--
CREATE UNIQUE INDEX BUSINESS_OBJECTS_SERVER_AK ON BUSINESS_OBJECTS_SERVER
(BOS_NAME)
/


--
-- BUSINESS_OBJECTS_SERVER_PK  (Index) 
--
--  Dependencies: 
--   BUSINESS_OBJECTS_SERVER (Table)
--
CREATE UNIQUE INDEX BUSINESS_OBJECTS_SERVER_PK ON BUSINESS_OBJECTS_SERVER
(BOS_ID)
/


--
-- BUSINESS_OBJECTS_UNIVERSE_AK  (Index) 
--
--  Dependencies: 
--   BUSINESS_OBJECTS_UNIVERSE (Table)
--
CREATE UNIQUE INDEX BUSINESS_OBJECTS_UNIVERSE_AK ON BUSINESS_OBJECTS_UNIVERSE
(BOS_ID, BOV_UNIVERSE_NAME)
/


--
-- BUSINESS_OBJECTS_UNIVERSE_PK  (Index) 
--
--  Dependencies: 
--   BUSINESS_OBJECTS_UNIVERSE (Table)
--
CREATE UNIQUE INDEX BUSINESS_OBJECTS_UNIVERSE_PK ON BUSINESS_OBJECTS_UNIVERSE
(BOV_ID)
/


--
-- CACHE_STRATEGY_PK  (Index) 
--
--  Dependencies: 
--   CACHE_STRATEGY (Table)
--
CREATE UNIQUE INDEX CACHE_STRATEGY_PK ON CACHE_STRATEGY
(CST_ID)
/


--
-- CACHE_STRATEGY_SS1  (Index) 
--
--  Dependencies: 
--   CACHE_STRATEGY (Table)
--
CREATE UNIQUE INDEX CACHE_STRATEGY_SS1 ON CACHE_STRATEGY
(CST_CACHE_CLASS, CST_OBJECT_CLASS, CST_CACHE_KEY)
/


--
-- CASE_DFN_AK  (Index) 
--
--  Dependencies: 
--   CASE_DFN (Table)
--
CREATE UNIQUE INDEX CASE_DFN_AK ON CASE_DFN
(CDN_NAME)
/


--
-- CASE_DFN_ITEM_AK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_AK ON CASE_DFN_ITEM
(CDN_ID, CDI_NAME)
/


--
-- CASE_DFN_ITEM_ALERT_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_ALERT (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_ALERT_PK ON CASE_DFN_ITEM_ALERT
(CDA_ID)
/


--
-- CASE_DFN_ITEM_ALERT_SS1  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_ALERT (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_ALERT_SS1 ON CASE_DFN_ITEM_ALERT
(CDI_ID, ALD_ID, CDA_GUIDE_PK)
/


--
-- CASE_DFN_ITEM_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_PK ON CASE_DFN_ITEM
(CDI_ID)
/


--
-- CASE_DFN_ITEM_STEP_AK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_STEP (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_STEP_AK ON CASE_DFN_ITEM_STEP
(CDI_ID, CDS_NAME)
/


--
-- CASE_DFN_ITEM_STEP_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_STEP (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_STEP_PK ON CASE_DFN_ITEM_STEP
(CDS_ID)
/


--
-- CASE_DFN_ITEM_STEP_TEAM_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_STEP_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_STEP_TEAM_PK ON CASE_DFN_ITEM_STEP_TEAM
(CTT_ID)
/


--
-- CASE_DFN_ITEM_STEP_TEAM_SS1  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_STEP_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_STEP_TEAM_SS1 ON CASE_DFN_ITEM_STEP_TEAM
(CDS_ID, TEA_ID)
/


--
-- CASE_DFN_ITEM_TEAM_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_TEAM_PK ON CASE_DFN_ITEM_TEAM
(CMT_ID)
/


--
-- CASE_DFN_ITEM_TEAM_SS1  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_TEAM_SS1 ON CASE_DFN_ITEM_TEAM
(CDI_ID, TEA_ID)
/


--
-- CASE_DFN_ITEM_TRANSITION_AK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_TRANSITION (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_TRANSITION_AK ON CASE_DFN_ITEM_TRANSITION
(CDT_FROM_CDS_ID, CDT_TO_CDS_ID)
/


--
-- CASE_DFN_ITEM_TRANSITION_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_ITEM_TRANSITION (Table)
--
CREATE UNIQUE INDEX CASE_DFN_ITEM_TRANSITION_PK ON CASE_DFN_ITEM_TRANSITION
(CDT_ID)
/


--
-- CASE_DFN_NOTIFY_TEAM_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_NOTIFY_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_NOTIFY_TEAM_PK ON CASE_DFN_NOTIFY_TEAM
(CNT_ID)
/


--
-- CASE_DFN_NOTIFY_USER_AK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_NOTIFY_USER (Table)
--
CREATE UNIQUE INDEX CASE_DFN_NOTIFY_USER_AK ON CASE_DFN_NOTIFY_USER
(CDN_ID, USR_ID)
/


--
-- CASE_DFN_NOTIFY_USER_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_NOTIFY_USER (Table)
--
CREATE UNIQUE INDEX CASE_DFN_NOTIFY_USER_PK ON CASE_DFN_NOTIFY_USER
(CDU_ID)
/


--
-- CASE_DFN_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN (Table)
--
CREATE UNIQUE INDEX CASE_DFN_PK ON CASE_DFN
(CDN_ID)
/


--
-- CASE_DFN_TEAM_PK  (Index) 
--
--  Dependencies: 
--   CASE_DFN_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_TEAM_PK ON CASE_DFN_TEAM
(CAT_ID)
/


--
-- CASE_DFN_TEAM_SS1  (Index) 
--
--  Dependencies: 
--   CASE_DFN_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_DFN_TEAM_SS1 ON CASE_DFN_TEAM
(CDN_ID, TEA_ID)
/


--
-- CASE_ESCALATION_PK  (Index) 
--
--  Dependencies: 
--   CASE_ESCALATION (Table)
--
CREATE UNIQUE INDEX CASE_ESCALATION_PK ON CASE_ESCALATION
(CEN_ID)
/


--
-- CASE_ESC_NOTIFY_TEAM_PK  (Index) 
--
--  Dependencies: 
--   CASE_ESC_NOTIFY_TEAM (Table)
--
CREATE UNIQUE INDEX CASE_ESC_NOTIFY_TEAM_PK ON CASE_ESC_NOTIFY_TEAM
(CET_ID)
/


--
-- CASE_ESC_NOTIFY_USER_PK  (Index) 
--
--  Dependencies: 
--   CASE_ESC_NOTIFY_USER (Table)
--
CREATE UNIQUE INDEX CASE_ESC_NOTIFY_USER_PK ON CASE_ESC_NOTIFY_USER
(CEU_ID)
/


--
-- CASE_INST_HISTORY_PK  (Index) 
--
--  Dependencies: 
--   CASE_INST_HISTORY (Table)
--
CREATE UNIQUE INDEX CASE_INST_HISTORY_PK ON CASE_INST_HISTORY
(CTH_ID)
/


--
-- CASE_INST_HISTORY_SS1  (Index) 
--
--  Dependencies: 
--   CASE_INST_HISTORY (Table)
--
CREATE UNIQUE INDEX CASE_INST_HISTORY_SS1 ON CASE_INST_HISTORY
(CIT_ID, CTH_ID)
/


--
-- CASE_INST_ITEM_HISTORY_PK  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM_HISTORY (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_HISTORY_PK ON CASE_INST_ITEM_HISTORY
(CIH_ID)
/


--
-- CASE_INST_ITEM_HISTORY_SS1  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM_HISTORY (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_HISTORY_SS1 ON CASE_INST_ITEM_HISTORY
(CII_ID, CIH_ID)
/


--
-- CASE_INST_ITEM_NOTE_PK  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM_NOTE (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_NOTE_PK ON CASE_INST_ITEM_NOTE
(CIN_ID)
/


--
-- CASE_INST_ITEM_NOTE_SS1  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM_NOTE (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_NOTE_SS1 ON CASE_INST_ITEM_NOTE
(CII_ID, CIN_ID)
/


--
-- CASE_INST_ITEM_PK  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_PK ON CASE_INST_ITEM
(CII_ID)
/


--
-- CASE_INST_ITEM_SS1  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_SS1 ON CASE_INST_ITEM
(CIT_ID, CII_ID)
/


--
-- CASE_INST_ITEM_SS2  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_SS2 ON CASE_INST_ITEM
(CDI_ID, CII_ID)
/


--
-- CASE_INST_ITEM_STEP_PK  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM_STEP (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_STEP_PK ON CASE_INST_ITEM_STEP
(CIS_ID)
/


--
-- CASE_INST_ITEM_STEP_SS1  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM_STEP (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_STEP_SS1 ON CASE_INST_ITEM_STEP
(CII_ID, CIS_ORDER_NO)
/


--
-- CASE_INST_ITEM_STEP_SS2  (Index) 
--
--  Dependencies: 
--   CASE_INST_ITEM_STEP (Table)
--
CREATE UNIQUE INDEX CASE_INST_ITEM_STEP_SS2 ON CASE_INST_ITEM_STEP
(CDS_ID, CIS_ID)
/


--
-- CASE_INST_NOTE_PK  (Index) 
--
--  Dependencies: 
--   CASE_INST_NOTE (Table)
--
CREATE UNIQUE INDEX CASE_INST_NOTE_PK ON CASE_INST_NOTE
(CTN_ID)
/


--
-- CASE_INST_NOTE_SS1  (Index) 
--
--  Dependencies: 
--   CASE_INST_NOTE (Table)
--
CREATE UNIQUE INDEX CASE_INST_NOTE_SS1 ON CASE_INST_NOTE
(CIT_ID, CTN_ID)
/


--
-- CASE_INST_PK  (Index) 
--
--  Dependencies: 
--   CASE_INST (Table)
--
CREATE UNIQUE INDEX CASE_INST_PK ON CASE_INST
(CIT_ID)
/


--
-- CASE_INST_SS1  (Index) 
--
--  Dependencies: 
--   CASE_INST (Table)
--
CREATE UNIQUE INDEX CASE_INST_SS1 ON CASE_INST
(CIT_CASE_NO)
/


--
-- CASE_INST_SS2  (Index) 
--
--  Dependencies: 
--   CASE_INST (Table)
--
CREATE UNIQUE INDEX CASE_INST_SS2 ON CASE_INST
(CDN_ID, CIT_ID)
/


--
-- CASE_ITEM_PRIORITY_PK  (Index) 
--
--  Dependencies: 
--   CASE_ITEM_PRIORITY (Table)
--
CREATE UNIQUE INDEX CASE_ITEM_PRIORITY_PK ON CASE_ITEM_PRIORITY
(CIP_ID)
/


--
-- CASE_ITEM_PRIORITY_SS1  (Index) 
--
--  Dependencies: 
--   CASE_ITEM_PRIORITY (Table)
--
CREATE UNIQUE INDEX CASE_ITEM_PRIORITY_SS1 ON CASE_ITEM_PRIORITY
(CIP_NAME)
/


--
-- CASE_ITEM_PRIORITY_SS2  (Index) 
--
--  Dependencies: 
--   CASE_ITEM_PRIORITY (Table)
--
CREATE UNIQUE INDEX CASE_ITEM_PRIORITY_SS2 ON CASE_ITEM_PRIORITY
(CIP_ORDER_NO)
/


--
-- CHANGED_CLASS_PK  (Index) 
--
--  Dependencies: 
--   CHANGED_CLASS (Table)
--
CREATE UNIQUE INDEX CHANGED_CLASS_PK ON CHANGED_CLASS
(CDC_ID)
/


--
-- CHANGED_CLASS_SS1  (Index) 
--
--  Dependencies: 
--   CHANGED_CLASS (Table)
--
CREATE UNIQUE INDEX CHANGED_CLASS_SS1 ON CHANGED_CLASS
(CDC_CLASS)
/


--
-- CHART_AK  (Index) 
--
--  Dependencies: 
--   CHART (Table)
--
CREATE UNIQUE INDEX CHART_AK ON CHART
(CHR_NAME)
/


--
-- CHART_PK  (Index) 
--
--  Dependencies: 
--   CHART (Table)
--
CREATE UNIQUE INDEX CHART_PK ON CHART
(CHR_ID)
/


--
-- CHART_PROPERTY_GROUP_PK  (Index) 
--
--  Dependencies: 
--   CHART_PROPERTY_GROUP (Table)
--
CREATE UNIQUE INDEX CHART_PROPERTY_GROUP_PK ON CHART_PROPERTY_GROUP
(CPG_ID)
/


--
-- CHART_RANGE_PK  (Index) 
--
--  Dependencies: 
--   CHART_RANGE (Table)
--
CREATE UNIQUE INDEX CHART_RANGE_PK ON CHART_RANGE
(CCR_ID)
/


--
-- CHART_SERIES_PK  (Index) 
--
--  Dependencies: 
--   CHART_SERIES (Table)
--
CREATE UNIQUE INDEX CHART_SERIES_PK ON CHART_SERIES
(CHS_ID)
/


--
-- CHART_SERIES_TYPE_AK  (Index) 
--
--  Dependencies: 
--   CHART_SERIES_TYPE (Table)
--
CREATE UNIQUE INDEX CHART_SERIES_TYPE_AK ON CHART_SERIES_TYPE
(TYP_NAME)
/


--
-- CHART_SERIES_TYPE_PK  (Index) 
--
--  Dependencies: 
--   CHART_SERIES_TYPE (Table)
--
CREATE UNIQUE INDEX CHART_SERIES_TYPE_PK ON CHART_SERIES_TYPE
(TYP_ID)
/


--
-- CHART_SUB_TYPE_AK  (Index) 
--
--  Dependencies: 
--   CHART_SUB_TYPE (Table)
--
CREATE UNIQUE INDEX CHART_SUB_TYPE_AK ON CHART_SUB_TYPE
(CSB_SWF)
/


--
-- CHART_SUB_TYPE_PK  (Index) 
--
--  Dependencies: 
--   CHART_SUB_TYPE (Table)
--
CREATE UNIQUE INDEX CHART_SUB_TYPE_PK ON CHART_SUB_TYPE
(CSB_ID)
/


--
-- CHART_SUB_TYPE_PROP_AK  (Index) 
--
--  Dependencies: 
--   CHART_SUB_TYPE_PROP (Table)
--
CREATE UNIQUE INDEX CHART_SUB_TYPE_PROP_AK ON CHART_SUB_TYPE_PROP
(CSB_ID, CSP_PDG_KEY, CSP_TAG_NAME)
/


--
-- CHART_SUB_TYPE_PROP_PK  (Index) 
--
--  Dependencies: 
--   CHART_SUB_TYPE_PROP (Table)
--
CREATE UNIQUE INDEX CHART_SUB_TYPE_PROP_PK ON CHART_SUB_TYPE_PROP
(CSP_ID)
/


--
-- CHART_TYPE_AK  (Index) 
--
--  Dependencies: 
--   CHART_TYPE (Table)
--
CREATE UNIQUE INDEX CHART_TYPE_AK ON CHART_TYPE
(CHT_NAME)
/


--
-- CHART_TYPE_PK  (Index) 
--
--  Dependencies: 
--   CHART_TYPE (Table)
--
CREATE UNIQUE INDEX CHART_TYPE_PK ON CHART_TYPE
(CHT_ID)
/


--
-- COLLECTED_FILE_PK  (Index) 
--
--  Dependencies: 
--   COLLECTED_FILE (Table)
--
CREATE UNIQUE INDEX COLLECTED_FILE_PK ON COLLECTED_FILE
(CLF_ID)
/


--
-- COLLECTED_FILE_SS1  (Index) 
--
--  Dependencies: 
--   COLLECTED_FILE (Table)
--
CREATE UNIQUE INDEX COLLECTED_FILE_SS1 ON COLLECTED_FILE
(FIL_ID, CLF_ID)
/


--
-- COMPONENT_PK  (Index) 
--
--  Dependencies: 
--   COMPONENT (Table)
--
CREATE UNIQUE INDEX COMPONENT_PK ON COMPONENT
(CMP_ID)
/


--
-- COMPONENT_SS1  (Index) 
--
--  Dependencies: 
--   COMPONENT (Table)
--
CREATE UNIQUE INDEX COMPONENT_SS1 ON COMPONENT
(CMP_NAME, CPT_ID)
/


--
-- COMPONENT_TYPE_PK  (Index) 
--
--  Dependencies: 
--   COMPONENT_TYPE (Table)
--
CREATE UNIQUE INDEX COMPONENT_TYPE_PK ON COMPONENT_TYPE
(CPT_ID)
/


--
-- COMPONENT_TYPE_SS1  (Index) 
--
--  Dependencies: 
--   COMPONENT_TYPE (Table)
--
CREATE UNIQUE INDEX COMPONENT_TYPE_SS1 ON COMPONENT_TYPE
(CPT_NAME)
/


--
-- COMPONENT_TYPE_SS2  (Index) 
--
--  Dependencies: 
--   COMPONENT_TYPE (Table)
--
CREATE UNIQUE INDEX COMPONENT_TYPE_SS2 ON COMPONENT_TYPE
(CPT_TYPE_CD)
/


--
-- CONTEXT_PK  (Index) 
--
--  Dependencies: 
--   CONTEXT (Table)
--
CREATE UNIQUE INDEX CONTEXT_PK ON CONTEXT
(CXT_ID)
/


--
-- CONTEXT_SS1  (Index) 
--
--  Dependencies: 
--   CONTEXT (Table)
--
CREATE UNIQUE INDEX CONTEXT_SS1 ON CONTEXT
(CXT_NAME)
/


--
-- COUNTRY_AK  (Index) 
--
--  Dependencies: 
--   COUNTRY (Table)
--
CREATE UNIQUE INDEX COUNTRY_AK ON COUNTRY
(CTR_NAME)
/


--
-- COUNTRY_PK  (Index) 
--
--  Dependencies: 
--   COUNTRY (Table)
--
CREATE UNIQUE INDEX COUNTRY_PK ON COUNTRY
(CTR_ID)
/


--
-- COUNTRY_SS1  (Index) 
--
--  Dependencies: 
--   COUNTRY (Table)
--
CREATE UNIQUE INDEX COUNTRY_SS1 ON COUNTRY
(CTR_ISO_CD)
/


--
-- CURRENCY_AK  (Index) 
--
--  Dependencies: 
--   CURRENCY (Table)
--
CREATE UNIQUE INDEX CURRENCY_AK ON CURRENCY
(CUR_NAME)
/


--
-- CURRENCY_PK  (Index) 
--
--  Dependencies: 
--   CURRENCY (Table)
--
CREATE UNIQUE INDEX CURRENCY_PK ON CURRENCY
(CUR_ID)
/


--
-- CURRENCY_SS1  (Index) 
--
--  Dependencies: 
--   CURRENCY (Table)
--
CREATE UNIQUE INDEX CURRENCY_SS1 ON CURRENCY
(CUR_ISO_CD)
/


--
-- CUSTOM_OBJECT_AK  (Index) 
--
--  Dependencies: 
--   CUSTOM_OBJECT (Table)
--
CREATE UNIQUE INDEX CUSTOM_OBJECT_AK ON CUSTOM_OBJECT
(COS_NAME)
/


--
-- CUSTOM_OBJECT_GROUP_AK  (Index) 
--
--  Dependencies: 
--   CUSTOM_OBJECT_GROUP (Table)
--
CREATE UNIQUE INDEX CUSTOM_OBJECT_GROUP_AK ON CUSTOM_OBJECT_GROUP
(COG_NAME)
/


--
-- CUSTOM_OBJECT_GROUP_PK  (Index) 
--
--  Dependencies: 
--   CUSTOM_OBJECT_GROUP (Table)
--
CREATE UNIQUE INDEX CUSTOM_OBJECT_GROUP_PK ON CUSTOM_OBJECT_GROUP
(COG_ID)
/


--
-- CUSTOM_OBJECT_PK  (Index) 
--
--  Dependencies: 
--   CUSTOM_OBJECT (Table)
--
CREATE UNIQUE INDEX CUSTOM_OBJECT_PK ON CUSTOM_OBJECT
(COS_ID)
/


--
-- DASHBOARD_AK  (Index) 
--
--  Dependencies: 
--   DASHBOARD (Table)
--
CREATE UNIQUE INDEX DASHBOARD_AK ON DASHBOARD
(DBD_NAME)
/


--
-- DASHBOARD_PK  (Index) 
--
--  Dependencies: 
--   DASHBOARD (Table)
--
CREATE UNIQUE INDEX DASHBOARD_PK ON DASHBOARD
(DBD_ID)
/


--
-- DASHBOARD_SECTION_PK  (Index) 
--
--  Dependencies: 
--   DASHBOARD_SECTION (Table)
--
CREATE UNIQUE INDEX DASHBOARD_SECTION_PK ON DASHBOARD_SECTION
(DBS_ID)
/


--
-- DASHBOARD_SERVER_AK  (Index) 
--
--  Dependencies: 
--   DASHBOARD_SERVER (Table)
--
CREATE UNIQUE INDEX DASHBOARD_SERVER_AK ON DASHBOARD_SERVER
(DER_NAME)
/


--
-- DASHBOARD_SERVER_PK  (Index) 
--
--  Dependencies: 
--   DASHBOARD_SERVER (Table)
--
CREATE UNIQUE INDEX DASHBOARD_SERVER_PK ON DASHBOARD_SERVER
(DER_ID)
/


--
-- DATA_INTEGRITY_CHECK_PK  (Index) 
--
--  Dependencies: 
--   DATA_INTEGRITY_CHECK (Table)
--
CREATE UNIQUE INDEX DATA_INTEGRITY_CHECK_PK ON DATA_INTEGRITY_CHECK
(DIC_ID)
/


--
-- DATA_SOURCE_CONNECTION_AK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_CONNECTION (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_CONNECTION_AK ON DATA_SOURCE_CONNECTION
(DSC_NAME)
/


--
-- DATA_SOURCE_CONNECTION_PK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_CONNECTION (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_CONNECTION_PK ON DATA_SOURCE_CONNECTION
(DSC_ID)
/


--
-- DATA_SOURCE_LOCATION_AK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_LOCATION (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_LOCATION_AK ON DATA_SOURCE_LOCATION
(DSL_NAME)
/


--
-- DATA_SOURCE_LOCATION_PK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_LOCATION (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_LOCATION_PK ON DATA_SOURCE_LOCATION
(DSL_ID)
/


--
-- DATA_SOURCE_PERSPECTIVE_AK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_PERSPECTIVE (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_PERSPECTIVE_AK ON DATA_SOURCE_PERSPECTIVE
(DPR_NAME)
/


--
-- DATA_SOURCE_PERSPECTIVE_PK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_PERSPECTIVE (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_PERSPECTIVE_PK ON DATA_SOURCE_PERSPECTIVE
(DPR_ID)
/


--
-- DATA_SOURCE_TYPE_AK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_TYPE (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_TYPE_AK ON DATA_SOURCE_TYPE
(DSY_NAME)
/


--
-- DATA_SOURCE_TYPE_PK  (Index) 
--
--  Dependencies: 
--   DATA_SOURCE_TYPE (Table)
--
CREATE UNIQUE INDEX DATA_SOURCE_TYPE_PK ON DATA_SOURCE_TYPE
(DSY_ID)
/


--
-- DATE_ALLOCATED_NUMBER_PK  (Index) 
--
--  Dependencies: 
--   DATE_ALLOCATED_NUMBER (Table)
--
CREATE UNIQUE INDEX DATE_ALLOCATED_NUMBER_PK ON DATE_ALLOCATED_NUMBER
(DAN_ID)
/


--
-- DATE_ALLOCATED_NUMBER_SS1  (Index) 
--
--  Dependencies: 
--   DATE_ALLOCATED_NUMBER (Table)
--
CREATE UNIQUE INDEX DATE_ALLOCATED_NUMBER_SS1 ON DATE_ALLOCATED_NUMBER
(SNG_ID, DAN_ID)
/


--
-- DAY_GROUP_AK  (Index) 
--
--  Dependencies: 
--   DAY_GROUP (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_AK ON DAY_GROUP
(DGP_NAME)
/


--
-- DAY_GROUP_DATE_PK  (Index) 
--
--  Dependencies: 
--   DAY_GROUP_DATE (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_DATE_PK ON DAY_GROUP_DATE
(DGD_ID)
/


--
-- DAY_GROUP_DATE_SS1  (Index) 
--
--  Dependencies: 
--   DAY_GROUP_DATE (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_DATE_SS1 ON DAY_GROUP_DATE
(DGP_ID, DGD_NAME)
/


--
-- DAY_GROUP_DATE_SS2  (Index) 
--
--  Dependencies: 
--   DAY_GROUP_DATE (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_DATE_SS2 ON DAY_GROUP_DATE
(DGP_ID, DGD_DT)
/


--
-- DAY_GROUP_LIST_MEMBER_AK  (Index) 
--
--  Dependencies: 
--   DAY_GROUP_LIST_MEMBER (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_LIST_MEMBER_AK ON DAY_GROUP_LIST_MEMBER
(DGL_ID, DGP_ID)
/


--
-- DAY_GROUP_LIST_MEMBER_PK  (Index) 
--
--  Dependencies: 
--   DAY_GROUP_LIST_MEMBER (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_LIST_MEMBER_PK ON DAY_GROUP_LIST_MEMBER
(DGM_ID)
/


--
-- DAY_GROUP_LIST_PK  (Index) 
--
--  Dependencies: 
--   DAY_GROUP_LIST (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_LIST_PK ON DAY_GROUP_LIST
(DGL_ID)
/


--
-- DAY_GROUP_PK  (Index) 
--
--  Dependencies: 
--   DAY_GROUP (Table)
--
CREATE UNIQUE INDEX DAY_GROUP_PK ON DAY_GROUP
(DGP_ID)
/


--
-- DEFAULT_GRID_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   DEFAULT_GRID_COLUMN (Table)
--
CREATE UNIQUE INDEX DEFAULT_GRID_COLUMN_PK ON DEFAULT_GRID_COLUMN
(DGC_ID)
/


--
-- DEFAULT_GRID_COLUMN_SS1  (Index) 
--
--  Dependencies: 
--   DEFAULT_GRID_COLUMN (Table)
--
CREATE UNIQUE INDEX DEFAULT_GRID_COLUMN_SS1 ON DEFAULT_GRID_COLUMN
(DGR_ID, DGC_ORDER_NO)
/


--
-- DEFAULT_GRID_PK  (Index) 
--
--  Dependencies: 
--   DEFAULT_GRID (Table)
--
CREATE UNIQUE INDEX DEFAULT_GRID_PK ON DEFAULT_GRID
(DGR_ID)
/


--
-- DEFAULT_GRID_SS1  (Index) 
--
--  Dependencies: 
--   DEFAULT_GRID (Table)
--
CREATE UNIQUE INDEX DEFAULT_GRID_SS1 ON DEFAULT_GRID
(ENT_ID)
/


--
-- DEFAULT_TABLE_FILTER_COL_PK  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_FILTER_COL (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_FILTER_COL_PK ON DEFAULT_TABLE_FILTER_COL
(DFC_ID)
/


--
-- DEFAULT_TABLE_FILTER_COL_SS1  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_FILTER_COL (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_FILTER_COL_SS1 ON DEFAULT_TABLE_FILTER_COL
(DTF_ID, DFC_ORDER_NO, DFC_ID)
/


--
-- DEFAULT_TABLE_FILTER_PK  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_FILTER (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_FILTER_PK ON DEFAULT_TABLE_FILTER
(DTF_ID)
/


--
-- DEFAULT_TABLE_FILTER_SS1  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_FILTER (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_FILTER_SS1 ON DEFAULT_TABLE_FILTER
(TIN_ID)
/


--
-- DEFAULT_TABLE_GRID_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_GRID_COLUMN (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_GRID_COLUMN_PK ON DEFAULT_TABLE_GRID_COLUMN
(DTC_ID)
/


--
-- DEFAULT_TABLE_GRID_COLUMN_SS1  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_GRID_COLUMN (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_GRID_COLUMN_SS1 ON DEFAULT_TABLE_GRID_COLUMN
(DTG_ID, DTC_ORDER_NO, DTC_ID)
/


--
-- DEFAULT_TABLE_GRID_PK  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_GRID (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_GRID_PK ON DEFAULT_TABLE_GRID
(DTG_ID)
/


--
-- DEFAULT_TABLE_GRID_SS1  (Index) 
--
--  Dependencies: 
--   DEFAULT_TABLE_GRID (Table)
--
CREATE UNIQUE INDEX DEFAULT_TABLE_GRID_SS1 ON DEFAULT_TABLE_GRID
(TIN_ID, CXT_ID)
/


--
-- DUPLICATE_CONFIG_AK  (Index) 
--
--  Dependencies: 
--   DUPLICATE_CONFIG (Table)
--
CREATE UNIQUE INDEX DUPLICATE_CONFIG_AK ON DUPLICATE_CONFIG
(DCF_NAME)
/


--
-- DUPLICATE_CONFIG_PK  (Index) 
--
--  Dependencies: 
--   DUPLICATE_CONFIG (Table)
--
CREATE UNIQUE INDEX DUPLICATE_CONFIG_PK ON DUPLICATE_CONFIG
(DCF_ID)
/


--
-- DUPLICATE_FIELD_AK  (Index) 
--
--  Dependencies: 
--   DUPLICATE_FIELD (Table)
--
CREATE UNIQUE INDEX DUPLICATE_FIELD_AK ON DUPLICATE_FIELD
(DCF_ID, TCL_ID)
/


--
-- DUPLICATE_FIELD_PK  (Index) 
--
--  Dependencies: 
--   DUPLICATE_FIELD (Table)
--
CREATE UNIQUE INDEX DUPLICATE_FIELD_PK ON DUPLICATE_FIELD
(DFD_ID)
/


--
-- DUPLICATE_TABLE_AK  (Index) 
--
--  Dependencies: 
--   DUPLICATE_TABLE (Table)
--
CREATE UNIQUE INDEX DUPLICATE_TABLE_AK ON DUPLICATE_TABLE
(DCF_ID, TIN_ID)
/


--
-- DUPLICATE_TABLE_PK  (Index) 
--
--  Dependencies: 
--   DUPLICATE_TABLE (Table)
--
CREATE UNIQUE INDEX DUPLICATE_TABLE_PK ON DUPLICATE_TABLE
(DTB_ID)
/


--
-- ELEMENT_AK  (Index) 
--
--  Dependencies: 
--   ELEMENT (Table)
--
CREATE UNIQUE INDEX ELEMENT_AK ON ELEMENT
(ELT_DISPLAY, ELT_FROM_DTTM, EST_ID)
/


--
-- ELEMENT_CONNECTION_PK  (Index) 
--
--  Dependencies: 
--   ELEMENT_CONNECTION (Table)
--
CREATE UNIQUE INDEX ELEMENT_CONNECTION_PK ON ELEMENT_CONNECTION
(ECT_ID)
/


--
-- ELEMENT_CONNECTION_SS1  (Index) 
--
--  Dependencies: 
--   ELEMENT_CONNECTION (Table)
--
CREATE UNIQUE INDEX ELEMENT_CONNECTION_SS1 ON ELEMENT_CONNECTION
(ECT_FROM_ELT_ID, ECT_TO_ELT_ID, BND_ID)
/


--
-- ELEMENT_CONNECTION_SS2  (Index) 
--
--  Dependencies: 
--   ELEMENT_CONNECTION (Table)
--
CREATE UNIQUE INDEX ELEMENT_CONNECTION_SS2 ON ELEMENT_CONNECTION
(ECT_TO_ELT_ID, ECT_FROM_ELT_ID, BND_ID)
/


--
-- ELEMENT_CONNECTION_SS3  (Index) 
--
--  Dependencies: 
--   ELEMENT_CONNECTION (Table)
--
CREATE UNIQUE INDEX ELEMENT_CONNECTION_SS3 ON ELEMENT_CONNECTION
(BND_ID, ECT_ID)
/


--
-- ELEMENT_PK  (Index) 
--
--  Dependencies: 
--   ELEMENT (Table)
--
CREATE UNIQUE INDEX ELEMENT_PK ON ELEMENT
(ELT_ID)
/


--
-- ELEMENT_REPORT_GROUP_PK  (Index) 
--
--  Dependencies: 
--   ELEMENT_REPORT_GROUP (Table)
--
CREATE UNIQUE INDEX ELEMENT_REPORT_GROUP_PK ON ELEMENT_REPORT_GROUP
(EGP_ID)
/


--
-- ELEMENT_REPORT_GROUP_SS1  (Index) 
--
--  Dependencies: 
--   ELEMENT_REPORT_GROUP (Table)
--
CREATE UNIQUE INDEX ELEMENT_REPORT_GROUP_SS1 ON ELEMENT_REPORT_GROUP
(EGP_NAME)
/


--
-- ELEMENT_SET_AK  (Index) 
--
--  Dependencies: 
--   ELEMENT_SET (Table)
--
CREATE UNIQUE INDEX ELEMENT_SET_AK ON ELEMENT_SET
(EST_NAME)
/


--
-- ELEMENT_SET_PK  (Index) 
--
--  Dependencies: 
--   ELEMENT_SET (Table)
--
CREATE UNIQUE INDEX ELEMENT_SET_PK ON ELEMENT_SET
(EST_ID)
/


--
-- ELEMENT_SS1  (Index) 
--
--  Dependencies: 
--   ELEMENT (Table)
--
CREATE UNIQUE INDEX ELEMENT_SS1 ON ELEMENT
(EST_ID, ELT_DIGITS, ELT_FROM_DTTM)
/


--
-- ENTITY_ACTION_GROUP_AK  (Index) 
--
--  Dependencies: 
--   ENTITY_ACTION_GROUP (Table)
--
CREATE UNIQUE INDEX ENTITY_ACTION_GROUP_AK ON ENTITY_ACTION_GROUP
(EAG_CODE)
/


--
-- ENTITY_ACTION_GROUP_PK  (Index) 
--
--  Dependencies: 
--   ENTITY_ACTION_GROUP (Table)
--
CREATE UNIQUE INDEX ENTITY_ACTION_GROUP_PK ON ENTITY_ACTION_GROUP
(EAG_ID)
/


--
-- ENTITY_EXPORT_GROUP_PK  (Index) 
--
--  Dependencies: 
--   ENTITY_EXPORT_GROUP (Table)
--
CREATE UNIQUE INDEX ENTITY_EXPORT_GROUP_PK ON ENTITY_EXPORT_GROUP
(EEG_ID)
/


--
-- ENTITY_EXPORT_ITEM_PK  (Index) 
--
--  Dependencies: 
--   ENTITY_EXPORT_ITEM (Table)
--
CREATE UNIQUE INDEX ENTITY_EXPORT_ITEM_PK ON ENTITY_EXPORT_ITEM
(EEI_ID)
/


--
-- ENTITY_EXPORT_ITEM_SS1  (Index) 
--
--  Dependencies: 
--   ENTITY_EXPORT_ITEM (Table)
--
CREATE UNIQUE INDEX ENTITY_EXPORT_ITEM_SS1 ON ENTITY_EXPORT_ITEM
(EEG_ID, EEI_OBJECT_PK)
/


--
-- ENTITY_EXPORT_PK  (Index) 
--
--  Dependencies: 
--   ENTITY_EXPORT (Table)
--
CREATE UNIQUE INDEX ENTITY_EXPORT_PK ON ENTITY_EXPORT
(EXP_ID)
/


--
-- ENTITY_GUID_AK  (Index) 
--
--  Dependencies: 
--   ENTITY_GUID (Table)
--
CREATE UNIQUE INDEX ENTITY_GUID_AK ON ENTITY_GUID
(EGD_GUID)
/


--
-- ENTITY_GUID_PK  (Index) 
--
--  Dependencies: 
--   ENTITY_GUID (Table)
--
CREATE UNIQUE INDEX ENTITY_GUID_PK ON ENTITY_GUID
(EGD_ID)
/


--
-- ENTITY_GUID_SS1  (Index) 
--
--  Dependencies: 
--   ENTITY_GUID (Table)
--
CREATE UNIQUE INDEX ENTITY_GUID_SS1 ON ENTITY_GUID
(ENT_ID, EGD_OBJECT_PK)
/


--
-- ENTITY_NUMBER_GROUP_PK  (Index) 
--
--  Dependencies: 
--   ENTITY_NUMBER_GROUP (Table)
--
CREATE UNIQUE INDEX ENTITY_NUMBER_GROUP_PK ON ENTITY_NUMBER_GROUP
(ENG_ID)
/


--
-- ENTITY_NUMBER_GROUP_SS1  (Index) 
--
--  Dependencies: 
--   ENTITY_NUMBER_GROUP (Table)
--
CREATE UNIQUE INDEX ENTITY_NUMBER_GROUP_SS1 ON ENTITY_NUMBER_GROUP
(ENT_ID, ENG_NUMBER_PROPERTY)
/


--
-- ENTITY_TBL_PK  (Index) 
--
--  Dependencies: 
--   ENTITY_TBL (Table)
--
CREATE UNIQUE INDEX ENTITY_TBL_PK ON ENTITY_TBL
(ENT_ID)
/


--
-- ENTITY_TBL_SS1  (Index) 
--
--  Dependencies: 
--   ENTITY_TBL (Table)
--
CREATE UNIQUE INDEX ENTITY_TBL_SS1 ON ENTITY_TBL
(ENT_ENTITY)
/


--
-- EVENT_ERROR_MESSAGE_AK  (Index) 
--
--  Dependencies: 
--   EVENT_ERROR_MESSAGE (Table)
--
CREATE UNIQUE INDEX EVENT_ERROR_MESSAGE_AK ON EVENT_ERROR_MESSAGE
(EEM_ERROR_NO)
/


--
-- EVENT_ERROR_MESSAGE_GROUP_PK  (Index) 
--
--  Dependencies: 
--   EVENT_ERROR_MESSAGE_GROUP (Table)
--
CREATE UNIQUE INDEX EVENT_ERROR_MESSAGE_GROUP_PK ON EVENT_ERROR_MESSAGE_GROUP
(EMG_ID)
/


--
-- EVENT_ERROR_MESSAGE_GROUP_SS1  (Index) 
--
--  Dependencies: 
--   EVENT_ERROR_MESSAGE_GROUP (Table)
--
CREATE UNIQUE INDEX EVENT_ERROR_MESSAGE_GROUP_SS1 ON EVENT_ERROR_MESSAGE_GROUP
(EMG_CODE)
/


--
-- EVENT_ERROR_MESSAGE_PK  (Index) 
--
--  Dependencies: 
--   EVENT_ERROR_MESSAGE (Table)
--
CREATE UNIQUE INDEX EVENT_ERROR_MESSAGE_PK ON EVENT_ERROR_MESSAGE
(EEM_ID)
/


--
-- EVENT_STATISTICS_AK  (Index) 
--
--  Dependencies: 
--   EVENT_STATISTICS (Table)
--
CREATE UNIQUE INDEX EVENT_STATISTICS_AK ON EVENT_STATISTICS
(SFL_ID, EVS_EVT_DTTM)
/


--
-- EVENT_STATISTICS_PK  (Index) 
--
--  Dependencies: 
--   EVENT_STATISTICS (Table)
--
CREATE UNIQUE INDEX EVENT_STATISTICS_PK ON EVENT_STATISTICS
(EVS_ID)
/


--
-- EVENT_STATISTICS_STAGE_AK  (Index) 
--
--  Dependencies: 
--   EVENT_STATISTICS_STAGE (Table)
--
CREATE UNIQUE INDEX EVENT_STATISTICS_STAGE_AK ON EVENT_STATISTICS_STAGE
(EVS_ID, STS_ID, ESY_ID)
/


--
-- EVENT_STATISTICS_STAGE_PK  (Index) 
--
--  Dependencies: 
--   EVENT_STATISTICS_STAGE (Table)
--
CREATE UNIQUE INDEX EVENT_STATISTICS_STAGE_PK ON EVENT_STATISTICS_STAGE
(ESS_ID)
/


--
-- EVENT_STATISTICS_TYPE_AK  (Index) 
--
--  Dependencies: 
--   EVENT_STATISTICS_TYPE (Table)
--
CREATE UNIQUE INDEX EVENT_STATISTICS_TYPE_AK ON EVENT_STATISTICS_TYPE
(ESY_CODE)
/


--
-- EVENT_STATISTICS_TYPE_PK  (Index) 
--
--  Dependencies: 
--   EVENT_STATISTICS_TYPE (Table)
--
CREATE UNIQUE INDEX EVENT_STATISTICS_TYPE_PK ON EVENT_STATISTICS_TYPE
(ESY_ID)
/


--
-- EVENT_STATISTICS_TYPE_SS1  (Index) 
--
--  Dependencies: 
--   EVENT_STATISTICS_TYPE (Table)
--
CREATE UNIQUE INDEX EVENT_STATISTICS_TYPE_SS1 ON EVENT_STATISTICS_TYPE
(ESY_NAME)
/


--
-- EXTERNAL_ALERT_PK  (Index) 
--
--  Dependencies: 
--   EXTERNAL_ALERT (Table)
--
CREATE UNIQUE INDEX EXTERNAL_ALERT_PK ON EXTERNAL_ALERT
(EXA_ID)
/


--
-- EXTRA_ARGS_DFN_PK  (Index) 
--
--  Dependencies: 
--   EXTRA_ARGS_DFN (Table)
--
CREATE UNIQUE INDEX EXTRA_ARGS_DFN_PK ON EXTRA_ARGS_DFN
(EAD_ID)
/


--
-- EXTRA_ARGS_DFN_SS1  (Index) 
--
--  Dependencies: 
--   EXTRA_ARGS_DFN (Table)
--
CREATE UNIQUE INDEX EXTRA_ARGS_DFN_SS1 ON EXTRA_ARGS_DFN
(ENT_ID, EAD_NAME)
/


--
-- EXTRA_ARGS_DFN_SS2  (Index) 
--
--  Dependencies: 
--   EXTRA_ARGS_DFN (Table)
--
CREATE UNIQUE INDEX EXTRA_ARGS_DFN_SS2 ON EXTRA_ARGS_DFN
(ENT_ID, EAD_ORDER_NO, EAD_ID)
/


--
-- EXTRA_ARGS_INST_PK  (Index) 
--
--  Dependencies: 
--   EXTRA_ARGS_INST (Table)
--
CREATE UNIQUE INDEX EXTRA_ARGS_INST_PK ON EXTRA_ARGS_INST
(EAV_ID)
/


--
-- EXTRA_ARGS_INST_SS1  (Index) 
--
--  Dependencies: 
--   EXTRA_ARGS_INST (Table)
--
CREATE UNIQUE INDEX EXTRA_ARGS_INST_SS1 ON EXTRA_ARGS_INST
(EAD_ID, EAV_OBJECT_PK)
/


--
-- EXTRA_CONTROL_AK  (Index) 
--
--  Dependencies: 
--   EXTRA_CONTROL (Table)
--
CREATE UNIQUE INDEX EXTRA_CONTROL_AK ON EXTRA_CONTROL
(ENT_ID, EXC_NAME)
/


--
-- EXTRA_CONTROL_PK  (Index) 
--
--  Dependencies: 
--   EXTRA_CONTROL (Table)
--
CREATE UNIQUE INDEX EXTRA_CONTROL_PK ON EXTRA_CONTROL
(EXC_ID)
/


--
-- FILE_COLLECTION_PK  (Index) 
--
--  Dependencies: 
--   FILE_COLLECTION (Table)
--
CREATE UNIQUE INDEX FILE_COLLECTION_PK ON FILE_COLLECTION
(FCN_ID)
/


--
-- FILE_COLLECTION_SS1  (Index) 
--
--  Dependencies: 
--   FILE_COLLECTION (Table)
--
CREATE UNIQUE INDEX FILE_COLLECTION_SS1 ON FILE_COLLECTION
(FLS_ID, FCN_NAME)
/


--
-- FILE_FIRST_LAST_SEQUENCE_PK  (Index) 
--
--  Dependencies: 
--   FILE_FIRST_LAST_SEQUENCE (Table)
--
CREATE UNIQUE INDEX FILE_FIRST_LAST_SEQUENCE_PK ON FILE_FIRST_LAST_SEQUENCE
(FFL_ID)
/


--
-- FILE_PARSE_STATISTIC_PK  (Index) 
--
--  Dependencies: 
--   FILE_PARSE_STATISTIC (Table)
--
CREATE UNIQUE INDEX FILE_PARSE_STATISTIC_PK ON FILE_PARSE_STATISTIC
(FPS_ID)
/


--
-- FILE_PARSE_STAT_TYPE_PK  (Index) 
--
--  Dependencies: 
--   FILE_PARSE_STAT_TYPE (Table)
--
CREATE UNIQUE INDEX FILE_PARSE_STAT_TYPE_PK ON FILE_PARSE_STAT_TYPE
(FSY_ID)
/


--
-- FILE_SOURCE_PK  (Index) 
--
--  Dependencies: 
--   FILE_SOURCE (Table)
--
CREATE UNIQUE INDEX FILE_SOURCE_PK ON FILE_SOURCE
(FLS_ID)
/


--
-- FILE_SOURCE_SS1  (Index) 
--
--  Dependencies: 
--   FILE_SOURCE (Table)
--
CREATE UNIQUE INDEX FILE_SOURCE_SS1 ON FILE_SOURCE
(FLS_NAME)
/


--
-- FILE_TBL_PK  (Index) 
--
--  Dependencies: 
--   FILE_TBL (Table)
--
CREATE UNIQUE INDEX FILE_TBL_PK ON FILE_TBL
(FIL_ID)
/


--
-- FILE_TBL_SS1  (Index) 
--
--  Dependencies: 
--   FILE_TBL (Table)
--
CREATE UNIQUE INDEX FILE_TBL_SS1 ON FILE_TBL
(FIL_FILENAME, FIL_ID)
/


--
-- FILE_TBL_SS2  (Index) 
--
--  Dependencies: 
--   FILE_TBL (Table)
--
CREATE INDEX FILE_TBL_SS2 ON FILE_TBL
(FIL_HASH_VALUE)
/


--
-- FREQUENCY_GROUP_AK  (Index) 
--
--  Dependencies: 
--   FREQUENCY_GROUP (Table)
--
CREATE UNIQUE INDEX FREQUENCY_GROUP_AK ON FREQUENCY_GROUP
(FRG_NAME)
/


--
-- FREQUENCY_GROUP_COMPONENT_AK  (Index) 
--
--  Dependencies: 
--   FREQUENCY_GROUP_COMPONENT (Table)
--
CREATE UNIQUE INDEX FREQUENCY_GROUP_COMPONENT_AK ON FREQUENCY_GROUP_COMPONENT
(FRG_ID, CMP_ID)
/


--
-- FREQUENCY_GROUP_COMPONENT_PK  (Index) 
--
--  Dependencies: 
--   FREQUENCY_GROUP_COMPONENT (Table)
--
CREATE UNIQUE INDEX FREQUENCY_GROUP_COMPONENT_PK ON FREQUENCY_GROUP_COMPONENT
(FGC_ID)
/


--
-- FREQUENCY_GROUP_PK  (Index) 
--
--  Dependencies: 
--   FREQUENCY_GROUP (Table)
--
CREATE UNIQUE INDEX FREQUENCY_GROUP_PK ON FREQUENCY_GROUP
(FRG_ID)
/


--
-- GENERATED_REPORT_PK  (Index) 
--
--  Dependencies: 
--   GENERATED_REPORT (Table)
--
CREATE UNIQUE INDEX GENERATED_REPORT_PK ON GENERATED_REPORT
(GNR_ID)
/


--
-- GRID_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   GRID_COLUMN (Table)
--
CREATE UNIQUE INDEX GRID_COLUMN_PK ON GRID_COLUMN
(GRC_ID)
/


--
-- GRID_COLUMN_SS1  (Index) 
--
--  Dependencies: 
--   GRID_COLUMN (Table)
--
CREATE UNIQUE INDEX GRID_COLUMN_SS1 ON GRID_COLUMN
(GRD_ID, GRC_ORDER_NO)
/


--
-- GRID_PK  (Index) 
--
--  Dependencies: 
--   GRID (Table)
--
CREATE UNIQUE INDEX GRID_PK ON GRID
(GRD_ID)
/


--
-- GRID_SS1  (Index) 
--
--  Dependencies: 
--   GRID (Table)
--
CREATE UNIQUE INDEX GRID_SS1 ON GRID
(USR_ID, ENT_ID)
/


--
-- IMAGE_GROUP_PK  (Index) 
--
--  Dependencies: 
--   IMAGE_GROUP (Table)
--
CREATE UNIQUE INDEX IMAGE_GROUP_PK ON IMAGE_GROUP
(IGP_ID)
/


--
-- IMAGE_GROUP_SS1  (Index) 
--
--  Dependencies: 
--   IMAGE_GROUP (Table)
--
CREATE UNIQUE INDEX IMAGE_GROUP_SS1 ON IMAGE_GROUP
(IGP_NAME)
/


--
-- IMAGE_TBL_AK  (Index) 
--
--  Dependencies: 
--   IMAGE_TBL (Table)
--
CREATE UNIQUE INDEX IMAGE_TBL_AK ON IMAGE_TBL
(IMG_NAME)
/


--
-- IMAGE_TBL_PK  (Index) 
--
--  Dependencies: 
--   IMAGE_TBL (Table)
--
CREATE UNIQUE INDEX IMAGE_TBL_PK ON IMAGE_TBL
(IMG_ID)
/


--
-- IMAGE_VIEWER_AK  (Index) 
--
--  Dependencies: 
--   IMAGE_VIEWER (Table)
--
CREATE UNIQUE INDEX IMAGE_VIEWER_AK ON IMAGE_VIEWER
(IMA_EXTENSION)
/


--
-- IMAGE_VIEWER_PK  (Index) 
--
--  Dependencies: 
--   IMAGE_VIEWER (Table)
--
CREATE UNIQUE INDEX IMAGE_VIEWER_PK ON IMAGE_VIEWER
(IMA_ID)
/


--
-- IMAGE_VIEWER_SS1  (Index) 
--
--  Dependencies: 
--   IMAGE_VIEWER (Table)
--
CREATE UNIQUE INDEX IMAGE_VIEWER_SS1 ON IMAGE_VIEWER
(IMA_NAME)
/


--
-- INSTALL_VERSION_PK  (Index) 
--
--  Dependencies: 
--   INSTALL_VERSION (Table)
--
CREATE UNIQUE INDEX INSTALL_VERSION_PK ON INSTALL_VERSION
(IVN_ID)
/


--
-- INSTALL_VERSION_SS1  (Index) 
--
--  Dependencies: 
--   INSTALL_VERSION (Table)
--
CREATE UNIQUE INDEX INSTALL_VERSION_SS1 ON INSTALL_VERSION
(IVN_NAME)
/


--
-- INTERFACE_GROUP_AK  (Index) 
--
--  Dependencies: 
--   INTERFACE_GROUP (Table)
--
CREATE UNIQUE INDEX INTERFACE_GROUP_AK ON INTERFACE_GROUP
(IFG_NAME)
/


--
-- INTERFACE_GROUP_PK  (Index) 
--
--  Dependencies: 
--   INTERFACE_GROUP (Table)
--
CREATE UNIQUE INDEX INTERFACE_GROUP_PK ON INTERFACE_GROUP
(IFG_ID)
/


--
-- INTERFACE_TBL_AK  (Index) 
--
--  Dependencies: 
--   INTERFACE_TBL (Table)
--
CREATE UNIQUE INDEX INTERFACE_TBL_AK ON INTERFACE_TBL
(IFE_NAME)
/


--
-- INTERFACE_TBL_PK  (Index) 
--
--  Dependencies: 
--   INTERFACE_TBL (Table)
--
CREATE UNIQUE INDEX INTERFACE_TBL_PK ON INTERFACE_TBL
(IFE_ID)
/


--
-- INTERFACE_TYPE_AK  (Index) 
--
--  Dependencies: 
--   INTERFACE_TYPE (Table)
--
CREATE UNIQUE INDEX INTERFACE_TYPE_AK ON INTERFACE_TYPE
(IFY_CODE)
/


--
-- INTERFACE_TYPE_PK  (Index) 
--
--  Dependencies: 
--   INTERFACE_TYPE (Table)
--
CREATE UNIQUE INDEX INTERFACE_TYPE_PK ON INTERFACE_TYPE
(IFY_ID)
/


--
-- INTERFACE_TYPE_SS1  (Index) 
--
--  Dependencies: 
--   INTERFACE_TYPE (Table)
--
CREATE UNIQUE INDEX INTERFACE_TYPE_SS1 ON INTERFACE_TYPE
(IFY_NAME)
/


--
-- LAYOUT_AK  (Index) 
--
--  Dependencies: 
--   LAYOUT (Table)
--
CREATE UNIQUE INDEX LAYOUT_AK ON LAYOUT
(LYT_NAME)
/


--
-- LAYOUT_PK  (Index) 
--
--  Dependencies: 
--   LAYOUT (Table)
--
CREATE UNIQUE INDEX LAYOUT_PK ON LAYOUT
(LYT_ID)
/


--
-- LONG_STRING_ITEM_PK  (Index) 
--
--  Dependencies: 
--   LONG_STRING_ITEM (Table)
--
CREATE UNIQUE INDEX LONG_STRING_ITEM_PK ON LONG_STRING_ITEM
(LSI_ID)
/


--
-- LONG_STRING_PK  (Index) 
--
--  Dependencies: 
--   LONG_STRING (Table)
--
CREATE UNIQUE INDEX LONG_STRING_PK ON LONG_STRING
(LST_ID)
/


--
-- MACHINE_ADDRESS_PK  (Index) 
--
--  Dependencies: 
--   MACHINE_ADDRESS (Table)
--
CREATE UNIQUE INDEX MACHINE_ADDRESS_PK ON MACHINE_ADDRESS
(MAD_ID)
/


--
-- MACHINE_ADDRESS_SS1  (Index) 
--
--  Dependencies: 
--   MACHINE_ADDRESS (Table)
--
CREATE UNIQUE INDEX MACHINE_ADDRESS_SS1 ON MACHINE_ADDRESS
(MAC_ID, MAD_HOST_ADDRESS)
/


--
-- MACHINE_TBL_AK  (Index) 
--
--  Dependencies: 
--   MACHINE_TBL (Table)
--
CREATE UNIQUE INDEX MACHINE_TBL_AK ON MACHINE_TBL
(MAC_NAME)
/


--
-- MACHINE_TBL_PK  (Index) 
--
--  Dependencies: 
--   MACHINE_TBL (Table)
--
CREATE UNIQUE INDEX MACHINE_TBL_PK ON MACHINE_TBL
(MAC_ID)
/


--
-- MISSING_FILE_PK  (Index) 
--
--  Dependencies: 
--   MISSING_FILE (Table)
--
CREATE UNIQUE INDEX MISSING_FILE_PK ON MISSING_FILE
(MSF_ID)
/



DROP TABLE NEXT_OBJECT_ID CASCADE CONSTRAINTS
/

--
-- NEXT_OBJECT_ID  (Table) 
--
CREATE TABLE NEXT_OBJECT_ID
(
  NOI_OBJECT_NAME  NVARCHAR2(255)               NOT NULL,
  NOI_CURRENT_NO   NUMBER(19)                   NOT NULL
)
/


DROP TABLE NOTE CASCADE CONSTRAINTS
/

--
-- NOTE  (Table) 
--
CREATE TABLE NOTE
(
  NOT_ID              NUMBER(10)                NOT NULL,
  NOT_NAME            NVARCHAR2(255)            NOT NULL,
  ENT_ID              NUMBER(10)                NOT NULL,
  NOT_OBJECT_PK       NUMBER(10)                NOT NULL,
  LST_ID              NUMBER(10)                NOT NULL,
  NOT_CREATED_USR_ID  NUMBER(10)                NOT NULL,
  NOT_CREATED_DTTM    TIMESTAMP(6)              NOT NULL,
  NOT_DELETE_FL       CHAR(1)                   NOT NULL,
  NOT_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE NOTE_ATTACHMENT CASCADE CONSTRAINTS
/

--
-- NOTE_ATTACHMENT  (Table) 
--
CREATE TABLE NOTE_ATTACHMENT
(
  NAT_ID          NUMBER(10)                    NOT NULL,
  NAT_NAME        NVARCHAR2(255)                NOT NULL,
  NOT_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  NAT_DATA1       NVARCHAR2(255)                    NULL,
  NAT_DATA2       NVARCHAR2(255)                    NULL,
  NAT_DATA3       NVARCHAR2(255)                    NULL,
  NAT_DATA4       NVARCHAR2(255)                    NULL,
  NAT_DATA5       NVARCHAR2(255)                    NULL,
  NAT_DELETE_FL   CHAR(1)                       NOT NULL,
  NAT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE NOTE_HISTORY CASCADE CONSTRAINTS
/

--
-- NOTE_HISTORY  (Table) 
--
CREATE TABLE NOTE_HISTORY
(
  NOH_ID             NUMBER(10)                 NOT NULL,
  NOT_ID             NUMBER(10)                 NOT NULL,
  NOH_NAME           NVARCHAR2(255)             NOT NULL,
  LST_ID             NUMBER(10)                 NOT NULL,
  USR_ID             NUMBER(10)                 NOT NULL,
  NOH_MODIFIED_DTTM  TIMESTAMP(6)               NOT NULL,
  NOH_ACTION_CD      NVARCHAR2(255)             NOT NULL,
  NOH_DESC           NVARCHAR2(255)             NOT NULL,
  NOH_DELETE_FL      CHAR(1)                    NOT NULL,
  NOH_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE PARAMETER_DFN CASCADE CONSTRAINTS
/

--
-- PARAMETER_DFN  (Table) 
--
CREATE TABLE PARAMETER_DFN
(
  PMD_ID                NUMBER(10)              NOT NULL,
  ENT_ID                NUMBER(10)              NOT NULL,
  PMD_NAME              NVARCHAR2(255)          NOT NULL,
  PMD_DISPLAY_PROPERTY  NVARCHAR2(255)          NOT NULL,
  PMD_EXTRA1            NVARCHAR2(255)              NULL,
  PMD_EXTRA2            NVARCHAR2(255)              NULL,
  PMD_EXTRA3            NVARCHAR2(255)              NULL,
  PMD_EXTRA4            NVARCHAR2(255)              NULL,
  PMD_EXTRA5            NVARCHAR2(255)              NULL,
  PMD_DELETE_FL         CHAR(1)                 NOT NULL,
  PMD_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE PARSE_OUTPUT_MAP CASCADE CONSTRAINTS
/

--
-- PARSE_OUTPUT_MAP  (Table) 
--
CREATE TABLE PARSE_OUTPUT_MAP
(
  POM_ID            NUMBER(10)                  NOT NULL,
  STS_ID            NUMBER(10)                  NOT NULL,
  TIN_ID            NUMBER(10)                  NOT NULL,
  POM_OUTPUT_KEY    NVARCHAR2(255)              NOT NULL,
  POM_DATA_LOAD_FL  CHAR(1)                     NOT NULL,
  POM_DELETE_FL     CHAR(1)                     NOT NULL,
  POM_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE PARTITION_TBL CASCADE CONSTRAINTS
/

--
-- PARTITION_TBL  (Table) 
--
CREATE TABLE PARTITION_TBL
(
  PTN_ID          NUMBER(10)                    NOT NULL,
  PTN_NAME        NVARCHAR2(255)                NOT NULL,
  PTN_DELETE_FL   CHAR(1)                       NOT NULL,
  PTN_VERSION_ID  NUMBER(10)                    NOT NULL
)
/


DROP TABLE PENDING_COLLECTED_FILE CASCADE CONSTRAINTS
/

--
-- PENDING_COLLECTED_FILE  (Table) 
--
CREATE TABLE PENDING_COLLECTED_FILE
(
  PCF_ID          NUMBER(10)                    NOT NULL,
  CLF_ID          NUMBER(10)                    NOT NULL,
  PCF_DELETE_FL   CHAR(1)                       NOT NULL,
  PCF_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE PENDING_TASK CASCADE CONSTRAINTS
/

--
-- PENDING_TASK  (Table) 
--
CREATE TABLE PENDING_TASK
(
  PTK_ID          NUMBER(10)                    NOT NULL,
  TSK_ID          NUMBER(10)                    NOT NULL,
  PTK_DELETE_FL   CHAR(1)                       NOT NULL,
  PTK_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE PROCESSED_FILE_INFO CASCADE CONSTRAINTS
/

--
-- PROCESSED_FILE_INFO  (Table) 
--
CREATE TABLE PROCESSED_FILE_INFO
(
  PFI_ID              NUMBER(10)                NOT NULL,
  FIL_ID              NUMBER(10)                NOT NULL,
  FCN_ID              NUMBER(10)                NOT NULL,
  PFI_PROCESSED_TIME  TIMESTAMP(6)              NOT NULL,
  PFI_FILENAME        NVARCHAR2(255)            NOT NULL,
  PFI_SEQ_NUMBER      NUMBER(10)                NOT NULL,
  PFI_START_FL        CHAR(1)                   NOT NULL,
  PFI_DELETE_FL       CHAR(1)                   NOT NULL,
  PFI_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE PROPERTY_DFN CASCADE CONSTRAINTS
/

--
-- PROPERTY_DFN  (Table) 
--
CREATE TABLE PROPERTY_DFN
(
  PRD_ID            NUMBER(10)                  NOT NULL,
  PDG_ID            NUMBER(10)                  NOT NULL,
  CMP_ID            NUMBER(10)                  NOT NULL,
  PRD_KEY           NVARCHAR2(255)              NOT NULL,
  PRD_NAME          NVARCHAR2(255)              NOT NULL,
  PRD_DEFAULT       NVARCHAR2(255)                  NULL,
  PRD_READ_ONLY_FL  CHAR(1)                     NOT NULL,
  PRD_MANDATORY_FL  CHAR(1)                     NOT NULL,
  PRD_RENDERED_FL   CHAR(1)                         NULL,
  PRD_EXTRA1        NVARCHAR2(255)                  NULL,
  PRD_EXTRA2        NVARCHAR2(255)                  NULL,
  PRD_EXTRA3        NVARCHAR2(255)                  NULL,
  PRD_EXTRA4        NVARCHAR2(255)                  NULL,
  PRD_EXTRA5        NVARCHAR2(255)                  NULL,
  PRD_DELETE_FL     CHAR(1)                     NOT NULL,
  PRD_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE PROPERTY_DFN_GROUP CASCADE CONSTRAINTS
/

--
-- PROPERTY_DFN_GROUP  (Table) 
--
CREATE TABLE PROPERTY_DFN_GROUP
(
  PDG_ID                     NUMBER(10)         NOT NULL,
  PDG_PARENT_PDG_ID          NUMBER(10)             NULL,
  PDG_KEY                    NVARCHAR2(255)     NOT NULL,
  PDG_NAME                   NVARCHAR2(255)     NOT NULL,
  PDG_SYSTEM_FL              CHAR(1)            NOT NULL,
  PDG_SYSTEM_SERVER_PACKAGE  NVARCHAR2(255)         NULL,
  PDG_DELETE_FL              CHAR(1)            NOT NULL,
  PDG_VERSION_ID             NUMBER(10)         NOT NULL,
  PTN_ID                     NUMBER(10)         NOT NULL
)
/


DROP TABLE PROPERTY_INST CASCADE CONSTRAINTS
/

--
-- PROPERTY_INST  (Table) 
--
CREATE TABLE PROPERTY_INST
(
  PRI_ID          NUMBER(10)                    NOT NULL,
  PIG_ID          NUMBER(10)                    NOT NULL,
  PRD_ID          NUMBER(10)                    NOT NULL,
  PRI_VALUE       NVARCHAR2(255)                    NULL,
  PRI_DELETE_FL   CHAR(1)                       NOT NULL,
  PRI_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE PROPERTY_INST_GROUP CASCADE CONSTRAINTS
/

--
-- PROPERTY_INST_GROUP  (Table) 
--
CREATE TABLE PROPERTY_INST_GROUP
(
  PIG_ID          NUMBER(10)                    NOT NULL,
  PDG_ID          NUMBER(10)                    NOT NULL,
  PIG_NAME        NVARCHAR2(255)                NOT NULL,
  PIG_DELETE_FL   CHAR(1)                       NOT NULL,
  PIG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE QUERY_BUILDER CASCADE CONSTRAINTS
/

--
-- QUERY_BUILDER  (Table) 
--
CREATE TABLE QUERY_BUILDER
(
  QBR_ID          NUMBER(10)                    NOT NULL,
  SQL_ID          NUMBER(10)                    NOT NULL,
  QBR_NAME        NVARCHAR2(255)                NOT NULL,
  QBR_DELETE_FL   CHAR(1)                       NOT NULL,
  QBR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE QUERY_FILTER CASCADE CONSTRAINTS
/

--
-- QUERY_FILTER  (Table) 
--
CREATE TABLE QUERY_FILTER
(
  QFR_ID             NUMBER(10)                 NOT NULL,
  SQL_ID             NUMBER(10)                 NOT NULL,
  QFR_LOCKED_USR_ID  NUMBER(10)                     NULL,
  QFR_NAME           NVARCHAR2(255)             NOT NULL,
  QFR_DELETE_FL      CHAR(1)                    NOT NULL,
  QFR_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE RECURRING_SCHEDULE CASCADE CONSTRAINTS
/

--
-- RECURRING_SCHEDULE  (Table) 
--
CREATE TABLE RECURRING_SCHEDULE
(
  RSH_ID                    NUMBER(10)          NOT NULL,
  RSH_FREQUENCY_CMP_ID      NUMBER(10)          NOT NULL,
  RSH_FREQUENCY_MULTIPLIER  NUMBER(10)          NOT NULL,
  DGL_ID                    NUMBER(10)              NULL,
  RSH_NEXT_DTTM             TIMESTAMP(6)        NOT NULL,
  RSH_DELETE_FL             CHAR(1)             NOT NULL,
  RSH_VERSION_ID            NUMBER(10)          NOT NULL,
  PTN_ID                    NUMBER(10)          NOT NULL
)
/


DROP TABLE REFRESH_CONFIG CASCADE CONSTRAINTS
/

--
-- REFRESH_CONFIG  (Table) 
--
CREATE TABLE REFRESH_CONFIG
(
  RFG_ID            NUMBER(10)                  NOT NULL,
  RFG_CLASS_NAME    NVARCHAR2(255)              NOT NULL,
  RFG_TIMEOUT_MINS  NUMBER(10)                  NOT NULL,
  RFG_DELETE_FL     CHAR(1)                     NOT NULL,
  RFG_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE REF_TABLE CASCADE CONSTRAINTS
/

--
-- REF_TABLE  (Table) 
--
CREATE TABLE REF_TABLE
(
  RFT_ID                NUMBER(10)              NOT NULL,
  ENT_ID                NUMBER(10)              NOT NULL,
  RFT_NAME              NVARCHAR2(255)          NOT NULL,
  RFT_SITE_SPECIFIC_FL  CHAR(1)                 NOT NULL,
  RFT_DELETE_FL         CHAR(1)                 NOT NULL,
  RFT_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE REF_TABLE_COLUMN CASCADE CONSTRAINTS
/

--
-- REF_TABLE_COLUMN  (Table) 
--
CREATE TABLE REF_TABLE_COLUMN
(
  RFC_ID             NUMBER(10)                 NOT NULL,
  RFT_ID             NUMBER(10)                 NOT NULL,
  RFC_LABEL          NVARCHAR2(255)             NOT NULL,
  RFC_TYPE           NVARCHAR2(255)             NOT NULL,
  RFC_DATA_PROPERTY  NVARCHAR2(255)             NOT NULL,
  RFC_ORDER_NO       NUMBER(10)                 NOT NULL,
  RFC_VISIBLE_FL     CHAR(1)                    NOT NULL,
  RFC_SORT_FL        CHAR(1)                    NOT NULL,
  RFC_MANDATORY_FL   CHAR(1)                    NOT NULL,
  RFC_EXTRA1         NVARCHAR2(255)                 NULL,
  RFC_EXTRA2         NVARCHAR2(255)                 NULL,
  RFC_EXTRA3         NVARCHAR2(255)                 NULL,
  RFC_EXTRA4         NVARCHAR2(255)                 NULL,
  RFC_EXTRA5         NVARCHAR2(255)                 NULL,
  RFC_DELETE_FL      CHAR(1)                    NOT NULL,
  RFC_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE REPORT CASCADE CONSTRAINTS
/

--
-- REPORT  (Table) 
--
CREATE TABLE REPORT
(
  RPT_ID                NUMBER(10)              NOT NULL,
  RPT_NAME              NVARCHAR2(255)          NOT NULL,
  RPT_DESIGN_FILE_NAME  NVARCHAR2(255)          NOT NULL,
  ALD_ID                NUMBER(10)              NOT NULL,
  RPT_DELETE_FL         CHAR(1)                 NOT NULL,
  RPT_VERSION_ID        NUMBER(10)              NOT NULL,
  PTN_ID                NUMBER(10)              NOT NULL
)
/


DROP TABLE ROLE_BUS_OBJECTS_GROUP CASCADE CONSTRAINTS
/

--
-- ROLE_BUS_OBJECTS_GROUP  (Table) 
--
CREATE TABLE ROLE_BUS_OBJECTS_GROUP
(
  RBG_ID          NUMBER(10)                    NOT NULL,
  ROL_ID          NUMBER(10)                    NOT NULL,
  BOG_ID          NUMBER(10)                    NOT NULL,
  RBG_DELETE_FL   CHAR(1)                       NOT NULL,
  RBG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ROLE_REF_TABLE CASCADE CONSTRAINTS
/

--
-- ROLE_REF_TABLE  (Table) 
--
CREATE TABLE ROLE_REF_TABLE
(
  RRF_ID          NUMBER(10)                    NOT NULL,
  ROL_ID          NUMBER(10)                    NOT NULL,
  RFT_ID          NUMBER(10)                    NOT NULL,
  RRF_READ_FL     CHAR(1)                       NOT NULL,
  RRF_CREATE_FL   CHAR(1)                       NOT NULL,
  RRF_UPDATE_FL   CHAR(1)                       NOT NULL,
  RRF_REMOVE_FL   CHAR(1)                       NOT NULL,
  RRF_DELETE_FL   CHAR(1)                       NOT NULL,
  RRF_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ROLE_SECURITY_LABEL CASCADE CONSTRAINTS
/

--
-- ROLE_SECURITY_LABEL  (Table) 
--
CREATE TABLE ROLE_SECURITY_LABEL
(
  RSL_ID          NUMBER(10)                    NOT NULL,
  ROL_ID          NUMBER(10)                    NOT NULL,
  SLA_ID          NUMBER(10)                    NOT NULL,
  RSL_DELETE_FL   CHAR(1)                       NOT NULL,
  RSL_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ROLE_TBL CASCADE CONSTRAINTS
/

--
-- ROLE_TBL  (Table) 
--
CREATE TABLE ROLE_TBL
(
  ROL_ID          NUMBER(10)                    NOT NULL,
  ROL_NAME        NVARCHAR2(255)                NOT NULL,
  ROL_DELETE_FL   CHAR(1)                       NOT NULL,
  ROL_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ROLE_UI_ACTION_ITEM CASCADE CONSTRAINTS
/

--
-- ROLE_UI_ACTION_ITEM  (Table) 
--
CREATE TABLE ROLE_UI_ACTION_ITEM
(
  RAI_ID          NUMBER(10)                    NOT NULL,
  ROL_ID          NUMBER(10)                    NOT NULL,
  UAI_ID          NUMBER(10)                    NOT NULL,
  RAI_BROWSE_FL   CHAR(1)                       NOT NULL,
  RAI_NEW_FL      CHAR(1)                       NOT NULL,
  RAI_EDIT_FL     CHAR(1)                       NOT NULL,
  RAI_REMOVE_FL   CHAR(1)                       NOT NULL,
  RAI_DELETE_FL   CHAR(1)                       NOT NULL,
  RAI_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ROUTE CASCADE CONSTRAINTS
/

--
-- ROUTE  (Table) 
--
CREATE TABLE ROUTE
(
  RUT_ID            NUMBER(10)                  NOT NULL,
  SWT_ID            NUMBER(10)                  NOT NULL,
  RTC_ID            NUMBER(10)                  NOT NULL,
  RTT_ID            NUMBER(10)                  NOT NULL,
  RUT_NAME          NVARCHAR2(255)              NOT NULL,
  RUT_MATCH_STR     NVARCHAR2(255)              NOT NULL,
  RUT_FROM_DTTM     TIMESTAMP(6)                NOT NULL,
  RUT_TO_DTTM       TIMESTAMP(6)                NOT NULL,
  RUT_DIRECTION_CD  NVARCHAR2(255)              NOT NULL,
  RUT_TRANSIT_FL    CHAR(1)                     NOT NULL,
  RUT_DELETE_FL     CHAR(1)                     NOT NULL,
  RUT_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE ROUTE_CLASS CASCADE CONSTRAINTS
/

--
-- ROUTE_CLASS  (Table) 
--
CREATE TABLE ROUTE_CLASS
(
  RTC_ID          NUMBER(10)                    NOT NULL,
  RTC_CODE        NVARCHAR2(255)                NOT NULL,
  RTC_NAME        NVARCHAR2(255)                NOT NULL,
  RTC_DELETE_FL   CHAR(1)                       NOT NULL,
  RTC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE ROUTE_TYPE CASCADE CONSTRAINTS
/

--
-- ROUTE_TYPE  (Table) 
--
CREATE TABLE ROUTE_TYPE
(
  RTT_ID          NUMBER(10)                    NOT NULL,
  RTT_CODE        NVARCHAR2(255)                NOT NULL,
  RTT_NAME        NVARCHAR2(255)                NOT NULL,
  RTT_DELETE_FL   CHAR(1)                       NOT NULL,
  RTT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SCHEMA_TBL CASCADE CONSTRAINTS
/

--
-- SCHEMA_TBL  (Table) 
--
CREATE TABLE SCHEMA_TBL
(
  SCH_ID          NUMBER(10)                    NOT NULL,
  SCT_ID          NUMBER(10)                    NOT NULL,
  USG_ID          NUMBER(10)                        NULL,
  SCH_NAME        NVARCHAR2(255)                NOT NULL,
  SCH_DELETE_FL   CHAR(1)                       NOT NULL,
  SCH_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SCHEMA_TYPE CASCADE CONSTRAINTS
/

--
-- SCHEMA_TYPE  (Table) 
--
CREATE TABLE SCHEMA_TYPE
(
  SCT_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  SCT_NAME        NVARCHAR2(255)                NOT NULL,
  SCT_DELETE_FL   CHAR(1)                       NOT NULL,
  SCT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SECURITY_LABEL CASCADE CONSTRAINTS
/

--
-- SECURITY_LABEL  (Table) 
--
CREATE TABLE SECURITY_LABEL
(
  SLA_ID          NUMBER(10)                    NOT NULL,
  SLA_NAME        NVARCHAR2(255)                NOT NULL,
  SLA_LABEL       NVARCHAR2(255)                NOT NULL,
  SLA_DELETE_FL   CHAR(1)                       NOT NULL,
  SLA_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SEQUENTIAL_NUMBER_GROUP CASCADE CONSTRAINTS
/

--
-- SEQUENTIAL_NUMBER_GROUP  (Table) 
--
CREATE TABLE SEQUENTIAL_NUMBER_GROUP
(
  SNG_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  SNG_NAME        NVARCHAR2(255)                NOT NULL,
  SNG_NUMBER      NUMBER(19)                    NOT NULL,
  SNG_DELETE_FL   CHAR(1)                       NOT NULL,
  SNG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SERVER_EXCEPTION CASCADE CONSTRAINTS
/

--
-- SERVER_EXCEPTION  (Table) 
--
CREATE TABLE SERVER_EXCEPTION
(
  SEX_ID          NUMBER(10)                    NOT NULL,
  SEG_ID          NUMBER(10)                    NOT NULL,
  SEX_ORDER_NO    NUMBER(10)                    NOT NULL,
  SEX_MESSAGE     NVARCHAR2(255)                    NULL,
  SEX_TRACE1      NVARCHAR2(255)                    NULL,
  SEX_TRACE2      NVARCHAR2(255)                    NULL,
  SEX_TRACE3      NVARCHAR2(255)                    NULL,
  SEX_TRACE4      NVARCHAR2(255)                    NULL,
  SEX_TRACE5      NVARCHAR2(255)                    NULL,
  SEX_TRACE6      NVARCHAR2(255)                    NULL,
  SEX_TRACE7      NVARCHAR2(255)                    NULL,
  SEX_TRACE8      NVARCHAR2(255)                    NULL,
  SEX_TRACE9      NVARCHAR2(255)                    NULL,
  SEX_TRACE10     NVARCHAR2(255)                    NULL,
  SEX_DELETE_FL   CHAR(1)                       NOT NULL,
  SEX_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SERVER_EXCEPTION_GROUP CASCADE CONSTRAINTS
/

--
-- SERVER_EXCEPTION_GROUP  (Table) 
--
CREATE TABLE SERVER_EXCEPTION_GROUP
(
  SEG_ID          NUMBER(10)                    NOT NULL,
  SEG_DELETE_FL   CHAR(1)                       NOT NULL,
  SEG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SQL_QUERY CASCADE CONSTRAINTS
/

--
-- SQL_QUERY  (Table) 
--
CREATE TABLE SQL_QUERY
(
  SQL_ID             NUMBER(10)                 NOT NULL,
  SQL_OUTPUT_TBD_ID  NUMBER(10)                     NULL,
  PDG_ID             NUMBER(10)                     NULL,
  SQL_MAX_ROWS       NUMBER(10)                     NULL,
  SQL_DISTINCT_FL    CHAR(1)                    NOT NULL,
  SQL_HIDDEN_FL      CHAR(1)                    NOT NULL,
  SQL_DELETE_FL      CHAR(1)                    NOT NULL,
  SQL_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE SQL_QUERY_FROM CASCADE CONSTRAINTS
/

--
-- SQL_QUERY_FROM  (Table) 
--
CREATE TABLE SQL_QUERY_FROM
(
  SQF_ID           NUMBER(10)                   NOT NULL,
  SQL_ID           NUMBER(10)                   NOT NULL,
  TBD_ID           NUMBER(10)                   NOT NULL,
  TIN_ID           NUMBER(10)                       NULL,
  SQF_TABLE_ALIAS  NVARCHAR2(255)               NOT NULL,
  SQF_ORDER_NO     NUMBER(10)                   NOT NULL,
  SQF_JOIN_TYPE    NVARCHAR2(255)                   NULL,
  SQF_COLUMN1      NVARCHAR2(255)                   NULL,
  SQF_OPERATOR     NVARCHAR2(255)                   NULL,
  SQF_COLUMN2      NVARCHAR2(255)                   NULL,
  SQF_DELETE_FL    CHAR(1)                      NOT NULL,
  SQF_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE SQL_QUERY_ORDER_BY CASCADE CONSTRAINTS
/

--
-- SQL_QUERY_ORDER_BY  (Table) 
--
CREATE TABLE SQL_QUERY_ORDER_BY
(
  SQO_ID             NUMBER(10)                 NOT NULL,
  SQL_ID             NUMBER(10)                 NOT NULL,
  SQS_ID             NUMBER(10)                 NOT NULL,
  SQO_DESCENDING_FL  CHAR(1)                    NOT NULL,
  SQO_ORDER_NO       NUMBER(10)                 NOT NULL,
  SQO_DELETE_FL      CHAR(1)                    NOT NULL,
  SQO_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE SQL_QUERY_SELECT CASCADE CONSTRAINTS
/

--
-- SQL_QUERY_SELECT  (Table) 
--
CREATE TABLE SQL_QUERY_SELECT
(
  SQS_ID          NUMBER(10)                    NOT NULL,
  SQL_ID          NUMBER(10)                    NOT NULL,
  SQS_STATEMENT   NVARCHAR2(255)                NOT NULL,
  SQS_AGGREGATE   NVARCHAR2(255)                    NULL,
  SQS_ORDER_NO    NUMBER(10)                    NOT NULL,
  SQS_DELETE_FL   CHAR(1)                       NOT NULL,
  SQS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE SQL_QUERY_WHERE CASCADE CONSTRAINTS
/

--
-- SQL_QUERY_WHERE  (Table) 
--
CREATE TABLE SQL_QUERY_WHERE
(
  SQW_ID                    NUMBER(10)          NOT NULL,
  SQL_ID                    NUMBER(10)          NOT NULL,
  SQW_OPERATOR              NVARCHAR2(255)          NULL,
  SQW_FILTER_FL             CHAR(1)             NOT NULL,
  SQW_EXPRESSION1_TCL_ID    NUMBER(10)              NULL,
  SQW_EXPRESSION1           NVARCHAR2(255)          NULL,
  SQW_EXPRESSION_OPERATOR   NVARCHAR2(255)          NULL,
  SQW_EXPRESSION1_DATATYPE  NVARCHAR2(255)          NULL,
  SQW_EXPRESSION2_TCL_ID    NUMBER(10)              NULL,
  SQW_EXPRESSION2           NVARCHAR2(255)          NULL,
  SQW_EXPRESSION2_DATATYPE  NVARCHAR2(255)          NULL,
  QFR_ID                    NUMBER(10)              NULL,
  QBR_ID                    NUMBER(10)              NULL,
  SQF_ID                    NUMBER(10)              NULL,
  SQW_OPEN_COUNT            NUMBER(10)          NOT NULL,
  SQW_CLOSE_COUNT           NUMBER(10)          NOT NULL,
  SQW_ORDER_NO              NUMBER(10)          NOT NULL,
  SQW_DELETE_FL             CHAR(1)             NOT NULL,
  SQW_VERSION_ID            NUMBER(10)          NOT NULL,
  PTN_ID                    NUMBER(10)          NOT NULL
)
/


DROP TABLE STREAM CASCADE CONSTRAINTS
/

--
-- STREAM  (Table) 
--
CREATE TABLE STREAM
(
  STM_ID          NUMBER(10)                    NOT NULL,
  STM_NAME        NVARCHAR2(255)                NOT NULL,
  STM_DELETE_FL   CHAR(1)                       NOT NULL,
  STM_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE STREAM_CONTROLLER CASCADE CONSTRAINTS
/

--
-- STREAM_CONTROLLER  (Table) 
--
CREATE TABLE STREAM_CONTROLLER
(
  STC_ID                 NUMBER(10)             NOT NULL,
  STC_NAME               NVARCHAR2(255)         NOT NULL,
  STC_CONFIGURED_PIG_ID  NUMBER(10)             NOT NULL,
  STC_RUNNING_PIG_ID     NUMBER(10)                 NULL,
  STC_REINITIALISE_FL    CHAR(1)                NOT NULL,
  STC_DELETE_FL          CHAR(1)                NOT NULL,
  STC_VERSION_ID         NUMBER(10)             NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE STREAM_FILE CASCADE CONSTRAINTS
/

--
-- STREAM_FILE  (Table) 
--
CREATE TABLE STREAM_FILE
(
  SFL_ID          NUMBER(10)                    NOT NULL,
  STM_ID          NUMBER(10)                    NOT NULL,
  FIL_ID          NUMBER(10)                    NOT NULL,
  SFL_DELETE_FL   CHAR(1)                       NOT NULL,
  SFL_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE STREAM_STAGE CASCADE CONSTRAINTS
/

--
-- STREAM_STAGE  (Table) 
--
CREATE TABLE STREAM_STAGE
(
  STS_ID                 NUMBER(10)             NOT NULL,
  STM_ID                 NUMBER(10)             NOT NULL,
  SST_ID                 NUMBER(10)             NOT NULL,
  PDG_ID                 NUMBER(10)             NOT NULL,
  STS_NAME               NVARCHAR2(255)         NOT NULL,
  STS_STATUS             NVARCHAR2(255)         NOT NULL,
  STS_CONFIGURED_PIG_ID  NUMBER(10)             NOT NULL,
  STS_RUNNING_PIG_ID     NUMBER(10)                 NULL,
  STS_DELETE_FL          CHAR(1)                NOT NULL,
  STS_VERSION_ID         NUMBER(10)             NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE STREAM_STAGE_RECUR_TASK CASCADE CONSTRAINTS
/

--
-- STREAM_STAGE_RECUR_TASK  (Table) 
--
CREATE TABLE STREAM_STAGE_RECUR_TASK
(
  SRT_ID                 NUMBER(10)             NOT NULL,
  STS_ID                 NUMBER(10)             NOT NULL,
  RSH_ID                 NUMBER(10)             NOT NULL,
  SRT_NAME               NVARCHAR2(255)         NOT NULL,
  SRT_PRIORITY           NUMBER(10)             NOT NULL,
  SRT_REUSE_TASK_FL      CHAR(1)                NOT NULL,
  SRT_RUN_AFTER_FAIL_FL  CHAR(1)                NOT NULL,
  SRT_DELETE_FL          CHAR(1)                NOT NULL,
  SRT_VERSION_ID         NUMBER(10)             NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE STREAM_STAGE_TYPE CASCADE CONSTRAINTS
/

--
-- STREAM_STAGE_TYPE  (Table) 
--
CREATE TABLE STREAM_STAGE_TYPE
(
  SST_ID                   NUMBER(10)           NOT NULL,
  PDG_ID                   NUMBER(10)           NOT NULL,
  SST_TASK_FACTORY_CMP_ID  NUMBER(10)           NOT NULL,
  SST_CONFIG_CMP_ID        NUMBER(10)               NULL,
  SST_CODE                 NVARCHAR2(255)       NOT NULL,
  SST_NAME                 NVARCHAR2(255)       NOT NULL,
  SST_DELETE_FL            CHAR(1)              NOT NULL,
  SST_VERSION_ID           NUMBER(10)           NOT NULL,
  PTN_ID                   NUMBER(10)           NOT NULL
)
/


DROP TABLE STRING_RULE CASCADE CONSTRAINTS
/

--
-- STRING_RULE  (Table) 
--
CREATE TABLE STRING_RULE
(
  SRL_ID          NUMBER(10)                    NOT NULL,
  SRS_ID          NUMBER(10)                    NOT NULL,
  SRL_NAME        NVARCHAR2(255)                NOT NULL,
  SRL_DELETE_FL   CHAR(1)                       NOT NULL,
  SRL_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE STRING_RULE_MATCH CASCADE CONSTRAINTS
/

--
-- STRING_RULE_MATCH  (Table) 
--
CREATE TABLE STRING_RULE_MATCH
(
  SRM_ID            NUMBER(10)                  NOT NULL,
  SRS_ID            NUMBER(10)                  NOT NULL,
  SRL_ID            NUMBER(10)                  NOT NULL,
  SRM_MATCH_STRING  NVARCHAR2(255)                  NULL,
  SRM_DELETE_FL     CHAR(1)                     NOT NULL,
  SRM_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE STRING_RULE_SET CASCADE CONSTRAINTS
/

--
-- STRING_RULE_SET  (Table) 
--
CREATE TABLE STRING_RULE_SET
(
  SRS_ID          NUMBER(10)                    NOT NULL,
  SRS_NAME        NVARCHAR2(255)                NOT NULL,
  SRS_DELETE_FL   CHAR(1)                       NOT NULL,
  SRS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE STRING_RULE_STEP CASCADE CONSTRAINTS
/

--
-- STRING_RULE_STEP  (Table) 
--
CREATE TABLE STRING_RULE_STEP
(
  SRP_ID                  NUMBER(10)            NOT NULL,
  SRL_ID                  NUMBER(10)            NOT NULL,
  SRP_ORDER_NO            NUMBER(10)            NOT NULL,
  SRP_MATCH_STRING        NVARCHAR2(255)        NOT NULL,
  SRP_OUTPUT_STRING       NVARCHAR2(255)        NOT NULL,
  SRP_FIELD_STRING        NVARCHAR2(255)            NULL,
  SRP_MATCHED_SRP_ID      NUMBER(10)                NULL,
  SRP_NON_MATCHED_SRP_ID  NUMBER(10)                NULL,
  SRP_DELETE_FL           CHAR(1)               NOT NULL,
  SRP_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE SWITCH_TBL CASCADE CONSTRAINTS
/

--
-- SWITCH_TBL  (Table) 
--
CREATE TABLE SWITCH_TBL
(
  SWT_ID          NUMBER(10)                    NOT NULL,
  SWT_NAME        NVARCHAR2(255)                NOT NULL,
  SWT_MATCH_STR   NVARCHAR2(255)                NOT NULL,
  SWT_DELETE_FL   CHAR(1)                       NOT NULL,
  SWT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TABLE_COLUMN CASCADE CONSTRAINTS
/

--
-- TABLE_COLUMN  (Table) 
--
CREATE TABLE TABLE_COLUMN
(
  TCL_ID              NUMBER(10)                NOT NULL,
  TBD_ID              NUMBER(10)                NOT NULL,
  ENT_ID              NUMBER(10)                    NULL,
  TCL_NAME            NVARCHAR2(255)            NOT NULL,
  TCL_DISPLAY         NVARCHAR2(255)            NOT NULL,
  TCL_ORDER_NO        NUMBER(10)                NOT NULL,
  TCL_PRIMARY_KEY_FL  CHAR(1)                   NOT NULL,
  TCL_TYPE            NVARCHAR2(255)            NOT NULL,
  TCL_LENGTH          NUMBER(10)                NOT NULL,
  TCL_MANDATORY_FL    CHAR(1)                   NOT NULL,
  TCL_DELETE_FL       CHAR(1)                   NOT NULL,
  TCL_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE TABLE_DFN CASCADE CONSTRAINTS
/

--
-- TABLE_DFN  (Table) 
--
CREATE TABLE TABLE_DFN
(
  TBD_ID           NUMBER(10)                   NOT NULL,
  SCT_ID           NUMBER(10)                   NOT NULL,
  TBD_NAME         NVARCHAR2(255)               NOT NULL,
  TBD_PREFIX       NVARCHAR2(255)               NOT NULL,
  TBD_SYSTEM_FL    CHAR(1)                      NOT NULL,
  TBD_INTERNAL_FL  CHAR(1)                      NOT NULL,
  TBD_TEMP_FL      CHAR(1)                      NOT NULL,
  TBD_DELETE_FL    CHAR(1)                      NOT NULL,
  TBD_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE TABLE_FILTER CASCADE CONSTRAINTS
/

--
-- TABLE_FILTER  (Table) 
--
CREATE TABLE TABLE_FILTER
(
  TFR_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  TIN_ID          NUMBER(10)                    NOT NULL,
  TFR_DELETE_FL   CHAR(1)                       NOT NULL,
  TFR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TABLE_FILTER_COL CASCADE CONSTRAINTS
/

--
-- TABLE_FILTER_COL  (Table) 
--
CREATE TABLE TABLE_FILTER_COL
(
  TFC_ID          NUMBER(10)                    NOT NULL,
  TFR_ID          NUMBER(10)                    NOT NULL,
  TCL_ID          NUMBER(10)                    NOT NULL,
  TFC_LABEL       NVARCHAR2(255)                NOT NULL,
  TFC_ORDER_NO    NUMBER(10)                    NOT NULL,
  TFC_VISIBLE_FL  CHAR(1)                       NOT NULL,
  TFC_DELETE_FL   CHAR(1)                       NOT NULL,
  TFC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TABLE_GRID CASCADE CONSTRAINTS
/

--
-- TABLE_GRID  (Table) 
--
CREATE TABLE TABLE_GRID
(
  TGR_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  TIN_ID          NUMBER(10)                    NOT NULL,
  CXT_ID          NUMBER(10)                    NOT NULL,
  TGR_DELETE_FL   CHAR(1)                       NOT NULL,
  TGR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TABLE_GRID_COLUMN CASCADE CONSTRAINTS
/

--
-- TABLE_GRID_COLUMN  (Table) 
--
CREATE TABLE TABLE_GRID_COLUMN
(
  TGC_ID            NUMBER(10)                  NOT NULL,
  TGR_ID            NUMBER(10)                  NOT NULL,
  TCL_ID            NUMBER(10)                  NOT NULL,
  TGC_LABEL         NVARCHAR2(255)                  NULL,
  TGC_WIDTH         NUMBER(10)                  NOT NULL,
  TGC_ORDER_NO      NUMBER(10)                  NOT NULL,
  TGC_TYPE          NVARCHAR2(255)              NOT NULL,
  TGC_VISIBLE_FL    CHAR(1)                     NOT NULL,
  TGC_SORT          NVARCHAR2(255)              NOT NULL,
  TGC_TEXT_ALIGN    NVARCHAR2(255)              NOT NULL,
  TGC_NULL_DISPLAY  NVARCHAR2(255)                  NULL,
  TGC_DELETE_FL     CHAR(1)                     NOT NULL,
  TGC_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE TABLE_INDEX CASCADE CONSTRAINTS
/

--
-- TABLE_INDEX  (Table) 
--
CREATE TABLE TABLE_INDEX
(
  TIX_ID            NUMBER(10)                  NOT NULL,
  TBD_ID            NUMBER(10)                  NOT NULL,
  TIX_SUFFIX        NVARCHAR2(255)              NOT NULL,
  TIX_UNIQUE_FL     CHAR(1)                     NOT NULL,
  TIX_CLUSTERED_FL  CHAR(1)                     NOT NULL,
  TIX_DELETE_FL     CHAR(1)                     NOT NULL,
  TIX_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE TABLE_INDEX_COLUMN CASCADE CONSTRAINTS
/

--
-- TABLE_INDEX_COLUMN  (Table) 
--
CREATE TABLE TABLE_INDEX_COLUMN
(
  TIC_ID          NUMBER(10)                    NOT NULL,
  TIX_ID          NUMBER(10)                    NOT NULL,
  TCL_ID          NUMBER(10)                    NOT NULL,
  TIC_ORDER_NO    NUMBER(10)                    NOT NULL,
  TIC_DELETE_FL   CHAR(1)                       NOT NULL,
  TIC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TABLE_INST CASCADE CONSTRAINTS
/

--
-- TABLE_INST  (Table) 
--
CREATE TABLE TABLE_INST
(
  TIN_ID                  NUMBER(10)            NOT NULL,
  TBD_ID                  NUMBER(10)            NOT NULL,
  SCH_ID                  NUMBER(10)            NOT NULL,
  TIN_PARTITION_TCL_ID    NUMBER(10)                NULL,
  TIN_TABLE_NAME          NVARCHAR2(255)        NOT NULL,
  TIN_DISPLAY_NAME        NVARCHAR2(255)        NOT NULL,
  TIN_ALIAS               NVARCHAR2(255)        NOT NULL,
  TIN_ROW_COUNT           NUMBER(19)                NULL,
  TIN_LAST_MODIFIED_DTTM  TIMESTAMP(6)              NULL,
  TIN_DELETE_FL           CHAR(1)               NOT NULL,
  TIN_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE TABLE_MAPPING CASCADE CONSTRAINTS
/

--
-- TABLE_MAPPING  (Table) 
--
CREATE TABLE TABLE_MAPPING
(
  TMA_ID          NUMBER(10)                    NOT NULL,
  TMA_DELETE_FL   CHAR(1)                       NOT NULL,
  TMA_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TABLE_MAPPING_COLUMN CASCADE CONSTRAINTS
/

--
-- TABLE_MAPPING_COLUMN  (Table) 
--
CREATE TABLE TABLE_MAPPING_COLUMN
(
  TMC_ID           NUMBER(10)                   NOT NULL,
  TMA_ID           NUMBER(10)                   NOT NULL,
  TMC_FROM_TCL_ID  NUMBER(10)                   NOT NULL,
  TMC_TO_TCL_ID    NUMBER(10)                   NOT NULL,
  TMC_DELETE_FL    CHAR(1)                      NOT NULL,
  TMC_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE TARIFF CASCADE CONSTRAINTS
/

--
-- TARIFF  (Table) 
--
CREATE TABLE TARIFF
(
  TFF_ID                  NUMBER(10)            NOT NULL,
  TFF_PARENT_TFF_ID       NUMBER(10)                NULL,
  TFF_ROOT_TFF_ID         NUMBER(10)                NULL,
  TCS_ID                  NUMBER(10)            NOT NULL,
  TFT_ID                  NUMBER(10)            NOT NULL,
  CTR_ID                  NUMBER(10)            NOT NULL,
  CUR_ID                  NUMBER(10)            NOT NULL,
  DGL_ID                  NUMBER(10)            NOT NULL,
  TFF_CUR_DP              NUMBER(10)            NOT NULL,
  TFF_NAME                NVARCHAR2(255)        NOT NULL,
  TFF_CASHFLOW_CD         NVARCHAR2(255)        NOT NULL,
  TFF_ALLOW_NEGATIVE_FL   CHAR(1)               NOT NULL,
  TFF_ROUNDING_CD         NVARCHAR2(255)        NOT NULL,
  TFF_CROSS_PERIOD_FL     CHAR(1)               NOT NULL,
  TFF_EXTERNAL_REFERENCE  NVARCHAR2(255)            NULL,
  TFF_USAGE_PER_UNIT_DEF  NUMBER(10)            NOT NULL,
  TFF_MIN_USAGE_DEF       NUMBER(10)            NOT NULL,
  TFF_MIN_AMT_DEF         NUMBER(19)            NOT NULL,
  TFF_MAX_AMT_DEF         NUMBER(19)                NULL,
  TFF_SETUP_USAGE_DEF     NUMBER(10)            NOT NULL,
  TFF_SETUP_AMT_DEF       NUMBER(19)            NOT NULL,
  TFF_VERSION_ID          NUMBER(10)            NOT NULL,
  TFF_DELETE_FL           CHAR(1)               NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE TARIFF_BAND CASCADE CONSTRAINTS
/

--
-- TARIFF_BAND  (Table) 
--
CREATE TABLE TARIFF_BAND
(
  TAB_ID              NUMBER(10)                NOT NULL,
  TFF_ID              NUMBER(10)                NOT NULL,
  BND_ID              NUMBER(10)                NOT NULL,
  TAB_FROM_DTTM       TIMESTAMP(6)              NOT NULL,
  TAB_TO_DTTM         TIMESTAMP(6)              NOT NULL,
  CUR_ID              NUMBER(10)                NOT NULL,
  DGL_ID              NUMBER(10)                    NULL,
  TAB_TIME_STRING_FL  CHAR(1)                   NOT NULL,
  TAB_VERSION_ID      NUMBER(10)                NOT NULL,
  TAB_DELETE_FL       CHAR(1)                   NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE TARIFF_BAND_HISTORY CASCADE CONSTRAINTS
/

--
-- TARIFF_BAND_HISTORY  (Table) 
--
CREATE TABLE TARIFF_BAND_HISTORY
(
  TBH_ID             NUMBER(10)                 NOT NULL,
  TAP_ID             NUMBER(10)                 NOT NULL,
  BND_ID             NUMBER(10)                 NOT NULL,
  CUR_ID             NUMBER(10)                 NOT NULL,
  USR_ID             NUMBER(10)                 NOT NULL,
  TBH_ACTION_CD      NVARCHAR2(255)             NOT NULL,
  TBH_MODIFIED_DTTM  TIMESTAMP(6)               NOT NULL,
  TBH_COMMENTS       NVARCHAR2(255)             NOT NULL,
  TBH_DELETE_FL      CHAR(1)                    NOT NULL,
  TBH_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE TARIFF_BAND_RATE CASCADE CONSTRAINTS
/

--
-- TARIFF_BAND_RATE  (Table) 
--
CREATE TABLE TARIFF_BAND_RATE
(
  TBR_ID              NUMBER(10)                NOT NULL,
  TAB_ID              NUMBER(10)                NOT NULL,
  TRN_ID              NUMBER(10)                NOT NULL,
  TRD_ID              NUMBER(10)                    NULL,
  TBR_RATE            NUMBER(19)                NOT NULL,
  TBR_USAGE_PER_UNIT  NUMBER(10)                NOT NULL,
  TBR_THRESHOLD_FL    CHAR(1)                   NOT NULL,
  TBR_VERSION_ID      NUMBER(10)                NOT NULL,
  TBR_DELETE_FL       CHAR(1)                   NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE TARIFF_BAND_RATE_DETAIL CASCADE CONSTRAINTS
/

--
-- TARIFF_BAND_RATE_DETAIL  (Table) 
--
CREATE TABLE TARIFF_BAND_RATE_DETAIL
(
  TRD_ID           NUMBER(10)                   NOT NULL,
  TRD_MIN_USAGE    NUMBER(10)                   NOT NULL,
  TRD_MIN_AMT      NUMBER(19)                   NOT NULL,
  TRD_MAX_AMT      NUMBER(19)                       NULL,
  TRD_SETUP_USAGE  NUMBER(10)                   NOT NULL,
  TRD_SETUP_AMT    NUMBER(19)                   NOT NULL,
  TRD_VERSION_ID   NUMBER(10)                   NOT NULL,
  TRD_DELETE_FL    CHAR(1)                      NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE TARIFF_BAND_RATE_HISTORY CASCADE CONSTRAINTS
/

--
-- TARIFF_BAND_RATE_HISTORY  (Table) 
--
CREATE TABLE TARIFF_BAND_RATE_HISTORY
(
  TRH_ID          NUMBER(10)                    NOT NULL,
  TBH_ID          NUMBER(10)                    NOT NULL,
  TRN_ID          NUMBER(10)                    NOT NULL,
  TRH_RATE        NUMBER(19)                    NOT NULL,
  TRH_DELETE_FL   CHAR(1)                       NOT NULL,
  TRH_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_BAND_RATE_THRESHOLD CASCADE CONSTRAINTS
/

--
-- TARIFF_BAND_RATE_THRESHOLD  (Table) 
--
CREATE TABLE TARIFF_BAND_RATE_THRESHOLD
(
  TBT_ID               NUMBER(10)               NOT NULL,
  TBR_ID               NUMBER(10)               NOT NULL,
  TBT_THRESHOLD_USAGE  NUMBER(10)               NOT NULL,
  TBT_THRESHOLD_RATE   NUMBER(19)               NOT NULL,
  TBT_VERSION_ID       NUMBER(10)               NOT NULL,
  TBT_DELETE_FL        CHAR(1)                  NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE TARIFF_BAND_TIME_STRING CASCADE CONSTRAINTS
/

--
-- TARIFF_BAND_TIME_STRING  (Table) 
--
CREATE TABLE TARIFF_BAND_TIME_STRING
(
  TBS_ID          NUMBER(10)                    NOT NULL,
  TAB_ID          NUMBER(10)                    NOT NULL,
  DGM_ID          NUMBER(10)                    NOT NULL,
  TSG_ID          NUMBER(10)                    NOT NULL,
  TBS_DELETE_FL   CHAR(1)                       NOT NULL,
  TBS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_CLASS CASCADE CONSTRAINTS
/

--
-- TARIFF_CLASS  (Table) 
--
CREATE TABLE TARIFF_CLASS
(
  TCS_ID          NUMBER(10)                    NOT NULL,
  TFT_ID          NUMBER(10)                    NOT NULL,
  EST_ID          NUMBER(10)                    NOT NULL,
  TFM_ID          NUMBER(10)                    NOT NULL,
  TCS_NAME        NVARCHAR2(255)                NOT NULL,
  TCS_DELETE_FL   CHAR(1)                       NOT NULL,
  TCS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_CLASS_BAND CASCADE CONSTRAINTS
/

--
-- TARIFF_CLASS_BAND  (Table) 
--
CREATE TABLE TARIFF_CLASS_BAND
(
  TCB_ID          NUMBER(10)                    NOT NULL,
  BND_ID          NUMBER(10)                    NOT NULL,
  TCS_ID          NUMBER(10)                    NOT NULL,
  TCB_VERSION_ID  NUMBER(10)                    NOT NULL,
  TCB_DELETE_FL   CHAR(1)                       NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_CLASS_DAY_GROUP CASCADE CONSTRAINTS
/

--
-- TARIFF_CLASS_DAY_GROUP  (Table) 
--
CREATE TABLE TARIFF_CLASS_DAY_GROUP
(
  TCD_ID          NUMBER(10)                    NOT NULL,
  TCS_ID          NUMBER(10)                    NOT NULL,
  DGP_ID          NUMBER(10)                    NOT NULL,
  TCD_ORDER_NO    NUMBER(10)                    NOT NULL,
  TCD_DELETE_FL   CHAR(1)                       NOT NULL,
  TCD_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_ELEMENT_SET CASCADE CONSTRAINTS
/

--
-- TARIFF_ELEMENT_SET  (Table) 
--
CREATE TABLE TARIFF_ELEMENT_SET
(
  TES_ID          NUMBER(10)                    NOT NULL,
  TFF_ID          NUMBER(10)                    NOT NULL,
  EST_ID          NUMBER(10)                    NOT NULL,
  TES_ORDER_NO    NUMBER(10)                    NOT NULL,
  TES_VERSION_ID  NUMBER(10)                    NOT NULL,
  TES_DELETE_FL   CHAR(1)                       NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_METRIC_TYPE CASCADE CONSTRAINTS
/

--
-- TARIFF_METRIC_TYPE  (Table) 
--
CREATE TABLE TARIFF_METRIC_TYPE
(
  TFM_ID                  NUMBER(10)            NOT NULL,
  TFM_NAME                NVARCHAR2(255)        NOT NULL,
  TFM_USAGE_NAME          NVARCHAR2(255)        NOT NULL,
  TFM_USAGE_DIVISOR_NAME  NVARCHAR2(255)        NOT NULL,
  TFM_USAGE_DIVISOR       NUMBER(10)            NOT NULL,
  TFM_DELETE_FL           CHAR(1)               NOT NULL,
  TFM_VERSION_ID          NUMBER(10)            NOT NULL,
  PTN_ID                  NUMBER(10)            NOT NULL
)
/


DROP TABLE TARIFF_PERIOD CASCADE CONSTRAINTS
/

--
-- TARIFF_PERIOD  (Table) 
--
CREATE TABLE TARIFF_PERIOD
(
  TAP_ID          NUMBER(10)                    NOT NULL,
  TFF_ID          NUMBER(10)                    NOT NULL,
  TAP_FROM_DTTM   TIMESTAMP(6)                  NOT NULL,
  TAP_TO_DTTM     TIMESTAMP(6)                  NOT NULL,
  TAP_VERSION_ID  NUMBER(10)                    NOT NULL,
  TAP_DELETE_FL   CHAR(1)                       NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_RATE_NAME CASCADE CONSTRAINTS
/

--
-- TARIFF_RATE_NAME  (Table) 
--
CREATE TABLE TARIFF_RATE_NAME
(
  TRN_ID          NUMBER(10)                    NOT NULL,
  TRN_NAME        NVARCHAR2(255)                NOT NULL,
  TRN_DELETE_FL   CHAR(1)                       NOT NULL,
  TRN_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_TRN CASCADE CONSTRAINTS
/

--
-- TARIFF_TRN  (Table) 
--
CREATE TABLE TARIFF_TRN
(
  TTR_ID          NUMBER(10)                    NOT NULL,
  TFF_ID          NUMBER(10)                    NOT NULL,
  TRN_ID          NUMBER(10)                    NOT NULL,
  TTR_ORDER_NO    NUMBER(10)                    NOT NULL,
  TTR_CODE        NVARCHAR2(255)                NOT NULL,
  TTR_COLOUR      NVARCHAR2(255)                NOT NULL,
  TTR_VERSION_ID  NUMBER(10)                    NOT NULL,
  TTR_DELETE_FL   CHAR(1)                       NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TARIFF_TYPE CASCADE CONSTRAINTS
/

--
-- TARIFF_TYPE  (Table) 
--
CREATE TABLE TARIFF_TYPE
(
  TFT_ID          NUMBER(10)                    NOT NULL,
  TFT_CODE        NVARCHAR2(255)                NOT NULL,
  TFT_NAME        NVARCHAR2(255)                NOT NULL,
  TFT_DELETE_FL   CHAR(1)                       NOT NULL,
  TFT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TASK CASCADE CONSTRAINTS
/

--
-- TASK  (Table) 
--
CREATE TABLE TASK
(
  TSK_ID              NUMBER(10)                NOT NULL,
  TSK_PARENT_TSK_ID   NUMBER(10)                    NULL,
  STS_ID              NUMBER(10)                NOT NULL,
  TCR_ID              NUMBER(10)                    NULL,
  TAR_ID              NUMBER(10)                    NULL,
  TSK_PRIORITY        NUMBER(10)                NOT NULL,
  TSK_STATUS          NVARCHAR2(255)            NOT NULL,
  TSK_REFRESH_FL      CHAR(1)                   NOT NULL,
  TSK_REPROCESS_FL    CHAR(1)                   NOT NULL,
  TSK_DISPLAY         NVARCHAR2(255)                NULL,
  TSK_WARN_FL         CHAR(1)                   NOT NULL,
  TSK_HALT_CHAIN_FL   CHAR(1)                   NOT NULL,
  TSK_CREATED_DTTM    TIMESTAMP(6)              NOT NULL,
  TSK_START_DTTM      TIMESTAMP(6)                  NULL,
  TSK_END_DTTM        TIMESTAMP(6)                  NULL,
  TSK_SCHEDULED_DTTM  TIMESTAMP(6)                  NULL,
  TSK_DATA1           NVARCHAR2(255)                NULL,
  TSK_DATA2           NVARCHAR2(255)                NULL,
  TSK_DATA3           NVARCHAR2(255)                NULL,
  TSK_DATA4           NVARCHAR2(255)                NULL,
  TSK_DATA5           NVARCHAR2(255)                NULL,
  TSK_DELETE_FL       CHAR(1)                   NOT NULL,
  TSK_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE TASK_ARCHIVE CASCADE CONSTRAINTS
/

--
-- TASK_ARCHIVE  (Table) 
--
CREATE TABLE TASK_ARCHIVE
(
  TAR_ID          NUMBER(10)                    NOT NULL,
  PIG_ID          NUMBER(10)                    NOT NULL,
  TAR_NAME        NVARCHAR2(255)                NOT NULL,
  TAR_DELETE_FL   CHAR(1)                       NOT NULL,
  TAR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TASK_CONTROLLER CASCADE CONSTRAINTS
/

--
-- TASK_CONTROLLER  (Table) 
--
CREATE TABLE TASK_CONTROLLER
(
  TCR_ID                 NUMBER(10)             NOT NULL,
  TCR_NAME               NVARCHAR2(255)         NOT NULL,
  TCR_CONFIGURED_PIG_ID  NUMBER(10)             NOT NULL,
  TCR_RUNNING_PIG_ID     NUMBER(10)                 NULL,
  TCR_DELETE_FL          CHAR(1)                NOT NULL,
  TCR_VERSION_ID         NUMBER(10)             NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE TASK_CONTROLLER_CAPABILITY CASCADE CONSTRAINTS
/

--
-- TASK_CONTROLLER_CAPABILITY  (Table) 
--
CREATE TABLE TASK_CONTROLLER_CAPABILITY
(
  TCC_ID          NUMBER(10)                    NOT NULL,
  TCR_ID          NUMBER(10)                    NOT NULL,
  STS_ID          NUMBER(10)                    NOT NULL,
  TCC_COUNT       NUMBER(10)                    NOT NULL,
  TCC_DELETE_FL   CHAR(1)                       NOT NULL,
  TCC_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TASK_OUTPUT_FILE CASCADE CONSTRAINTS
/

--
-- TASK_OUTPUT_FILE  (Table) 
--
CREATE TABLE TASK_OUTPUT_FILE
(
  TOF_ID            NUMBER(10)                  NOT NULL,
  TSK_ID            NUMBER(10)                  NOT NULL,
  USP_ID            NUMBER(10)                      NULL,
  FIL_ID            NUMBER(10)                  NOT NULL,
  TOF_TABLE         NVARCHAR2(255)                  NULL,
  TOF_DATA_LOAD_FL  CHAR(1)                     NOT NULL,
  TOF_DELETE_FL     CHAR(1)                     NOT NULL,
  TOF_VERSION_ID    NUMBER(10)                  NOT NULL,
  PTN_ID            NUMBER(10)                  NOT NULL
)
/


DROP TABLE TEAM CASCADE CONSTRAINTS
/

--
-- TEAM  (Table) 
--
CREATE TABLE TEAM
(
  TEA_ID                 NUMBER(10)             NOT NULL,
  TEA_NAME               NVARCHAR2(255)         NOT NULL,
  TEA_SUPERVISOR_USR_ID  NUMBER(10)             NOT NULL,
  TEA_DELETE_FL          CHAR(1)                NOT NULL,
  TEA_VERSION_ID         NUMBER(10)             NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE TEAM_USER CASCADE CONSTRAINTS
/

--
-- TEAM_USER  (Table) 
--
CREATE TABLE TEAM_USER
(
  TUR_ID          NUMBER(10)                    NOT NULL,
  TEA_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  TUR_DELETE_FL   CHAR(1)                       NOT NULL,
  TUR_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TIME_STRING CASCADE CONSTRAINTS
/

--
-- TIME_STRING  (Table) 
--
CREATE TABLE TIME_STRING
(
  TSG_ID           NUMBER(10)                   NOT NULL,
  TSG_TIME_STRING  NVARCHAR2(255)               NOT NULL,
  TSG_DELETE_FL    CHAR(1)                      NOT NULL,
  TSG_VERSION_ID   NUMBER(10)                   NOT NULL,
  PTN_ID           NUMBER(10)                   NOT NULL
)
/


DROP TABLE TOKEN_MAPPING CASCADE CONSTRAINTS
/

--
-- TOKEN_MAPPING  (Table) 
--
CREATE TABLE TOKEN_MAPPING
(
  TOM_ID              NUMBER(10)                NOT NULL,
  TOK_ID              NUMBER(10)                NOT NULL,
  TOM_CONTEXT_MAC_ID  NUMBER(10)                NOT NULL,
  TOM_REMOTE_MAC_ID   NUMBER(10)                    NULL,
  TOM_CONTEXT_PATH    NVARCHAR2(255)            NOT NULL,
  TOM_DELETE_FL       CHAR(1)                   NOT NULL,
  TOM_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE TOKEN_TBL CASCADE CONSTRAINTS
/

--
-- TOKEN_TBL  (Table) 
--
CREATE TABLE TOKEN_TBL
(
  TOK_ID          NUMBER(10)                    NOT NULL,
  TOK_TOKEN       NVARCHAR2(255)                NOT NULL,
  TOK_MACHINE_FL  CHAR(1)                       NOT NULL,
  TOK_DELETE_FL   CHAR(1)                       NOT NULL,
  TOK_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TOOLBAR CASCADE CONSTRAINTS
/

--
-- TOOLBAR  (Table) 
--
CREATE TABLE TOOLBAR
(
  TLB_ID          NUMBER(10)                    NOT NULL,
  APP_ID          NUMBER(10)                    NOT NULL,
  UAI_ID          NUMBER(10)                    NOT NULL,
  TLB_CODE        NVARCHAR2(255)                NOT NULL,
  TLB_DELETE_FL   CHAR(1)                       NOT NULL,
  TLB_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TREE_DFN CASCADE CONSTRAINTS
/

--
-- TREE_DFN  (Table) 
--
CREATE TABLE TREE_DFN
(
  TRE_ID          NUMBER(10)                    NOT NULL,
  TRE_NAME        NVARCHAR2(255)                NOT NULL,
  TFO_ID          NUMBER(10)                        NULL,
  TRE_DELETE_FL   CHAR(1)                       NOT NULL,
  TRE_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TREE_ENTITY CASCADE CONSTRAINTS
/

--
-- TREE_ENTITY  (Table) 
--
CREATE TABLE TREE_ENTITY
(
  TEN_ID          NUMBER(10)                    NOT NULL,
  TRE_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  TEN_DELETE_FL   CHAR(1)                       NOT NULL,
  TEN_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TREE_FOLDER CASCADE CONSTRAINTS
/

--
-- TREE_FOLDER  (Table) 
--
CREATE TABLE TREE_FOLDER
(
  TFO_ID             NUMBER(10)                 NOT NULL,
  TRE_ID             NUMBER(10)                 NOT NULL,
  TFO_NAME           NVARCHAR2(255)             NOT NULL,
  TFO_ROOT_TFO_ID    NUMBER(10)                     NULL,
  TFO_PARENT_TFO_ID  NUMBER(10)                     NULL,
  TFO_DELETE_FL      CHAR(1)                    NOT NULL,
  TFO_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE TREE_LEAF CASCADE CONSTRAINTS
/

--
-- TREE_LEAF  (Table) 
--
CREATE TABLE TREE_LEAF
(
  TLE_ID          NUMBER(10)                    NOT NULL,
  TFO_ID          NUMBER(10)                    NOT NULL,
  ENT_ID          NUMBER(10)                    NOT NULL,
  TLE_OBJECT_PK   NUMBER(10)                    NOT NULL,
  TLE_DELETE_FL   CHAR(1)                       NOT NULL,
  TLE_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TRIGGER_PIN CASCADE CONSTRAINTS
/

--
-- TRIGGER_PIN  (Table) 
--
CREATE TABLE TRIGGER_PIN
(
  TRP_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  TRT_ID          NUMBER(10)                    NOT NULL,
  TRP_ORDER_NO    NUMBER(10)                    NOT NULL,
  TRP_NAME        NVARCHAR2(255)                NOT NULL,
  TRP_DELETE_FL   CHAR(1)                       NOT NULL,
  TRP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE TRIGGER_TBL CASCADE CONSTRAINTS
/

--
-- TRIGGER_TBL  (Table) 
--
CREATE TABLE TRIGGER_TBL
(
  TRG_ID                 NUMBER(10)             NOT NULL,
  STM_ID                 NUMBER(10)                 NULL,
  TRT_ID                 NUMBER(10)             NOT NULL,
  TRG_CONFIGURED_PIG_ID  NUMBER(10)             NOT NULL,
  TRG_RUNNING_PIG_ID     NUMBER(10)                 NULL,
  TRG_NAME               NVARCHAR2(255)         NOT NULL,
  TRG_DELETE_FL          CHAR(1)                NOT NULL,
  TRG_VERSION_ID         NUMBER(10)             NOT NULL,
  PTN_ID                 NUMBER(10)             NOT NULL
)
/


DROP TABLE TRIGGER_TYPE CASCADE CONSTRAINTS
/

--
-- TRIGGER_TYPE  (Table) 
--
CREATE TABLE TRIGGER_TYPE
(
  TRT_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  TRT_NAME        NVARCHAR2(255)                NOT NULL,
  TRT_DELETE_FL   CHAR(1)                       NOT NULL,
  TRT_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE UI_ACTION_ITEM CASCADE CONSTRAINTS
/

--
-- UI_ACTION_ITEM  (Table) 
--
CREATE TABLE UI_ACTION_ITEM
(
  UAI_ID             NUMBER(10)                 NOT NULL,
  EAG_ID             NUMBER(10)                     NULL,
  UAI_PARENT_UAI_ID  NUMBER(10)                     NULL,
  CMP_ID             NUMBER(10)                 NOT NULL,
  IMG_ID             NUMBER(10)                     NULL,
  UAI_CODE           NVARCHAR2(255)             NOT NULL,
  UAI_DISPLAY        NVARCHAR2(255)             NOT NULL,
  UAI_DESCRIPTION    NVARCHAR2(255)             NOT NULL,
  UAI_ORDER_NO       NUMBER(10)                 NOT NULL,
  ENT_ID             NUMBER(10)                     NULL,
  UAI_EXTRA1         NVARCHAR2(255)                 NULL,
  UAI_EXTRA2         NVARCHAR2(255)                 NULL,
  UAI_EXTRA3         NVARCHAR2(255)                 NULL,
  UAI_EXTRA4         NVARCHAR2(255)                 NULL,
  UAI_EXTRA5         NVARCHAR2(255)                 NULL,
  UAI_SYSTEM_FL      CHAR(1)                    NOT NULL,
  UAI_DELETE_FL      CHAR(1)                    NOT NULL,
  UAI_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


DROP TABLE USAGE_GROUP CASCADE CONSTRAINTS
/

--
-- USAGE_GROUP  (Table) 
--
CREATE TABLE USAGE_GROUP
(
  USG_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  USG_NAME        NVARCHAR2(255)                NOT NULL,
  USG_DELETE_FL   CHAR(1)                       NOT NULL,
  USG_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USAGE_GROUP_SERVER CASCADE CONSTRAINTS
/

--
-- USAGE_GROUP_SERVER  (Table) 
--
CREATE TABLE USAGE_GROUP_SERVER
(
  UGS_ID          NUMBER(10)                    NOT NULL,
  USG_ID          NUMBER(10)                    NOT NULL,
  USV_ID          NUMBER(10)                    NOT NULL,
  UGS_DELETE_FL   CHAR(1)                       NOT NULL,
  UGS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USAGE_PARTITION CASCADE CONSTRAINTS
/

--
-- USAGE_PARTITION  (Table) 
--
CREATE TABLE USAGE_PARTITION
(
  UPN_ID          NUMBER(10)                    NOT NULL,
  USG_ID          NUMBER(10)                    NOT NULL,
  UPN_NAME        NVARCHAR2(255)                NOT NULL,
  UPN_FROM        NVARCHAR2(255)                    NULL,
  UPN_TO          NVARCHAR2(255)                    NULL,
  UPN_SUFFIX      NVARCHAR2(255)                    NULL,
  UPN_INDEX_FL    CHAR(1)                       NOT NULL,
  UPN_DELETE_FL   CHAR(1)                       NOT NULL,
  UPN_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USAGE_SERVER CASCADE CONSTRAINTS
/

--
-- USAGE_SERVER  (Table) 
--
CREATE TABLE USAGE_SERVER
(
  USV_ID              NUMBER(10)                NOT NULL,
  MAC_ID              NUMBER(10)                NOT NULL,
  DSL_ID              NUMBER(10)                NOT NULL,
  DSC_ID              NUMBER(10)                    NULL,
  USV_NAME            NVARCHAR2(255)            NOT NULL,
  USV_DATA_LOCATION   NVARCHAR2(255)                NULL,
  USV_INDEX_LOCATION  NVARCHAR2(255)                NULL,
  USV_DELETE_FL       CHAR(1)                   NOT NULL,
  USV_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE USAGE_SERVER_PARTITION CASCADE CONSTRAINTS
/

--
-- USAGE_SERVER_PARTITION  (Table) 
--
CREATE TABLE USAGE_SERVER_PARTITION
(
  USP_ID              NUMBER(10)                NOT NULL,
  UPN_ID              NUMBER(10)                NOT NULL,
  USV_ID              NUMBER(10)                NOT NULL,
  DSC_ID              NUMBER(10)                NOT NULL,
  USP_TABLE_SUFFIX    NVARCHAR2(255)                NULL,
  USP_DATA_LOCATION   NVARCHAR2(255)                NULL,
  USP_INDEX_LOCATION  NVARCHAR2(255)                NULL,
  USP_DELETE_FL       CHAR(1)                   NOT NULL,
  USP_VERSION_ID      NUMBER(10)                NOT NULL,
  PTN_ID              NUMBER(10)                NOT NULL
)
/


DROP TABLE USER_DEFAULT_DETAIL CASCADE CONSTRAINTS
/

--
-- USER_DEFAULT_DETAIL  (Table) 
--
CREATE TABLE USER_DEFAULT_DETAIL
(
  UDD_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  PMD_ID          NUMBER(10)                    NOT NULL,
  UDD_OBJECT_PK   NUMBER(10)                    NOT NULL,
  UDD_DELETE_FL   CHAR(1)                       NOT NULL,
  UDD_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USER_DEFAULT_SEARCH CASCADE CONSTRAINTS
/

--
-- USER_DEFAULT_SEARCH  (Table) 
--
CREATE TABLE USER_DEFAULT_SEARCH
(
  UDS_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  PMD_ID          NUMBER(10)                    NOT NULL,
  UDS_OBJECT_PK   NUMBER(10)                    NOT NULL,
  UDS_DELETE_FL   CHAR(1)                       NOT NULL,
  UDS_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USER_LOGIN CASCADE CONSTRAINTS
/

--
-- USER_LOGIN  (Table) 
--
CREATE TABLE USER_LOGIN
(
  ULG_ID               NUMBER(10)               NOT NULL,
  USR_ID               NUMBER(10)                   NULL,
  ULG_DTTM             TIMESTAMP(6)             NOT NULL,
  ULG_SUCCESS_FL       CHAR(1)                  NOT NULL,
  ULG_SOURCE_ADDRESS   NVARCHAR2(255)           NOT NULL,
  ULG_SOURCE_HOSTNAME  NVARCHAR2(255)           NOT NULL,
  ULG_MESSAGE          NVARCHAR2(255)           NOT NULL,
  ULG_DELETE_FL        CHAR(1)                  NOT NULL,
  ULG_VERSION_ID       NUMBER(10)               NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE USER_NAME_VALIDATION CASCADE CONSTRAINTS
/

--
-- USER_NAME_VALIDATION  (Table) 
--
CREATE TABLE USER_NAME_VALIDATION
(
  UNV_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  PIG_ID          NUMBER(10)                    NOT NULL,
  UNV_NAME        NVARCHAR2(255)                NOT NULL,
  UNV_DELETE_FL   CHAR(1)                       NOT NULL,
  UNV_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USER_PASSWORD CASCADE CONSTRAINTS
/

--
-- USER_PASSWORD  (Table) 
--
CREATE TABLE USER_PASSWORD
(
  UPW_ID               NUMBER(10)               NOT NULL,
  UPW_CHANGING_USR_ID  NUMBER(10)               NOT NULL,
  UPW_EFFECTED_USR_ID  NUMBER(10)               NOT NULL,
  UPW_DTTM             TIMESTAMP(6)             NOT NULL,
  UPW_PASSWORD         NVARCHAR2(255)           NOT NULL,
  UPW_RESET_FL         CHAR(1)                  NOT NULL,
  UPW_DELETE_FL        CHAR(1)                  NOT NULL,
  UPW_VERSION_ID       NUMBER(10)               NOT NULL,
  PTN_ID               NUMBER(10)               NOT NULL
)
/


DROP TABLE USER_PASSWORD_VALIDATION CASCADE CONSTRAINTS
/

--
-- USER_PASSWORD_VALIDATION  (Table) 
--
CREATE TABLE USER_PASSWORD_VALIDATION
(
  UPV_ID          NUMBER(10)                    NOT NULL,
  CMP_ID          NUMBER(10)                    NOT NULL,
  PIG_ID          NUMBER(10)                    NOT NULL,
  UPV_NAME        NVARCHAR2(255)                NOT NULL,
  UPV_DELETE_FL   CHAR(1)                       NOT NULL,
  UPV_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USER_ROLE_PARTITION CASCADE CONSTRAINTS
/

--
-- USER_ROLE_PARTITION  (Table) 
--
CREATE TABLE USER_ROLE_PARTITION
(
  URP_ID          NUMBER(10)                    NOT NULL,
  USR_ID          NUMBER(10)                    NOT NULL,
  ROL_ID          NUMBER(10)                    NOT NULL,
  URP_PTN_ID      NUMBER(10)                    NOT NULL,
  URP_DELETE_FL   CHAR(1)                       NOT NULL,
  URP_VERSION_ID  NUMBER(10)                    NOT NULL,
  PTN_ID          NUMBER(10)                    NOT NULL
)
/


DROP TABLE USER_TBL CASCADE CONSTRAINTS
/

--
-- USER_TBL  (Table) 
--
CREATE TABLE USER_TBL
(
  USR_ID             NUMBER(10)                 NOT NULL,
  PIG_ID             NUMBER(10)                 NOT NULL,
  USR_NAME           NVARCHAR2(255)             NOT NULL,
  USR_PASSWORD       NVARCHAR2(255)             NOT NULL,
  USR_FORENAME       NVARCHAR2(255)             NOT NULL,
  USR_SURNAME        NVARCHAR2(255)             NOT NULL,
  USR_EMAIL_ADDRESS  NVARCHAR2(255)                 NULL,
  USR_DISABLED_FL    CHAR(1)                    NOT NULL,
  USR_DELETE_FL      CHAR(1)                    NOT NULL,
  USR_VERSION_ID     NUMBER(10)                 NOT NULL,
  PTN_ID             NUMBER(10)                 NOT NULL
)
/


--
-- NOTE_ATTACHMENT_PK  (Index) 
--
--  Dependencies: 
--   NOTE_ATTACHMENT (Table)
--
CREATE UNIQUE INDEX NOTE_ATTACHMENT_PK ON NOTE_ATTACHMENT
(NAT_ID)
/


--
-- NOTE_HISTORY_PK  (Index) 
--
--  Dependencies: 
--   NOTE_HISTORY (Table)
--
CREATE UNIQUE INDEX NOTE_HISTORY_PK ON NOTE_HISTORY
(NOH_ID)
/


--
-- NOTE_PK  (Index) 
--
--  Dependencies: 
--   NOTE (Table)
--
CREATE UNIQUE INDEX NOTE_PK ON NOTE
(NOT_ID)
/


--
-- PARAMETER_DFN_AK  (Index) 
--
--  Dependencies: 
--   PARAMETER_DFN (Table)
--
CREATE UNIQUE INDEX PARAMETER_DFN_AK ON PARAMETER_DFN
(PMD_NAME)
/


--
-- PARAMETER_DFN_PK  (Index) 
--
--  Dependencies: 
--   PARAMETER_DFN (Table)
--
CREATE UNIQUE INDEX PARAMETER_DFN_PK ON PARAMETER_DFN
(PMD_ID)
/


--
-- PARSE_OUTPUT_MAP_AK  (Index) 
--
--  Dependencies: 
--   PARSE_OUTPUT_MAP (Table)
--
CREATE UNIQUE INDEX PARSE_OUTPUT_MAP_AK ON PARSE_OUTPUT_MAP
(STS_ID, POM_OUTPUT_KEY)
/


--
-- PARSE_OUTPUT_MAP_PK  (Index) 
--
--  Dependencies: 
--   PARSE_OUTPUT_MAP (Table)
--
CREATE UNIQUE INDEX PARSE_OUTPUT_MAP_PK ON PARSE_OUTPUT_MAP
(POM_ID)
/


--
-- PARTITION_TBL_AK  (Index) 
--
--  Dependencies: 
--   PARTITION_TBL (Table)
--
CREATE UNIQUE INDEX PARTITION_TBL_AK ON PARTITION_TBL
(PTN_NAME)
/


--
-- PARTITION_TBL_PK  (Index) 
--
--  Dependencies: 
--   PARTITION_TBL (Table)
--
CREATE UNIQUE INDEX PARTITION_TBL_PK ON PARTITION_TBL
(PTN_ID)
/


--
-- PENDING_COLLECTED_FILE_PK  (Index) 
--
--  Dependencies: 
--   PENDING_COLLECTED_FILE (Table)
--
CREATE UNIQUE INDEX PENDING_COLLECTED_FILE_PK ON PENDING_COLLECTED_FILE
(PCF_ID)
/


--
-- PENDING_TASK_PK  (Index) 
--
--  Dependencies: 
--   PENDING_TASK (Table)
--
CREATE UNIQUE INDEX PENDING_TASK_PK ON PENDING_TASK
(PTK_ID)
/


--
-- PROCESSED_FILE_INFO_PK  (Index) 
--
--  Dependencies: 
--   PROCESSED_FILE_INFO (Table)
--
CREATE UNIQUE INDEX PROCESSED_FILE_INFO_PK ON PROCESSED_FILE_INFO
(PFI_ID)
/


--
-- PROPERTY_DFN_GROUP_PK  (Index) 
--
--  Dependencies: 
--   PROPERTY_DFN_GROUP (Table)
--
CREATE UNIQUE INDEX PROPERTY_DFN_GROUP_PK ON PROPERTY_DFN_GROUP
(PDG_ID)
/


--
-- PROPERTY_DFN_GROUP_SS1  (Index) 
--
--  Dependencies: 
--   PROPERTY_DFN_GROUP (Table)
--
CREATE UNIQUE INDEX PROPERTY_DFN_GROUP_SS1 ON PROPERTY_DFN_GROUP
(PDG_KEY)
/


--
-- PROPERTY_DFN_PK  (Index) 
--
--  Dependencies: 
--   PROPERTY_DFN (Table)
--
CREATE UNIQUE INDEX PROPERTY_DFN_PK ON PROPERTY_DFN
(PRD_ID)
/


--
-- PROPERTY_DFN_SS1  (Index) 
--
--  Dependencies: 
--   PROPERTY_DFN (Table)
--
CREATE UNIQUE INDEX PROPERTY_DFN_SS1 ON PROPERTY_DFN
(PDG_ID, PRD_KEY)
/


--
-- PROPERTY_INST_AK  (Index) 
--
--  Dependencies: 
--   PROPERTY_INST (Table)
--
CREATE UNIQUE INDEX PROPERTY_INST_AK ON PROPERTY_INST
(PIG_ID, PRD_ID)
/


--
-- PROPERTY_INST_GROUP_PK  (Index) 
--
--  Dependencies: 
--   PROPERTY_INST_GROUP (Table)
--
CREATE UNIQUE INDEX PROPERTY_INST_GROUP_PK ON PROPERTY_INST_GROUP
(PIG_ID)
/


--
-- PROPERTY_INST_PK  (Index) 
--
--  Dependencies: 
--   PROPERTY_INST (Table)
--
CREATE UNIQUE INDEX PROPERTY_INST_PK ON PROPERTY_INST
(PRI_ID)
/


--
-- QUERY_BUILDER_AK  (Index) 
--
--  Dependencies: 
--   QUERY_BUILDER (Table)
--
CREATE UNIQUE INDEX QUERY_BUILDER_AK ON QUERY_BUILDER
(QBR_NAME)
/


--
-- QUERY_BUILDER_PK  (Index) 
--
--  Dependencies: 
--   QUERY_BUILDER (Table)
--
CREATE UNIQUE INDEX QUERY_BUILDER_PK ON QUERY_BUILDER
(QBR_ID)
/


--
-- QUERY_FILTER_AK  (Index) 
--
--  Dependencies: 
--   QUERY_FILTER (Table)
--
CREATE UNIQUE INDEX QUERY_FILTER_AK ON QUERY_FILTER
(QFR_NAME)
/


--
-- QUERY_FILTER_PK  (Index) 
--
--  Dependencies: 
--   QUERY_FILTER (Table)
--
CREATE UNIQUE INDEX QUERY_FILTER_PK ON QUERY_FILTER
(QFR_ID)
/


--
-- RECURRING_SCHEDULE_PK  (Index) 
--
--  Dependencies: 
--   RECURRING_SCHEDULE (Table)
--
CREATE UNIQUE INDEX RECURRING_SCHEDULE_PK ON RECURRING_SCHEDULE
(RSH_ID)
/


--
-- REFRESH_CONFIG_PK  (Index) 
--
--  Dependencies: 
--   REFRESH_CONFIG (Table)
--
CREATE UNIQUE INDEX REFRESH_CONFIG_PK ON REFRESH_CONFIG
(RFG_ID)
/


--
-- REF_TABLE_AK  (Index) 
--
--  Dependencies: 
--   REF_TABLE (Table)
--
CREATE UNIQUE INDEX REF_TABLE_AK ON REF_TABLE
(RFT_NAME)
/


--
-- REF_TABLE_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   REF_TABLE_COLUMN (Table)
--
CREATE UNIQUE INDEX REF_TABLE_COLUMN_PK ON REF_TABLE_COLUMN
(RFC_ID)
/


--
-- REF_TABLE_COLUMN_SS1  (Index) 
--
--  Dependencies: 
--   REF_TABLE_COLUMN (Table)
--
CREATE UNIQUE INDEX REF_TABLE_COLUMN_SS1 ON REF_TABLE_COLUMN
(RFT_ID, RFC_LABEL)
/


--
-- REF_TABLE_PK  (Index) 
--
--  Dependencies: 
--   REF_TABLE (Table)
--
CREATE UNIQUE INDEX REF_TABLE_PK ON REF_TABLE
(RFT_ID)
/


--
-- REF_TABLE_SS1  (Index) 
--
--  Dependencies: 
--   REF_TABLE (Table)
--
CREATE UNIQUE INDEX REF_TABLE_SS1 ON REF_TABLE
(ENT_ID)
/


--
-- REPORT_PK  (Index) 
--
--  Dependencies: 
--   REPORT (Table)
--
CREATE UNIQUE INDEX REPORT_PK ON REPORT
(RPT_ID)
/


--
-- REPORT_SS1  (Index) 
--
--  Dependencies: 
--   REPORT (Table)
--
CREATE UNIQUE INDEX REPORT_SS1 ON REPORT
(RPT_NAME)
/


--
-- REPORT_SS2  (Index) 
--
--  Dependencies: 
--   REPORT (Table)
--
CREATE UNIQUE INDEX REPORT_SS2 ON REPORT
(RPT_NAME, RPT_DESIGN_FILE_NAME)
/


--
-- ROLE_BUS_OBJECTS_GROUP_PK  (Index) 
--
--  Dependencies: 
--   ROLE_BUS_OBJECTS_GROUP (Table)
--
CREATE UNIQUE INDEX ROLE_BUS_OBJECTS_GROUP_PK ON ROLE_BUS_OBJECTS_GROUP
(RBG_ID)
/


--
-- ROLE_BUS_OBJECTS_GROUP_SS1  (Index) 
--
--  Dependencies: 
--   ROLE_BUS_OBJECTS_GROUP (Table)
--
CREATE UNIQUE INDEX ROLE_BUS_OBJECTS_GROUP_SS1 ON ROLE_BUS_OBJECTS_GROUP
(ROL_ID, BOG_ID)
/


--
-- ROLE_REF_TABLE_PK  (Index) 
--
--  Dependencies: 
--   ROLE_REF_TABLE (Table)
--
CREATE UNIQUE INDEX ROLE_REF_TABLE_PK ON ROLE_REF_TABLE
(RRF_ID)
/


--
-- ROLE_REF_TABLE_SS1  (Index) 
--
--  Dependencies: 
--   ROLE_REF_TABLE (Table)
--
CREATE UNIQUE INDEX ROLE_REF_TABLE_SS1 ON ROLE_REF_TABLE
(ROL_ID, RFT_ID)
/


--
-- ROLE_SECURITY_LABEL_PK  (Index) 
--
--  Dependencies: 
--   ROLE_SECURITY_LABEL (Table)
--
CREATE UNIQUE INDEX ROLE_SECURITY_LABEL_PK ON ROLE_SECURITY_LABEL
(RSL_ID)
/


--
-- ROLE_SECURITY_LABEL_SS1  (Index) 
--
--  Dependencies: 
--   ROLE_SECURITY_LABEL (Table)
--
CREATE UNIQUE INDEX ROLE_SECURITY_LABEL_SS1 ON ROLE_SECURITY_LABEL
(ROL_ID, SLA_ID)
/


--
-- ROLE_TBL_AK  (Index) 
--
--  Dependencies: 
--   ROLE_TBL (Table)
--
CREATE UNIQUE INDEX ROLE_TBL_AK ON ROLE_TBL
(ROL_NAME)
/


--
-- ROLE_TBL_PK  (Index) 
--
--  Dependencies: 
--   ROLE_TBL (Table)
--
CREATE UNIQUE INDEX ROLE_TBL_PK ON ROLE_TBL
(ROL_ID)
/


--
-- ROLE_UI_ACTION_ITEM_PK  (Index) 
--
--  Dependencies: 
--   ROLE_UI_ACTION_ITEM (Table)
--
CREATE UNIQUE INDEX ROLE_UI_ACTION_ITEM_PK ON ROLE_UI_ACTION_ITEM
(RAI_ID)
/


--
-- ROLE_UI_ACTION_ITEM_SS1  (Index) 
--
--  Dependencies: 
--   ROLE_UI_ACTION_ITEM (Table)
--
CREATE UNIQUE INDEX ROLE_UI_ACTION_ITEM_SS1 ON ROLE_UI_ACTION_ITEM
(ROL_ID, UAI_ID)
/


--
-- ROUTE_CLASS_AK  (Index) 
--
--  Dependencies: 
--   ROUTE_CLASS (Table)
--
CREATE UNIQUE INDEX ROUTE_CLASS_AK ON ROUTE_CLASS
(RTC_NAME)
/


--
-- ROUTE_CLASS_PK  (Index) 
--
--  Dependencies: 
--   ROUTE_CLASS (Table)
--
CREATE UNIQUE INDEX ROUTE_CLASS_PK ON ROUTE_CLASS
(RTC_ID)
/


--
-- ROUTE_CLASS_SS1  (Index) 
--
--  Dependencies: 
--   ROUTE_CLASS (Table)
--
CREATE UNIQUE INDEX ROUTE_CLASS_SS1 ON ROUTE_CLASS
(RTC_CODE)
/


--
-- ROUTE_PK  (Index) 
--
--  Dependencies: 
--   ROUTE (Table)
--
CREATE UNIQUE INDEX ROUTE_PK ON ROUTE
(RUT_ID)
/


--
-- ROUTE_SS1  (Index) 
--
--  Dependencies: 
--   ROUTE (Table)
--
CREATE UNIQUE INDEX ROUTE_SS1 ON ROUTE
(SWT_ID, RUT_NAME, RUT_MATCH_STR, RUT_FROM_DTTM)
/


--
-- ROUTE_TYPE_AK  (Index) 
--
--  Dependencies: 
--   ROUTE_TYPE (Table)
--
CREATE UNIQUE INDEX ROUTE_TYPE_AK ON ROUTE_TYPE
(RTT_NAME)
/


--
-- ROUTE_TYPE_PK  (Index) 
--
--  Dependencies: 
--   ROUTE_TYPE (Table)
--
CREATE UNIQUE INDEX ROUTE_TYPE_PK ON ROUTE_TYPE
(RTT_ID)
/


--
-- ROUTE_TYPE_SS1  (Index) 
--
--  Dependencies: 
--   ROUTE_TYPE (Table)
--
CREATE UNIQUE INDEX ROUTE_TYPE_SS1 ON ROUTE_TYPE
(RTT_CODE)
/


--
-- SCHEMA_TBL_AK  (Index) 
--
--  Dependencies: 
--   SCHEMA_TBL (Table)
--
CREATE UNIQUE INDEX SCHEMA_TBL_AK ON SCHEMA_TBL
(SCH_NAME)
/


--
-- SCHEMA_TBL_PK  (Index) 
--
--  Dependencies: 
--   SCHEMA_TBL (Table)
--
CREATE UNIQUE INDEX SCHEMA_TBL_PK ON SCHEMA_TBL
(SCH_ID)
/


--
-- SCHEMA_TYPE_AK  (Index) 
--
--  Dependencies: 
--   SCHEMA_TYPE (Table)
--
CREATE UNIQUE INDEX SCHEMA_TYPE_AK ON SCHEMA_TYPE
(SCT_NAME)
/


--
-- SCHEMA_TYPE_PK  (Index) 
--
--  Dependencies: 
--   SCHEMA_TYPE (Table)
--
CREATE UNIQUE INDEX SCHEMA_TYPE_PK ON SCHEMA_TYPE
(SCT_ID)
/


--
-- SECURITY_LABEL_PK  (Index) 
--
--  Dependencies: 
--   SECURITY_LABEL (Table)
--
CREATE UNIQUE INDEX SECURITY_LABEL_PK ON SECURITY_LABEL
(SLA_ID)
/


--
-- SECURITY_LABEL_SS1  (Index) 
--
--  Dependencies: 
--   SECURITY_LABEL (Table)
--
CREATE UNIQUE INDEX SECURITY_LABEL_SS1 ON SECURITY_LABEL
(SLA_NAME)
/


--
-- SECURITY_LABEL_SS2  (Index) 
--
--  Dependencies: 
--   SECURITY_LABEL (Table)
--
CREATE UNIQUE INDEX SECURITY_LABEL_SS2 ON SECURITY_LABEL
(SLA_LABEL)
/


--
-- SEQUENTIAL_NUMBER_GROUP_AK  (Index) 
--
--  Dependencies: 
--   SEQUENTIAL_NUMBER_GROUP (Table)
--
CREATE UNIQUE INDEX SEQUENTIAL_NUMBER_GROUP_AK ON SEQUENTIAL_NUMBER_GROUP
(SNG_NAME)
/


--
-- SEQUENTIAL_NUMBER_GROUP_PK  (Index) 
--
--  Dependencies: 
--   SEQUENTIAL_NUMBER_GROUP (Table)
--
CREATE UNIQUE INDEX SEQUENTIAL_NUMBER_GROUP_PK ON SEQUENTIAL_NUMBER_GROUP
(SNG_ID)
/


--
-- SERVER_EXCEPTION_GROUP_PK  (Index) 
--
--  Dependencies: 
--   SERVER_EXCEPTION_GROUP (Table)
--
CREATE UNIQUE INDEX SERVER_EXCEPTION_GROUP_PK ON SERVER_EXCEPTION_GROUP
(SEG_ID)
/


--
-- SERVER_EXCEPTION_PK  (Index) 
--
--  Dependencies: 
--   SERVER_EXCEPTION (Table)
--
CREATE UNIQUE INDEX SERVER_EXCEPTION_PK ON SERVER_EXCEPTION
(SEX_ID)
/


--
-- SERVER_EXCEPTION_SS1  (Index) 
--
--  Dependencies: 
--   SERVER_EXCEPTION (Table)
--
CREATE UNIQUE INDEX SERVER_EXCEPTION_SS1 ON SERVER_EXCEPTION
(SEG_ID, SEX_ORDER_NO)
/


--
-- SQL_QUERY_FROM_AK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_FROM (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_FROM_AK ON SQL_QUERY_FROM
(SQL_ID, SQF_ORDER_NO)
/


--
-- SQL_QUERY_FROM_PK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_FROM (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_FROM_PK ON SQL_QUERY_FROM
(SQF_ID)
/


--
-- SQL_QUERY_FROM_SS1  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_FROM (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_FROM_SS1 ON SQL_QUERY_FROM
(SQL_ID, TBD_ID, SQF_TABLE_ALIAS)
/


--
-- SQL_QUERY_ORDER_BY_AK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_ORDER_BY (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_ORDER_BY_AK ON SQL_QUERY_ORDER_BY
(SQL_ID, SQO_ORDER_NO)
/


--
-- SQL_QUERY_ORDER_BY_PK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_ORDER_BY (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_ORDER_BY_PK ON SQL_QUERY_ORDER_BY
(SQO_ID)
/


--
-- SQL_QUERY_PK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_PK ON SQL_QUERY
(SQL_ID)
/


--
-- SQL_QUERY_SELECT_AK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_SELECT (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_SELECT_AK ON SQL_QUERY_SELECT
(SQL_ID, SQS_ORDER_NO)
/


--
-- SQL_QUERY_SELECT_PK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_SELECT (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_SELECT_PK ON SQL_QUERY_SELECT
(SQS_ID)
/


--
-- SQL_QUERY_WHERE_AK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_WHERE (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_WHERE_AK ON SQL_QUERY_WHERE
(SQL_ID, SQW_ORDER_NO)
/


--
-- SQL_QUERY_WHERE_PK  (Index) 
--
--  Dependencies: 
--   SQL_QUERY_WHERE (Table)
--
CREATE UNIQUE INDEX SQL_QUERY_WHERE_PK ON SQL_QUERY_WHERE
(SQW_ID)
/


--
-- STREAM_CONTROLLER_AK  (Index) 
--
--  Dependencies: 
--   STREAM_CONTROLLER (Table)
--
CREATE UNIQUE INDEX STREAM_CONTROLLER_AK ON STREAM_CONTROLLER
(STC_NAME)
/


--
-- STREAM_CONTROLLER_PK  (Index) 
--
--  Dependencies: 
--   STREAM_CONTROLLER (Table)
--
CREATE UNIQUE INDEX STREAM_CONTROLLER_PK ON STREAM_CONTROLLER
(STC_ID)
/


--
-- STREAM_FILE_PK  (Index) 
--
--  Dependencies: 
--   STREAM_FILE (Table)
--
CREATE UNIQUE INDEX STREAM_FILE_PK ON STREAM_FILE
(SFL_ID)
/


--
-- STREAM_PK  (Index) 
--
--  Dependencies: 
--   STREAM (Table)
--
CREATE UNIQUE INDEX STREAM_PK ON STREAM
(STM_ID)
/


--
-- STREAM_SS1  (Index) 
--
--  Dependencies: 
--   STREAM (Table)
--
CREATE UNIQUE INDEX STREAM_SS1 ON STREAM
(STM_NAME)
/


--
-- STREAM_STAGE_AK  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_AK ON STREAM_STAGE
(STM_ID, STS_NAME)
/


--
-- STREAM_STAGE_PK  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_PK ON STREAM_STAGE
(STS_ID)
/


--
-- STREAM_STAGE_RECUR_TASK_AK  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE_RECUR_TASK (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_RECUR_TASK_AK ON STREAM_STAGE_RECUR_TASK
(SRT_NAME)
/


--
-- STREAM_STAGE_RECUR_TASK_PK  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE_RECUR_TASK (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_RECUR_TASK_PK ON STREAM_STAGE_RECUR_TASK
(SRT_ID)
/


--
-- STREAM_STAGE_RECUR_TASK_SS1  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE_RECUR_TASK (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_RECUR_TASK_SS1 ON STREAM_STAGE_RECUR_TASK
(STS_ID)
/


--
-- STREAM_STAGE_TYPE_PK  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE_TYPE (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_TYPE_PK ON STREAM_STAGE_TYPE
(SST_ID)
/


--
-- STREAM_STAGE_TYPE_SS1  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE_TYPE (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_TYPE_SS1 ON STREAM_STAGE_TYPE
(SST_CODE)
/


--
-- STREAM_STAGE_TYPE_SS2  (Index) 
--
--  Dependencies: 
--   STREAM_STAGE_TYPE (Table)
--
CREATE UNIQUE INDEX STREAM_STAGE_TYPE_SS2 ON STREAM_STAGE_TYPE
(SST_NAME)
/


--
-- STRING_RULE_AK  (Index) 
--
--  Dependencies: 
--   STRING_RULE (Table)
--
CREATE UNIQUE INDEX STRING_RULE_AK ON STRING_RULE
(SRS_ID, SRL_NAME)
/


--
-- STRING_RULE_MATCH_AK  (Index) 
--
--  Dependencies: 
--   STRING_RULE_MATCH (Table)
--
CREATE UNIQUE INDEX STRING_RULE_MATCH_AK ON STRING_RULE_MATCH
(SRS_ID, SRM_MATCH_STRING)
/


--
-- STRING_RULE_MATCH_PK  (Index) 
--
--  Dependencies: 
--   STRING_RULE_MATCH (Table)
--
CREATE UNIQUE INDEX STRING_RULE_MATCH_PK ON STRING_RULE_MATCH
(SRM_ID)
/


--
-- STRING_RULE_PK  (Index) 
--
--  Dependencies: 
--   STRING_RULE (Table)
--
CREATE UNIQUE INDEX STRING_RULE_PK ON STRING_RULE
(SRL_ID)
/


--
-- STRING_RULE_SET_AK  (Index) 
--
--  Dependencies: 
--   STRING_RULE_SET (Table)
--
CREATE UNIQUE INDEX STRING_RULE_SET_AK ON STRING_RULE_SET
(SRS_NAME)
/


--
-- STRING_RULE_SET_PK  (Index) 
--
--  Dependencies: 
--   STRING_RULE_SET (Table)
--
CREATE UNIQUE INDEX STRING_RULE_SET_PK ON STRING_RULE_SET
(SRS_ID)
/


--
-- STRING_RULE_STEP_AK  (Index) 
--
--  Dependencies: 
--   STRING_RULE_STEP (Table)
--
CREATE UNIQUE INDEX STRING_RULE_STEP_AK ON STRING_RULE_STEP
(SRL_ID, SRP_MATCH_STRING, SRP_ORDER_NO)
/


--
-- STRING_RULE_STEP_PK  (Index) 
--
--  Dependencies: 
--   STRING_RULE_STEP (Table)
--
CREATE UNIQUE INDEX STRING_RULE_STEP_PK ON STRING_RULE_STEP
(SRP_ID)
/


--
-- SWITCH_TBL_AK  (Index) 
--
--  Dependencies: 
--   SWITCH_TBL (Table)
--
CREATE UNIQUE INDEX SWITCH_TBL_AK ON SWITCH_TBL
(SWT_NAME)
/


--
-- SWITCH_TBL_PK  (Index) 
--
--  Dependencies: 
--   SWITCH_TBL (Table)
--
CREATE UNIQUE INDEX SWITCH_TBL_PK ON SWITCH_TBL
(SWT_ID)
/


--
-- SWITCH_TBL_SS1  (Index) 
--
--  Dependencies: 
--   SWITCH_TBL (Table)
--
CREATE UNIQUE INDEX SWITCH_TBL_SS1 ON SWITCH_TBL
(SWT_MATCH_STR)
/


--
-- TABLE_COLUMN_AK  (Index) 
--
--  Dependencies: 
--   TABLE_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_COLUMN_AK ON TABLE_COLUMN
(TBD_ID, TCL_NAME)
/


--
-- TABLE_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   TABLE_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_COLUMN_PK ON TABLE_COLUMN
(TCL_ID)
/


--
-- TABLE_COLUMN_SS1  (Index) 
--
--  Dependencies: 
--   TABLE_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_COLUMN_SS1 ON TABLE_COLUMN
(TBD_ID, TCL_ORDER_NO, TCL_ID)
/


--
-- TABLE_COLUMN_SS2  (Index) 
--
--  Dependencies: 
--   TABLE_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_COLUMN_SS2 ON TABLE_COLUMN
(TBD_ID, TCL_DISPLAY)
/


--
-- TABLE_DFN_AK  (Index) 
--
--  Dependencies: 
--   TABLE_DFN (Table)
--
CREATE UNIQUE INDEX TABLE_DFN_AK ON TABLE_DFN
(TBD_NAME)
/


--
-- TABLE_DFN_PK  (Index) 
--
--  Dependencies: 
--   TABLE_DFN (Table)
--
CREATE UNIQUE INDEX TABLE_DFN_PK ON TABLE_DFN
(TBD_ID)
/


--
-- TABLE_FILTER_COL_PK  (Index) 
--
--  Dependencies: 
--   TABLE_FILTER_COL (Table)
--
CREATE UNIQUE INDEX TABLE_FILTER_COL_PK ON TABLE_FILTER_COL
(TFC_ID)
/


--
-- TABLE_FILTER_COL_SS1  (Index) 
--
--  Dependencies: 
--   TABLE_FILTER_COL (Table)
--
CREATE UNIQUE INDEX TABLE_FILTER_COL_SS1 ON TABLE_FILTER_COL
(TFR_ID, TFC_ORDER_NO)
/


--
-- TABLE_FILTER_PK  (Index) 
--
--  Dependencies: 
--   TABLE_FILTER (Table)
--
CREATE UNIQUE INDEX TABLE_FILTER_PK ON TABLE_FILTER
(TFR_ID)
/


--
-- TABLE_FILTER_SS1  (Index) 
--
--  Dependencies: 
--   TABLE_FILTER (Table)
--
CREATE UNIQUE INDEX TABLE_FILTER_SS1 ON TABLE_FILTER
(USR_ID, TIN_ID)
/


--
-- TABLE_GRID_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   TABLE_GRID_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_GRID_COLUMN_PK ON TABLE_GRID_COLUMN
(TGC_ID)
/


--
-- TABLE_GRID_PK  (Index) 
--
--  Dependencies: 
--   TABLE_GRID (Table)
--
CREATE UNIQUE INDEX TABLE_GRID_PK ON TABLE_GRID
(TGR_ID)
/


--
-- TABLE_GRID_SS1  (Index) 
--
--  Dependencies: 
--   TABLE_GRID (Table)
--
CREATE UNIQUE INDEX TABLE_GRID_SS1 ON TABLE_GRID
(TIN_ID, CXT_ID, USR_ID)
/


--
-- TABLE_INDEX_AK  (Index) 
--
--  Dependencies: 
--   TABLE_INDEX (Table)
--
CREATE UNIQUE INDEX TABLE_INDEX_AK ON TABLE_INDEX
(TBD_ID, TIX_SUFFIX)
/


--
-- TABLE_INDEX_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   TABLE_INDEX_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_INDEX_COLUMN_PK ON TABLE_INDEX_COLUMN
(TIC_ID)
/


--
-- TABLE_INDEX_COLUMN_SS1  (Index) 
--
--  Dependencies: 
--   TABLE_INDEX_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_INDEX_COLUMN_SS1 ON TABLE_INDEX_COLUMN
(TIX_ID, TIC_ORDER_NO, TIC_ID)
/


--
-- TABLE_INDEX_COLUMN_SS2  (Index) 
--
--  Dependencies: 
--   TABLE_INDEX_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_INDEX_COLUMN_SS2 ON TABLE_INDEX_COLUMN
(TIX_ID, TCL_ID)
/


--
-- TABLE_INDEX_PK  (Index) 
--
--  Dependencies: 
--   TABLE_INDEX (Table)
--
CREATE UNIQUE INDEX TABLE_INDEX_PK ON TABLE_INDEX
(TIX_ID)
/


--
-- TABLE_INST_AK  (Index) 
--
--  Dependencies: 
--   TABLE_INST (Table)
--
CREATE UNIQUE INDEX TABLE_INST_AK ON TABLE_INST
(TIN_DISPLAY_NAME)
/


--
-- TABLE_INST_PK  (Index) 
--
--  Dependencies: 
--   TABLE_INST (Table)
--
CREATE UNIQUE INDEX TABLE_INST_PK ON TABLE_INST
(TIN_ID)
/


--
-- TABLE_INST_SS1  (Index) 
--
--  Dependencies: 
--   TABLE_INST (Table)
--
CREATE UNIQUE INDEX TABLE_INST_SS1 ON TABLE_INST
(TIN_TABLE_NAME)
/


--
-- TABLE_MAPPING_COLUMN_PK  (Index) 
--
--  Dependencies: 
--   TABLE_MAPPING_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_MAPPING_COLUMN_PK ON TABLE_MAPPING_COLUMN
(TMC_ID)
/


--
-- TABLE_MAPPING_COLUMN_SS1  (Index) 
--
--  Dependencies: 
--   TABLE_MAPPING_COLUMN (Table)
--
CREATE UNIQUE INDEX TABLE_MAPPING_COLUMN_SS1 ON TABLE_MAPPING_COLUMN
(TMA_ID, TMC_TO_TCL_ID)
/


--
-- TABLE_MAPPING_PK  (Index) 
--
--  Dependencies: 
--   TABLE_MAPPING (Table)
--
CREATE UNIQUE INDEX TABLE_MAPPING_PK ON TABLE_MAPPING
(TMA_ID)
/


--
-- TARIFF_AK  (Index) 
--
--  Dependencies: 
--   TARIFF (Table)
--
CREATE UNIQUE INDEX TARIFF_AK ON TARIFF
(TFF_NAME)
/


--
-- TARIFF_BAND_HISTORY_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_HISTORY (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_HISTORY_PK ON TARIFF_BAND_HISTORY
(TBH_ID)
/


--
-- TARIFF_BAND_HISTORY_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_HISTORY (Table)
--
CREATE INDEX TARIFF_BAND_HISTORY_SS1 ON TARIFF_BAND_HISTORY
(TAP_ID, BND_ID, TBH_MODIFIED_DTTM)
/


--
-- TARIFF_BAND_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_PK ON TARIFF_BAND
(TAB_ID)
/


--
-- TARIFF_BAND_RATE_DETAIL_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_RATE_DETAIL (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_RATE_DETAIL_PK ON TARIFF_BAND_RATE_DETAIL
(TRD_ID)
/


--
-- TARIFF_BAND_RATE_HISTORY_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_RATE_HISTORY (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_RATE_HISTORY_PK ON TARIFF_BAND_RATE_HISTORY
(TRH_ID)
/


--
-- TARIFF_BAND_RATE_HISTORY_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_RATE_HISTORY (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_RATE_HISTORY_SS1 ON TARIFF_BAND_RATE_HISTORY
(TBH_ID, TRN_ID)
/


--
-- TARIFF_BAND_RATE_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_RATE (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_RATE_PK ON TARIFF_BAND_RATE
(TBR_ID)
/


--
-- TARIFF_BAND_RATE_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_RATE (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_RATE_SS1 ON TARIFF_BAND_RATE
(TAB_ID, TRN_ID, TBR_ID)
/


--
-- TARIFF_BAND_RATE_THRESHOLD_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_RATE_THRESHOLD (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_RATE_THRESHOLD_PK ON TARIFF_BAND_RATE_THRESHOLD
(TBT_ID)
/


--
-- TARIFF_BAND_RATE_THRESHOLD_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_RATE_THRESHOLD (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_RATE_THRESHOLD_SS1 ON TARIFF_BAND_RATE_THRESHOLD
(TBR_ID, TBT_THRESHOLD_USAGE)
/


--
-- TARIFF_BAND_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_SS1 ON TARIFF_BAND
(TFF_ID, BND_ID, TAB_FROM_DTTM, TAB_TO_DTTM)
/


--
-- TARIFF_BAND_SS2  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_SS2 ON TARIFF_BAND
(BND_ID, TFF_ID, TAB_ID)
/


--
-- TARIFF_BAND_SS3  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND (Table)
--
CREATE INDEX TARIFF_BAND_SS3 ON TARIFF_BAND
(TAB_FROM_DTTM, TAB_TO_DTTM)
/


--
-- TARIFF_BAND_TIME_STRING_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_TIME_STRING (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_TIME_STRING_PK ON TARIFF_BAND_TIME_STRING
(TBS_ID)
/


--
-- TARIFF_BAND_TIME_STRING_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_BAND_TIME_STRING (Table)
--
CREATE UNIQUE INDEX TARIFF_BAND_TIME_STRING_SS1 ON TARIFF_BAND_TIME_STRING
(TAB_ID, DGM_ID)
/


--
-- TARIFF_CLASS_AK  (Index) 
--
--  Dependencies: 
--   TARIFF_CLASS (Table)
--
CREATE UNIQUE INDEX TARIFF_CLASS_AK ON TARIFF_CLASS
(TCS_NAME)
/


--
-- TARIFF_CLASS_BAND_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_CLASS_BAND (Table)
--
CREATE UNIQUE INDEX TARIFF_CLASS_BAND_PK ON TARIFF_CLASS_BAND
(TCB_ID)
/


--
-- TARIFF_CLASS_BAND_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_CLASS_BAND (Table)
--
CREATE UNIQUE INDEX TARIFF_CLASS_BAND_SS1 ON TARIFF_CLASS_BAND
(BND_ID, TCS_ID)
/


--
-- TARIFF_CLASS_DAY_GROUP_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_CLASS_DAY_GROUP (Table)
--
CREATE UNIQUE INDEX TARIFF_CLASS_DAY_GROUP_PK ON TARIFF_CLASS_DAY_GROUP
(TCD_ID)
/


--
-- TARIFF_CLASS_DAY_GROUP_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_CLASS_DAY_GROUP (Table)
--
CREATE UNIQUE INDEX TARIFF_CLASS_DAY_GROUP_SS1 ON TARIFF_CLASS_DAY_GROUP
(TCS_ID, TCD_ORDER_NO, TCD_ID)
/


--
-- TARIFF_CLASS_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_CLASS (Table)
--
CREATE UNIQUE INDEX TARIFF_CLASS_PK ON TARIFF_CLASS
(TCS_ID)
/


--
-- TARIFF_ELEMENT_SET_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_ELEMENT_SET (Table)
--
CREATE UNIQUE INDEX TARIFF_ELEMENT_SET_PK ON TARIFF_ELEMENT_SET
(TES_ID)
/


--
-- TARIFF_ELEMENT_SET_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_ELEMENT_SET (Table)
--
CREATE UNIQUE INDEX TARIFF_ELEMENT_SET_SS1 ON TARIFF_ELEMENT_SET
(TFF_ID, EST_ID)
/


--
-- TARIFF_ELEMENT_SET_SS2  (Index) 
--
--  Dependencies: 
--   TARIFF_ELEMENT_SET (Table)
--
CREATE UNIQUE INDEX TARIFF_ELEMENT_SET_SS2 ON TARIFF_ELEMENT_SET
(TFF_ID, TES_ORDER_NO, TES_ID)
/


--
-- TARIFF_METRIC_TYPE_AK  (Index) 
--
--  Dependencies: 
--   TARIFF_METRIC_TYPE (Table)
--
CREATE UNIQUE INDEX TARIFF_METRIC_TYPE_AK ON TARIFF_METRIC_TYPE
(TFM_NAME)
/


--
-- TARIFF_METRIC_TYPE_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_METRIC_TYPE (Table)
--
CREATE UNIQUE INDEX TARIFF_METRIC_TYPE_PK ON TARIFF_METRIC_TYPE
(TFM_ID)
/


--
-- TARIFF_PERIOD_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_PERIOD (Table)
--
CREATE UNIQUE INDEX TARIFF_PERIOD_PK ON TARIFF_PERIOD
(TAP_ID)
/


--
-- TARIFF_PERIOD_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_PERIOD (Table)
--
CREATE UNIQUE INDEX TARIFF_PERIOD_SS1 ON TARIFF_PERIOD
(TFF_ID, TAP_FROM_DTTM)
/


--
-- TARIFF_PK  (Index) 
--
--  Dependencies: 
--   TARIFF (Table)
--
CREATE UNIQUE INDEX TARIFF_PK ON TARIFF
(TFF_ID)
/


--
-- TARIFF_RATE_NAME_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_RATE_NAME (Table)
--
CREATE UNIQUE INDEX TARIFF_RATE_NAME_PK ON TARIFF_RATE_NAME
(TRN_ID)
/


--
-- TARIFF_RATE_NAME_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_RATE_NAME (Table)
--
CREATE UNIQUE INDEX TARIFF_RATE_NAME_SS1 ON TARIFF_RATE_NAME
(TRN_NAME)
/


--
-- TARIFF_TRN_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_TRN (Table)
--
CREATE UNIQUE INDEX TARIFF_TRN_PK ON TARIFF_TRN
(TTR_ID)
/


--
-- TARIFF_TRN_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_TRN (Table)
--
CREATE UNIQUE INDEX TARIFF_TRN_SS1 ON TARIFF_TRN
(TFF_ID, TRN_ID)
/


--
-- TARIFF_TRN_SS2  (Index) 
--
--  Dependencies: 
--   TARIFF_TRN (Table)
--
CREATE UNIQUE INDEX TARIFF_TRN_SS2 ON TARIFF_TRN
(TFF_ID, TTR_ORDER_NO)
/


--
-- TARIFF_TRN_SS3  (Index) 
--
--  Dependencies: 
--   TARIFF_TRN (Table)
--
CREATE UNIQUE INDEX TARIFF_TRN_SS3 ON TARIFF_TRN
(TFF_ID, TTR_CODE)
/


--
-- TARIFF_TYPE_AK  (Index) 
--
--  Dependencies: 
--   TARIFF_TYPE (Table)
--
CREATE UNIQUE INDEX TARIFF_TYPE_AK ON TARIFF_TYPE
(TFT_CODE)
/


--
-- TARIFF_TYPE_PK  (Index) 
--
--  Dependencies: 
--   TARIFF_TYPE (Table)
--
CREATE UNIQUE INDEX TARIFF_TYPE_PK ON TARIFF_TYPE
(TFT_ID)
/


--
-- TARIFF_TYPE_SS1  (Index) 
--
--  Dependencies: 
--   TARIFF_TYPE (Table)
--
CREATE UNIQUE INDEX TARIFF_TYPE_SS1 ON TARIFF_TYPE
(TFT_NAME)
/


--
-- TASK_ARCHIVE_AK  (Index) 
--
--  Dependencies: 
--   TASK_ARCHIVE (Table)
--
CREATE UNIQUE INDEX TASK_ARCHIVE_AK ON TASK_ARCHIVE
(TAR_NAME)
/


--
-- TASK_ARCHIVE_PK  (Index) 
--
--  Dependencies: 
--   TASK_ARCHIVE (Table)
--
CREATE UNIQUE INDEX TASK_ARCHIVE_PK ON TASK_ARCHIVE
(TAR_ID)
/


--
-- TASK_CONTROLLER_CAPABILITY_PK  (Index) 
--
--  Dependencies: 
--   TASK_CONTROLLER_CAPABILITY (Table)
--
CREATE UNIQUE INDEX TASK_CONTROLLER_CAPABILITY_PK ON TASK_CONTROLLER_CAPABILITY
(TCC_ID)
/


--
-- TASK_CONTROLLER_CAPABILITY_SS1  (Index) 
--
--  Dependencies: 
--   TASK_CONTROLLER_CAPABILITY (Table)
--
CREATE UNIQUE INDEX TASK_CONTROLLER_CAPABILITY_SS1 ON TASK_CONTROLLER_CAPABILITY
(TCR_ID, STS_ID)
/


--
-- TASK_CONTROLLER_PK  (Index) 
--
--  Dependencies: 
--   TASK_CONTROLLER (Table)
--
CREATE UNIQUE INDEX TASK_CONTROLLER_PK ON TASK_CONTROLLER
(TCR_ID)
/


--
-- TASK_CONTROLLER_SS1  (Index) 
--
--  Dependencies: 
--   TASK_CONTROLLER (Table)
--
CREATE UNIQUE INDEX TASK_CONTROLLER_SS1 ON TASK_CONTROLLER
(TCR_NAME)
/


--
-- TASK_OUTPUT_FILE_PK  (Index) 
--
--  Dependencies: 
--   TASK_OUTPUT_FILE (Table)
--
CREATE UNIQUE INDEX TASK_OUTPUT_FILE_PK ON TASK_OUTPUT_FILE
(TOF_ID)
/


--
-- TASK_OUTPUT_FILE_SS1  (Index) 
--
--  Dependencies: 
--   TASK_OUTPUT_FILE (Table)
--
CREATE UNIQUE INDEX TASK_OUTPUT_FILE_SS1 ON TASK_OUTPUT_FILE
(TSK_ID, TOF_ID)
/


--
-- TASK_PK  (Index) 
--
--  Dependencies: 
--   TASK (Table)
--
CREATE UNIQUE INDEX TASK_PK ON TASK
(TSK_ID)
/


--
-- TASK_SS1  (Index) 
--
--  Dependencies: 
--   TASK (Table)
--
CREATE UNIQUE INDEX TASK_SS1 ON TASK
(STS_ID, TSK_ID)
/


--
-- TASK_SS2  (Index) 
--
--  Dependencies: 
--   TASK (Table)
--
CREATE UNIQUE INDEX TASK_SS2 ON TASK
(TCR_ID, TSK_ID)
/


--
-- TASK_SS3  (Index) 
--
--  Dependencies: 
--   TASK (Table)
--
CREATE UNIQUE INDEX TASK_SS3 ON TASK
(TSK_END_DTTM, TSK_ID)
/


--
-- TASK_SS4  (Index) 
--
--  Dependencies: 
--   TASK (Table)
--
CREATE INDEX TASK_SS4 ON TASK
(STS_ID, TSK_STATUS)
/


--
-- TASK_SS5  (Index) 
--
--  Dependencies: 
--   TASK (Table)
--
CREATE INDEX TASK_SS5 ON TASK
(STS_ID, TSK_END_DTTM)
/


--
-- TASK_SS6  (Index) 
--
--  Dependencies: 
--   TASK (Table)
--
CREATE INDEX TASK_SS6 ON TASK
(TSK_STATUS, TSK_END_DTTM)
/


--
-- TEAM_AK  (Index) 
--
--  Dependencies: 
--   TEAM (Table)
--
CREATE UNIQUE INDEX TEAM_AK ON TEAM
(TEA_NAME)
/


--
-- TEAM_PK  (Index) 
--
--  Dependencies: 
--   TEAM (Table)
--
CREATE UNIQUE INDEX TEAM_PK ON TEAM
(TEA_ID)
/


--
-- TEAM_USER_PK  (Index) 
--
--  Dependencies: 
--   TEAM_USER (Table)
--
CREATE UNIQUE INDEX TEAM_USER_PK ON TEAM_USER
(TUR_ID)
/


--
-- TEAM_USER_SS1  (Index) 
--
--  Dependencies: 
--   TEAM_USER (Table)
--
CREATE UNIQUE INDEX TEAM_USER_SS1 ON TEAM_USER
(TEA_ID, USR_ID)
/


--
-- TIME_STRING_PK  (Index) 
--
--  Dependencies: 
--   TIME_STRING (Table)
--
CREATE UNIQUE INDEX TIME_STRING_PK ON TIME_STRING
(TSG_ID)
/


--
-- TOKEN_MAPPING_PK  (Index) 
--
--  Dependencies: 
--   TOKEN_MAPPING (Table)
--
CREATE UNIQUE INDEX TOKEN_MAPPING_PK ON TOKEN_MAPPING
(TOM_ID)
/


--
-- TOKEN_MAPPING_SS1  (Index) 
--
--  Dependencies: 
--   TOKEN_MAPPING (Table)
--
CREATE UNIQUE INDEX TOKEN_MAPPING_SS1 ON TOKEN_MAPPING
(TOK_ID, TOM_CONTEXT_MAC_ID, TOM_REMOTE_MAC_ID)
/


--
-- TOKEN_TBL_AK  (Index) 
--
--  Dependencies: 
--   TOKEN_TBL (Table)
--
CREATE UNIQUE INDEX TOKEN_TBL_AK ON TOKEN_TBL
(TOK_TOKEN)
/


--
-- TOKEN_TBL_PK  (Index) 
--
--  Dependencies: 
--   TOKEN_TBL (Table)
--
CREATE UNIQUE INDEX TOKEN_TBL_PK ON TOKEN_TBL
(TOK_ID)
/


--
-- TOOLBAR_AK  (Index) 
--
--  Dependencies: 
--   TOOLBAR (Table)
--
CREATE UNIQUE INDEX TOOLBAR_AK ON TOOLBAR
(APP_ID, TLB_CODE)
/


--
-- TOOLBAR_PK  (Index) 
--
--  Dependencies: 
--   TOOLBAR (Table)
--
CREATE UNIQUE INDEX TOOLBAR_PK ON TOOLBAR
(TLB_ID)
/


--
-- TREE_DFN_AK  (Index) 
--
--  Dependencies: 
--   TREE_DFN (Table)
--
CREATE UNIQUE INDEX TREE_DFN_AK ON TREE_DFN
(TRE_NAME)
/


--
-- TREE_DFN_PK  (Index) 
--
--  Dependencies: 
--   TREE_DFN (Table)
--
CREATE UNIQUE INDEX TREE_DFN_PK ON TREE_DFN
(TRE_ID)
/


--
-- TREE_ENTITY_AK  (Index) 
--
--  Dependencies: 
--   TREE_ENTITY (Table)
--
CREATE UNIQUE INDEX TREE_ENTITY_AK ON TREE_ENTITY
(TRE_ID, ENT_ID)
/


--
-- TREE_ENTITY_PK  (Index) 
--
--  Dependencies: 
--   TREE_ENTITY (Table)
--
CREATE UNIQUE INDEX TREE_ENTITY_PK ON TREE_ENTITY
(TEN_ID)
/


--
-- TREE_FOLDER_PK  (Index) 
--
--  Dependencies: 
--   TREE_FOLDER (Table)
--
CREATE UNIQUE INDEX TREE_FOLDER_PK ON TREE_FOLDER
(TFO_ID)
/


--
-- TREE_LEAF_PK  (Index) 
--
--  Dependencies: 
--   TREE_LEAF (Table)
--
CREATE UNIQUE INDEX TREE_LEAF_PK ON TREE_LEAF
(TLE_ID)
/


--
-- TRIGGER_PIN_AK  (Index) 
--
--  Dependencies: 
--   TRIGGER_PIN (Table)
--
CREATE UNIQUE INDEX TRIGGER_PIN_AK ON TRIGGER_PIN
(TRT_ID, TRP_ORDER_NO)
/


--
-- TRIGGER_PIN_PK  (Index) 
--
--  Dependencies: 
--   TRIGGER_PIN (Table)
--
CREATE UNIQUE INDEX TRIGGER_PIN_PK ON TRIGGER_PIN
(TRP_ID)
/


--
-- TRIGGER_TBL_PK  (Index) 
--
--  Dependencies: 
--   TRIGGER_TBL (Table)
--
CREATE UNIQUE INDEX TRIGGER_TBL_PK ON TRIGGER_TBL
(TRG_ID)
/


--
-- TRIGGER_TBL_SS1  (Index) 
--
--  Dependencies: 
--   TRIGGER_TBL (Table)
--
CREATE UNIQUE INDEX TRIGGER_TBL_SS1 ON TRIGGER_TBL
(STM_ID, TRG_NAME)
/


--
-- TRIGGER_TYPE_AK  (Index) 
--
--  Dependencies: 
--   TRIGGER_TYPE (Table)
--
CREATE UNIQUE INDEX TRIGGER_TYPE_AK ON TRIGGER_TYPE
(TRT_NAME)
/


--
-- TRIGGER_TYPE_PK  (Index) 
--
--  Dependencies: 
--   TRIGGER_TYPE (Table)
--
CREATE UNIQUE INDEX TRIGGER_TYPE_PK ON TRIGGER_TYPE
(TRT_ID)
/


--
-- UI_ACTION_ITEM_AK  (Index) 
--
--  Dependencies: 
--   UI_ACTION_ITEM (Table)
--
CREATE UNIQUE INDEX UI_ACTION_ITEM_AK ON UI_ACTION_ITEM
(UAI_DESCRIPTION)
/


--
-- UI_ACTION_ITEM_PK  (Index) 
--
--  Dependencies: 
--   UI_ACTION_ITEM (Table)
--
CREATE UNIQUE INDEX UI_ACTION_ITEM_PK ON UI_ACTION_ITEM
(UAI_ID)
/


--
-- USAGE_GROUP_AK  (Index) 
--
--  Dependencies: 
--   USAGE_GROUP (Table)
--
CREATE UNIQUE INDEX USAGE_GROUP_AK ON USAGE_GROUP
(USG_NAME)
/


--
-- USAGE_GROUP_PK  (Index) 
--
--  Dependencies: 
--   USAGE_GROUP (Table)
--
CREATE UNIQUE INDEX USAGE_GROUP_PK ON USAGE_GROUP
(USG_ID)
/


--
-- USAGE_GROUP_SERVER_PK  (Index) 
--
--  Dependencies: 
--   USAGE_GROUP_SERVER (Table)
--
CREATE UNIQUE INDEX USAGE_GROUP_SERVER_PK ON USAGE_GROUP_SERVER
(UGS_ID)
/


--
-- USAGE_GROUP_SERVER_SS1  (Index) 
--
--  Dependencies: 
--   USAGE_GROUP_SERVER (Table)
--
CREATE UNIQUE INDEX USAGE_GROUP_SERVER_SS1 ON USAGE_GROUP_SERVER
(USG_ID, USV_ID)
/


--
-- USAGE_PARTITION_AK  (Index) 
--
--  Dependencies: 
--   USAGE_PARTITION (Table)
--
CREATE UNIQUE INDEX USAGE_PARTITION_AK ON USAGE_PARTITION
(USG_ID, UPN_NAME)
/


--
-- USAGE_PARTITION_PK  (Index) 
--
--  Dependencies: 
--   USAGE_PARTITION (Table)
--
CREATE UNIQUE INDEX USAGE_PARTITION_PK ON USAGE_PARTITION
(UPN_ID)
/


--
-- USAGE_SERVER_AK  (Index) 
--
--  Dependencies: 
--   USAGE_SERVER (Table)
--
CREATE UNIQUE INDEX USAGE_SERVER_AK ON USAGE_SERVER
(USV_NAME)
/


--
-- USAGE_SERVER_PARTITION_PK  (Index) 
--
--  Dependencies: 
--   USAGE_SERVER_PARTITION (Table)
--
CREATE UNIQUE INDEX USAGE_SERVER_PARTITION_PK ON USAGE_SERVER_PARTITION
(USP_ID)
/


--
-- USAGE_SERVER_PK  (Index) 
--
--  Dependencies: 
--   USAGE_SERVER (Table)
--
CREATE UNIQUE INDEX USAGE_SERVER_PK ON USAGE_SERVER
(USV_ID)
/


--
-- USAGE_SERVER_SS1  (Index) 
--
--  Dependencies: 
--   USAGE_SERVER (Table)
--
CREATE UNIQUE INDEX USAGE_SERVER_SS1 ON USAGE_SERVER
(DSL_ID, DSC_ID)
/


--
-- USER_DEFAULT_DETAIL_PK  (Index) 
--
--  Dependencies: 
--   USER_DEFAULT_DETAIL (Table)
--
CREATE UNIQUE INDEX USER_DEFAULT_DETAIL_PK ON USER_DEFAULT_DETAIL
(UDD_ID)
/


--
-- USER_DEFAULT_DETAIL_SS1  (Index) 
--
--  Dependencies: 
--   USER_DEFAULT_DETAIL (Table)
--
CREATE UNIQUE INDEX USER_DEFAULT_DETAIL_SS1 ON USER_DEFAULT_DETAIL
(USR_ID, PMD_ID)
/


--
-- USER_DEFAULT_SEARCH_PK  (Index) 
--
--  Dependencies: 
--   USER_DEFAULT_SEARCH (Table)
--
CREATE UNIQUE INDEX USER_DEFAULT_SEARCH_PK ON USER_DEFAULT_SEARCH
(UDS_ID)
/


--
-- USER_DEFAULT_SEARCH_SS1  (Index) 
--
--  Dependencies: 
--   USER_DEFAULT_SEARCH (Table)
--
CREATE UNIQUE INDEX USER_DEFAULT_SEARCH_SS1 ON USER_DEFAULT_SEARCH
(USR_ID, PMD_ID)
/


--
-- USER_LOGIN_PK  (Index) 
--
--  Dependencies: 
--   USER_LOGIN (Table)
--
CREATE UNIQUE INDEX USER_LOGIN_PK ON USER_LOGIN
(ULG_ID)
/


--
-- USER_NAME_VALIDATION_AK  (Index) 
--
--  Dependencies: 
--   USER_NAME_VALIDATION (Table)
--
CREATE UNIQUE INDEX USER_NAME_VALIDATION_AK ON USER_NAME_VALIDATION
(UNV_NAME)
/


--
-- USER_NAME_VALIDATION_PK  (Index) 
--
--  Dependencies: 
--   USER_NAME_VALIDATION (Table)
--
CREATE UNIQUE INDEX USER_NAME_VALIDATION_PK ON USER_NAME_VALIDATION
(UNV_ID)
/


--
-- USER_PASSWORD_PK  (Index) 
--
--  Dependencies: 
--   USER_PASSWORD (Table)
--
CREATE UNIQUE INDEX USER_PASSWORD_PK ON USER_PASSWORD
(UPW_ID)
/


--
-- USER_PASSWORD_SS1  (Index) 
--
--  Dependencies: 
--   USER_PASSWORD (Table)
--
CREATE UNIQUE INDEX USER_PASSWORD_SS1 ON USER_PASSWORD
(UPW_EFFECTED_USR_ID, UPW_DTTM)
/


--
-- USER_PASSWORD_VALIDATION_AK  (Index) 
--
--  Dependencies: 
--   USER_PASSWORD_VALIDATION (Table)
--
CREATE UNIQUE INDEX USER_PASSWORD_VALIDATION_AK ON USER_PASSWORD_VALIDATION
(UPV_NAME)
/


--
-- USER_PASSWORD_VALIDATION_PK  (Index) 
--
--  Dependencies: 
--   USER_PASSWORD_VALIDATION (Table)
--
CREATE UNIQUE INDEX USER_PASSWORD_VALIDATION_PK ON USER_PASSWORD_VALIDATION
(UPV_ID)
/


--
-- USER_ROLE_PARTITION_PK  (Index) 
--
--  Dependencies: 
--   USER_ROLE_PARTITION (Table)
--
CREATE UNIQUE INDEX USER_ROLE_PARTITION_PK ON USER_ROLE_PARTITION
(URP_ID)
/


--
-- USER_ROLE_PARTITION_SS1  (Index) 
--
--  Dependencies: 
--   USER_ROLE_PARTITION (Table)
--
CREATE UNIQUE INDEX USER_ROLE_PARTITION_SS1 ON USER_ROLE_PARTITION
(USR_ID, ROL_ID, URP_PTN_ID)
/


--
-- USER_TBL_AK  (Index) 
--
--  Dependencies: 
--   USER_TBL (Table)
--
CREATE UNIQUE INDEX USER_TBL_AK ON USER_TBL
(USR_NAME)
/


--
-- USER_TBL_PK  (Index) 
--
--  Dependencies: 
--   USER_TBL (Table)
--
CREATE UNIQUE INDEX USER_TBL_PK ON USER_TBL
(USR_ID)
/



CREATE OR REPLACE PACKAGE DB_USER
AS
  TYPE TMP_PARTITION_TBL IS TABLE OF NUMBER ;
  PROCEDURE CREATE_USER(USER_NAME IN VARCHAR2, ROLE_ID IN NUMBER, PARTITION_IDS IN TMP_PARTITION_TBL) ;
  PROCEDURE DELETE_USER(USER_NAME IN VARCHAR2) ;
  PROCEDURE UPDATE_USER_ROLE_PARTITION(USER_NAME IN VARCHAR2, ROLE_ID IN NUMBER, PARTITION_IDS IN TMP_PARTITION_TBL) ;
END DB_USER ;
/
CREATE OR REPLACE PACKAGE BODY DB_USER
AS
  PROCEDURE CREATE_USER(USER_NAME IN VARCHAR2, ROLE_ID IN NUMBER, PARTITION_IDS IN TMP_PARTITION_TBL)
  IS
    current_property_inst_group_id  number := 0 ;
    current_property_inst_id        number := 0 ;
    current_user_tbl_id             number := 0 ;
    current_user_password_id        number := 0 ;
    current_application_user_id     number := 0 ;

    var_pdg_id number := 0 ;
    var_app_id number := 0 ;
    var_startup_uai_id number := 0 ;

  BEGIN
    DBMS_OUTPUT.PUT_LINE('Selecting all the current id(s) from NEXT_OBJECT_ID ')  ;
    SELECT NOI_CURRENT_NO INTO current_property_inst_group_id FROM NEXT_OBJECT_ID WHERE NOI_OBJECT_NAME = 'PropertyInstGroup' ;
    SELECT NOI_CURRENT_NO INTO current_property_inst_id FROM NEXT_OBJECT_ID WHERE NOI_OBJECT_NAME = 'PropertyInst' ;
    SELECT NOI_CURRENT_NO INTO current_user_tbl_id      FROM NEXT_OBJECT_ID WHERE NOI_OBJECT_NAME = 'UserTbl' ;
    SELECT NOI_CURRENT_NO INTO current_user_password_id FROM NEXT_OBJECT_ID WHERE NOI_OBJECT_NAME = 'UserPassword' ;
    SELECT NOI_CURRENT_NO INTO current_application_user_id FROM NEXT_OBJECT_ID WHERE NOI_OBJECT_NAME = 'ApplicationUser' ;

    -- STEP 1:
    -- Create a property instance group for property definition group 'UserProperties'
    DBMS_OUTPUT.PUT_LINE('STEP 1: Create a property instance group for property definition group ''UserProperties''')  ;
    SELECT PDG_ID INTO var_pdg_id FROM PROPERTY_DFN_GROUP WHERE PDG_KEY = 'UserProperties' ;
    INSERT INTO PROPERTY_INST_GROUP(pig_id, pdg_id, pig_name, pig_delete_fl, pig_version_id, ptn_id)
      VALUES(current_property_inst_group_id+1, var_pdg_id, 'User Properties','N', 2, 1) ;

    UPDATE NEXT_OBJECT_ID SET NOI_CURRENT_NO = current_property_inst_group_id+1 WHERE NOI_OBJECT_NAME = 'PropertyInstGroup' ;

    -- STEP 2:
    -- For each property definition (property_dfn) in the property_dfn_group(pdg_key='UserProperties')
    -- entries need to be made in property_inst table.
    -- - The property_dfn and property_dfn_group can be joined using
    --   property_dfn.pdg_id = property_dfn_group.pdg_id and pdg_key = 'UserProperties'
    DBMS_OUTPUT.PUT_LINE('STEP 2: For each property definition (property_dfn) in the property_dfn_group(pdg_key= ''UserProperties'' entries need to be made in property_inst table.')  ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+1, current_property_inst_group_id+1, 97, 'Y' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+2, current_property_inst_group_id+1, 98, '5' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+3, current_property_inst_group_id+1, 99, 'Y' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+4, current_property_inst_group_id+1, 100, 'en-GB' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+5, current_property_inst_group_id+1, 101, '1' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+6, current_property_inst_group_id+1, 102, NULL ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+7, current_property_inst_group_id+1, 103, NULL ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+8, current_property_inst_group_id+1, 104, 'Y' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+9, current_property_inst_group_id+1, 105, '10' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+10, current_property_inst_group_id+1, 106, 'Y' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+11, current_property_inst_group_id+1, 107, 'Y' ,'N', 1, 1) ;
    INSERT INTO PROPERTY_INST (pri_id, pig_id, prd_id, pri_value, pri_delete_fl, pri_version_id, ptn_id)
      VALUES (current_property_inst_id+12, current_property_inst_group_id+1, 108, NULL ,'N', 1, 1) ;

    UPDATE NEXT_OBJECT_ID SET NOI_CURRENT_NO = current_property_inst_id+12 WHERE NOI_OBJECT_NAME = 'PropertyInst' ;

    -- STEP 3:
    -- Create the new user entry in 'user_tbl' table
    -- Password default to 'welcome', later change the password using the CHANGE_PASSWORD procedure.
    DBMS_OUTPUT.PUT_LINE('STEP 3: Create the new user entry in ''user_tbl'' table')  ;
    INSERT INTO USER_TBL( USR_ID, PIG_ID, USR_NAME, USR_PASSWORD, USR_FORENAME, USR_SURNAME, USR_EMAIL_ADDRESS,
                          USR_DISABLED_FL, USR_DELETE_FL, USR_VERSION_ID, PTN_ID)
      VALUES(current_user_tbl_id+1, current_property_inst_group_id+1, USER_NAME, '4F2F5B246A89D8EBD7FAA76D32CE63E5',
      USER_NAME, USER_NAME, USER_NAME||'@subex.com','N', 'N', 1, 1) ;
    UPDATE NEXT_OBJECT_ID SET NOI_CURRENT_NO = current_user_tbl_id+1 WHERE NOI_OBJECT_NAME = 'UserTbl' ;

    -- STEP 4:
    -- Create entry in 'user_password' table
    DBMS_OUTPUT.PUT_LINE('STEP 4: Create the new user entry in ''user_password'' table')  ;
    INSERT INTO USER_PASSWORD(UPW_ID, UPW_CHANGING_USR_ID, UPW_EFFECTED_USR_ID, UPW_DTTM, UPW_PASSWORD,
                              UPW_RESET_FL, UPW_DELETE_FL, UPW_VERSION_ID, PTN_ID)
      VALUES(current_user_password_id+1, 1, current_user_tbl_id+1, sysdate, '4F2F5B246A89D8EBD7FAA76D32CE63E5', 'N', 'N' , 1, 1) ;

    UPDATE NEXT_OBJECT_ID SET NOI_CURRENT_NO = current_user_password_id+1 WHERE NOI_OBJECT_NAME = 'UserPassword' ;

    -- STEP 5:
    -- Create an entry in 'application_user' table.  For creating the entry,
    --  app_id is the foreign key with 'application_tbl' table. Select the entry with app_name as 'Spark Client'
    DBMS_OUTPUT.PUT_LINE('STEP 5: Create the new user entry in ''application_user'' table')  ;
    SELECT APP_ID INTO var_app_id FROM APPLICATION_TBL WHERE APP_NAME = 'Spark Client' ;
    SELECT UAI_ID INTO var_startup_uai_id FROM UI_ACTION_ITEM T WHERE UAI_CODE = 'DashboardsMainPage' ;

    INSERT INTO APPLICATION_USER( APU_ID, APP_ID, USR_ID, APU_STARTUP_UAI_ID, APU_STARTUP_HELPER, APU_ACCESS_FL,
                                  APU_DELETE_FL, APU_VERSION_ID, PTN_ID)
      VALUES(current_application_user_id+1, var_app_id, current_user_tbl_id+1, var_startup_uai_id, NULL, 'Y', 'N', 1, 1) ;

    UPDATE NEXT_OBJECT_ID SET NOI_CURRENT_NO = current_application_user_id+1 WHERE NOI_OBJECT_NAME = 'ApplicationUser' ;

    -- STEP 6:
    -- Assign Roles and Partitions
    DBMS_OUTPUT.PUT_LINE('STEP 6: Assign Roles and Partitions.')  ;
    IF ROLE_ID > 0
    THEN
      UPDATE_USER_ROLE_PARTITION (USER_NAME, ROLE_ID, PARTITION_IDS) ;
    END IF ;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('STEP 7: Successfully Created the user.')  ;

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK ;
      DBMS_OUTPUT.PUT_LINE('ERROR: Failed to Create user.')  ;
      DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
  END CREATE_USER ;

  PROCEDURE UPDATE_USER_ROLE_PARTITION(USER_NAME IN VARCHAR2, ROLE_ID IN NUMBER, PARTITION_IDS IN TMP_PARTITION_TBL)
  IS
    current_user_role_partition_id  number := 0 ;
    user_id number := 0 ;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Changing Roles and Partitions')  ;
    -- Create an entry in user_role_partition, set the appropriate usr_id (the newly created user),
    --  role_id(the role that you want to map, the table is role_tbl) and
    --  urp_ptn_id(the partition id that you want the user to have access to)
    -- Note: If you want the user to have access to multiple partitions, create multiple entries in this table.
    -- PREREQUISITE: 1. ROLES have been created before creating the users throught GUI.
    -- PREREQUISITE: 2. PARTITIONS have been ADDED from backend. (Business, IT, Executive)

    SELECT NOI_CURRENT_NO INTO current_user_role_partition_id FROM NEXT_OBJECT_ID WHERE NOI_OBJECT_NAME = 'UserRolePartition' ;
    SELECT USR_ID into user_id FROM USER_TBL WHERE USR_NAME = USER_NAME ;

    -- Delete all the existing roles and partition
    DELETE FROM USER_ROLE_PARTITION WHERE USR_ID = (SELECT USR_ID FROM USER_TBL WHERE USR_NAME = USER_NAME) ;

    -- Insert the new roles and partition
    FOR i IN PARTITION_IDS.first..PARTITION_IDS.last
    LOOP
      INSERT INTO USER_ROLE_PARTITION(urp_id, usr_id, rol_id, urp_ptn_id, urp_delete_fl, urp_version_id, ptn_id)
        VALUES(current_user_role_partition_id + 1, user_id, ROLE_ID, PARTITION_IDS(i), 'N', 1, 1) ;

    current_user_role_partition_id := current_user_role_partition_id + 1 ;
    END LOOP ;
    UPDATE NEXT_OBJECT_ID SET NOI_CURRENT_NO = current_user_role_partition_id  WHERE NOI_OBJECT_NAME = 'UserRolePartition' ;

    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
      ROLLBACK;
      RAISE ;
  END UPDATE_USER_ROLE_PARTITION ;

  PROCEDURE DELETE_USER(USER_NAME IN VARCHAR2)
  IS
    user_id number := 0 ;
    property_inst_group_id number := 0 ;
  BEGIN
    SELECT USR_ID,PIG_ID into user_id, property_inst_group_id FROM USER_TBL WHERE USR_NAME = USER_NAME ;

    DELETE FROM USER_ROLE_PARTITION WHERE USR_ID = user_id ;
    DELETE FROM APPLICATION_USER WHERE USR_ID = user_id ;
    DELETE FROM USER_PASSWORD WHERE UPW_EFFECTED_USR_ID = user_id ;
    DELETE FROM USER_TBL WHERE USR_ID = user_id ;
    DELETE FROM PROPERTY_INST WHERE PIG_ID = property_inst_group_id ;
    DELETE FROM PROPERTY_INST_GROUP WHERE PIG_ID = property_inst_group_id ;

    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
      ROLLBACK;
  END DELETE_USER ;
END DB_USER ;
-- exec dashboard.DB_USER.CREATE_USER ('cadmin', 3, DASHBOARD.DB_USER.TMP_PARTITION_TBL(2, 4)) ;
-- exec dashboard.DB_USER.DELETE_USER ('cadmin') ;
/


