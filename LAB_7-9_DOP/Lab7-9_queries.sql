use Transport;

----16
-- 1. Вернуть длину строки в таблице transport
SELECT LEN(type) AS TypeLength FROM transport;

-- 2. Привести все значения столбца brand к верхнему регистру
SELECT UPPER(brand) AS Brand FROM transport;

-- 3. Извлечь подстроку из значения столбца gov_num
SELECT SUBSTRING(gov_num, 1, 4) AS GovNumSubstring FROM transport;

-- 4. Проверить, содержит ли значение столбца brand подстроку 'MERC'
SELECT CASE WHEN brand LIKE '%MERC%' THEN 'Yes' ELSE 'No' END AS HasBMWBrand FROM transport;


----17
-- 1. Вычислить сумму значений столбца capacity в таблице transport
SELECT SUM(capacity) AS TotalCapacity FROM transport;

-- 2. Округлить значения столбца bus_num до ближайшего целого числа
SELECT ROUND(bus_num, 0) AS RoundedBusNum FROM transport;

-- 3. Найти максимальное значение столбца number в таблице depot
SELECT MAX(number) AS MaxDepotNumber FROM depot;

-- 4. Вычислить среднее значение столбца y в таблице stop
SELECT AVG(y) AS AverageY FROM stop;


----18
-- 1. Представление для списка всех маршрутов и соответствующих им транспортных средств
go
CREATE VIEW RouteTransportView AS
SELECT r.number AS RouteNumber, t.type AS TransportType
FROM route r
JOIN transport t ON r.id = t.route_id;
go
select *  from RouteTransportView

-- 2. Представление для списка остановок и координат
go
CREATE VIEW StopCoordinatesView AS
SELECT name, x, y
FROM stop;
go
select *  from StopCoordinatesView

-- 3. Представление для списка транспортных средств и их вместимости
go
CREATE VIEW TransportCapacityView AS
SELECT gov_num AS GovernmentNumber, capacity AS Capacity
FROM transport;
go
select *  from TransportCapacityView

-- 4. Представление для списка водителей и их контактной информации
go
CREATE VIEW DriverContactView AS
SELECT name, phone
FROM driver;
go
select *  from DriverContactView

----19
-- Использование временной таблицы
CREATE TABLE #TempTable (
id INT,
name VARCHAR(50)
);

INSERT INTO #TempTable (id, name)
SELECT id, name
FROM driver;

SELECT * FROM #TempTable;

-- Использование табличной переменной
DECLARE @TableVariable TABLE (
id INT,
name VARCHAR(50)
);

INSERT INTO @TableVariable (id, name)
SELECT id, name
FROM driver;

SELECT * FROM @TableVariable;

-- Использование глобальной таблицы
CREATE TABLE ##GlobalTable (
id INT,
name VARCHAR(50)
);

INSERT INTO ##GlobalTable (id, name)
SELECT id, name
FROM driver;

SELECT * FROM ##GlobalTable;

-- Использование обобщенного табличного выражения
WITH CTE AS (
SELECT id, name
FROM driver
)
SELECT *
FROM CTE;

----20
-- 1. Хранимая процедура без параметров
go
CREATE PROCEDURE GetTransportCount
AS
BEGIN
SELECT COUNT(*) AS TotalTransportCount
FROM transport;
END
go
DECLARE @transportCount INT;
EXEC GetTransportCount;
PRINT 'Total transport count: ' + CAST(@transportCount AS VARCHAR);

-- 2. Хранимая процедура с выходным параметром
go
CREATE PROCEDURE GetDriverCount
@driverCount INT OUTPUT
AS
BEGIN
SELECT @driverCount = COUNT(*)
FROM driver;
END;
go
DECLARE @driverCount INT;
EXEC GetDriverCount @driverCount OUTPUT;
PRINT 'Total driver count: ' + CAST(@driverCount AS VARCHAR);

----21
-- 1. Скалярная функция для подсчета количества транспортных средств определенного типа
go
CREATE FUNCTION CountTransportByType (@type VARCHAR(20))
RETURNS INT
AS
BEGIN
DECLARE @count INT;
SELECT @count = COUNT(*)
FROM transport
WHERE type = @type;
RETURN @count;
END;
go
SELECT dbo.CountTransportByType('Bus') AS BusCount;

-- 2. Табличная функция для получения списка остановок для определенного маршрута
go
CREATE FUNCTION GetStopsByRoute (@routeId INT)
RETURNS TABLE
AS
RETURN
(
SELECT s.name AS StopName, s.x AS CoordinateX, s.y AS CoordinateY
FROM stop s
INNER JOIN route_stop rs ON s.id = rs.stop_id
WHERE rs.route_id = @routeId
);
go
SELECT *
FROM dbo.GetStopsByRoute(1);

----23
-- 1. Триггер AFTER на таблице transport для записи изменений в журнал
go
CREATE TRIGGER AuditTransportChanges
ON transport
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	print 'transport db changed'
END;
INSERT INTO transport (route_id, type, gov_num, brand, capacity, bus_num)
VALUES (1, 'Bus', '1234AB-1', 'Mercedes', 50, 1);

-- 2. Триггер INSTEAD OF на таблице driver для проверки валидности вставки
go
CREATE TRIGGER ValidateDriverInsert
ON driver
INSTEAD OF INSERT
AS
BEGIN
	print 'Access denied, cannot insert'
END;
INSERT INTO driver (transport_id, name, phone, categories)
VALUES (1, 'John Doe', '+1234567890', 'B');
