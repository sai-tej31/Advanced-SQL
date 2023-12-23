use temp;

select * from EmpSalary;

/*
1	Bhavesh Patel	IT	A	8000.00
2	Alpesh Patel	Sales	A	7000.00
3	Kalpesh Thakor	IT	B	5000.00
4	Jay Shah	Sales	B	4000.00
5	Ram Nayak	IT	C	3000.00
6	Jay Shaw	Sales	C	2000.00
*/


-- Create a view from EmpSalary to get all the IT employee details
create view ITEmp
as 
select * from EmpSalary
where Department = 'IT'


select * from ITEmp;

/*
1	Bhavesh Patel	IT	A	8000.00
3	Kalpesh Thakor	IT	B	5000.00
5	Ram Nayak	IT	C	3000.00
*/


-- Create a view from EmpSalary to restrict row and columns
create view Empgroups
as 
select Department, count(*) as emp_num from EmpSalary
group by Department

select * from Empgroups

/*
IT	3
Sales	3
*/


-- Updating the view updates the table 
update ITEmp
set EmpName = 'Bhavesh updated' where id =1

select * from ITEmp

/*
1	Bhavesh updated	IT	A	8000.00
3	Kalpesh Thakor	IT	B	5000.00
5	Ram Nayak	IT	C	3000.00
*/

select * from EmpSalary

/*
1	Bhavesh updated	IT	A	8000.00
2	Alpesh Patel	Sales	A	7000.00
3	Kalpesh Thakor	IT	B	5000.00
4	Jay Shah	Sales	B	4000.00
5	Ram Nayak	IT	C	3000.00
6	Jay Shaw	Sales	C	2000.00
*/


sp_helptext Empgroups;

/*
  
create view Empgroups  
as   
select Department, count(*) as emp_num from EmpSalary  
group by Department

*/