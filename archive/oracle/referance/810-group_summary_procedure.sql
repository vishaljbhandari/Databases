--/*******************************************************************************
-- *	Copyright (c) Subex Systems Limited 2005. All rights reserved.	            *
-- *	The copyright to the computer program(s) herein is the property of Subex    *
-- *	Systems Limited. The program(s) may be used and/or copied with the written  *
-- *	permission from Subex Systems Limited or in accordance with the terms and   *
-- *	conditions stipulated in the agreement/contract under which the program(s)  *
-- *	have been supplied.                                                         *
-- *******************************************************************************/
SPOOL group_summary_procedure.log
set serveroutput off ;
SET FEEDBACK OFF 
 
CREATE OR REPLACE PACKAGE GroupSummary
AS

    TYPE network_array IS TABLE OF NUMBER(20) INDEX BY VARCHAR2(256) ;
       
       
					
	networks_groups 			network_array ;
	groups						varchar2(256) ;
	network_id					varchar2(256) ;
	record_config_id			varchar2(256) ;
	
	SUB_REC_CONF_ID			varchar2(3) := '3' ;
	ACC_REC_CONF_ID			varchar2(3) := '4' ;

	PROCEDURE GetSummary ;
	PROCEDURE InitializeNetWorksGroups ;
	PROCEDURE AddToNetWorksGroups (network_id VARCHAR2, record_conf_id VARCHAR2, groups VARCHAR2) ;
	PROCEDURE PopulateSubscriberSummary ;
	PROCEDURE PopulateAccountSummary ;
	PROCEDURE PopulateSummary ;
	FUNCTION GetGroupName (input_groups VARCHAR2, last_token_read_pos IN OUT NUMBER) RETURN VARCHAR2 ;
	type networkidssub_array is table of subscriber.network_id%type index by binary_integer;
	type groupsub_array is table of subscriber.groups%type index by binary_integer;
	type networkidsacc_array is table of account.network_id%type index by binary_integer;
	type groupacc_array is table of account.groups%type index by binary_integer;
	NetworkSubIDs networkidssub_array ;
	GroupSubIDs groupsub_array;
	NetworkAccIDs networkidsacc_array ;
	GroupAccIDs groupacc_array;
	
END GroupSummary ;
/

CREATE OR REPLACE PACKAGE BODY GroupSummary 
AS
	FUNCTION GetGroupName (input_groups VARCHAR2, last_token_read_pos IN OUT NUMBER) RETURN VARCHAR2 
	IS
		next_comm_pos	NUMBER := 0 ;
		current_group	VARCHAR2(256) := '' ;
	BEGIN
		next_comm_pos := instr(input_groups, ',', last_token_read_pos + 1) ;
		IF (next_comm_pos = 0 )
		THEN 
			current_group := substr (input_groups, last_token_read_pos+1) ;
			last_token_read_pos := next_comm_pos ;
		ELSE
			current_group := substr (input_groups, last_token_read_pos+1, next_comm_pos - last_token_read_pos - 1) ;
			last_token_read_pos := next_comm_pos ;
		end iF ;
		RETURN current_group ;	
	END GetGroupName ;
	
	PROCEDURE InitializeNetWorksGroups
	IS
	BEGIN
		FOR rec IN (SELECT G.key AS key, TO_CHAR(N.id) AS network_id, TO_CHAR(G.record_config_id) AS rec_conf_id FROM subscriber_groups G, networks N )
		LOOP
			networks_groups(rec.network_id||':'||rec.rec_conf_id||':'||rec.key) := 0 ;			
		END LOOP ;
	END InitializeNetWorksGroups ;
	
	PROCEDURE AddToNetWorksGroups (network_id VARCHAR2, record_conf_id VARCHAR2, groups VARCHAR2) 
	IS
		group_name        VARCHAR2(256) ;
		current_read_pos  NUMBER(20) ;
	BEGIN
		IF (INSTR (groups, ',') > 0 ) 
		THEN
			current_read_pos := 0 ;
			LOOP
				group_name := GetGroupName(groups, current_read_pos) ;
				IF (group_name IS NOT NULL)
				THEN
					BEGIN
						networks_groups(network_id||':'||record_conf_id||':'||group_name) := networks_groups(network_id||':'||record_conf_id||':'||group_name) + 1 ;
					EXCEPTION
						WHEN no_data_found THEN
						NULL ;
					END ;
				END IF ;
				EXIT WHEN group_name IS NULL OR current_read_pos = 0 ;
			END LOOP ;
		ELSE
			BEGIN
				networks_groups(network_id||':'||record_conf_id||':'||groups) := networks_groups(network_id||':'||record_conf_id||':'||groups) + 1 ;
			EXCEPTION
				WHEN no_data_found THEN
				NULL ;
			END ;
		END IF ;
	END AddToNetWorksGroups ;

	PROCEDURE GetSummary
	IS
	BEGIN
		EXECUTE IMMEDIATE 'TRUNCATE TABLE subscriber_groups_summary ' ;

		FOR rec IN (SELECT G.key AS key, TO_CHAR(N.id) AS network_id, TO_CHAR(G.record_config_id) AS rec_conf_id FROM subscriber_groups G, networks N,
				networks_subscriber_groups NG WHERE NG.network_id = N.id AND NG.subscriber_group_id = G.id )
		LOOP
			INSERT INTO subscriber_groups_summary (network_id, record_config_id, group_name, group_count)
						VALUES (rec.network_id, rec.rec_conf_id, rec.key, networks_groups(to_char(rec.network_id)||':'||rec.rec_conf_id||':'||rec.key) ) ;
		END LOOP ;
	END GetSummary ;
	
	PROCEDURE PopulateAccountSummary 
	IS
        CURSOR cursor_account IS select groups, network_id FROM account WHERE id >1024 AND account_type !=2 AND groups IS NOT NULL;
	BEGIN
        OPEN cursor_account ;
        LOOP
            FETCH cursor_account BULK COLLECT INTO GroupAccIDs,NetworkAccIDs  LIMIT 200 ;
            FOR i IN 1 .. GroupAccIDs.count
            LOOP
                AddToNetWorksGroups(TO_CHAR(NetworkAccIDs(i)),TO_CHAR(ACC_REC_CONF_ID), TO_CHAR(GroupAccIDs(i))) ;
            END LOOP ;
            EXIT WHEN cursor_account%NOTFOUND ;
        END LOOP ;
	END PopulateAccountSummary ;

	PROCEDURE PopulateSubscriberSummary 
	IS
        CURSOR cursor_subscriber IS SELECT groups, network_id FROM subscriber WHERE id >1024 AND subscriber_type !=2 AND groups IS NOT NULL;
	BEGIN
        OPEN cursor_subscriber ;
        LOOP
            FETCH cursor_subscriber BULK COLLECT INTO  GroupSubIDs,NetworkSubIDs LIMIT 200 ; 
            FOR i IN 1 .. GroupSubIDs.count
            LOOP
                AddToNetWorksGroups(TO_CHAR(NetworkSubIDs(i)),TO_CHAR(SUB_REC_CONF_ID),TO_CHAR(GroupSubIDs(i))) ;
            END LOOP ;
            EXIT WHEN cursor_subscriber%NOTFOUND ;
        END LOOP ;
	END PopulateSubscriberSummary ;
	
	PROCEDURE PopulateSummary 
	IS
	BEGIN
		InitializeNetWorksGroups ;
		PopulateAccountSummary ;
		PopulateSubscriberSummary ;
		GetSummary ;
	END PopulateSummary ;
	
END GroupSummary;
/
commit ;
