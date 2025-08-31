update field_categories set category = category ||' CHANGE_EVENT'  where name = 'Product Type';
commit ;
