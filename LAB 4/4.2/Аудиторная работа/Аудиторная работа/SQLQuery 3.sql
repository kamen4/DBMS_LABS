use Lab2DB

SELECT * FROM Products;

SELECT ProductName + '('+ Manufacturer +')' as ModelName,
Price,
Price * ProductCount as TotalSum
FROM Products;