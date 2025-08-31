SPOOL nikira-DDL-db-demo-account-ACC_CRE_DET.log
SET FEEDBACK OFF ;
set serveroutput off ;




CREATE TABLE ACCOUNT_CREDIT_DETAIL
(
        ACCOUNT_ID                                              NUMBER(20,0) NOT NULL,
        ACCOUNT_NAME                                    VARCHAR2(40),
        STATIC_CREDIT_LIMIT                             NUMBER(16,6) DEFAULT 0.0,
        DYNAMIC_CREDIT_LIMIT                    NUMBER(16,6) DEFAULT 0.0,
    TOTAL_SLIPPAGE                                      NUMBER(20,0) DEFAULT 0,
    OUTSTANDING_AMOUNT                          NUMBER(16,6) DEFAULT 0.0,
    TOTAL_PAYMENT                                       NUMBER(16,6) DEFAULT 0.0,
    UNBILLED_AMOUNT                                     NUMBER(16,6) DEFAULT 0.0,
        LAST_DUE_DATE                                   DATE         DEFAULT SYSDATE,
        LAST_PAY_DATE                                   DATE         DEFAULT SYSDATE,
        LAST_PAID_AMOUNT                                NUMBER(16,6) DEFAULT 0.0,
        NO_OF_SUSPENSIONS                               NUMBER(20,0) DEFAULT 0,
    NO_OF_FULL_PAYMENTS                         NUMBER(20,0) DEFAULT 0,
    NO_OF_PART_PAYMENTS                         NUMBER(20,0) DEFAULT 0,
        NO_OF_SLIPPAGES                                 NUMBER(20) DEFAULT 0,
        BILL_CYCLE_DAY                                  NUMBER(20)       DEFAULT 1,
        EXPOSURE                                                NUMBER(16,6) DEFAULT 0.0,
        PERCENTAGE_EXPOSURE                             NUMBER(16,6) DEFAULT 0.0,
        CREDIT_EXPIRY_DATE                              DATE,
        CONSTRAINT PK_ACC_CREDIT_DET_ACC_ID PRIMARY KEY (ACCOUNT_ID)
) ;

CREATE INDEX IX_ACC_CRE_DET_ACCOUNT_NAME ON ACCOUNT_CREDIT_DETAIL("ACCOUNT_NAME");

commit;
spool off

