-----------Record View Dropdown Changes ---------------------


update tasks set parent_id=30 where parent_id=12 and id in (1394,1397,1396,1411,1395,1412,1413,1654,1417,1416,1415,1398,1418,1400,1420,1401,1405,1414,1448,1551,1552,1553,1651);
update tasks set parent_id=31 where parent_id=12 and id in (1566,1662,1576,1602,1747,1611,1738,1586,1661,1449,1587);
update tasks set NAME='Account Groups' where id =1397 ;
update tasks set NAME='Subscriber Groups' where id =1417 ;

commit;
