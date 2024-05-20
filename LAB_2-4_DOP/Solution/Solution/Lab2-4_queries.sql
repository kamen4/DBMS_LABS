use Transport;

---- 3. С помощью языка T-SQL выполнить следующие запросы
-- вывести все данные из таблиц
select * from depot
select * from depot_transport
select * from driver
select * from route
select * from route_stop
select * from stop
select * from transport

-- вывести определенные данные, отсортированные в алфавитном порядке по определенному полю 
select name, phone
from driver
order by name asc

-- вывести определенные данные, отсортированные в обратном алфавитном порядке по двум полям
select type, brand, gov_num 
from transport
order by type desc, brand desc

-- создать вычисляемое поле, и вывести данные, убрав дубликаты
select distinct categories, LEN(categories) as cat_num
from driver

-- вывести 30% строк
select top 30 percent *
from stop

-- вывести первые 5 строк
select top 5 *
from driver

-- вывести строки начиная с 4 строки по 7 строку, отсортированные в обратном порядке
select *
from driver
order by name desc
offset 3 rows
fetch next 4 rows only

-- отсортировать данные, используя в качестве критерия сортировки сложно выражение на основе столбцов
select *
from driver
order by LEN(categories) asc, name asc

-- запрос на выборку с добавлением SELECT into
select [contact] = name + ' ' + phone,
	categories
into driver_info
from driver
select * from driver_info


---- 4. С помощью языка T-SQL написать и выполнить 7 запросов на фильтрацию данных
--   с использованием в запросах операторов сравнения, логических операторов
-- 1
select *
from driver
where name like '[d]%'

-- 2
select *
from driver
where LEN(categories)=2

-- 3
select *
from transport
where (type='Bus' or type='Tram') and capacity>=40

-- 4
select *
from transport
where gov_num like '%[1]' or brand='Mercedese'

-- 5
select *
from stop
where x*y>10000 or x<=30

-- 6
select *
from stop
where x between 30 and 120

-- 7
select *
from transport
where type in ('Tram', 'Trolleybus')


---- 5. Переименуйте одну из таблиц вашей БД
--exec sp_rename 'driver_information', 'driver_info'
exec sp_rename 'driver_info', 'driver_information'


---- 6. Добавьте по две записи в каждую из таблиц вашей БД
-- Добавление записей в таблицу depot
insert into depot (number) values
(11),
(12);

-- Добавление записей в таблицу stop
insert into stop (name, x, y) values
('Stop 11', 210, 220),
('Stop 12', 230, 240);

-- Добавление записей в таблицу route
insert into route (number) values
(11),
(12);

-- Добавление записей в таблицу transport
insert into transport (route_id, type, gov_num, brand, capacity, bus_num) values
(11, 'Bus', '1234AB-7', 'МАЗ', 60, 1011),
(12, 'Tram', '5678CD-7', 'МАЗ', 10, 1012);

-- Добавление записей в таблицу driver
insert into driver (transport_id, name, phone, categories) values
(13, 'Anton Bosko', '+375333812056', 'B'),
(14, 'Haley Smith', '+375654321099', 'B');

-- Добавление записей в таблицу depot_transport
insert into depot_transport (depot_id, transport_id) values
(11, 13),
(12, 14);

-- Добавление записей в таблицу route_stop
insert into route_stop (route_id, stop_id, stop_number) values
(11, 11, 1),
(11, 12, 2);


---- 7. Измените одну из таблиц вашей БД:
-- добавьте по смыслу один столбец
alter table driver
add age int, constraint age_check check (age >= 18);


---- 8. Напишите 5 запросов, используя агрегатные функции (SUM, MAX, MIN, AVG, COUNT)
-- 1
select SUM(age) as sum_age
from driver
-- 2
select MAX(age) as max_age
from driver
-- 3
select MIN(age) as min_age
from driver
-- 4
select AVG(age) as avg_age
from driver
-- 5
select COUNT(distinct type) as types_count
from transport


---- 9. Написать 2 запроса на группировку данных, используя оператор GROUP BY
-- 1
select type, COUNT(TYPE) as count
from transport
group by type
-- 2
select LEN(categories) as cat_count, COUNT(LEN(categories)) as count
from driver
group by LEN(categories)


---- 10. Написать 2 запроса на фильтрацию групп, используя HAVING.
-- 1
select type, COUNT(TYPE) as count
from transport
group by type
having type in ('Tram', 'Trolleybus')
-- 2
select route_id, COUNT(stop_id) as stops_count
from route_stop
group by route_id
having COUNT(stop_id) > 2


---- 11. Написать запросы на расширения SQL Server для группировки (ROLLUP, CUBE, GROUPING SETS, OVER)
-- 1
select type, brand, COUNT(TYPE) as count
from transport
group by rollup(type, brand)
order by type desc, brand desc
-- 2
select type, brand, COUNT(TYPE) as count
from transport
group by cube(type, brand)
order by type desc, brand desc
-- 3
select type, brand, COUNT(TYPE) as count
from transport
group by grouping sets (type, brand, ())
order by type desc, brand desc
-- 4
select name, categories, SUM(age) over (partition by categories) as sum_of_ages_same_cat
from driver


---- 12. Написать запрос на разворачивание данных (PIVOT), отмена разворачивания (UNPIVOT).
select *
from (select brand, type from transport) as src
pivot (COUNT(type) for type in ([Bus], [Tram], [Trolleybus], [Electrobus])) as piv

select gov_num, name, value
from (select gov_num, brand, type from transport) as src
unpivot (value for name in (brand, type)) as unpiv
