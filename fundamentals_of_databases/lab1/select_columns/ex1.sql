-- 1
SELECT CompanyName, Address
FROM Customers;

-- 2 
SELECT LastName, HomePhone
FROM Employees;

-- 3
SELECT ProductName, UnitPrice
FROM Products;

-- 4
SELECT CategoryName, Description
FROM Categories;

-- 5
SELECT DISTINCT ShipName, ShipAddress
FROM Orders;

-- 6
SELECT LastName, FirstName, Title
FROM Employees
WHERE EmployeeID = 5;

-- 7
SELECT LastName, City
FROM Employees
WHERE Country = 'USA';

-- 8
SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE OrderDate <= '1996-08-01';
