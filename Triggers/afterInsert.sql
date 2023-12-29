-- Triggers :)

use temp;

-- Let's create a new table for updates once triggered

create table trigUpdates(
id int,
change varchar(60)
)

select * from trigUpdates;

select * from EmpSalary;


/*
1	Bhavesh updated	IT	A	8000.00
2	Alpesh Patel	Sales	A	7000.00
3	Kalpesh Thakor	IT	B	5000.00
4	Jay Shah	Sales	B	4000.00
5	Ram Nayak	IT	C	3000.00
6	Jay Shaw	Sales	C	2000.00
*/

-- After triggers

-- Insert Trigger
-- beginning of after insert
create trigger tr_EmpSalary_Insert
on EmpSalary
for insert
as 
begin
	declare @id int
	declare @name nvarchar(20)
	declare @dept nvarchar(10)
	declare @cat char
	declare @sal money

	select @id=id,@name=EmpName, @dept=Department,@cat=Category, @sal=Salary from inserted

	insert into trigUpdates values(@id,'insert data :'+ @name + '-'+@dept+'-'+ @cat + '-'+cast(@sal as nvarchar))

end
-- end of insert after insert
insert into EmpSalary values('James Smith','Marketing','A',12000);


select * from trigUpdates;

/*
7	insert data :James Smith-Marketing-A-12000.00
*/


-- 
