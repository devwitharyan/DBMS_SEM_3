---1---

begin try
declare @id int
declare @name varchar(200) ='hello'
set @id = convert(int ,@name)
end try

begin catch
	select ERROR_NUMBER() as ErrorNumber,
	ERROR_STATE() as ErrorState,
	ERROR_SEVERITY() as ErrorSeverity,
	ERROR_LINE() as ErrorLine,
	ERROR_PROCEDURE() as ErrorProcedure,
	ERROR_MESSAGE() as ErrorMessage
end catch

---2---

begin try
declare @id int= 5/0;
end try

begin catch
	select ERROR_NUMBER() as ErrorNumber,
	ERROR_STATE() as ErrorState,
	ERROR_SEVERITY() as ErrorSeverity,
	ERROR_LINE() as ErrorLine,
	ERROR_PROCEDURE() as ErrorProcedure,
	ERROR_MESSAGE() as ErrorMessage
end catch

---3---

begin try
declare @age int=11;
if(@age<14)
begin
	raiserror('child labour is not legal',16,1)
end
end try

begin catch
	select ERROR_NUMBER() as ErrorNumber,
	ERROR_STATE() as ErrorState,
	ERROR_SEVERITY() as ErrorSeverity,
	ERROR_LINE() as ErrorLine,
	ERROR_PROCEDURE() as ErrorProcedure,
	ERROR_MESSAGE() as ErrorMessage
end catch


---11.4---

create table A_Student
(
	ID int,
	name varchar(50),
	age int check(age > 18)
)

