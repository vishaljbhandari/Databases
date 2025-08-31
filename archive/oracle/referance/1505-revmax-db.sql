-- Things you should know before you modify this file:
-- Every table creation script, must be preceeded with that table's deletion script
-- Deletion of foreign key tables of a table must preceed the table deletion
-- Insert a one line comment for each table explaining its purpose ----YET TOBE DONE FOR REVMAX---
-- Scripts for deletion and creation of sequences used by a table must preceed table creation
-- Use all names consistent with coding conventions and conventions of this script

set feedback off ;

drop table rip_datasource_info cascade constraints ;
drop table rip_node_link_info cascade constraints ;
drop table rip_node_instance_info cascade constraints ;
drop table rip_ds_comp_config cascade constraints ;
drop table rip_sample_file_data ;
drop table rip_configuration cascade constraints ;
drop table rip_output_field_config cascade constraints ;
drop table rip_output_field_group cascade constraints ;
drop table rip_rule_tokens cascade constraints ;
drop table rip_rule cascade constraints ;
drop table rip_operand_output_mapping cascade constraints ;
drop table rip_operand cascade constraints ;
drop table rip_operator cascade constraints ;
drop table rip_special_number ;
drop table rip_special_list ;
drop table rip_custom_operand_function cascade constraints ;
drop table rip_function_substring cascade constraints ;
drop table rip_function_datetostring cascade constraints ;
drop table rip_function_stringpadding cascade constraints ;
drop table rip_function_round cascade constraints ;
drop table rip_function_string_to_date ;
drop table rip_br_rule cascade constraints ;
drop table rip_lpm_search_replace cascade constraints ;
drop table rip_lpm cascade constraints ;
drop table rip_lpm_group ;
drop table rip_tr_replace cascade constraints ;
drop table rip_tr_replace_expression cascade constraints ;
drop table rip_lk_table cascade constraints ;
drop table rip_lk_column_data cascade constraints ;
drop table rip_lk_operand_mapping cascade constraints ;
drop table rip_lk_data cascade constraints ;
drop table rip_un_lk_data cascade constraints ;
drop table rip_lk_assignment cascade constraints ;
drop table rip_un_lk_sequence cascade constraints ;
drop table rip_find_replace cascade constraints ;
drop table rip_expression cascade constraints ;
drop table rip_logfile_size_info cascade constraints ;
drop table rip_node_logger_map ;
drop table rip_logger cascade constraints ;
drop table rip_custom_component cascade constraints ;
drop table rip_holiday_info cascade constraints ;
drop table rip_fixed_width_marker_info cascade constraints ;
drop table rip_node_group_map ;
drop table rip_node_group ;
drop table rip_temp_impacted_items ;
drop table rip_datastream_global_data ;
drop table rip_table_sequence_map ;
drop table rip_rec_term_point_info cascade constraints ;
drop table rip_rec_term_reason cascade constraints ;
drop table rip_inputfield_operand_map cascade constraints ;
drop table rip_ascii_parser_config_info cascade constraints ;
drop table rip_parser_info cascade constraints ;
drop table rip_operand_validation ;
drop table rip_decoder cascade constraints ;
drop table rip_rec_term_end_map cascade constraints ;
drop table rip_processed_file_info cascade constraints ;
drop table rip_term_rec_count cascade constraints ;
drop table rip_rs_rec_count cascade constraints ;
drop table rip_date_format ;
drop table rip_asn1_parser_config_info ;
drop table rip_asn1_tag_info ;

drop sequence rip_node_config_id ;
drop sequence rip_output_field_conf_id ;
drop sequence rip_output_field_grp_id ;
drop sequence rip_data_stream_seq_id ;
drop sequence rip_operand_id ;
drop sequence rip_special_list_id ;
drop sequence rip_rule_id ;
drop sequence rip_operator_id ;
drop sequence rip_lk_table_seq_id ;
drop sequence rip_lk_data_seq_id ;
drop sequence rip_node_group_id ;
drop sequence rip_lpm_grp_id ;
drop sequence rip_input_field_id ;
drop sequence rip_parser_id ;
drop sequence rip_logger_id ;
drop sequence rip_reason_id ;
drop sequence rip_file_id ;
drop sequence rip_asn1_tag_id ;

