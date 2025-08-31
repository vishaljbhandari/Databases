CREATE OR REPLACE FORCE VIEW "DSM_REFERENCE_TYPES_V" ("ID", "DESCRIPTION", "RECORD_CONFIG_ID") AS
  (
    select id, description, record_config_id from reference_types
        where id not in (select id from reference_types_dsm)
union
    select id, description, record_config_id from reference_types_dsm
        where delete_record = 0
) ;

CREATE OR REPLACE FORCE VIEW "DSM_SPARK_SUPPORT_V" ("ID", "TNAME", "COL_SUBPARTITION", "IS_HYBRID", "INDEX_ACTIVE_PERIOD", "INDEX_INACTIVE_PERIOD") AS
  (
                        select a.id, a.tname, b.col_subpartition, b.is_hybrid, b.index_active_period, b.index_inactive_period
            from dsm_record_configs_v a left outer join spark_support_dsm b
            on a.id = b.id where a.spark_support = 'Yes'
            );


CREATE OR REPLACE FORCE VIEW "DSM_RECORD_CONFIGS_V" ("ID", "DESCRIPTION", "TNAME", "VISIBLE", "CATEGORY", "OFFLINE_TNAME", "SPARK_SUPPORT", "DISTRIBUTED_CACHE", "TASKS", "AGGREGATIONS", "STATS_AGGREGATIONS", "DENORMALIZE_TNAME", "DISPATCHER_CATEGORY", "PREVEA_SUPPORT", "DISPATCHER_ACTIONS", "STORAGE_DAYS", "DELIMETER", "FUNCTIONS", "ARCHIVE_TABLE_NAME", "ARCHIVE_TNAME", "STATUS") AS
  (
    select r.id, description, tname,
    decode(is_visible, 1, 'Yes', 'No') as visible, category, (select OFFLINE_TNAME from
    dbwriter_configurations where record_config_id= r.id) as offline_tname, decode(is_spark_support, 1, 'Yes', 'No') as spark_support, decode(is_distributed_cache,1, 'Yes','No') as distributed_cache,
    (select tasks from record_view_tasks where record_config_id = r.id) as tasks,
    (select joinmanyrowsin1((select name from field_categories fc where fc.id = arcm.aggregation_type )) from  AGG_RECORD_CONFIG_MAPS arcm where arcm.record_config_id = r.id) as aggregations,
    (select joinmanyrowsin1((select fc.name from field_categories fc where F.entity_type = fc.id and F.category like '%SR%' )) from fp_entities F where instr(','||element_datastream_ids||',', ','||r.id||',') > 0) as stats_aggregations,
    (select lookup_table_name from alarm_xdr_maps where record_config_id = r.id) as denormalize_tname,
    (select name from field_categories where id in (select field_category_id from modulo_dispatcher_categories where record_config_id = r.id)) as dispatcher_category,
    (select value from configurations where config_key = 'PREVEA_SUPPORT') as PREVEA_SUPPORT,
    (select joinmanyrowsin1(name) from rules where id in (select rule_id from record_configs_rules where record_config_id = r.id and rule_id in (5, 6, 7))) as dispatcher_actions,
    (select substr(value, instr(value, ',')+1) from configurations where config_key = 'CLEANUP.RECORDS.'||r.tname||'.OPTIONS') as storage_days,delimeter, (select joinmanyrowsin1(name) from pseudo_functions where id in (select pseudo_function_id from pseudo_functns_record_configs where record_config_id = r.id)) as functions,
    (select lookup_table_name from archive_maps where record_config_id = r.id) as archive_table_name,
    (select archive_name from archive_maps where record_config_id = r.id) as archive_tname,
    (select status from record_configs where record_configs.id = r.id) as status
    from record_configs r where (description in (select name from tasks where parent_id = getparentid('Events')) or id in (select distinct RECORD_CONFIG_ID from reference_types where RECORD_CONFIG_ID is not null) and delimeter is not null) and r.id not in (select id from record_configs_dsm where delete_record = 0)
union
    select id, description, tname, visible, category, offline_tname, spark_support,distributed_cache, tasks, aggregation_types, stats_aggregations, denormalize_tname, dispatcher_category,prevea_support, dispatcher_actions, storage_days, delimeter, functions,archive_table_name,archive_tname, status from record_configs_dsm where delete_record = 0
) ;


