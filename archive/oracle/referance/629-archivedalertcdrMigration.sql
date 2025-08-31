set serveroutput on ;

declare

 XDR_Time		date ;
 Query			varchar2(4000) ;
 InsertQuery	varchar2(4000) ;
 TableName		varchar2(50) ;
 FieldAssociation		varchar2(50) ;
 InsertTableName		varchar2(50) ;
 XDay			number ;
 YDay			number ;
 GotData		boolean ;
 CommitCount	number ;
 QueryWithoutAggValue		boolean ;

cursor cur is select ac.cdr_id, a.aggregation_value, a.aggregation_type, a.start_day,a.end_day, ac.RECORD_CATEGORY, a.id
			from archived_alerts a, archived_alert_cdr ac where a.ID=ac.alert_id  and ac.RECORD_CATEGORY not in (select RECORD_CONFIG_ID from NO_DENORMALIZATION_TYPES ) order by start_day, RECORD_CATEGORY ;

type XDRID is table of alert_cdr.cdr_id%type index by binary_integer ;
type Agv is table of alerts.aggregation_value%type index by binary_integer ;
type AgTyp is table of alerts.aggregation_type%type index by binary_integer ;
type StartDay is table of alerts.start_day%type index by binary_integer ;
type EndDay   is table of alerts.end_day%type index by binary_integer ;
type RecordCat is table of alert_cdr.record_category%type index by binary_integer ;
type AlertID   is table of alerts.id%type index by binary_integer ;


XDRIDs				XDRID ;
AgValues			Agv ;
AgTypes				AgTyp ;
StartDays			StartDay ;
EndDays				EndDay ;
RecordCatagories 	RecordCat ;
AlertIDs			AlertID ;

begin
		dbms_output.enable(100000000) ;
		CommitCount:=0 ;
		
		open cur ;
		loop
			fetch cur bulk collect into XDRIDs, AgValues,AgTypes,StartDays,EndDays,RecordCatagories,AlertIDs  limit 500  ;

			for i in 1 .. XDRIDs.count 
			loop
					<<StartLoop>>
					GotData:=true ;

					select tname into TableName from record_configs where id = RecordCatagories(i) ;
					begin
						select LOOKUP_TABLE_NAME into InsertTableName from archive_maps where record_config_id = RecordCatagories(i);
						EXCEPTION
						WHEN OTHERS THEN 
						GOTO StartLoop ;
					end ;

					if (TableName = 'CRM_LOG')
					then
						Query:='select transaction_time_stamp from '||TableName||' where day_of_year ' ;
					else
						Query:='select time_stamp from '||TableName||' where day_of_year ' ;
					end if ;
					InsertQuery:='insert into ' ||InsertTableName||' select xdr.*, :AlertID from '||TableName||' xdr where xdr.day_of_year ';


					if ( StartDays(i) > EndDays(i) )
					then
						Query:= Query||'  not between :X and :Y ' ;
						InsertQuery:=InsertQuery||' not between :X and :Y ' ;
						XDay:=EndDays(i)+1 ;
						YDay:=StartDays(i)-1 ;
							
					else
						Query:= Query||' between :X and :Y ' ;
						InsertQuery:=InsertQuery||' between :X and :Y ' ;
						XDay:=StartDays(i) ;
						YDay:=EndDays(i) ;
					end if ;

					begin
						FieldAssociation := utility.GET_FIELD_ASSOCIATION(AgTypes(i),RecordCatagories(i)) ;
						exception
					when others then
						dbms_output.put_line('Error : ' || SQLERRM) ;
						dbms_output.put_line('Error : Unable to get the field association for : ') ;
						dbms_output.put_line('AgTypes : ' || AgTypes(i) || 'RecordCatagories : ' || RecordCatagories(i));
					end ;
					
					if ( instr(FieldAssociation,'.') > 0 ) 
					then
					QueryWithoutAggValue := true ;
					Query:= Query||' and ID=:xdrID' ;
					InsertQuery:=InsertQuery||' and ID=:xdrID' ;
					else
					QueryWithoutAggValue := false ;
					Query:= Query||' and '|| utility.GET_FIELD(AgTypes(i),RecordCatagories(i))||'=:AgValue and ID=:xdrID' ;
					InsertQuery:=InsertQuery||' and '|| utility.GET_FIELD(AgTypes(i),RecordCatagories(i))||'=:AgValue and ID=:xdrID' ;
					end if ;
					begin
						if ( QueryWithoutAggValue = true )
						then
							execute immediate Query into XDR_Time  using XDay, YDay,  XDRIDs(i) ;
						else
							execute immediate Query into XDR_Time  using XDay, YDay, AgValues(i), XDRIDs(i) ;

						end if ;
						exception 
								when NO_DATA_FOUND then
								begin
									dbms_output.put_line('Failed to fetch XDR for aggregation type='||AgTypes(i)||',value='||AgValues(i)||', xdr id='||XDRIDs(i)) ;
									GotData:=false ;
								end ;
					end ;

					if (GotData = true)
					then
						update archived_alert_cdr set RUN_ID=ALERT_CDR_RUN_ID_SEQ.nextval, AGGREGATION_TYPE=AgTypes(i), AGGREGATION_VALUE=AgValues(i), TIME_STAMP=XDR_Time
								where ALERT_ID=AlertIDs(i) and CDR_ID=XDRIDs(i) and RECORD_CATEGORY=RecordCatagories(i) ;

						if ( QueryWithoutAggValue = true )
						then
							execute immediate InsertQuery  using AlertIDs(i), XDay, YDay, XDRIDs(i) ;
						else
							execute immediate InsertQuery  using AlertIDs(i), XDay, YDay, AgValues(i), XDRIDs(i) ;
						end if ;

						CommitCount:=CommitCount+1 ;
						if(CommitCount = 100000)
						then
								commit ;
								CommitCount:=0 ;
						end if ;
						
					end if ;
					
			end loop ;

			exit when cur%NOTFOUND ;
		end loop ;

		update configurations set value=ALERT_CDR_RUN_ID_SEQ.nextval where config_key='ALARMDENORMALIZER.RUN_ID' ;


	commit ;
end ;
/

ALTER table archived_alert_cdr add RUN_ID NUMBER(20) NOT NULL ; 
ALTER table archived_alert_cdr add AGGREGATION_TYPE NUMBER(20) NOT NULL ;
ALTER table archived_alert_cdr add AGGREGATION_VALUE VARCHAR2(40) ;
ALTER table archived_alert_cdr add TIME_STAMP DATE NOT NULL ;
ALTER table archived_alert_cdr add IS_CALLED_TO_CALLED_BY number(1) default 0 NOT NULL ;

