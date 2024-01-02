use temp;


/*
Instead of insert

Let's say we create a view based out of two tables and when we insert values into the view, It fails since view is a virtual table not a table-table. That's where Instead of triggers come into help.
*/

select * from Dept;
/*
1	IT
2	Sales
3	HR
4	marketing
*/

select * from Employee;
/*
1	John Smith	1
2	James Smith	3
3	Jason hont	2
4	Karri KR	4
5	Dindu RPA	3
6	Vajja K	2
*/


create view vi_EmpDept
as 
select e.id,e.name, d.dept_name
from Employee e join Dept d
on e.deptId = d.dept_id


select * from vi_EmpDept

/* Let's try inserting values into view. */

insert into vi_EmpDept(id,name,dept_name) values(7,'Bhar Deb','marketing')

/* 
Error:

Msg 4405, Level 16, State 1, Line 40
View or function 'vi_EmpDept' is not updatable because the modification affects multiple base tables.

Completion time: 2024-01-01T21:37:13.6657519-05:00
*/

alter trigger tr_instead_insert
on vi_EmpDept
instead of insert
as
begin 
	declare @id int
	declare @name varchar(20)
	declare @deptid int
	declare @deptname varchar(10)

	select @id = id, @name=name, @deptname=dept_name from inserted

	select @deptid=dept_id from Dept where dept_name = @deptname

	insert into Employee(id,name,deptId) values (@id,@name, @deptid)

	
end


insert into vi_EmpDept(id,name,dept_name) values(7,'Bhar Deb','marketing')

select * from vi_EmpDept
/*
1	John Smith	IT
2	James Smith	HR
3	Jason hont	Sales
4	Karri KR	marketing
5	Dindu RPA	HR
6	Vajja K	Sales
7	Bhar Deb	marketing
*/

select * from Employee;

/*
1	John Smith	1
2	James Smith	3
3	Jason hont	2
4	Karri KR	4
5	Dindu RPA	3
6	Vajja K	2
7	Bhar Deb	4
*/