CREATE OR REPLACE FORCE VIEW "DSM_SERVICE_NUMBER_TYPES_V" ("ID", "DESCRIPTION", "RECORD_CONFIGS", "PRIMARY_AGGREGATION_TYPE") AS
  (
        select id, description, record_configs, primary_aggregation_type
        from service_number_types f where not exists (select 1 from service_number_types_dsm where id = f.id)
        union
        select id, description, record_configs, primary_aggregation_type
        from service_number_types_dsm f
        where delete_record != 1
) ;


CREATE OR REPLACE FORCE VIEW "DSM_AGGREGATION_TYPES_V" ("ID", "DESCRIPTION", "GROUP_RECORD_CONFIG_ID", "SP_CHILD_AGGREGATIONS", "FUNCTIONS", "PARENT_AGGREGATION", "REFENCE_VALUE_CATEGORY", "IS_STATS_AGG", "IS_FP_AGG", "PRIMARY_RECORD_VIEW", "WHERE_CLAUSE", "REFERENCE_ID_CATEGORY", "REFERENCE_TYPE", "SERVICE_NUMBER_TYPE") AS
  (
    select A.id, (select name from dsm_field_categories_v where id = A.id) as description,
        (select description from record_configs where id = group_record_config_id) as group_record_config_id,
                (select CHILD_AGGREGATIONS from SP_AGGREGATION_TYPE_MAPS where PARENT_AGGREGATION = A.id) as sp_child_aggregations,
        (select joinmanyrowsin1(NAME) from pseudo_functions where id in (select pseudo_function_id
            from agg_type_pseudo_functions where aggregation_type_id = A.id)) as functions,
        nvl((select name from dsm_field_categories_v where id = decode(AM.dest_aggregation, 0, -1, AM.dest_aggregation)), 'None') as parent_aggregation,
        R.reference_value_category_id as refence_value_category,( select case when (select entity_type ||'|'||description from fp_entities where id = A.id and category like '%SR%' ) is null then 'No' else 'Yes' end is_stats_agg from dual ) as is_stats_agg,
                ( select case when (select entity_type ||'|'||description from fp_entities where id = A.id and category like '%FP%' ) is null then 'No' else 'Yes' end is_fp_agg from dual ) as is_fp_agg,
                ( select case when (select record_view_config_id from fp_entities where id = A.id and category like '%SR%') is null then 0 else (select record_view_config_id from fp_entities where id = A.id ) end from dual) as primary_record_view,
        (select where_clause from profile_manager_entity_configs where A.id=entity_type) as where_clause,
        R.reference_category_id as reference_id_category,
        R.reference_type as reference_type,
                R.service_number_type as service_number_type
			from aggregation_types A,aggregation_types_maps AM, reference_types_maps R
        where A.id = AM.source_aggregation and A.id = R.aggregation_type and A.id not in
        (select id from aggregation_types_dsm)
union
    select id, description, group_record_config, sp_child_aggregations, functions,
    nvl((select name from dsm_field_categories_v where id = decode(A.parent_aggregation_id, 0, -1, A.parent_aggregation_id)), 'None'),
    A.reference_value_category_id as refence_value_category,is_stats_agg, is_fp_agg, primary_record_view, where_clause,
    A.reference_id_category as reference_id_category, reference_type, service_number_type
  from aggregation_types_dsm A
        where delete_record = 0
) ;


