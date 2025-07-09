-- Query for searching database tables and columns in SQL Server. Adapt as needed.
SELECT TABLE_SCHEMA, 
       TABLE_NAME, 
       COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE COLUMN_NAME LIKE '%acct%'
