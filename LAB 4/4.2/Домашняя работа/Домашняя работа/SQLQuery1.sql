use AdventureWorks2017

select * from HumanResources.Employee

-- 3.3

select 
BusinessEntityID,
JobTitle,
VacationHours + SickLeaveHours as NotWorkingHours,
DATEDIFF(YEAR, HireDate, CAST(GETDATE() as date)) as YearsOfWorking,
DATEDIFF(YEAR, BirthDate, CAST(GETDATE() as date)) as Age
from HumanResources.Employee

-- 3.4

select 
BusinessEntityID,
JobTitle,
VacationHours + SickLeaveHours as NotWorkingHours,
DATEDIFF(YEAR, HireDate, CAST(GETDATE() as date)) as YearsOfWorking,
DATEDIFF(YEAR, BirthDate, CAST(GETDATE() as date)) as Age
into EmployeeOutput
from HumanResources.Employee

select * from EmployeeOutput

-- 3.5

select 
BusinessEntityID,
JobTitle,
VacationHours + SickLeaveHours as NotWorkingHours,
DATEDIFF(YEAR, HireDate, CAST(GETDATE() as date)) as YearsOfWorking,
DATEDIFF(YEAR, BirthDate, CAST(GETDATE() as date)) as Age
from HumanResources.Employee
order by Age asc, YearsOfWorking desc