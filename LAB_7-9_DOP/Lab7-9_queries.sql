use Transport;

----16
-- 1. ������� ����� ������ � ������� transport
SELECT LEN(type) AS TypeLength FROM transport;

-- 2. �������� ��� �������� ������� brand � �������� ��������
SELECT UPPER(brand) AS Brand FROM transport;

-- 3. ������� ��������� �� �������� ������� gov_num
SELECT SUBSTRING(gov_num, 1, 4) AS GovNumSubstring FROM transport;

-- 4. ���������, �������� �� �������� ������� brand ��������� 'MERC'
SELECT CASE WHEN brand LIKE '%MERC%' THEN 'Yes' ELSE 'No' END AS HasBMWBrand FROM transport;


----17
-- 1. ��������� ����� �������� ������� capacity � ������� transport
SELECT SUM(capacity) AS TotalCapacity FROM transport;

-- 2. ��������� �������� ������� bus_num �� ���������� ������ �����
SELECT ROUND(bus_num, 0) AS RoundedBusNum FROM transport;

-- 3. ����� ������������ �������� ������� number � ������� depot
SELECT MAX(number) AS MaxDepotNumber FROM depot;

-- 4. ��������� ������� �������� ������� y � ������� stop
SELECT AVG(y) AS AverageY FROM stop;


----18
-- 1. ������������� ��� ������ ���� ��������� � ��������������� �� ������������ �������
go
CREATE VIEW RouteTransportView AS
SELECT r.number AS RouteNumber, t.type AS TransportType
FROM route r
JOIN transport t ON r.id = t.route_id;
go
select *  from RouteTransportView

-- 2. ������������� ��� ������ ��������� � ���������
go
CREATE VIEW StopCoordinatesView AS
SELECT name, x, y
FROM stop;
go
select *  from StopCoordinatesView

-- 3. ������������� ��� ������ ������������ ������� � �� �����������
go
CREATE VIEW TransportCapacityView AS
SELECT gov_num AS GovernmentNumber, capacity AS Capacity
FROM transport;
go
select *  from TransportCapacityView

-- 4. ������������� ��� ������ ��������� � �� ���������� ����������
go
CREATE VIEW DriverContactView AS
SELECT name, phone
FROM driver;
go
select *  from DriverContactView

----19
-- ������������� ��������� �������
CREATE TABLE #TempTable (
id INT,
name VARCHAR(50)
);

INSERT INTO #TempTable (id, name)
SELECT id, name
FROM driver;

SELECT * FROM #TempTable;

-- ������������� ��������� ����������
DECLARE @TableVariable TABLE (
id INT,
name VARCHAR(50)
);

INSERT INTO @TableVariable (id, name)
SELECT id, name
FROM driver;

SELECT * FROM @TableVariable;

-- ������������� ���������� �������
CREATE TABLE ##GlobalTable (
id INT,
name VARCHAR(50)
);

INSERT INTO ##GlobalTable (id, name)
SELECT id, name
FROM driver;

SELECT * FROM ##GlobalTable;

-- ������������� ����������� ���������� ���������
WITH CTE AS (
SELECT id, name
FROM driver
)
SELECT *
FROM CTE;

----20
-- 1. �������� ��������� ��� ����������
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

-- 2. �������� ��������� � �������� ����������
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
-- 1. ��������� ������� ��� �������� ���������� ������������ ������� ������������� ����
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

-- 2. ��������� ������� ��� ��������� ������ ��������� ��� ������������� ��������
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
-- 1. ������� AFTER �� ������� transport ��� ������ ��������� � ������
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

-- 2. ������� INSTEAD OF �� ������� driver ��� �������� ���������� �������
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
