set feedback off

delete from rip_configuration ;

insert into rip_configuration (key, value) values ('LOG_FILES_DIRECTORY', '$REVMAXHOME/log') ;
insert into rip_configuration (key, value) values ('SPLIT_FILE_SIZE_RECORD_LOGGER', '4294967296') ;
insert into rip_configuration (key, value) values ('PROCESS_SLEEP_TIME', '60') ;
insert into rip_configuration (key, value) values ('PROCESS_CYCLE_COUNT', '0') ;
insert into rip_configuration (key, value) values ('INPUT_SUCCESS_DIR_NAME', 'success') ;
insert into rip_configuration (key, value) values ('OUTPUT_SUCCESS_DIR_NAME', 'success') ;
insert into rip_configuration (key, value) values ('FILE_READ_BUFFER_SIZE', '4095') ;

-- ENABLE_DEFAULT_LOGGING flag is used to log Default TerminationPoint Info along with Translator Log Info. When it is 'off' no Info is Logged.
insert into rip_configuration (key, value) values ('ENABLE_DEFAULT_LOGGING', 'off') ;

-- DEFAULT_LOGFILE_PATH flag specifies the path where all the default loggers created.
insert into rip_configuration (key, value) values ('DEFAULT_LOGFILE_PATH', '$REVMAXHOME/log/') ;

/*  ENABLE_DEFAULT_REJECTED_LOGGING flag can take any one of the four values:- rejected,ignored,both,none
	when made rejected Datastream will log rejected records info 
	when made ignored  Datastream will log ignored records info
	when made both Datastream will log both rejected and ignored records info
	when made none basically no log is created related to ignored and rejected records
NOTE:- all the logs are created under DEFAULT_LOGFILE_PATH configuration key value directory */
insert into rip_configuration (key, value) values ('ENABLE_DEFAULT_REJECTED_LOGGING', 'both') ;
insert into rip_configuration (key, value) values ('SPLIT_REJECTED_RECORD_LOG_BASED_ON_INPUT_FILE', 'no') ;


delete from rip_operator ;

insert into rip_operator(id, name, description ) values (1, '&&', 'AND') ;
insert into rip_operator(id, name, description ) values (2, '||', 'OR') ;
insert into rip_operator(id, name, description ) values (3, 'IN', 'IN') ;
insert into rip_operator(id, name, description ) values (4, '>', 'Greater Than') ;
insert into rip_operator(id, name, description ) values (5, '<', 'Lesser Than') ;
insert into rip_operator(id, name, description ) values (6, '>=', 'Greater Than Equal To') ;
insert into rip_operator(id, name, description ) values (7, '<=', 'Lesser Than Equal To') ;
insert into rip_operator(id, name, description ) values (8, '==', 'Equal') ;
insert into rip_operator(id, name, description ) values (9, '!=', 'Not Equal') ;
insert into rip_operator(id, name, description ) values (10, 'BW', 'Begins With') ;
insert into rip_operator(id, name, description ) values (11, 'NBW', 'Not Begins With') ;
insert into rip_operator(id, name, description ) values (12, 'NIN', 'Not IN') ;
insert into rip_operator(id, name, description ) values (13, 'PIN', 'Prefix IN') ;
insert into rip_operator(id, name, description ) values (14, 'PNIN', 'Prefix Not IN') ;
insert into rip_operator(id, name, description ) values (17, 'CONTAINS', 'Contains IN') ;
insert into rip_operator(id, name, description ) values (18, 'REGEXP', 'RegExp Match') ;

delete from rip_holiday_info ;

insert into rip_holiday_info (holiday_date, description) values (to_date('2004-01-26 01:00:00','yyyy-mm-dd hh:mi:ss'), 'Republic Day') ;
insert into rip_holiday_info (holiday_date, description) values (to_date('2004-08-15 01:00:00','yyyy-mm-dd hh:mi:ss'), 'Independence Day') ;
insert into rip_holiday_info (holiday_date, description) values (to_date('2004-12-25 01:00:00','yyyy-mm-dd hh:mi:ss'), 'Christmas Day') ;

