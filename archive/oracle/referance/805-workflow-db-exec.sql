set feedback off;
set serveroutput off ;
SPOOL workflow-db-exec.log 

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

commit;
