
/* Stored Procedure with Parameters */

create procedure test_with_params
@user int    -- for default params @user int = 1
as
begin 
	select * from spending
	where user_id = @user
end


exec test_with_params @user = 1;

/*
1	2019-07-01	mobile	100
1	2019-07-01	desktop	100
*/


/* Stored Procedure with output Parameters, also changing the same sp with alter statement*/

alter procedure test_with_params
@user int ,   -- for default params @user int = 1
@total_amount int output
as
begin 
	set nocount on;
	select @total_amount = isnull(sum(amount),0) from spending
	group by user_id
	having user_id = @user
end

declare @amount int
exec test_with_params @user=1, @total_amount= @amount out

select @amount as total_sum;

-- 200

/* Encrypting Stored Procedure*/

create procedure ProcedureName
with encryption
as
begin
	select * from spending -- write SQL statements
end



/* sp_help */
sp_help test -- details about sp

-- Test	dbo	stored procedure	2023-12-21 20:04:27.880

sp_helptext test -- SQL statements as text


/*
create procedure Test  
as  
begin  
 select * from spending  
end
*/

sp_depends test --details about dependencies

/*
dbo.spending	user table	no	yes	user_id
dbo.spending	user table	no	yes	spend_date
dbo.spending	user table	no	yes	platform
dbo.spending	user table	no	yes	amount
*/