/* Show the state of rows in table on 15 minutes before          */
/* PS: Replace <TABLE_NAME> and '15' for prefered table and time */
/* This can save your life ;)                                    */

SELECT *
  FROM <TABLE_NAME>
AS OF TIMESTAMP SYSTIMESTAMP - INTERVAL '15' MINUTE
