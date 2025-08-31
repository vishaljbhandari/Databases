spool LINK_CHART_FILTERS.log



---------------------------delete statements ---------------
delete from LINK_CHART_FILTERS where  record_view_config_id = '1' and src_view_field_id = '9' and show_find_related_cdr = '0' and dest_view_field_id = '10' ;
---------------------------delete statements ---------------
delete from LINK_CHART_FILTERS where  record_view_config_id = '2' and src_view_field_id = '18' and show_find_related_cdr = '0' and dest_view_field_id = '17' ;
---------------------------delete statements ---------------
delete from LINK_CHART_FILTERS where  record_view_config_id = '1' and src_view_field_id = '22' and show_find_related_cdr = '0' and dest_view_field_id = '30' ;
spool off ;
