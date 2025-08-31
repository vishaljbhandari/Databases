
SPOOL nikira-DDL-db-demo-account-ACC_REC_DET.log
SET FEEDBACK OFF ;
set serveroutput off ;

CREATE TABLE ACCOUNT_RECHARGE_DETAIL
(
        ACCOUNT_ID                                      NUMBER(20,0) NOT NULL,
        ACCOUNT_NAME                            VARCHAR2(40),
        VOUCHER_EXPIRY_DATE             DATE,
        GRACE_PERIOD_EXPIRY_DATE        DATE,
        CURRENT_BALANCE                         NUMBER(16,6) NOT NULL,
        PREVIOUS_BALANCE                        NUMBER(16,6),
        LAST_RECHARGE_DATE                      DATE,
        LAST_CDR_TIME                           DATE,
        DIFF_BALANCE_PERCENTAGE         NUMBER(16,6) DEFAULT 0 NOT NULL,
        CONSTRAINT PK_ACC_RECH_DET_ACC_ID PRIMARY KEY (ACCOUNT_ID)
) ;
CREATE INDEX IX_ACC_REC_DET_ACCOUNT_NAME ON ACCOUNT_RECHARGE_DETAIL("ACCOUNT_NAME");

commit;
spool off

