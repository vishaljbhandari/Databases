-- Things you should know before you modify this file:
-- Every table creation script, must be preceeded with that table's deletion script
-- Deletion of foreign key tables of a table must preceed the table deletion
-- Insert a one line comment for each table explaining its purpose
-- Scripts for deletion and creation of sequences used by a table must preceed table creation
-- Use all names consistent with coding conventions and conventions of this script

SET FEEDBACK ON
SPOOL ranger-db-DSCommon.log




DROP TABLE DS_ASCII_INPUT_CONFIGURATION ;
DROP TABLE VOUCHER_VALIDITY_DETAIL ;
DROP TABLE GSM_PREFIX ;

CREATE TABLE DS_ASCII_INPUT_CONFIGURATION
(
    POSITION        NUMBER(10),
    FIELD_SIZE      NUMBER(10),
    SEQUENCE        NUMBER(10),
    DS_TYPE         NUMBER(10)
) ;

CREATE TABLE VOUCHER_VALIDITY_DETAIL 
(
    VOUCHER_VALUE               NUMBER (16,6),
    VALIDITY_PERIOD             NUMBER (10) NOT NULL,
    GRACE_PERIOD                NUMBER (10),
    MSISDN_VALIDITY_PERIOD      NUMBER (10),
    CONSTRAINT PK_RE_VA_DET PRIMARY KEY (VOUCHER_VALUE)
) ;

CREATE TABLE GSM_PREFIX (
    PREFIX  VARCHAR(20) NOT NULL
);

COMMIT ;
SPOOL OFF ;

QUIT ;

