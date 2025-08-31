delete from link_chart_filters where id in (2,3);
delete from link_chart_filters where id = 4 and RECORD_VIEW_CONFIG_ID = 2 ;
delete from FEATURE_TASK_MAPS where FEATURE_ID = 5 and TASK_ID = 1600;
commit;

