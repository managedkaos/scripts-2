# backing up from database to sqldump
mysqldump ‐u root ‐p[root_password] [database_name] > dumpfilename.sql

# restore from sqldump to database
mysql ‐u root ‐p[root_password] [database_name] < dumpfilename.sql
