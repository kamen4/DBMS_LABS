use Lab2DB

-- 5.1
select *
from Products
order by ProductName asc;

select *
from Products
order by ProductName desc;

select *
from Products
order by Manufacturer asc, ProductName desc;

-- 5.2
select ProductName,
ProductCount * Price as TotalSum
from Products
order by TotalSum;

-- 5.3
select 
	ProductName,
	Price,
	ProductCount
from Products
order by ProductCount * Price;