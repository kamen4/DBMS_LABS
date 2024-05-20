use Lab2DB

SELECT ProductName + '('+ Manufacturer +')' as ModelName,
Price
into ProductSummary
FROM Products;

select * from ProductSummary