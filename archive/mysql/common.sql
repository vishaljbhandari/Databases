-- connect Database
mysql -u user -p


-- Use Database
USE database_name;

-- Show Current User
SELECT CURRENT_USER();
SELECT SYSTEM_USER(); -- Return the current user name and host name for the MySQL connection
SELECT USER(); -- Return the current user name and host name for the MySQL connection
-- Show Current DB
SELECT DATABASE();

-- Switch User

-- Log Out User
quit;
exit;
logout;

-- Commit data
COMMIT;

-- List Tables
SHOW TABLES;
SHOW FULL TABLES;
SHOW TABLES FROM database_name;
SHOW TABLES LIKE pattern;

-- Current System Date
SELECT SYSDATE();