create table rip_datasource_info(
		id					number(10)			not null,
		name				varchar2(64),
		description			varchar2(256),
        status             	number(2)			not null,
		processid			number(10) 			default 0,	
		versionid			number(10) 			default 0,	
		globalversionid		number(10)			default 0,
		isvdftmode			number(2)			default 0,
		constraint  rip_pk_ds_info_id primary key(id) ) ;
		
create sequence rip_data_stream_seq_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_node_instance_info(
		node_config_id		number(10)		not null,
		node_type			number(10)		not null,
		name				varchar2(256),
		xpos				number(10)		not null,
		ypos 				number(10)		not null,
		is_configured		number(1)		default 0,
		data_stream_id		number(10) 		not null,
		constraint  rip_pk_node_conf_id primary key(node_config_id),
		constraint  rip_fk_nod_inst_inf_ds_id foreign key(data_stream_id) references rip_datasource_info(id) on delete cascade
		) ;

create sequence rip_node_config_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_ds_comp_config(
		id					number(10)			not null,
		name				varchar2(64)		not null,
		value 				varchar2(4000),
		constraint  rip_pk_ds_com_con_id_nam primary key(id, name),
		constraint  rip_fk_ds_com_con_nod_con_id foreign key(id) references rip_node_instance_info(node_config_id) on delete cascade
		) ;

create table rip_sample_file_data (
		node_config_id		number(10) not null,
		file_data			clob,
		constraint  rip_pk_tra_sam_fil_dat primary key(node_config_id),
		constraint rip_fk_tra_sam_fil_dat foreign key(node_config_id) references rip_node_instance_info(node_config_id) on delete cascade
		) ;

create table rip_node_link_info(
		source_node				number(10)	not null,
		destination_node 		number(10) 	not null,
		data_stream_id      	number(10) 	not null,
		linktype                number(1)   not null,
		sequence				number(10) 	default 1,
		constraint  rip_pk_nod_lin_inf_src_nod primary key(source_node, destination_node, linktype),
		constraint  rip_fk_nod_lin_inf_src foreign key(source_node) references rip_node_instance_info(node_config_id) on delete cascade,	
		constraint  rip_fk_nod_lin_inf_des foreign key(destination_node) references rip_node_instance_info(node_config_id) on delete cascade,
		constraint  rip_fk_nod_lin_inf_ds_id foreign key(data_stream_id) references rip_datasource_info(id) on delete cascade
		) ;

create table rip_configuration(
		key		varchar2(256)	not null,
		value	varchar2(1024),
		constraint  rip_pk_con_key primary key(key)) ;

create sequence rip_output_field_grp_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;
create table rip_output_field_group
(
        id			      number(10) not null,
        name              varchar2(64) not null,
        description       varchar2(256),
	globalversionid	  number(10) 	default 0,
	constraint  rip_out_fie_grp_id primary key(id) 
) ;

create sequence rip_output_field_conf_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;
create table rip_output_field_config(
		id				        number(10) not null,
		field_name              varchar2(256) not null,
		data_type              	number(2) not null,
		is_discrete				number(2) default 0,
		output_field_position	number(3) not null,
		output_field_format		varchar(256),
		output_field_group_id   number(10)  not null,
		dbname					varchar(256) default ('default_dbname'),
		dblength				varchar(32) default (''),
		constraint  rip_out_fie_con_fie_nam unique (field_name,output_field_group_id),
		constraint  rip_out_fie_con_fie_pos unique (output_field_position,output_field_group_id),
		constraint  rip_pk_out_fie_con_id primary key(id),
		constraint  rip_fk_out_fie_con_grp_id foreign key(output_field_group_id) references rip_output_field_group(id) 
		on delete cascade
		) ;

