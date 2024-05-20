----1.3
--1
use Lab2DB
go
create proc p1 as
begin
	select *
	from Tabl_Kontinent$
end
go
execute p1

--2
go
create proc 
	p2 @n as int,
	@cnt as int output
as begin
	set @cnt = 0
	while @n > 0
	begin
		set @cnt = @cnt + 1
		set @n = @n / 10
	end
end
go
declare @cnt as int
exec p2 12323, @cnt output
print @cnt

--3
go
create proc p3
	@fam as varchar(30) = 'Горбач'
as begin
	create table TestTable (nazv varchar(30))
	insert into TestTable (nazv)
	select Nazvanie
	from Tabl_Kontinent$
	where LEFT(@fam, 1) = LEFT(Nazvanie, 1)
end
go
execute p3 default
select * from TestTable

----2.4
--1
go
create function f1
( @pl as int )
returns table
as
return(
	select *
	from Tabl_Kontinent$
	where PL < @pl
)
go
select *
from f1(10000)

--2
go
create function f2 ()
returns table as
return(
	select Nazvanie, CAST(KolNas as float)/PL as Plotn
	from Tabl_Kontinent$
)
go
select *
from f2()

----3.1
--1
use Lab2DB
go
create trigger t1 on Student
for insert as
begin
	print 'Новая запись'
end
--2
insert into Student values
('Иванова Ивана Иванычна', '2001-01-01', 'Биология', 2021)

--3
go
create trigger t2 on Student
instead of delete as
begin
	print 'Нельзя удалить'
end
--4
delete from Student
where godpost = 2020

--5
create table Archive
(
	Fio nvarchar(40),
	Data date,
	spez nvarchar(20),
	godpost int,
	deleted date
)
go
create trigger t3 on Student
for delete as
begin
	insert Archive
	select *, GETDATE() as deleted
	from deleted
end
--6
drop trigger t2
delete from Student
where godpost < 2019
select * from Archive