use Lab2DB

select *
from Products

--1
select *
from Products
where Manufacturer='Samsung'

--2
select *
from Products
where price > 45000

--3
select *
from Products
where Price * ProductCount > 200000

--4
select *
from Products
where Manufacturer='Samsung' and Price>50000

--5
select *
from Products
where Manufacturer='Samsung' or Price>50000

--6
select *
from Products
where Manufacturer<>'Samsung'

--7
select *
from Products
where ProductCount>2 and Price>30000
	or Manufacturer='Samsung' 

--8
select *
from Products
where Manufacturer in ('Samsung', 'Xiaomi', 'Huawei')

--9
select *
from Products
where Price between 20000 and 40000

--10
select *
from Products
where Price * ProductCount between 100000 and 200000