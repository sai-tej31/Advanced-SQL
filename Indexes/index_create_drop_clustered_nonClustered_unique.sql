-- Indexes :)

use temp;


select * from EmpSalary;

/* 
1	Bhavesh updated	IT	A	8000.00
2	Alpesh Patel	Sales	A	7000.00
3	Kalpesh Thakor	IT	B	5000.00
4	Jay Shah	Sales	B	4000.00
5	Ram Nayak	IT	C	3000.00
6	Jay Shaw	Sales	C	2000.00
*/

select * from Dept;

/*
1	IT
2	Sales
3	HR
4	marketing
*/


-- Lets create an index on EmpSalary  (Non Clustered index)

create index Ix_EmpSalary_Salary
on EmpSalary (Salary)



sp_helpindex EmpSalary

/*
Ix_EmpSalary_Salary	nonclustered located on PRIMARY	Salary
PK__EmpSalar__3213E83FA0C15DFB	clustered, unique, primary key located on PRIMARY	id
*/

-- Dropping index
drop index EmpSalary.Ix_EmpSalary_Salary; -- (table_name.index_name)

-- Create a unique Non-clustered index

create unique nonclustered index Ix_EmpSalary_nameDept
on EmpSalary (EmpName,Department);

sp_helpindex EmpSalary;

/*
Ix_EmpSalary_nameDept	nonclustered, unique located on PRIMARY	EmpName, Department
Ix_EmpSalary_Salary	nonclustered located on PRIMARY	Salary
PK__EmpSalar__3213E83FA0C15DFB	clustered, unique, primary key located on PRIMARY	id
*/

/*
NOTE:

1) dropping a clustered index created while creating a table throws an error, delete it manually from the (Database->table->indexes).
2) we can create a composite clustered index just like non-clustered.
3) unique index can be for both clustered and non-clustered.