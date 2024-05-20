use Lab2DB

-- 1
select fio,
	data,
	spez,
	godpost
from Student
where godpost > 2018

--2
select fio,
	data,
	spez,
	godpost
from Student
where spez='Физика'

--3
select *
from Student
where spez!='Химия'

--4
select fio,
	data,
	spez,
	godpost
from Student
where (godpost>2019) and (spez='Математика')

--5
select fio,
	data,
	spez,
	godpost
from Student
where
	(godpost>2016) and (spez='Математика')
	or
	(godpost>2018) and (spez='Физика')

--6
select *
from Student
where godpost between 2019 and 2022

--7
select *
from Student
where data between '2001-01-01' and '2005-12-09'

--8
select *
from Student
where data between '2001-01-01' and '2005-12-09'
order by Fio

--9
select *
from Student
where fio like 'м%'

--10
select *
from Student
where spez like '_и%'

--11
select *
from Student
where Fio like '_[лем]%'

--12
select fio
from Student
where Fio like '[м-с]%'

--13
select fio
from Student
where Fio like '[^м-с,^Б]%'

--14
select *
from Student
where spez in ('математика', 'физика')