insert into rip_operand(id, name, description, position, data_type, source, operand_type, value)
	values(65000, 'GLOBAL_FILE_NAME_FIELD', 'This field represents File Name under process', 0, 3, NULL, 5, 'here-file-name-will-come') ;
insert into rip_operand(id, name, description, position, data_type, source, operand_type, value)
	values(65003, 'GLOBAL_DS_NAME_FIELD', 'This field represents name of the datastream under execution', 0, 3, NULL, 5, 'here-ds-name-will-come') ;
insert into rip_operand(id, name, description, position, data_type, source, operand_type, value)
	values(65004, 'GLOBAL_VDFT_KEY_FIELD', 'This field holds vdft key for every record under execution', 0, 3, NULL, 5, '') ;
insert into rip_operand(id, name, description, position, data_type, source, operand_type, value)
	values(65005, 'GLOBAL_SYS_DATE_FIELD', 'This field holds current system date and time', 0, 4, NULL, 5, '') ;

-- CONST CONFIG VALUE OPERANDS+
insert into rip_operand(id, name, description, position, data_type, source, operand_type, value)
	values(65001, '#MINUS_1', 'This Operand represents -1', 0, 1, NULL, 7, '-1') ;
insert into rip_operand(id, name, description, position, data_type, source, operand_type, value)
	values(65002, '#ZERO', 'This Operand represents 0', 0, 1, NULL, 7, '0') ;
-- CONST CONFIG VALUE OPERAND-

delete from rip_datastream_global_data ;
insert into rip_datastream_global_data values (0) ;

insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_DATASOURCE_INFO', 'ID', 'RIP_DATA_STREAM_SEQ_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_LPM_GROUP', 'ID', 'RIP_LPM_GRP_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_NODE_GROUP', 'ID', 'RIP_NODE_GROUP_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_NODE_INSTANCE_INFO', 'NODE_CONFIG_ID', 'RIP_NODE_CONFIG_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_OPERAND', 'ID', 'RIP_OPERAND_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_OUTPUT_FIELD_GROUP', 'ID', 'RIP_OUTPUT_FIELD_GRP_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_OUTPUT_FIELD_CONFIG', 'ID', 'RIP_OUTPUT_FIELD_CONF_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_RULE', 'ID', 'RIP_RULE_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_SPECIAL_LIST', 'ID', 'RIP_SPECIAL_LIST_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_LOGGER', 'LOGGER_ID', 'RIP_LOGGER_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_REC_TERM_REASON', 'ID', 'RIP_REASON_ID') ;
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_LK_TABLE','ID','RIP_LK_TABLE_SEQ_ID');
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_INPUTFIELD_OPERAND_MAP','FIELD_ID','RIP_INPUT_FIELD_ID');
insert into rip_table_sequence_map (table_name, field_name, sequence_name) values ('RIP_PARSER_INFO','PARSER_ID','RIP_PARSER_ID');



insert into rip_rec_term_reason(id, globalversionid, reason) values(1, 0, '') ;

insert into rip_decoder(id, decoder_type, name) values (0, 0, 'None') ;
insert into rip_decoder(id, decoder_type, name) values (1, 1, 'BCD') ;
insert into rip_decoder(id, decoder_type, name) values (2, 2, 'TBCD') ;
insert into rip_decoder(id, decoder_type, name) values (3, 3, 'Hex String') ;
insert into rip_decoder(id, decoder_type, name) values (4, 4, 'Hex to Decimal') ;
insert into rip_decoder(id, decoder_type, name) values (5, 5, 'Duration Decoder') ;
insert into rip_decoder(id, decoder_type, name) values (6, 6, 'UTC Time Decoder') ;

