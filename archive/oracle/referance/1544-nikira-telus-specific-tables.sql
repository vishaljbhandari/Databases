
-- ********************************************************************************
-- *  Copyright(c) Subexazure Limited 2006. All Rights Reserved.               *
-- *  The copyright to the Computer Program(s) herein is the property of Subex    *
-- *  systems limited. the program(s) may be used and/or copied with the written  *
-- *  permission from subex systems limited or in accordance with the terms and   *
-- *  conditions stipulated in the agreement/contract under which the program(s)  *
-- *  have been supplied.                                                         *
-- ********************************************************************************
spool nkira-telus-specific-tables.log

SET FEEDBACK OFF
drop table telus_pointcodes ;
drop table telus_local_call_lookup ;
drop table unf_conversion ;
drop table telus_special_number ;
drop table telus_ocn_npa ;
drop table telus_ngn ;
drop table telus_npa ;

CREATE TABLE TELUS_POINTCODES (
	ITU_POINTCODES  VARCHAR2(40)  NOT NULL,
	ANSI_POINTCODES VARCHAR2(40)  NOT NULL,
	OWNER_NAME	    VARCHAR2(100) NOT NULL) ;

CREATE TABLE TELUS_LOCAL_CALL_LOOKUP (
	CALLING_NPA  VARCHAR2(40)  NOT NULL,
	CALLED_NPA   VARCHAR2(40)  NOT NULL,
	PROVINCE     VARCHAR2(40)  NOT NULL,
	LOCAL_CALL   VARCHAR2(10)  NOT NULL) ;

CREATE TABLE UNF_CONVERSION (
	UNF_ID			 NUMBER(10), 
	PREFIX_STRING	 VARCHAR2(20),
	REPLACE_STRING	 VARCHAR2(20),
	CONSTRAINT PK_UNF_ID PRIMARY KEY(UNF_ID)) ;

CREATE TABLE TELUS_SPECIAL_NUMBER (
	ID 				NUMBER(20),
	SPECIAL_NUMBER 	VARCHAR2(40),  
	UNF_NUMBER 		VARCHAR2(40), 
	CONSTRAINT PK_SPECIAL_NUM_ID PRIMARY KEY(ID)) ; 

CREATE TABLE TELUS_OCN_NPA(
	OCN			VARCHAR2(10),
	PROVINCE    VARCHAR2(10),
	NPA			VARCHAR2(10),
	COMPANY		VARCHAR2(100) ) ;

CREATE TABLE TELUS_NGN (
	TOLL_FREE_NUMBER	 VARCHAR2(40),
	PULSE_RATE			 NUMBER(20,2),
	DESCRIPTION			 VARCHAR2(40)) ;

CREATE TABLE TELUS_NPA(
	ID			NUMBER(20),
	NPA			VARCHAR2(10),
	CONSTRAINT UK_NPA UNIQUE (NPA)) ;

commit;
spool off ;

quit ;

