DECLARE
	max_id number ;
BEGIN
	for record in (select tr_id as tr_id, key as key from translations group by tr_id, key having count(*) > 1)
	LOOP
		select max(id) into max_id from translations where tr_id = record.tr_id and key = record.key ;
	   	delete from translations where tr_id = record.tr_id and key = record.key and id <> max_id ;
	END LOOP ;  
	commit;
END;
/