CREATE OR REPLACE FORCE VIEW "DSM_NETWORK_V" ("ID", "SHORT_NAME", "DESCRIPTION", "CURRENCY") AS
  ( select id, short_name, description, currency from networks union select id, short_name, description, currency from dsm_networks ) ;


  CREATE OR REPLACE FORCE VIEW "DSM_FIELD_CONFIGS_V" ("ID", "NAME", "DATABASE_FIELD", "POSITION", "VISIBLE", "RECORD_CONFIG_ID", "BASIC_FILTER", "EXPANDABLE", "DATA_TYPE", "DERIVATIVE_FUNCTION", "DS_CATEGORY", "TRANSLATION_NAME", "FILTERABLE", "WIDTH", "REGULAR_EXPRESSION_ID", "ASSOCIATED_FIELD", "FIELD_ID", "INDEXED", "FIELD_CATEGORY", "INDEX_SUFFIX", "IS_MANDATORY", "FIELD_TYPE") AS
  (
            select id, name, database_field, position,decode(is_visible, 1, 'Yes', 'No') as visible, record_config_id,
            nvl((select 'Yes' from basic_filter_configs where record_config_id = f.record_config_id and field_id = f.field_id and rownum <2), 'No') as basic_filter,
            decode(is_expandable, 1, 'Yes', 'No') as expandable,
            (select d.data_type from data_types d where id = f.data_type) as data_type, derivative_function,
            ds_category, (select description from translation_indices where id = f.translation_id) as translation_name,
            decode(is_filter, 1, 'Yes', 'No') as filterable, to_char(width) as width,
            reg_exp_id as regular_expression_id, GetAssociatedString(associated_field, f.record_config_id) as associated_field, field_id,
            nvl((select 'Yes' from filter_index_fields where record_config_id = f.record_config_id and field_id = f.field_id), 'No') as indexed,
            (select joinmanyrowsin1(name) from dsm_field_categories_v where id in  (select field_category_id from field_record_config_maps where record_config_id = f.record_config_id and field_association = to_char(f.field_id))) as field_category,
                        (decode((select 'Yes' from filter_index_fields where record_config_id = f.record_config_id and field_id = f.field_id),'Yes', (SELECT substr(index_name,length(REGEXP_SUBSTR(INDEX_NAME,'.*_+',1,1))+1,3)  from user_ind_columns where TABLE_NAME = (select upper(archive_name) from archive_maps am where am.record_config_id = f.record_config_id ) and COLUMN_NAME=upper(database_field)),null)) as index_suffix,
                        decode((select NULLABLE from user_tab_columns where COLUMN_NAME = f.database_field and TABLE_NAME = (select tname from record_configs where id = f.record_config_id)),'Y','N','N','Y') as is_mandatory, (decode(database_field,null,decode(is_filter,0,decode(is_visible,0,'RA','iRAFM'),'iRAFM'), 'iRAFM')) as field_type
            from field_configs f where f.id not in (select id from field_configs_dsm) and not exists (select 1 from field_configs_dsm where
                record_config_id = f.record_config_id and field_id = f.field_id)
            union
            select id, name, database_field, position, visible, record_config_id, basic_filter, expandable, data_type, derivative_function,
            ds_category, translation_name, filterable, width, regular_expression_id, GetAssociatedString(associated_field, f.record_config_id) as associated_field, field_id,
            indexed, field_category, index_suffix, is_mandatory, field_type from field_configs_dsm f where delete_record = 0
             );


  CREATE OR REPLACE FORCE VIEW "DSM_FIELD_CATEGORIES_V" ("ID", "NAME", "DATA_TYPE", "CATEGORY", "COMMON_CATEGORY_ID", "REGULAR_EXPRESSION_ID") AS
  (
    select id, name, data_type, category, common_category_id, regular_expression_id from field_categories
        where id not in (select id from field_categories_dsm)
union
    select id, name, data_type, category, common_category_id, regular_expression_id from field_categories_dsm
        where delete_record = 0
) ;


