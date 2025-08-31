CREATE OR REPLACE FUNCTION GetHighValueAsString (
    p_TableName     IN VARCHAR2,
    p_PatitionName  IN VARCHAR2
) RETURN VARCHAR2
IS
   v_LongVal LONG;
BEGIN
    SELECT HIGH_VALUE INTO v_LongVal
      FROM USER_TAB_PARTITIONS
     WHERE TABLE_NAME = p_TableName
       AND PARTITION_NAME = p_PatitionName;

    RETURN substr(v_LongVal, 1, 255);
END GetHighValueAsString;
/

CREATE OR REPLACE PROCEDURE PopulatePartitionLookup
IS
	CURSOR GET_TNAMES IS SELECT * FROM RECORD_CONFIGS WHERE IS_PARTITIONED=1;
	RC GET_TNAMES%rowtype;
BEGIN
	FOR RC IN GET_TNAMES 
	LOOP  
		dbms_output.put_line('Inserting into PARTITION_LOOKUP for table : '||RC.tname); 
		
		MERGE INTO PARTITION_LOOKUP P USING
		(
		 SELECT TABLE_NAME, PARTITION_NAME, GetHighValueAsString(TABLE_NAME, PARTITION_NAME) HIGH_VALUE FROM USER_TAB_PARTITIONS U WHERE U.TABLE_NAME = RC.TNAME
		) U
		ON
		(
         P.TABLE_NAME = U.TABLE_NAME AND
		 P.PARTITION_NAME = U.PARTITION_NAME
		)
		WHEN NOT MATCHED THEN
			INSERT VALUES
			(
				U.TABLE_NAME, U.PARTITION_NAME, U.HIGH_VALUE
			);

		COMMIT;
	END LOOP; 
END PopulatePartitionLookup;
/

exec PopulatePartitionLookup;

CREATE OR REPLACE FUNCTION GetPartitionName (
 	record_config_id 	IN NUMBER,
	day_of_year			IN NUMBER
		) RETURN VARCHAR2
IS
	tname varchar2(255) := '';
	partitionType varchar2(255) := '';
	partitionName varchar2(255) := '';
BEGIN
	select tname into tname from record_configs where id = record_config_id;
	select PARTITIONING_TYPE into partitionType from user_part_tables where TABLE_NAME = tname;
	IF partitionType = 'LIST' THEN
		select partition_name into partitionName from partition_lookup where table_name = tname and instr(', '||days_of_year||', ', ', '||to_char(day_of_year)||', ')>0;
	ELSIF partitionType = 'RANGE' THEN
		select partition_name into partitionName from partition_lookup where table_name = tname and instr(', '||days_of_year||', ', ', '||to_char(day_of_year+1)||', ')>0;
	END IF;
	return partitionName;
END GetPartitionName;
/


CREATE OR REPLACE FUNCTION GetTruncatedPartitionKey (
 	record_config_id 	IN NUMBER,
	day_of_year			IN NUMBER
		) RETURN number
IS
	partitionName varchar2(255) := '' ;
	key number := 0 ;
BEGIN

	select GetPartitionName(record_config_id,day_of_year) into partitionName from dual ;
	select TRIM(leading 'P' from partitionName) into partitionName from dual ;
	select to_number(partitionName) into key from dual ;
	return key ;
END GetTruncatedPartitionKey;
/

commit;