create sequence rip_operand_id increment by 1 minvalue 1 maxvalue 64999 nocycle cache 20 order ;
create table rip_operand (
    id              number(10),
    name            varchar(64),
    description     varchar(256),
    position        number(5),
    data_type       number(5) not null,
    source          number(10), 
    operand_type    number(5) default 1 not null,
    value	    varchar(1000),
    globalversionid number(10)	default 0,
    constraint  rip_pk_operand primary key (id),
    constraint  rip_fk_op_src foreign key (source) references rip_datasource_info(id) on delete cascade
);

create table rip_custom_operand_function
(
 	custom_operand_id		number(10) not null,
	base_operand_id			number(10) not null, 
	function_type			number(10) not null,
	constraint  rip_pk_icu_op_fu		primary key (custom_operand_id),
	constraint  rip_fk_cu_op_fu foreign key(custom_operand_id) references rip_operand(id) on delete cascade,
	constraint  rip_fk_cu_ba_op foreign key(base_operand_id) references rip_operand(id) on delete cascade
);

create table rip_function_substring
(
 	custom_operand_id		number(10) not null,
	start_index				number(10) not null, 
	length					number(10) not null,
	matchtype				number(1)  not null,
	constraint  rip_pk_fun_sub		primary key (custom_operand_id),
	constraint  rip_fk_fu_su foreign key(custom_operand_id) references rip_custom_operand_function(custom_operand_id) on delete cascade,
    constraint  rip_fk_fu_su_st_in foreign key(start_index) references rip_operand(id) on delete cascade,
    constraint  rip_fk_fu_su_le foreign key(length) references rip_operand(id) on delete cascade
);

create table rip_function_datetostring
(
 	custom_operand_id	number(10) not null,
	dateformat			varchar(50) not null,
	constraint  rip_pk_dt_to_str	primary key (custom_operand_id),
	constraint  rip_fk_ft_str foreign key(custom_operand_id) references rip_custom_operand_function(custom_operand_id) on delete cascade
);

create table rip_function_stringpadding
(
 	custom_operand_id		number(10) not null,
	length					number(10) not null,
	padchar					varchar(1)  not null,
	padding					number(1) not null,
	constraint  rip_pk_fun_strpad		primary key (custom_operand_id),
	constraint  rip_fk_fun_strpad_len foreign key(length) references rip_operand(id) on delete cascade,
	constraint  rip_fk_fun_strpad foreign key(custom_operand_id) references rip_custom_operand_function(custom_operand_id) on delete cascade
);

create table rip_function_round
(
 	custom_operand_id		number(10) not null,
	digits_to_round			number(10) not null,
	constraint  rip_pk_fun_rou		primary key (custom_operand_id),
    constraint  rip_fk_fun_digits_to_round_cn foreign key(digits_to_round) references rip_operand(id) on delete cascade,
	constraint  rip_fk_fun_rnd foreign key(custom_operand_id) references rip_custom_operand_function(custom_operand_id) on delete cascade
);

create table rip_function_string_to_date
(
	custom_operand_id	number(10) not null,
	date_format      	varchar2(64) not null,
	constraint  rip_pk_fun_str_to_date      primary key (custom_operand_id),
	constraint  rip_fk_fun_str_to_date foreign key(custom_operand_id) references rip_custom_operand_function(custom_operand_id) on delete cascade
);

create table rip_lk_table
(
    id      number(10) not null,
    name    varchar2(64) not null,
    constraint  rip_pk_lk_ta primary key (id)
) ;

create sequence rip_lk_table_seq_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_rule 
(
 	id				 number(10),
    name             varchar(256) not null,
    description      varchar(256),
    expression       varchar(1000),
	notation         varchar(1000),
	source           number(10),
	table_id		 number(10),--null means rule is not using any table-operands or else using table operands defined in this tableid
	is_rule			 number(1) default 0, --else its an expression
    constraint  rip_pk_rule_id primary key (id),
    constraint  rip_fk_ru_id foreign key (source) references rip_datasource_info(id) on delete cascade,
	constraint  rip_fk_ta_id foreign key (table_id) references rip_lk_table(id) on delete cascade
);

