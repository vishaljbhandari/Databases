--/*******************************************************************************
-- *	Copyright (c) Subex Azure Limited 2006. All rights reserved.	           *
-- *	The copyright to the computer program(s) herein is the property of Subex   *
-- *	Azure Limited. The program(s) may be used and/or copied with the written *
-- *	permission from Subex Azure Limited or in accordance with the terms and  *
-- *	conditions stipulated in the agreement/contract under which the program(s) *
-- *	have been supplied.                                                        *
-- *******************************************************************************/

CREATE OR REPLACE PACKAGE HotlistDestSummary
AS
	current_week			 number  ;
	
	PROCEDURE MergeIntoSummary(input_date in VARCHAR) ;
	PROCEDURE UpdateSummaryInfo(input_date in Date) ;
	PROCEDURE CleanUpOldRecords(input_date in Date) ;

END HotlistDestSummary ;
/
show error;

CREATE OR REPLACE PACKAGE BODY HotlistDestSummary AS

	PROCEDURE MergeIntoSummary(input_date in VARCHAR)
	AS
		BEGIN
				if (nvl(input_date, ' ') = ' ') then
					current_week := to_number(to_char(sysdate-1, 'iw'));
				else
					current_week := to_number(to_char(to_date(input_date, 'dd-mm-yyyy'), 'iw'));
				end if ;

			    merge /*+ append */ into hotlist_dest_summary s
			            using (
			                select /*+ parallel (c,4)  */
			                            c.phone_number phone_number,
			                            c.subscriber_id subscriber_id,
			                            c.network_id network_id,
			                            c.vpmn vpmn,
			                            c.call_type call_type,
			                            c.cdr_type cdr_type,
			                            c.total_value total_value,
			                            c.total_duration total_duration,
			                            c.total_count total_count
			                    from nik_hotlist_temp c) c
			            on (
			                        s.week = current_week
			                        and s.network_id = c.network_id
			                        and s.phone_number = c.phone_number
			                        and s.subscriber_id = c.subscriber_id
			                        and s.call_type = c.call_type
			                        and s.cdr_type = c.cdr_type
			                        and s.vpmn = c.vpmn
			                )
			            when matched then
			            update
			            set     s.total_value     = c.total_value + s.total_value,
			                    s.total_duration  = c.total_duration + s.total_duration,
			                    s.total_count     = c.total_count + s.total_count
			            when not matched then
			            insert
			                (id, subscriber_id, network_id, phone_number, vpmn, total_value, total_duration, total_count, call_type, cdr_type, week)
			                values
			                (hotlist_dest_summary_seq.nextval, c.subscriber_id, c.network_id, c.phone_number, c.vpmn, c.total_value,
			                    c.total_duration, c.total_count, c.call_type, c.cdr_type, current_week
			                );
			    
		commit ;
		
		HotlistDestSummary.UpdateSummaryInfo(to_date(input_date, 'dd-mm-yyyy'));
		HotlistDestSummary.CleanUpOldRecords(to_date(input_date, 'dd-mm-yyyy'));
		
		
	END MergeIntoSummary;
	
	PROCEDURE UpdateSummaryInfo(input_date in Date)
	  AS
	  BEGIN
		SummaryData.set_last_updated_info ('HOTLISTDEST_SUMMARY_LAST_UPDATED_WEEK', input_date) ;
		commit ;
		
	END UpdateSummaryInfo;	
	
	PROCEDURE CleanUpOldRecords(input_date in Date)
	  AS
	  BEGIN
	  	SummaryData.delete_old_data(input_date, 'HOTLIST_DEST_SUMMARY' , 'HOTLISTDEST_SUMMARY_LAST_UPDATED_WEEK') ;
		commit ;
	END CleanUpOldRecords ;
END HotlistDestSummary;
/
show error;
