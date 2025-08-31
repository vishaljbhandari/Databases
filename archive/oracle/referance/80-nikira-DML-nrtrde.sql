spool nikira-DML-nrtrde.log
set feedback off ;
set serveroutput off ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'VPMNIDIncrement','1');
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'HotList VPMN Expiry in Days','30');
--Configuration For Bulk Load
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'TRUNCATE_VPMN_INFO_FOR_BULK_LOAD', '0' );


--- Entries For NRTRDE View -------

insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 42, 49, 5, 8, 1, 0) ;

insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('Process VPMN Records', 'processvpmnrecords.rb,ProcessVpmnRecordsPID',0,0, 0) ;

insert into modulo_dispatcher_categories  (record_config_id, field_category_id) values (42,200) ;

commit ;

