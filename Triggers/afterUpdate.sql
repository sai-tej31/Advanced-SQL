-- Triggers :)

use temp;


select * from trigUpdates;


/*
14	insert data :James Smith-Marketing-A-12000.00
5	delete data :Ram Nayak-IT-C-3000.00
*/

select * from EmpSalary;


/*
1	Bhavesh updated	IT	A	8000.00
2	Alpesh Patel	Sales	A	7000.00
3	Kalpesh Thakor	IT	B	5000.00
4	Jay Shah	Sales	B	4000.00
6	Jay Shaw	Sales	C	2000.00
14	James Smith	Marketing	A	12000.00
15	James Foul	Marketing	A	12000.00
*/


/*
After update Trigger
After Update trigger uses both inserted and deleted tables
*/

create trigger tr_EmpSalary_update
on EmpSalary
for update
as 
begin
	declare @id int
	declare @old_name nvarchar(20)
	declare @old_dept nvarchar(10)
	declare @old_cat char
	declare @old_sal money

	declare @new_name nvarchar(20)
	declare @new_dept nvarchar(10)
	declare @new_cat char
	declare @new_sal money

	select * into #temp from inserted   -- for multiple records first store in temp table 


	while(exists(select @id from #temp)) -- Let's process each record and delete it from temp table
	begin
		
		select top 1 @id = id,@new_name=EmpName, @new_dept=Department,@new_cat=Category, @new_sal=Salary from #temp  -- select top record
		select @old_name=EmpName, @old_dept=Department,@old_cat=Category, @old_sal=Salary from deleted where id =@id
		declare @res varchar(50)
		set @res = ''
	
		if @old_name <> @new_name
		begin
			set @res = @res+@old_name + '->' + @new_name
		end

		if @old_dept <> @new_dept
		begin
			set @res = @res+@old_dept + '->' + @new_dept
		end

		if @old_cat <> @new_cat
		begin
			set @res = @res+@old_cat + '->' + @new_cat
		end

		if @old_sal <> @new_sal
		begin
			set @res = @res+cast(@old_sal as nvarchar)+ '->' + cast(@new_sal as nvarchar)
		end

		insert into trigUpdates values(@id,'updated data :>>'+ @res)
		delete from #temp where id =@id
	end
end
-- end of after update


update EmpSalary
set Department='HumanRes' 
where Department = 'HR';


select * from trigUpdates;

/*
7	insert data :James Smith-Marketing-A-12000.00
5	delete data :Ram Nayak-IT-C-3000.00
1	updated data :>>HR->HumanRes
*/
-- 
