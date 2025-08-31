DECLARE
Rule_id RULES.ID%TYPE ;
BEGIN
    FOR I IN (select id from rules where name in ('Call Collision','Geographically Infeasible - CDR','Geographically Infeasible - GPRS') )
    LOOP
        Rule_id := I.id ;
        INSERT INTO RULES_SUBSCRIBER_GROUPS(RULE_ID ,SUBSCRIBER_GROUP_ID) SELECT Rule_id, ID FROM SUBSCRIBER_GROUPS WHERE DESCRIPTION IN ('Prepaid','Default','Subscriberless') AND RECORD_CONFIG_ID = 3 ;
    END LOOP ;
END ;
/
