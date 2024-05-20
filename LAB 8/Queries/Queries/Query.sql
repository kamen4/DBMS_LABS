--1
use Lab2DB
go
create view v1 as
select * from Tabl_Kontinent$
where Kontinent='Африка' and KolNas > 10000000 and PL > 50000
go
select * from v1

--2
use Lab2DB
go
create view v2
(Kontinent, PL, Plot) as
select 
	Kontinent,
	AVG(PL) as PL, 
	CAST(SUM(KolNas) as float)/SUM(PL) as Plot
from Tabl_Kontinent$
group by Kontinent

go
select * from v2

--3
use Lab5
go
create view v3
(Фамилия, Должность, Звание, Степень, МестоРаботы, КолвоЭкз)
as select
FIO, Dolgn, Zvanie, Stepen, NFak, COUNT(Tab_Nom)
from Sotrudnik s
	inner join Prepodavatel p on s.TabNom = p.TabNom_Pr
	inner join Kafedra k on s.ShifrKaf_Sotr = k.ShifrKaf
	inner join Fakultet f on k.AbFaK_Kaf = f.AFak
	inner join Ozenka o on s.TabNom = o.Tab_Nom
group by FIO, Dolgn, Zvanie, Stepen, NFak
go
select * from v3

--4
declare @v4 table
(НомерМесяца int, НазваниеМесяца nvarchar(20), КолвоДней int)
declare @t as date = '2024-01-01'
while YEAR(@t) = 2024
begin
	insert @v4
	values (MONTH(@t), DATENAME(MONTH, @t),DAY(EOMONTH(@t)))
	set @t = DATEADD(MONTH, 1, @t)
end
select * from @v4

--5
use Lab2DB
declare @v5 table
(Название varchar(50), Площадь int)
insert into @v5
select Nazvanie, PL
from Tabl_Kontinent$ t
where 100 * PL < (
	select AVG(PL)
	from Tabl_Kontinent$ t1 
	where t.Kontinent = t1.Kontinent)

select * from @v5

--6
use Lab5
select
	DATEPART(WEEK, data) as [Номер Недели],
	COUNT(distinct ReGNom) as [Количиство студентов],
	COUNT(data) as [Количество экзаменов]
	into #v6
from Ozenka
group by DATEPART(WEEK, data)

select * from #v6

--7
use Lab2DB
create table ##v7
(Название nvarchar(20), МаксПл int, МинПл int)
insert into ##v7 (Название, МаксПл, МинПл)
select Kontinent, Min(PL), Max(PL)
from Tabl_Kontinent$
group by Kontinent

select * from ##v7

--8
use Lab5;
with dop as
(
	select f.NFak, f.AFak, AVG(s.Zarplata) as srZ
	from Sotrudnik s
		inner join Kafedra k on s.ShifrKaf_Sotr = k.ShifrKaf
		inner join Fakultet f on k.AbFaK_Kaf = f.AFak
	group by f.NFak, f.AFak
)
select
	s.FIO, s.Zarplata, d.NFak, d.srZ
from Sotrudnik s
	inner join Kafedra k on s.ShifrKaf_Sotr = k.ShifrKaf
	inner join dop d on k.AbFaK_Kaf = d.AFak
where s.Zarplata < d.srZ

--9
drop view v3
drop table #v6
drop table ##v7
use Lab2DB
drop view v1
drop view v2