create table rip_special_list
(
    id                      number(10),
    name                    varchar(64),
    description             varchar(256),
	globalversionid			number(10) default 0,
    constraint  rip_pk_special_list primary key (id)
);

create sequence rip_special_list_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_special_number 
(
    special_list_id		number(10) not null,
    sp_number			varchar(64) not null,
    constraint  rip_fk_spnum_sl_id foreign key (special_list_id) references rip_special_list(id) on delete cascade
);

create sequence rip_parser_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_parser_info 
(
	parser_id 		number(10) not null,
	node_id			number(10) not null,
	parser_type		number(2) not null,
	constraint rip_pk_parser_info primary key (parser_id),
	constraint rip_fk_rip_parser_info foreign key (node_id) references rip_node_instance_info(node_config_id) on delete cascade
) ;

create table rip_decoder
(
 	id					number(10),
 	decoder_type		number(2),
 	name				varchar2(256),
	constraint rip_pk_decoder primary key(id)
) ;

create sequence rip_input_field_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_inputfield_operand_map
(
	 field_id				number(10) not null,
	 operand_id				number(10) not null,
	 constraint rip_pf_inpfld_op_map primary key (field_id),
	 constraint rip_fk_inpfld_op_map_op_id foreign key (operand_id) references rip_operand (id) on delete cascade
) ;

create table rip_ascii_parser_config_info
(
	parser_id		number(10) not null,
	field_id 		number(10) not null,
	input_position	number(10) not null,
	constraint rip_fk_asc_par_inf_fld_id foreign key (field_id) references rip_inputfield_operand_map (field_id) on delete cascade,
	constraint rip_fk_parser_id foreign key (parser_id) references rip_parser_info(parser_id) on delete cascade
) ;

create table rip_operand_validation
(
	 operand_id				number(10) not null,
	 field_size             number(10) default 0,
	 input_field_format     varchar(256),
	 field_flag            	number(2),
	 min_limit				varchar(256),
	 max_limit				varchar(256),
	 field_pattern			varchar(256),
	 rule_id				number(10),
	 decoder_id				number(10),
	 constraint  rip_pk_op_val_fie_op_id primary key (operand_id), 
	 constraint  rip_fk_op_val_op_id foreign key (operand_id) references rip_operand (id) on delete cascade,
	 constraint  rip_fk_op_val_rule_id foreign key (rule_id) references rip_rule(id) on delete cascade,
	 constraint  rip_fk_op_val_dec_id foreign key (decoder_id) references rip_decoder (id)
) ;

create sequence rip_rule_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_rule_tokens (
    rule_id                 number(5) not null,
    token                   varchar(256) not null,
    sequence                number(5) not null,
    token_type              number(5) not null,
    constraint  rip_pk_rule_tokens primary key (rule_id,sequence),
    constraint  rip_fk_rt_rule_id foreign key (rule_id) references rip_rule(id) on delete cascade
);

create table rip_operator
(
    id                      number(10),
    name                    varchar(256) not null,
    description             varchar(256),
    constraint  rip_pk_operator primary key (id)
);

create sequence rip_operator_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_operand_output_mapping
(
    node_id					number(10) not null,
    operand_id              number(10) not null,
    output_field_id         number(10) not null,
    constraint  rip_pk_ope_out_map primary key (node_id, operand_id, output_field_id),
    constraint  rip_fk_ope_out_map_node foreign key (node_id) references rip_node_instance_info(node_config_id) on delete cascade,
    constraint  rip_fk_ope_out_map_ope foreign key (operand_id) references rip_operand(id) on delete cascade,
    constraint  rip_fk_ope_out_map_out foreign key (output_field_id) references rip_output_field_config(id) on delete cascade
);

create table rip_br_rule
(
    rule_id 	number(10) not null,
	node_id		number(10) not null,
	constraint  rip_pk_br_rul_node_id primary key (node_id),
	constraint  rip_fk_br_ru_rule_id foreign key(rule_id) references rip_rule(id) on delete cascade,
	constraint  rip_fk_br_no_node_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade	
);

