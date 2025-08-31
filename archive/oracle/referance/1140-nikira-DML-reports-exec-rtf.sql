spool nikira-DML-reports-exec-rtf.log
set feedback off ;
set serveroutput off ;
-------Rule Test Facility Summary Report ------

INSERT INTO reports (ID, NAME, DISPLAY_NAME, DESCRIPTION, CATEGORY, IS_LONG_RUNNING) VALUES
   (reports_seq.nextval, 'RuleTestFacilitySummary', 'Rule Test Facility Summary Report', 'This report give details of activities under rule test facility for the given period of time', 'Summary', 0) ;

INSERT INTO report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
   VALUES (report_parameters_seq.nextval,reports_seq.currval, 1, 'Start Date', 'StartDate', 4, NULL, 1) ;
INSERT INTO report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
   VALUES (report_parameters_seq.nextval, reports_seq.currval, 2, 'End Date', 'EndDate', 4, NULL, 1) ;

commit ;

