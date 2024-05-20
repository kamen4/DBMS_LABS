use Lab2DB;

--1
select FIO
from Student
order by LEN(FIO)

--2
select TRIM(FIO)
from Student

--3
select FIO, CHARINDEX('ов', FIO) as pos
from Student

--4
select FIO, RIGHT(spez, 2) as sp
from Student

--5
select CONCAT(
		LEFT(FIO, CHARINDEX(' ', FIO)),
		SUBSTRING(FIO, CHARINDEX(' ', FIO) + 1, 1), '. ',
		SUBSTRING(FIO, CHARINDEX(' ', FIO, CHARINDEX(' ', FIO) + 1) + 1, 1), '.'
		) as fio
from Student

--6
select distinct spez
from Student
union
select distinct REVERSE(spez)
from Student

--7
select REPLICATE('Горбач', 19) as fam

--8
select ROUND(
	ABS(
		SQUARE(SIN(PI()/2)) - COS(3*PI()/2)
	)
	, 2)

--9
select DATEDIFF(DAY, GETDATE(), '2024-07-29')

--10
select DATEDIFF(MONTH, '2004-09-02', GETDATE())

--12
select distinct spez, IIF(LEN(spez) > 6, 'длинный', 'короткий')
from Student