create table rip_expression
(
    expression_id 	number(10) not null,
	node_id			number(10) not null,
	lhs_operand		number(10) not null,
	constraint  rip_pk_expr_node_id primary key (node_id),
	constraint  rip_fk_expr_id foreign key(expression_id) references rip_rule(id) on delete cascade,
	constraint  rip_fk_expr_lhs_id foreign key(lhs_operand) references rip_operand(id) on delete cascade,
	constraint  rip_fk_ex_no_node_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade
);

create table rip_lpm_group
(
	id				number(10) not null,
	name  			varchar2(256),
	globalversionid number(10)  default 0,
	constraint rip_pk_lpm_gp_id primary key(id)	
);

create sequence rip_lpm_grp_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_lpm
(
	node_id			number(10) 	not null,
	operand_id 		number(10)  not null,
	group_id		number(10) 	not null,
	constraint  rip_pl_lpm_node_id primary key(node_id),
	constraint  rip_fk_lpm_node_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade,
	constraint  rip_fk_lpm_opr_id foreign key(operand_id) references rip_operand(id) on delete cascade,
	constraint  rip_fk_lpm_group_id foreign key(group_id) references rip_lpm_group(id) on delete cascade
);	

create table rip_lpm_search_replace
(
	lpm_id 			number(10) 	not null,
	search_prefix 	varchar2(20), 
	replace_prefix	varchar2(20),
	constraint  rip_uk_lpm_id_sr_pfx unique (lpm_id, search_prefix),
	constraint  rip_fk_lpm_sr_rpl_lpm_id foreign key(lpm_id) references rip_lpm_group(id) on delete cascade
);	

create table rip_tr_replace
(
    node_id         number(10) not null,
    operand_id      number(10) not null,
    start_index     number(10) ,
    is_start	    number(1)  default 0,
    end_index       number(10) ,
    is_end    		number(1)  default 0,
    constraint  rip_pk_tr_re primary key (node_id) ,
	constraint  rip_fk_tr_re_node_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade ,
	constraint  rip_fk_tr_re_oper_id foreign key(operand_id) references rip_operand(id),
	constraint  rip_fk_tr_re_stridx foreign key(start_index) references rip_operand(id),
	constraint  rip_fk_tr_re_endidx foreign key(end_index) references rip_operand(id)
);

create table rip_tr_replace_expression
(
    node_id         number(10) not null,
    token           varchar2(120) not null,
    token_type      number(1) not null,
    sequence        number(10) not null,
    constraint   rip_fk_tr_re_ex_node_id foreign key(node_id) references rip_tr_replace(node_id) on delete cascade
);

create table rip_lk_column_data
(
    table_id            number(10) not null,
    column_name         varchar2(64) not null,
    sequence            number (5) not null,
    data_type           number(5) not null,
    constraint  rip_pk_lk_co_da_ta_co primary key(table_id,column_name),
    constraint  rip_uk_lk_co_da_ta_co unique(table_id,sequence),
    constraint  rip_fk_lk_co_da_tid foreign key(table_id) references rip_lk_table(id) on delete cascade
) ;

create table rip_lk_operand_mapping
(
    operand_id          number(10) not null,
    table_id            number(10) not null,
    column_name         varchar2(32) not null,
    is_sequence_field   number(1) default 0,
    constraint  rip_pk_lk_op_op_id primary key(operand_id) ,
    constraint  rip_fk_lk_op_op_id foreign key(operand_id) references rip_operand(id) on delete cascade,
    constraint  rip_fk_lk_op_da_tid foreign key(table_id) references rip_lk_table(id) on delete cascade,
    constraint  rip_fk_lk_op_da_col foreign key(table_id, column_name) references rip_lk_column_data(table_id,column_name) on delete cascade
) ;

