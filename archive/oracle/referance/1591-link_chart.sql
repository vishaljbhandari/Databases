delete from link_chart_filters where SRC_VIEW_FIELD_ID in (18,9,22);
delete from RANGER_GROUPS_TASKS where TASK_ID in (select id from tasks where name = 'Alarm Link Chart Task');
delete from FEATURE_TASK_MAPS where TASK_ID in (select id from tasks where name = 'Alarm Link Chart Task');
delete from tasks where name = 'Alarm Link Chart Task';
commit;

