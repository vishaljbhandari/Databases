update user_options set value='1,2,3,4,5,6,7,8,17,18' where option_id = '2.SelectedFields' and user_id in ('radmin', 'nadmin', 'default') ;
commit; 