create table rip_lk_data
(
    node_id     number(10) not null,
    table_id    number(10) not null,
    rule_id     number(10) not null,
    constraint  rip_pk_lk_da primary key (node_id),
    constraint  rip_fk_lk_da_node_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade,
    constraint  rip_fk_lk_da_tabl_id foreign key(table_id) references rip_lk_table(id) on delete cascade,
    constraint  rip_fk_lk_da_rule_id foreign key(rule_id) references rip_rule(id) on delete cascade
) ;

create table rip_un_lk_data
(
    node_id     number(10) not null,
    table_id    number(10) not null,
    constraint  rip_pk_un_lk_da primary key (node_id),
    constraint  rip_fk_un_lk_da_node_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade,
    constraint  rip_fk_un_lk_da_tabl_id foreign key(table_id) references rip_lk_table(id) on delete cascade
) ;

create table rip_lk_assignment
(
    node_id  	number(10) not null,
    lhs_field   number(10) not null,
    rhs_field   number(10) not null,
	path_status number(1) default 0,
    constraint  rip_pk_lk_as primary key(node_id, lhs_field, path_status),
    constraint  rip_fk_lk_as_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade, 
    constraint  rip_fk_lk_as_lhs foreign key(lhs_field) references rip_operand(id) on delete cascade,
    constraint  rip_fk_lk_as_rhs foreign key(rhs_field) references rip_operand(id) on delete cascade
) ;

create sequence rip_lk_data_seq_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_un_lk_sequence
(
    node_id      	number(10) not null,
    lhs_op_id       number(10) not null,
    rhs_table_op_id number(10) not null,
    sequence        number(5) not null,
	comparison_type number(2) default 1,
	is_default      number(1) default 0,
    default_value   varchar2(256) default '',
    constraint  rip_pk_un_lk_seq primary key(node_id, lhs_op_id, rhs_table_op_id),
    constraint  rip_fk_un_lk_seq_lk_id foreign key(node_id) references rip_un_lk_data(node_id) on delete cascade,
    constraint  rip_fk_un_lk_seq_op_id foreign key(lhs_op_id) references rip_operand(id) on delete cascade,
    constraint  rip_fk_un_lk_seq_ta_fi foreign key(rhs_table_op_id) references rip_operand(id) on delete cascade
) ;

create table rip_find_replace
(
 	node_id				number(10) not null,
	operand_id			number(10) not null,
	search_string		number(10) not null,
	replace_string		number(10),
	action_count		number(10) not null,
	is_alloccurances	number(1) default 0,
	is_pattern			number(1) not null,
	is_case_sensitive	number(1) default 1,
	constraint  rip_pk_fi_re primary key (node_id),
    constraint  rip_fk_fi_re_no_id foreign key(node_id) references rip_node_instance_info(node_config_id) on delete cascade,
    constraint  rip_fk_fi_re_op_id foreign key(operand_id) references rip_operand(id) on delete cascade,
    constraint  rip_fk_fi_re_ac_cn foreign key(action_count) references rip_operand(id),
    constraint  rip_fk_fi_re_search_cn foreign key(search_string) references rip_operand(id),
    constraint  rip_fk_fi_re_replace_cn foreign key(replace_string) references rip_operand(id)
);

create table rip_logger
(
 	logger_id					number(10) not null,
	name						varchar2(64) not null,
	description					varchar2(256),
	log_file_path				varchar2(256) not null,
	raw_record_file_path		varchar2(256),
	log_file_name				varchar2(256) not null,
	raw_record_file_name		varchar2(256),
	message_format				varchar2(1024) not null,
	file_split_flag				number(2) default 0,
	globalversionid				number(10)	default 0,
	is_default_logger			number(1)	default 0,
	constraint  rip_pk_log_log_id primary key (logger_id)
);

create sequence rip_logger_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_logfile_size_info
(
	logger_id                   number(10) not null,
	globalversionid				number(10)	default 0,
	log_file_size               number(20) not null,
	constraint  rip_pk_log_log_fil_siz primary key (logger_id),
	constraint  rip_fk_log_log_fil_siz foreign key (logger_id) references rip_logger(logger_id) on delete cascade
);

