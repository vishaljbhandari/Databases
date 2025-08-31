spool spark_fms_db.log;
set feedback on;

---> STREAM - Start ---- 

declare
	noi number(20) := 0 ;
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from STREAM where stm_name='FMS_Common_Streams' ;

	if IsExists = 0
	then
		select nvl((select NOI_CURRENT_NO + 1 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='Stream'), 0) into noi from dual ;

		insert into STREAM (stm_delete_fl,system_generated_fl,stm_id,stm_name,ptn_id,stm_version_id) values ('N','N', noi, 'FMS_Common_Streams', 1.0, 0.0) ;

		if noi = 0
		then
			insert into next_object_id (NOI_OBJECT_NAME, NOI_CURRENT_NO) values ('Stream', 1) ;
		else
			update next_object_id set NOI_CURRENT_NO = noi where NOI_OBJECT_NAME = 'Stream' ;
		end if;
	end if ;
end ;
/


---> STREAM - End ---- 

---> PROPERTY_INST_GROUP - Start ---- 
---> STREAM_STAGE - Start ---- 

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='ASNProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  1 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'ASNProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='ASNProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  2 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'ASNProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='ASNProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO +  1 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  1 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO +  2 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'ASN','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='ASNProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='ASN')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='AlarmClosureProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  3 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'AlarmClosureProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='AlarmClosureProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  4 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'AlarmClosureProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='AlarmClosureProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO +  3 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  2 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO +  4 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Alarm Closure','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='AlarmClosureProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='AlarmClosure')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='AlarmDenormLoadProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  5 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'AlarmDenormLoadProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='AlarmDenormLoadProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  6 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'AlarmDenormLoadProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='AlarmDenormLoadProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO +  5 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  3 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO +  6 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Alarm Denormalizer Load','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='AlarmDenormLoadProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='AlarmDenormLoad')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='CreateIndexProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  7 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'CreateIndexProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='CreateIndexProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  8 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'CreateIndexProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='CreateIndexProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO +  7 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  4 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO +  8 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Create Index','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='CreateIndexProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='CreateIndex')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='ExecuteQueuedQueryProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO +  9 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'ExecuteQueuedQueryProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='ExecuteQueuedQueryProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 10 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'ExecuteQueuedQueryProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='ExecuteQueuedQueryProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO +  9 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  5 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 10 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Execute Queued Query','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='ExecuteQueuedQueryProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='ExecuteQueuedQuery')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='HotListDestinationSummaryProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 11 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'HotListDestinationSummaryProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='HotListDestinationSummaryProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 12 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'HotListDestinationSummaryProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='HotListDestinationSummaryProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO + 11 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  6 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 12 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Generate Hot List Destination Summary','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='HotListDestinationSummaryProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='HotListDestinationSummary')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='MissMatchSummaryProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 13 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'MissMatchSummaryProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='MissMatchSummaryProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 14 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'MissMatchSummaryProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='MissMatchSummaryProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO + 13 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  7 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 14 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Generate Miss Match Summary','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='MissMatchSummaryProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='MissMatchSummary')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='PopulateAlarmLinkCDRProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 15 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'PopulateAlarmLinkCDRProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='PopulateAlarmLinkCDRProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 16 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'PopulateAlarmLinkCDRProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='PopulateAlarmLinkCDRProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO + 15 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  8 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 16 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Populate Alarm Link CDRs','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='PopulateAlarmLinkCDRProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='PopulateAlarmLinkCDRs')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='RTFAlarmDenormLoadProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 17 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'RTFAlarmDenormLoadProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='RTFAlarmDenormLoadProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 18 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'RTFAlarmDenormLoadProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='RTFAlarmDenormLoadProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO + 17 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO +  9 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 18 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'RTF Alarm Denormalizer Load','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='RTFAlarmDenormLoadProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='RTFAlarmDenormLoad')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='RTFArchiveDataProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 19 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'RTFArchiveDataProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='RTFArchiveDataProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 20 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'RTFArchiveDataProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='RTFArchiveDataProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO + 19 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO + 10 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 20 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'RTF Archive Data','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='RTFArchiveDataProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='RTFArchiveData')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='RollOverPartitionProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 21 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'RollOverPartitionProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='RollOverPartitionProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 22 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'RollOverPartitionProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='RollOverPartitionProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO + 21 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO + 11 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 22 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Roll-Over Partition','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='RollOverPartitionProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='RollOverPartition')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

declare
	IsExists number(20) := 0 ;
begin
	select count(*) into IsExists from PROPERTY_INST_GROUP where pig_name='SyncReferenceTableProperties' ;

	if IsExists = 0
	then
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 23 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'SyncReferenceTableProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='SyncReferenceTableProperties'),'N',1.0) ;
		insert into PROPERTY_INST_GROUP (pig_id,pig_version_id,pig_name,system_generated_fl,pdg_id,pig_delete_fl,ptn_id) values ((select NOI_CURRENT_NO + 24 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),0.0,'SyncReferenceTableProperties','N',(select PDG_ID from property_dfn_group where PDG_KEY='SyncReferenceTableProperties'),'N',1.0) ;
		insert into STREAM_STAGE (sts_configured_pig_id,sts_id,sts_process_chain_fl,sts_status,sts_running_pig_id,sts_name,system_generated_fl,sts_delete_fl,stm_id,pdg_id,sts_version_id,ptn_id,sst_id) values ((select NOI_CURRENT_NO + 23 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),(select NOI_CURRENT_NO + 12 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='StreamStage'),'N','Paused',(select NOI_CURRENT_NO + 24 as id from NEXT_OBJECT_ID where NOI_OBJECT_NAME='PropertyInstGroup'),'Sync Reference Table','N','N',(select stm_id from stream where stm_name='FMS_Common_Streams'),(select PDG_ID from property_dfn_group where PDG_KEY='SyncReferenceTableProperties'),0.0,1.0,(select sst_id from stream_stage_type where sst_code='SyncReferenceTable')) ;

		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 2 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
		update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 1 where NOI_OBJECT_NAME = 'StreamStage' ;
	end if ;
end ;
/

--update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 24 where NOI_OBJECT_NAME = 'PropertyInstGroup' ;
--update next_object_id set NOI_CURRENT_NO = NOI_CURRENT_NO + 12 where NOI_OBJECT_NAME = 'StreamStage' ;
---> STREAM_STAGE - End ---- 
---> PROPERTY_INST_GROUP - End ---- 

commit;
spool off;

