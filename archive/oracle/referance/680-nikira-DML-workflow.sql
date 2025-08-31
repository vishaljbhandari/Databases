spool nikira-DML-workflow.log
set feedback off ;
set serveroutput off ;

insert into activity_templates (id, name, description, template_type, execution_type)
values (activity_templates_seq.nextval, 'Service Barring', 'Service Barring Template', 2, 0) ;
insert into activity_templates_actions (id, activity_template_id, action)
values (activity_templates_actions_seq.nextval, activity_templates_seq.currval, 'service_barring') ;

insert into activity_templates (id, name, description, template_type, execution_type)
values (activity_templates_seq.nextval, 'Standard Template', 'Template for capturing activity notes', 0, 0) ;

insert into activity_templates_actions (id, activity_template_id, action)
values (activity_templates_actions_seq.nextval, activity_templates_seq.currval, 'check_billing_info') ;

delete from alarm_tasks ;

Insert into alarm_tasks(id, name) values(1, 'Initiate Workflow') ;
Insert into alarm_tasks(id, name) values(3, 'Change Fraud Type') ;
Insert into alarm_tasks(id, name) values(4, 'Analyst Actions') ;
Insert into alarm_tasks(id, name) values(5, 'Close Alarm') ;
Insert into alarm_tasks(id, name) values(6, 'Keep Alarm Pending') ;
Insert into alarm_tasks(id, name) values(7, 'Close Alarm as Available') ;
Insert into alarm_tasks(id, name) values(11, 'Revoke Pending Alarm') ;

delete from serviceprov_action_maps ;

insert into serviceprov_action_maps (id, name) values(1, 'Service Downgrade to NLD') ;
insert into serviceprov_action_maps (id, name) values(2, 'Service Upgrade to ILD') ;
insert into serviceprov_action_maps (id, name) values(3, 'Service Downgrade to ICLD') ;
insert into serviceprov_action_maps (id, name) values(4, 'Service Upgrade to NLD') ;
insert into serviceprov_action_maps (id, name) values(5, 'Service Downgrade to LOCAL') ;
insert into serviceprov_action_maps (id, name) values(6, 'Service Upgrade to ICLD') ;
insert into serviceprov_action_maps (id, name) values(7, 'Service OG Barring') ;
insert into serviceprov_action_maps (id, name) values(8, 'Service Restoration') ;
insert into serviceprov_action_maps (id, name) values(9, 'Service Suspension') ;
insert into serviceprov_action_maps (id, name) values(10, 'Service Resumption') ;

delete from default_activity_labels ;

insert into default_activity_labels values(default_activity_labels_seq.nextval, 6, 1, 'Yes') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 6, 2, 'No') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 6, 3, 'Not Applicable') ;

insert into default_activity_labels values(default_activity_labels_seq.nextval, 4, 1, 'Range-A') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 4, 2, 'Range-B') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 4, 3, 'Not Applicable') ;

insert into default_activity_labels values(default_activity_labels_seq.nextval, 2, 1, 'Range-A') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 2, 2, 'Range-B') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 2, 3, 'Not Applicable') ;

insert into default_activity_labels values(default_activity_labels_seq.nextval, 1, 1, 'Range-A') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 1, 2, 'Range-B') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 1, 3, 'Not Applicable') ;

insert into default_activity_labels values(default_activity_labels_seq.nextval, 3, 1, 'Valid') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 3, 2, 'Invalid') ;
insert into default_activity_labels values(default_activity_labels_seq.nextval, 3, 3, 'Not Applicable') ;

insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'MARK_ALARM_WITHOUT_RESOLVE_WORKFLOW', '0');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'DEFAULT_WORKFLOW_POLLING_TIMEOUT', '50');

commit ;