create table rip_custom_component
(
 	id		number(10) not null,
	name	varchar2(64) not null,
	saveas_script varchar2(256) not null,
	export_script varchar2(256) not null,
	constraint  rip_pk_cust_comp primary key (id)
);

create table rip_node_logger_map
(
 	node_id				number(10) not null,
	logger_id			number(10) not null,
	output_state		number(2) default 0 not null,
	constraint  rip_pk_nod_log_map primary key (node_id, logger_id, output_state),
	constraint  rip_fk_nod_log_node_id foreign key (node_id) references rip_node_instance_info(node_config_id) on delete cascade,
	constraint  rip_fk_nod_log_map_log_id foreign key (logger_id) references rip_logger(logger_id) on delete cascade
);

create table rip_holiday_info
(
 	holiday_date	date not null,
	description		varchar2(256),
	constraint  rip_pk_holi_date primary key (holiday_date)
) ;

create table rip_fixed_width_marker_info
(
 	node_id				number(10) not null,
	marker_position 	number(10) not null,
    constraint  rip_pk_fix_wid_mar primary key (node_id, marker_position),
	constraint  rip_fk_fix_wid_mar_node_id foreign key (node_id) references rip_node_instance_info(node_config_id) on delete cascade
) ;

create table rip_node_group
(
 	id 			number(10) not null,                                                                    
 	name  		varchar2 (64),
	source		number(10) not null,
 	constraint  rip_pk_nod_grp_id primary key (id),
    constraint  rip_fk_nd_gr foreign key (source) references rip_datasource_info(id) on delete cascade
);

create sequence rip_node_group_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_node_group_map
(
     group_id number(10) not null,
	 node_id  number(10) not null,
	 constraint	rip_pk_nod_grp_map primary key (group_id, node_id),
	 constraint rip_fk_nod_grp_map_grp_id foreign key (group_id) references rip_node_group (id) on delete cascade,
	 constraint rip_fk_nod_grp_map_nod_id foreign key (node_id) references rip_node_instance_info(node_config_id) on delete cascade
);

create table rip_temp_impacted_items
(
	item_name varchar2(256) not null
);

create table rip_datastream_global_data
(
	version		number(10) not null
) ;

create table rip_table_sequence_map
(
       table_name              varchar2(64),
       field_name              varchar2(64),
       sequence_name   		   varchar2(64),
       constraint pk_tbl_fld_seq_mp primary key (table_name, field_name, sequence_name)
) ;

create sequence rip_reason_id increment by 1 nomaxvalue minvalue 1024 nocycle cache 20 order ;

create table rip_rec_term_reason
(
 	id					number(10) not null,
	globalversionid		number(10) not null,
	reason			    varchar2(256),
	constraint  rip_pk_rec_term_res_id primary key (id)
);

create table rip_rec_term_point_info
(
 	term_component_id	number(10) not null,
	termination_type	number(2)  not null,
	reason_id			number(10) not null,
	constraint  rip_pk_rec_term_pt_comp_id primary key (term_component_id),
	constraint  rip_fk_rec_term_pt_comp_id foreign key (term_component_id) references rip_node_instance_info(node_config_id) on delete cascade,
	constraint  rip_fk_rec_term_pt_res_id foreign key (reason_id) references rip_rec_term_reason(id) on delete cascade
);

create table rip_rec_term_end_map
(
	term_component_id            number(10) not null,
	end_component_id             number(10) not null,
	constraint rip_pk_rip_rec_term_end_map primary key (term_component_id, end_component_id),
	constraint rip_fk_rec_term_endmap_termid foreign key (term_component_id) references rip_rec_term_point_info(term_component_id) on delete cascade,
	constraint rip_fk_rec_term_endmap_endid foreign key (end_component_id) references rip_node_instance_info (node_config_id) on delete cascade
) ;

create sequence rip_file_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;