delete from rip_date_format ;
insert into rip_date_format (user_format, rip_format) values ('dd-mm-yy', '%d-%m-%y') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mm-yyyy', '%d-%m-%Y') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mm/yy', '%d/%m/%y') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mm/yyyy', '%d/%m/%Y') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mm-yy hh24:mi:ss', '%d-%m-%y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mm-yy hh:mi:ss AMPM', '%d-%m-%y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mm-yyyy hh24:mi:ss', '%d-%m-%Y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mm-yyyy hh:mi:ss AMPM', '%d-%m-%Y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mm/yy hh24:mi:ss', '%d/%m/%y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mm/yy hh:mi:ss AMPM', '%d/%m/%y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mm/yyyy hh24:mi:ss', '%d/%m/%Y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mm/yyyy hh:mi:ss AMPM', '%d/%m/%Y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mon-yy', '%d-%b-%y') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mon-yyyy', '%d-%b-%Y') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mon/yy', '%d/%b/%y') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mon/yyyy', '%d/%b/%Y') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mon-yy hh24:mi:ss', '%d-%b-%y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mon-yy hh:mi:ss AMPM', '%d-%b-%y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mon-yyyy hh24:mi:ss', '%d-%b-%Y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd-mon-yyyy hh:mi:ss AMPM', '%d-%b-%Y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mon/yy hh24:mi:ss', '%d/%b/%y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mon/yy hh:mi:ss AMPM', '%d/%b/%y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mon/yyyy hh24:mi:ss', '%d/%b/%Y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('dd/mon/yyyy hh:mi:ss AMPM', '%d/%b/%Y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('mm-dd-yy', '%m-%d-%y') ;
insert into rip_date_format (user_format, rip_format) values ('mm-dd-yyyy', '%m-%d-%Y') ;
insert into rip_date_format (user_format, rip_format) values ('mm/dd/yy', '%m/%d/%y') ;
insert into rip_date_format (user_format, rip_format) values ('mm/dd/yyyy', '%m/%d/%Y') ;
insert into rip_date_format (user_format, rip_format) values ('mm-dd-yy hh24:mi:ss', '%m-%d-%y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('mm-dd-yy hh:mi:ss AMPM', '%m-%d-%y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('mm-dd-yyyy hh24:mi:ss', '%m-%d-%Y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('mm-dd-yyyy hh:mi:ss AMPM', '%m-%d-%Y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('mm/dd/yy hh24:mi:ss', '%m/%d/%y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('mm/dd/yy hh:mi:ss AMPM', '%m/%d/%y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('mm/dd/yyyy hh24:mi:ss', '%m/%d/%Y %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('mm/dd/yyyy hh:mi:ss AMPM', '%m/%d/%Y %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy-mm-dd', '%Y-%m-%d') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy/mm/dd', '%Y/%m/%d') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy-mm-dd hh24:mi:ss', '%Y-%m-%d %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy-mm-dd hh:mi:ss AMPM', '%Y-%m-%d %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy/mm/dd hh24:mi:ss', '%Y/%m/%d %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy/mm/dd hh:mi:ss AMPM', '%Y/%m/%d %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy-mon-dd', '%Y-%b-%d') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy/mon/dd', '%Y/%b/%d') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy-mon-dd hh24:mi:ss', '%Y-%b-%d %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy-mon-dd hh:mi:ss AMPM', '%Y-%b-%d %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy/mon/dd hh24:mi:ss', '%Y/%b/%d %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('yyyy/mon/dd hh:mi:ss AMPM', '%Y/%b/%d %I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('yymmddhh24miss', '%y %m %d %H %M %S') ;
insert into rip_date_format (user_format, rip_format) values ('yymmddhh24miss+/-hhmi', '%y %m %d %H %M %S') ;
insert into rip_date_format (user_format, rip_format) values ('yyyymmddhh24miss', '%Y %m %d %H %M %S') ;
insert into rip_date_format (user_format, rip_format) values ('yyyymmdd', '%Y %m %d') ;
insert into rip_date_format (user_format, rip_format) values ('yymmdd', '%y %m %d') ;
insert into rip_date_format (user_format, rip_format) values ('yyyymmddhh24:mi:ss', '%Y %m %d %H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('hh24miss', '%H %M %S') ;
insert into rip_date_format (user_format, rip_format) values ('hh24:mi:ss', '%H:%M:%S') ;
insert into rip_date_format (user_format, rip_format) values ('hh:mi:ss AMPM', '%I:%M:%S %p') ;
insert into rip_date_format (user_format, rip_format) values ('hhmissAMPM', '%I %M %S %p') ;

commit ;
quit ;
