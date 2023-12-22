# Stored Procedure

- Stored procedure consists a batch of SQL statements as a group and stored in database (Programmability -> Stored procedures). we can execute stored procedures by using just the name of stored procedure.
- Stored procedure accepts parameters (like arguments) as input, dynamic parameters are helpful to execute without changing the queries.
- Stored Procedures also supports output parameters.


## Advantages

-  stored procedure after execution, creates a plan and stores it in the buffer pool, this plan can be reused whenevr the stored procedure is executed. But, if there is any small change in the Adhoc query (even a space) it will rerun the SQL statement instead of reusing the plan, where as stored procedure resues the plan. Thus, **Performance is improved.**
- Stored procedures can be executed by anyone without needing write the code (**Code reusability**).
- Stored procedures can be **encrypted**, eliminating the threat of direct access to the code. Also, they help avoid SQL injection attacks.
- Stored procedures when executed, only name of the stored procedure is passed over the network instead of the SQL statements which **reduces network traffic**.
- Code in Stored procedures can be easily changed using **ALTER PROCEDURE**.


<!-- 
## Diff b/n stored procedure and functions -->

