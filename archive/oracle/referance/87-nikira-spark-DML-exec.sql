insert into field_categories(id, name, category, data_type) values(224, 'Partioned Field in Spark','SPARK_PAR_FIELD',4) ;

insert into SPARK_DATA_TYPES values (1,'int') ;
insert into SPARK_DATA_TYPES values (2,'decimal') ;
insert into SPARK_DATA_TYPES values (3,'string') ;
insert into SPARK_DATA_TYPES values (4,'datetime') ;
insert into SPARK_DATA_TYPES values (5,'raw') ;
insert into SPARK_DATA_TYPES values (6,'int') ;
insert into SPARK_DATA_TYPES values (7,'multi_valued') ;
insert into SPARK_DATA_TYPES values (8,'long') ;

insert into spark_configurations values(1,'ExecuteQuery','http://10.113.51.171:8080/spark-web/webservice',1,'class,method,argtypes,argtypes','com.subex.spark.web.service.SparkUsageQuery,executeQuery,java.lang.String,[Lcom.subex.spark.database.schema.SparkType;','query,data_types') ;
insert into spark_configurations values(2,'ExecuteQueryWithPartition','http://10.113.51.171:8080/spark-web/webservice',1,'class,method,argtypes,argtypes,argtypes,argtypes','com.subex.spark.web.service.SparkUsageQuery,executeQuery,java.lang.String,[Lcom.subex.spark.database.schema.SparkType;,int,int','query,data_types,start_index,end_index') ;
insert into spark_configurations values(3,'ExecuteTask','http://10.113.51.171:8080/spark-web/webservice',1,'class,method,argtypes','com.subex.spark.web.service.SparkTask,executeTaskSync,java.lang.String','task_name') ;
insert into spark_configurations values(4,'Login','http://10.113.51.171:8080/spark-web/webservice',0,'userName,password,appName','Root,welcome1,Spark Client','') ;
insert into spark_configurations values(5,'ExecuteAsyncTask','http://10.113.51.171:8080/spark-web/webservice',1,'class,method,argtypes','com.subex.spark.web.service.SparkTask,executeTaskASync,java.lang.String','task_name') ;
insert into spark_configurations values(6,'CheckTaskStatus','http://10.113.51.171:8080/spark-web/webservice',1,'class,method,argtypes','com.subex.spark.web.service.SparkTask,checkTaskStatus,int','task_id') ;
insert into spark_configurations values(7,'ExecuteKillTask','http://10.113.51.171:8080/spark-web/webservice',1,'class,method,argtypes','com.subex.spark.web.service.SparkTask,cancelTask,int','task_id') ;

insert into configurations(id, config_key, value) values (configurations_seq.nextval,'AI.SUBSCRIBER_BATCH_SIZE', '1') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'TIME_SMP_CALC.ACCEPTABLE_FUT_DAYS', '5') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'SPARK_CLIENT.CONN_TIME_OUT', '2') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'SPARKTASK.SLEEP_INTERVAL', '3') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'SPARKTASK.RETRY_COUNT', '600') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'TEMP_PARTIAL_REC_CONF_ID','109');
