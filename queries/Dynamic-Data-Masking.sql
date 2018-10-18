USE master;
GO

CREATE LOGIN webuser 
WITH PASSWORD = N'1q2w3e4R5t^Y'
GO

USE WideWorldImporters;
GO

CREATE USER webuser FOR LOGIN webuser;
GO

CREATE USER Website FOR LOGIN Website;
GO

ALTER ROLE [Great Lakes Sales] ADD MEMBER webuser;
GO

GRANT SELECT, UPDATE ON Sales.Customers TO [Great Lakes Sales];
GO

SELECT * FROM Sales.Customers; 
GO

-- impersonate the user webuser
EXECUTE AS USER = 'webuser';
GO

-- Enable Dynamic Masking for Sales.Customer.PhoneNumber
SELECT * FROM Sales.Customers; 
GO

REVERT;
GO

