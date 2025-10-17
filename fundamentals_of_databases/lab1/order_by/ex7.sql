-- 1
SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

-- 2
SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice;

-- 3
SELECT ProductID, ProductName, CategoryID,  UnitPrice
FROM Products
ORDER BY CategoryID DESC, UnitPrice DESC;

-- 4
SELECT ProductID, ProductName, CategoryID, UnitPrice
FROM Products
ORDER BY SupplierID DESC, CategoryID DESC;

--5 
SELECT CompanyName, Country
FROM Customers
ORDER BY Country, CompanyName ASC;

--6
SELECT CompanyName, Country
FROM Customers
WHERE Country IN ('France', 'Spain')
ORDER BY Country, CompanyName ASC;

--7
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
ORDER BY OrderDate DESC, Freight ASC;


