use Lab2DB

--2
select MAX(PL) as max_PL
from Tabl_Kontinent$

--3
select MIN(KolNas) as min_KolNas
from Tabl_Kontinent$
where Kontinent='Африка'

--4
select SUM(KolNas) as sum_KolNas
from Tabl_Kontinent$
where Kontinent in ('Северная Америка', 'Южная Америка')

--5
select ROUND(AVG(CAST(KolNas as float)), 2) as SR_KolNas
from Tabl_Kontinent$
WHERE Kontinent != 'Европа';

--6
select COUNT(*) as Kol
from Tabl_Kontinent$
WHERE LEFT(Nazvanie, 1) = 'С';

--7
select COUNT(DISTINCT Kontinent) as Kol_Kontinent
from Tabl_Kontinent$

--8
select MAX(KolNas) - MIN(KolNas) as Razn
from Tabl_Kontinent$

--9
select Kontinent, COUNT(Nazvanie) as Kol_Stran
from Tabl_Kontinent$
group by kontinent
order by Kol_Stran desc;

--10
select 
LEFT(Nazvanie, 1) as Perv_Bv,
COUNT(Nazvanie) as KolStran
from Tabl_Kontinent$
group by LEFT(Nazvanie, 1)
order by Perv_Bv;

--11
select Kontinent, AVG(CAST(KolNas as float) / PL) as SR_Plotn
from Tabl_Kontinent$
group by Kontinent
having AVG(CAST(KolNas as float) / PL) > 100

--12
select
	Kontinent,
	floor(SUM(KolNas) * (
		case
			when kontinent in ('Европа', 'Азия') then 1.2
			when kontinent in ('Северная Америка', 'Африка') then 1.5
			else 1.7
		end
	)) as Sum_Nas
from Tabl_Kontinent$
group by Kontinent

--13
select Kontinent
from Tabl_Kontinent$
group by Kontinent
having MAX(KolNas) / MIN(KolNas) <= 1000

--14
select COUNT(*) as KolStran
from Tabl_Kontinent$
where Stolica is null

--15
select
	MAX(LEN(nazvanie)) as Dl_Nazv,
	MIN(LEN(nazvanie)) as Kr_Nazv,
	MAX(LEN(stolica)) as Dl_Stolica,
	MIN(LEN(stolica)) as Kr_Stolica
from Tabl_Kontinent$

--16
select
	Kontinent,
	AVG(CAST(KolNas as float)/PL) as Plotn
from Tabl_Kontinent$
where PL > 1000000
group by Kontinent
having AVG(CAST(KolNas as float)/PL) > 10
order by Plotn desc

--17
select MIN(PL)
from Tabl_Kontinent$

--18
select top 1 Nazvanie, MAX(KolNas) as Max_KolNas
from Tabl_Kontinent$
where Kontinent in ('Северная Америка', 'Южная Америка')
group by Nazvanie
order by Max_KolNas desc

--19
select ROUND(AVG(KolNas), 1) as SR_Nas
from Tabl_Kontinent$

--20
select COUNT(*)
from Tabl_Kontinent$
where right(Nazvanie, 2) = 'ан' and right(Nazvanie, 4) <> 'стан';

--21
select COUNT(distinct Kontinent) 
from Tabl_Kontinent$
where Kontinent like '[Р]%'

--22
select MAX(PL) / MIN(PL) as razn
from Tabl_Kontinent$

--23
select Kontinent, count(*) as kol
from Tabl_Kontinent$ 
where KolNas > 100000000 
group by Kontinent
order by count(*) asc;

--24
select LEN(Nazvanie) as kol_bukv, COUNT(*) as kol_stran
from Tabl_Kontinent$
group by LEN(Nazvanie)
order by kol_stran

--25
select Kontinent, FLOOR(SUM(KolNas) * 1.1) as new_KolNas
from Tabl_Kontinent$
group by Kontinent

--26
select Kontinent 
from Tabl_Kontinent$
group by Kontinent
having MAX(PL) / MIN(PL) <= 10000

--27
select AVG(LEN(Nazvanie)) as sr_len_nazv
from Tabl_Kontinent$
where Kontinent='Африка'

--28
select Kontinent, avg(KolNas / PL) as SR_PL 
from Tabl_Kontinent$ 
where KolNas > 1000000 
group by Kontinent
having avg(KolNas / PL) > 30