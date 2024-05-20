use Transport;

---- 13. Написать по два запроса на каждое соединение таблиц:
---внутреннее
--1
SELECT *
FROM transport
INNER JOIN route ON transport.route_id = route.id;
--2
SELECT *
FROM driver
INNER JOIN transport ON driver.transport_id = transport.id;

---внешнее левое
--1
SELECT *
FROM transport
LEFT JOIN route ON transport.route_id = route.id;
--2
SELECT *
FROM driver
LEFT JOIN transport ON driver.transport_id = transport.id;

---внешнее правое
--1
SELECT *
FROM transport
RIGHT JOIN route ON transport.route_id = route.id;
--2
SELECT *
FROM driver
RIGHT JOIN transport ON driver.transport_id = transport.id;

---полное внешнее
--1
SELECT *
FROM transport
FULL JOIN route ON transport.route_id = route.id;
--2
SELECT *
FROM driver
FULL JOIN transport ON driver.transport_id = transport.id;

---перекрестное
--1
SELECT *
FROM transport
CROSS JOIN route;
--2
SELECT *
FROM driver
CROSS JOIN transport;


---- 14. Написать по два запроса:
---на пересечение
--1
SELECT *
FROM driver
WHERE LEN(categories) > 3
INTERSECT
SELECT *
FROM driver
WHERE age < 45;
--2
SELECT *
FROM transport
WHERE capacity>40
INTERSECT
SELECT *
FROM transport
WHERE type='Bus';

---на разность
--1
SELECT *
FROM driver
WHERE LEN(categories) > 3
EXCEPT
SELECT *
FROM driver
WHERE age < 45;
--2
SELECT *
FROM transport
WHERE capacity>40
EXCEPT
SELECT *
FROM transport
WHERE type='Bus';

---на объединение таблиц
--1
SELECT *
FROM driver
WHERE LEN(categories) > 3
UNION
SELECT *
FROM driver
WHERE age < 45;
--2
SELECT *
FROM transport
WHERE capacity>40
UNION
SELECT *
FROM transport
WHERE type='Bus';


---- 15. Написать 4 запроса с использованием подзапросов, используя операторы
---- сравнения, операторы IN, ANY|SOME и ALL, предикат EXISTS
--1
SELECT *
FROM driver
WHERE LEN(categories) > all (
	SELECT LEN(brand) 
	FROM transport
	WHERE type='Trolleybus');
--2
SELECT *
FROM driver
WHERE transport_id IN (
	SELECT id
	FROM transport
	WHERE type='Bus');
--3
SELECT *
FROM (
	SELECT *
	FROM driver
	WHERE name like 'J%') a
WHERE a.age>=20;
--4
SELECT *
FROM driver
WHERE EXISTS (
	SELECT *
	FROM stop
	WHERE x=50);