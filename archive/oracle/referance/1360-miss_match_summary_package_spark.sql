
CREATE OR REPLACE PACKAGE MissMatchSummary
AS
	
	PROCEDURE MergeIntoSummary(input_date in varchar2);
	PROCEDURE SetLastUpdatedInfo(input_date in Date) ;
	
	END MissMatchSummary ;
/
show error;

CREATE OR REPLACE PACKAGE BODY MissMatchSummary AS

	PROCEDURE MergeIntoSummary(input_date in varchar2)
	AS
	BEGIN


	delete from mismatch_summary 
	where (to_date(input_date,'dd-mm-yyyy') - last_used_date) > 7 * RangerDefs.max_weeks_of_storage ;
	commit ;

	merge /* + append */  into mismatch_summary M
		      using
		      (
		          select subscriber_id, network_id, phone_number, imsi_number, equipment_id
		          from missmatch_temp
		      ) C
		      on
		      (
		          M.network_id = C.network_id
		          and M.phone_number = C.phone_number
		          and M.subscriber_id = C.subscriber_id
		          and M.imsi_number = C.imsi_number
		          and M.imei_number = C.equipment_id
		      )
		      when matched then
		          update set
		              M.last_used_date = to_date(input_date,'dd-mm-yyyy')
		      when not matched then
		          insert values
		              (C.subscriber_id, C.network_id, C.phone_number, C.imsi_number, C.equipment_id, to_date(input_date,'dd-mm-yyyy'), to_date(input_date,'dd-mm-yyyy')) ;
	
  		      commit;

	SetLastUpdatedInfo (to_date(input_date,'dd-mm-yyyy')) ;
	
	END MergeIntoSummary ;
	
	PROCEDURE SetLastUpdatedInfo(input_date in Date)
	AS
	BEGIN
	SummaryData.set_last_updated_info ('MISMATCH_SUMMARY_LAST_UPDATED_WEEK', input_date) ;
	END SetLastUpdatedInfo;
	
END MissMatchSummary;
/
show error;
