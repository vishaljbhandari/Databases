alter sequence expandable_field_maps_seq increment by 1000;
select expandable_field_maps_seq.nextval from dual;
alter sequence expandable_field_maps_seq increment by 1;
insert into expandable_field_maps(id,source_view_id,name,category,data_record_type,dest_key,dest_key_type,dest_view_id,is_new_view,source_key) select expandable_field_maps_seq.nextval,506, name,category,data_record_type,dest_key,dest_key_type,dest_view_id,is_new_view,source_key from expandable_field_maps where source_view_id = 4;

commit ;
