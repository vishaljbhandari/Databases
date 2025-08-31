SPOOL populateAlarmlinkForFCN.log   
 
set serveroutput off 
SET FEEDBACK OFF 
CREATE OR REPLACE PROCEDURE generatealarmlinkfcn AS

CURSOR alarmcursor IS 
	SELECT id,reference_value
	FROM alarms 
	WHERE  
	( 	modified_date >= to_date( (SELECT value FROM configurations WHERE config_key='ALARMLINK.FCN.LASTPOPULATEDTIME') , 
													'dd/mm/yyyy hh24:mi:ss')
		AND  reference_type=1 
		AND status not in (4, 8) 
	) 
	OR (
		reference_id in (select SUBSCRIBER_ID from SUBSCRIBER_PROFILE_DATES where DATE_OF_GENERATE > to_date(
			(SELECT value FROM configurations WHERE config_key='ALARMLINK.FCN.LASTPOPULATEDTIME') , 'dd/mm/yyyy hh24:mi:ss'))
		AND reference_type=1
		AND status not in (4, 8)
		AND modified_date >= to_date( (SELECT value FROM configurations WHERE config_key='ALARMLINK.FCN.LASTPOPULATEDTIME') , 
														'dd/mm/yyyy hh24:mi:ss')
	)  ;

alarmcur alarmcursor%ROWTYPE ;
	
BEGIN

-- date_of_generate >= to_date( (select value from configurations where config_key='ALARMLINK.FCN.LASTPOPULATEDTIME') , 'dd/m
--m/yyyy hh24:mi:ss')   ???? where       

	FOR alarmcur IN alarmcursor
	LOOP

	delete from alarm_link_fcn_temp ;
	insert into alarm_link_fcn_temp
	( select phone_number , destination , sum(cdr_count)
        from frequently_called_destinations
            where phone_number = alarmcur.reference_value
            and  subscriber_type <> 2
            and destination_type in (1,2)
            group by phone_number,destination
    ) ;

    delete from alarm_link_cdr_details
        where alarm_id = alarmcur.id
        and value in
                ( select destination from alarm_link_fcn_temp
                    where alarm_link_fcn_temp.phone_number=alarmcur.reference_value )
        and value_type=4 ;


    insert into alarm_link_cdr_details
        (   select alarmcur.id alarm_id , fcn.destination value , fcn.cdr_count value_count , 4 value_type, sysdate, 1
            from alarm_link_fcn_temp fcn 
        ) ;



	END LOOP ;

	update configurations set value = to_char(sysdate-1,'dd/mm/yyyy hh24:mi:ss')  where config_key = 'ALARMLINK.FCN.LASTPOPULATEDTIME' ;

END ;
/
commit ;
