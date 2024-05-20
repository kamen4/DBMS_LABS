use Lab2DB;

--1
select *, 
	ROUND(CAST(PL as float) * 100 / (select SUM(PL) from Tabl_Kontinent$),
		3) as PROCENT
from Tabl_Kontinent$
order by PROCENT desc

--2
select *
from Tabl_Kontinent$
where CAST(KolNas as float)/PL >
		(select AVG(CAST(KolNas as float)/PL) from Tabl_Kontinent$)

--3
select *
from (select * from Tabl_Kontinent$ where Kontinent='������') a
where a.KolNas < 5000000

--4
select *,
	ROUND(CAST(PL as float) * 100/ (
		select SUM(PL)
		from Tabl_Kontinent$ b
		where a.Kontinent=b.Kontinent), 3) as PROCENT
from Tabl_Kontinent$ a
order by PROCENT desc

--5
select *
from Tabl_Kontinent$ a
where PL > (
	select AVG(PL)
	from Tabl_Kontinent$ b 
	where a.Kontinent = b.Kontinent)

--6
select *
from Tabl_Kontinent$
where Kontinent in (
	select Kontinent 
	from Tabl_Kontinent$
	group by Kontinent
	having AVG(CAST(KolNas as float)/PL) > (
		select AVG(CAST(KolNas as float)/PL)
		from Tabl_Kontinent$))

--7
select *
from Tabl_Kontinent$
where Kontinent='����� �������' and KolNas > all (
	select KolNas
	from Tabl_Kontinent$
	where Kontinent='������')

--8
select *
from Tabl_Kontinent$
where Kontinent='������' and KolNas > any (
	select KolNas
	from Tabl_Kontinent$
	where Kontinent='����� �������')

--9
select *
from Tabl_Kontinent$
where Kontinent='������' and exists (
	select *
	from Tabl_Kontinent$
	where Kontinent='������' and PL>2000000)

--10
select *
from Tabl_Kontinent$
where Kontinent=(
	select Kontinent
	from Tabl_Kontinent$
	where Nazvanie='�����')

--11
select *
from Tabl_Kontinent$
where KolNas<=(
	select KolNas
	from Tabl_Kontinent$
	where Nazvanie='�����')

--12
select Nazvanie
from Tabl_Kontinent$
where KolNas = (
	select MAX(KolNas)
	from Tabl_Kontinent$
	where PL in (
			select MIN(PL)
			from Tabl_Kontinent$
			group by Kontinent))
