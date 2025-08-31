--/*******************************************************************************
-- * Copyright (c) Subex Systems Limited 2005. All rights reserved.	             *
-- * The copyright to the computer program(s) herein is the property of Subex    *
-- * Systems Limited. The program(s) may be used and/or copied with the written  *
-- * permission from Subex Systems Limited or in accordance with the terms and   *
-- * conditions stipulated in the agreement/contract under which the program(s)  *
-- * have been supplied.                                                         *
-- *******************************************************************************/
SPOOL subscriber_cleanup.log 
set serveroutput off ;
SET FEEDBACK OFF ; 

CREATE OR REPLACE PACKAGE SubscriberCleanup
AS
	
	FRAUD_SUBSCRIBER number(3) := 1 ;
	NON_FRAUD_SUBSCRIBER number(3) := 0 ;
	FP_SUBSCRIBER_ENTITY number(2) := 16 ;
	DISCONNECTED_SUBSCRIBER number(2) := 3 ;
	
	TYPE STRING_ARRAY IS TABLE OF varchar2(50) INDEX BY BINARY_INTEGER ;
	in_memory_tables STRING_ARRAY ;
	
	PROCEDURE GetInMemoryTables ; 
	PROCEDURE CleanupSubscriber(sub_id IN NUMBER, sub_phone_number IN VARCHAR2, sub_type in NUMBER) ; 
	PROCEDURE CleanupAccount(acc_id in NUMBER) ;
	PROCEDURE DisconnectedSubscribers(network_ids IN VARCHAR2) ; 
	
END SubscriberCleanup ;
/

CREATE OR REPLACE PACKAGE BODY SubscriberCleanup 
AS

	PROCEDURE GetInMemoryTables
	IS
	BEGIN
		FOR tables IN (SELECT rownum AS key, disconnect_table_name AS value FROM in_memory_counter_details ) 
		LOOP
			in_memory_tables(tables.key) := tables.value ;
		END LOOP ;
	EXCEPTION
			WHEN no_data_found THEN
				dbms_output.put_line('Error while executing SubscriberCleanup :: GetInMemoryTables');
	END GetInMemoryTables ;
	
	PROCEDURE CleanupSubscriber(sub_id IN NUMBER, sub_phone_number IN VARCHAR2, sub_type in NUMBER)
	IS
	BEGIN
		DELETE FROM subscriber_neural_profile WHERE subscriber_id = sub_id ;
		DELETE FROM blacklist_neural_profile WHERE phone_number = sub_phone_number ;
		DELETE FROM gprs_life_style_profiles WHERE subscriber_id = sub_id ;
		DELETE FROM usage_profiles WHERE subscriber_id = sub_id ;
		DELETE FROM fp_profiles WHERE entity_id = FP_SUBSCRIBER_ENTITY AND profiled_entity_id = sub_id AND version = 0 ;
		DELETE FROM thresholds t  WHERE t.reference_id = sub_id and  1=(select reference_type from reference_types_maps where aggregation_type=t.aggregation_type);
		DELETE FROM subscriber_profile_dates WHERE subscriber_id = sub_id AND subscriber_type = sub_type ;
		DELETE FROM subscriber WHERE id = sub_id AND status = DISCONNECTED_SUBSCRIBER ;
		FOR j IN 1 .. in_memory_tables.count
		LOOP
			EXECUTE IMMEDIATE ' INSERT INTO ' || in_memory_tables(j) || ' VALUES (' || sub_id || ')' ;
		END LOOP ;
	EXCEPTION
			WHEN no_data_found THEN
				dbms_output.put_line('Error while executing SubscriberCleanup :: CleanupSubscriber');
	END CleanupSubscriber ;
	
	PROCEDURE CleanupAccount(acc_id in NUMBER)
	IS
		no_of_subscribers NUMBER(10) := 0 ;
	BEGIN
		SELECT COUNT(*) INTO no_of_subscribers FROM subscriber WHERE account_id = acc_id AND subscriber_type in (NON_FRAUD_SUBSCRIBER, FRAUD_SUBSCRIBER) ;
		IF (no_of_subscribers) = 0 THEN
			DELETE FROM account_credit_detail WHERE account_id = acc_id ;
			DELETE FROM account_recharge_detail WHERE account_id = acc_id ;
			DELETE FROM account WHERE id = acc_id ;
		END IF ;
	EXCEPTION
			WHEN no_data_found THEN
				dbms_output.put_line('Error while executing SubscriberCleanup :: CleanupAccount');
	END CleanupAccount ;

	PROCEDURE DisconnectedSubscribers(network_ids IN VARCHAR2)
	IS
		no_of_days number(10) := 0 ;
		current_account_id number := 0 ;
		CURSOR subscriber_cursor (network_ids IN VARCHAR2, no_of_days number) 
		IS
		SELECT account_id, id AS subscriber_id , status, phone_number, subscriber_type 
			FROM subscriber
			WHERE (sysdate - modified_date) > no_of_days 
			AND INSTR(network_ids, network_id) > 0 
			AND subscriber_type = NON_FRAUD_SUBSCRIBER
			AND status = DISCONNECTED_SUBSCRIBER 
			ORDER BY account_id ;
		subscriber_rec subscriber_cursor%ROWTYPE ;
	BEGIN
		SELECT TO_NUMBER(value) INTO no_of_days FROM configurations WHERE config_key = 'Disconnected Subscriber Cleanup Interval in Days';
		GetInMemoryTables ;
		OPEN subscriber_cursor(network_ids, no_of_days);
		LOOP
			FETCH subscriber_cursor INTO subscriber_rec;
			EXIT WHEN subscriber_cursor%NOTFOUND;
			CleanupSubscriber(subscriber_rec.subscriber_id, subscriber_rec.phone_number, subscriber_rec.subscriber_type) ;
			IF current_account_id <> subscriber_rec.account_id THEN
				IF current_account_id <> 0 THEN
					CleanupAccount(current_account_id) ;
					COMMIT ;
				END IF ;	
				current_account_id := subscriber_rec.account_id ;
			END IF ;
		END LOOP ;
		CLOSE subscriber_cursor;	
		CleanupAccount(current_account_id) ;
		COMMIT ;
	EXCEPTION
			WHEN no_data_found THEN
				dbms_output.put_line('Error while executing SubscriberCleanup :: DisconnectedSubscribers');
	END DisconnectedSubscribers ;
	
	
END SubscriberCleanup ;
/

COMMIT ;




