delete from subscriber where id > 1024;
delete from ACCOUNT_RECHARGE_DETAIL where account_id > 1024;
delete from account_credit_detail where account_id > 1024;
delete from account where id > 1024;
commit;


