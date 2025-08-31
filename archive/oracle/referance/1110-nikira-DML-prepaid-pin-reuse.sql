insert into record_configs values(502, 'PIN_REUSE', 'PIN Reuse',1, '', 1,',', '', 0, 0, 0,0);                    
                                                                                                                                                             
insert into field_configs values(field_configs_seq.nextval, 502, 'PIN Number'          , 'PIN_NUMBER'           , 1     , 0, 1, '', 3, '', 1    , '', ''    , 1, 150        , 0  , '', '', '', 0, 0); 
insert into field_configs values(field_configs_seq.nextval, 502, 'Phone Number'        , 'PHONE_NUMBER'         , 2     , 0, 1, '', 3, '', 2    , '', ''    , 1, 150        , 0     , '', '', '', 0, 0);
insert into field_configs values(field_configs_seq.nextval, 502, 'Amount'              , 'AMOUNT'               , 3     , 0, 1, '', 2, '', 3    , '', ''    , 1, 150        , 0     , '', '', '', 0, 0);
insert into field_configs values(field_configs_seq.nextval, 502, 'Network'             , 'NETWORK_ID'           , 4     , 0, 0, '', 1, '', 4    , '', 10    , 1, 150        , null  , '', '', '', 0, 0);
insert into field_configs values(field_configs_seq.nextval, 502, 'Status'              , 'STATUS'               , 5     , 0, 1, '', 1, '', 5    , '', ''    , 1, 150        , null  , '', '', '', 0, 0);
insert into field_configs values(field_configs_seq.nextval, 502, 'Day of Year'         , 'DAY_OF_YEAR'          , 6     , 0, 1, '', 1, '', 6    , '', ''    , 1, 150        , null  , '', '', '', 0, 0);
insert into field_configs values(field_configs_seq.nextval, 502, 'Time stamp'          , 'TIME_STAMP'           , 7     , 0, 1, '', 4, '', 7    , '', ''    , 1, 150        , null  , '', '', '', 0, 0);
insert into field_configs values(field_configs_seq.nextval, 502, 'Credit Card'          , 'CREDIT_CARD'           , 8     , 0, 1, '', 3, '', 8    , '', ''    , 1, 150        , 0  , '', '', '', 0, 0);

insert into offline_readiness values(offline_readiness_seq.nextval, 2, to_date('01-01-1970','dd-mm-yyyy'), to_date('01-01-1970','dd-mm-yyyy'),to_date('01-01-1970','dd-mm-yyyy'),to_date('01-01-1970','dd-mm-yyyy'),to_date('01-01-1970','dd-mm-yyyy'),1,1,1);

commit;