create table rip_processed_file_info
(
	id                              number(10) not null,
	file_name                       varchar(256),
	file_size                       number(20),
	file_timestamp                  date,
	file_processing_start_time      date,
	file_processing_end_time        date,
	input_record_count              number(20) default 0,
	source							number(10) not null,
	constraint rip_pk_processed_file_info primary key (id),
	constraint rip_fk_file_info_source foreign key (source) references rip_datasource_info(id) on delete cascade
) ;

create table rip_term_rec_count
(
	file_id						number(10) 			not null,
	term_component_id			number(10) 			not null,
	vdft_key					varchar2(1024) 		not null,
	rec_count					number(20) 			default 0,
	file_processing_start_time 	date,
	constraint rip_pk_rip_term_rec_count primary key (term_component_id, file_id, vdft_key),
	constraint rip_fk_term_rec_count_file_id foreign key (file_id) references rip_processed_file_info(id) on delete cascade
) ;

create table rip_rs_rec_count
(
	file_id						number(10) not null,
	rs_component_id 			number(20) not null,
	input_record_count			number(20) not null,		
	output_record_count			number(20) not null,		
	on_hold_record_count		number(20) default 0,
	file_processing_start_time	date not null,
	constraint rip_pk_rip_rs_rec_count primary key (file_id, rs_component_id),
	constraint rip_fk_rs_component_id foreign key (rs_component_id) references rip_rec_term_point_info(term_component_id) on delete cascade,
	constraint rip_fk_file_id	foreign key (file_id) references rip_processed_file_info(id) on delete cascade
) ;

create table rip_date_format 
(
	user_format		varchar2(64),
	rip_format		varchar2(64),
	constraint rip_pk_dtfmt primary key (user_format)
) ;

create sequence rip_asn1_tag_id increment by 1 nomaxvalue minvalue 1 nocycle cache 20 order ;
create table rip_asn1_tag_info
(
 	id					number(10) not null,
 	tag 				varchar2(10) not null,
	parent_id 			number(10) not null,
	node_type			number(10) not null,
	parser_id			number(10) not null,
	repeat_action  		number(10) not null,
	position			number(10) ,
	constraint rip_pk_asn1_tag_info primary key (id, parser_id),
	constraint rip_fk_asn1_tag_info foreign key (parser_id) references rip_parser_info(parser_id) on delete cascade 
) ;

create table rip_asn1_parser_config_info
(	
 	parser_id	number(10) not null,
	field_id	number(10) not null ,
	tag_id		number(10) not null,
	path		varchar2(1024) not null,
	constraint rip_pk_asn1_parser_config_info primary key (parser_id, field_id),
	constraint rip_fk_asn_par_inf_fld_id foreign key (field_id) references rip_inputfield_operand_map (field_id) on delete cascade,
	constraint rip_fk_tag_id foreign key (parser_id, tag_id) references rip_asn1_tag_info(parser_id, id) on delete cascade
) ;


create or replace view rip_current_datastream_info as
(
	select *
	from
	(
		select id, name, rank() over (partition by name order by versionid desc) as version_rank
		from rip_datasource_info
	)
	where version_rank = 1
) ;

---- function to find End component, if the output directory is same as DataAcquisition local directory..
set serveroutput on ;
create or replace function dupdirentry(dsid number)  return number as
cursor cur is select * from rip_ds_comp_config where name='directory' and id in
            (select node_config_id from rip_node_instance_info where node_type=3 and data_stream_id=dsid);
cont number;
begin
for dirCur in cur loop
    select count(*) into cont from rip_ds_comp_config where (value = dirCur.value and name='localdirectory') and
      id in (select node_config_id from rip_node_instance_info where (node_type=1 or node_type=4) and data_stream_id=dsid);

      if(cont > 0) then
        return dirCur.id;
      end if;
end loop;
return 0;
end;
/

create or replace function getlatestglobalversionid  return number as
globalversion number;
begin
	select nvl(max(version),0) into globalversion from rip_datastream_global_data ;

return globalversion ;
end;
/

quit ;

