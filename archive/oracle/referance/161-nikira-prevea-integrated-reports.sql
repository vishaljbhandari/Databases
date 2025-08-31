---------------------------------------Exposure Management Report---------------------------------------------------
delete from RANGER_GROUPS_TASKS where task_id in (select id from tasks where name = 'Exposure Management Report');
delete from tasks where id in (select id from tasks where name = 'Exposure Management Report');
delete from report_parameters where report_id in (select id from reports where display_name = 'Exposure Management Report');
delete from reports where display_name = 'Exposure Management Report';
delete from translations where tr_id=560;
delete from translation_indices where id=560;

insert into translation_indices values (560, 'Exposure Type', '',0) ;
insert into translations values (translations_seq.nextval, 560,'EXPOSURE','Exposure');
insert into translations values (translations_seq.nextval, 560,'PERCENTAGE_EXPOSURE','Exposure Percentage');

insert into reports (id,name,display_name,category,description,is_long_running)
values (reports_seq.nextval,'ExposureManagement','Exposure Management Report','Prevea Reports','This report shows the exposure of the subscribers',0) ;

--Report Parameters--
insert into report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
	values (report_parameters_seq.nextval, reports_seq.currval, 1, 'Network', 'NETWORK_ID', 6, 10, 1) ;
    
insert into report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id,translation_index_id,is_mandatory)
	values (report_parameters_seq.nextval,reports_seq.currval, 2, 'Exposure Type', 'EXPOSURE_TYPE', 3,560,1);

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,REGEXP_ID)
	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'Minimum','MIN_VALUE',2,NULL,1,12)
;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,REGEXP_ID)
	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Maximum','MAX_VALUE',2,NULL,1,12);


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Report Listing', 'Reports'), 'Exposure Management Report' , '', 0, 0) ;

insert into ranger_groups_tasks (RANGER_GROUP_ID, TASK_ID ) select rg.id, t.id from tasks t , ranger_groups rg where rg.name in('default', 'radmin', 'nadmin') and t.name ='Exposure Management Report';

insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) values ('Prevea Exposure Management Summarization','preveaprofilefieldssummary.sh,PreveaProfileFieldLoaderpid',0,0) ;
commit ;
