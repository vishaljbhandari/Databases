update tasks set LINK=(select '/vpmn_info/list/' || id ||'?fetch_records=false;/record_view/list/'|| id from record_view_configs where id = 49) where  PACKAGE_IDS='0,4' and LINK like '/vpmn_info/list/%?fetch_records=false' ;
commit;