CREATE OR REPLACE FORCE VIEW "DSM_COUNTER_DETAILS_V" ("ID", "TABLE_NAME", "COUNTER_CATEGORY", "RECORD_CONFIGS", "AGGREGATION_TYPES", "COUNTER_TYPES", "DS_AGGR", "RULE_MODES") AS
  (
        select a.id, a.table_name, d.counter_category, joinmanyrowsin1uniq(c.record_config_id) as record_configs,
            joinmanyrowsin1uniq(c.aggregation_type_id) as aggregation_types,
            joinmanyrowsin1uniq(c.counter_type_id) as counter_types, (select unique joinmanyrowsin1(ds_agg) as ds_aggr from (select unique RECORD_CONFIG_ID||'-'||AGGREGATION_TYPE_ID as ds_agg,counter_detail_id from counter_manager_mappings order by ds_agg) where counter_detail_id=a.id) as ds_aggr, joinmanyrowsin1uniq(rule_mode) as rule_modes
            from counter_details a, counter_manager_mappings c , in_memory_counter_details d , dsm_record_configs_v e where d.id=a.id and a.id = c.counter_detail_id and e.id=c.record_config_id
            and a.id not in (select id from counter_details_dsm)
            group by a.id, a.table_name,d.counter_category
union
            select id, table_name, counter_category, record_configs, aggregation_types, counter_types, ds_aggr,  rule_modes from counter_details_dsm);


CREATE OR REPLACE FORCE VIEW "EXISTING_COUNTER_DETAILS_V" ("ID", "TABLE_NAME", "COUNTER_CATEGORY", "RECORD_CONFIGS", "AGGREGATION_TYPES", "COUNTER_TYPES", "DS_AGGR", "RULE_MODES") AS
  (
        select a.id, a.table_name, d.counter_category, joinmanyrowsin1uniq(c.record_config_id) as record_configs,
            joinmanyrowsin1uniq(c.aggregation_type_id) as aggregation_types,
            joinmanyrowsin1uniq(c.counter_type_id) as counter_types, (select unique joinmanyrowsin1(ds_agg) as ds_aggr from (select unique RECORD_CONFIG_ID||'-'||AGGREGATION_TYPE_ID as ds_agg,counter_detail_id from counter_manager_mappings order by ds_agg) where counter_detail_id=a.id) as ds_aggr, joinmanyrowsin1uniq(rule_mode) as rule_modes
            from counter_details a, counter_manager_mappings c , in_memory_counter_details d , dsm_record_configs_v e where d.id=a.id and a.id = c.counter_detail_id and e.id=c.record_config_id
            group by a.id, a.table_name,d.counter_category
                    );


CREATE OR REPLACE FORCE VIEW "DSM_TRANSLATION_INDICES_V" ("ID", "DESCRIPTION", "SORT_ON", "IS_DYNAMIC", "IS_NEW_RECORD", "DELETE_RECORD") AS
  select t."ID",t."DESCRIPTION",t."SORT_ON",t."IS_DYNAMIC", 0 as is_new_record, 0 as delete_record from translation_indices t union select "ID","DESCRIPTION","SORT_ON","IS_DYNAMIC","IS_NEW_RECORD","DELETE_RECORD" from translation_indices_dsm where delete_record = 0 ;
  CREATE OR REPLACE FORCE VIEW "RECORD_VIEW_TASKS" ("RECORD_CONFIG_ID", "TASKS") AS
  select id as record_config_id, joinmanyrowsin1(task_name) as tasks  from (
select r.id, t.name as task_name from tasks t, record_configs r , record_view_configs rv where rv.record_config_id = r.id and (link like '%'||rv.id  and parent_id = getparentid(r.description, 'Events'))
union select r.id, 'Global Exceptions' as task_name from tasks t, record_configs r where link like '/global_exceptions/list/'||r.id||'%'
union select r.id, 'Rule Creation' as task_name  from tasks t, record_configs r where t.name = to_char(r.description)||' Rule Creation' and r.description is not null
union select r.id, 'Events' from tasks t, record_configs r , record_view_configs rv where rv.record_config_id = r.id and link like '/record_view/list/'||rv.id||'%' and parent_id = getparentid('Events')
) group by id ;


CREATE OR REPLACE FORCE VIEW "DSM_COUNTER_INSTANCE_V" ("ID", "COUNTER_INSTANCE_ID", "DESCRIPTION", "NUMBER_OF_SLAVES", "NUMBER_OF_PARTITIONS_PER_SLAVE", "CACHE_SWEEP_INTERVAL", "DELTA_READ_BUFFER_SIZE", "DELTA_READ_AHEAD_COUNT", "CLEANUP_INTERVAL", "BATCH_COUNT", "BATCH_FLUSH_INTERVAL", "CACHE_DUMP_DESTINATION", "DELTA_FILE_PATH", "PR_FILE_PATH", "SHM_ENABLED") AS
  (select id,counter_instance_id,description,number_of_slaves,number_of_partitions_per_slave,cache_sweep_interval,
                delta_read_buffer_size,delta_read_ahead_count,cleanup_interval,batch_count,
                batch_flush_interval,cache_dump_destination,delta_file_path,
                pr_file_path,decode(shm_enabled, 1, 'Yes', 'No') as shm_enabled
                from in_memory_counter_details b
                where b.id not in(select id from counter_instance_dsm c where c.counter_instance_id = b.counter_instance_id )
            union
                select id,counter_instance_id,description,number_of_slaves,number_of_partitions_per_slave,cache_sweep_interval,delta_read_buffer_size,
                delta_read_ahead_count,cleanup_interval,batch_count,batch_flush_interval,
                cache_dump_destination,delta_file_path,pr_file_path,
                shm_enabled from counter_instance_dsm where delete_record = 0
                ) ;


CREATE OR REPLACE FORCE VIEW "DSM_PSEUDO_FUNCTIONS_V" ("ID", "NAME", "CATEGORY", "ACCUMULATION_FUNCTION", "ACCUMULATION_FIELD", "DURATION_BASED") AS
  (
    select id, name, category, to_char(f.accumulation_function_id) as accumulation_function,
    to_char(f.accumulation_field_id) as accumulation_field,
        (select decode(component_id, 2, 1, 0) from components_pseudo_functions
            where pseudo_function_id = f.id) as duration_based
    from pseudo_functions f where not exists (select 1 from pseudo_functions_dsm where id = f.id)
union
    select id, name, category, accumulation_function, accumulation_field, duration_based from pseudo_functions_dsm f
        where delete_record != 1
) ;


CREATE OR REPLACE FORCE VIEW "DSM_EXPANDABLE_FIELDS_V" ("ID", "NAME", "SOURCE_VIEW_ID", "SOURCE_KEY", "DEST_VIEW_ID", "DEST_KEY", "IS_NEW_VIEW", "CATEGORY") AS
  (
                 select r.id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, category
                 from expandable_field_maps r where id not in (select id from expandable_fields_dsm)
             union
                 select id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, category
                 from expandable_fields_dsm where delete_record = 0
             ) ;


CREATE OR REPLACE FORCE VIEW "DSM_REGULAR_EXPRESSIONS_V" ("ID", "DESCRIPTION", "EXPRESSION") AS
  (
    select id, description, expression from regular_expressions
        where id not in (select id from regular_expressions_dsm)
union
    select id, description, expression from regular_expressions_dsm
        where delete_record = 0
) ;


CREATE OR REPLACE FORCE VIEW "RECORD_VIEW_TASKS" ("RECORD_CONFIG_ID", "TASKS") AS
  select id as record_config_id, joinmanyrowsin1(task_name) as tasks  from (
select r.id, t.name as task_name from tasks t, record_configs r , record_view_configs rv where rv.record_config_id = r.id and (link like '%'||rv.id  and parent_id = getparentid(r.description, 'Events'))
union select r.id, 'Global Exceptions' as task_name from tasks t, record_configs r where link like '/global_exceptions/list/'||r.id||'%'
union select r.id, 'Rule Creation' as task_name  from tasks t, record_configs r where t.name = to_char(r.description)||' Rule Creation' and r.description is not null
union select r.id, 'Events' from tasks t, record_configs r , record_view_configs rv where rv.record_config_id = r.id and link like '/record_view/list/'||rv.id||'%' and parent_id = getparentid('Events')
) group by id ;
