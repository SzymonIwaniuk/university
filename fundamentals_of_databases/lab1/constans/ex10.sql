-- 1
SELECT FirstName,
       LastName,
       'Identification Number: ' + CAST(EmployeeID AS VARCHAR) AS EmployeeID
FROM Employees;

-- 2
SELECT CONCAT(FirstName, ' ', LastName) AS imie_nazwisko
FROM Employees;

-- 3
SELECT FirstName + ' ' + LastName AS imie_nazwisko
FROM Employees;

-- 4
SELECT OrderID, Freight,
       CASE 
         WHEN Freight > 100 THEN 'HIGH'
         WHEN Freight BETWEEN 50 AND 100 THEN 'MEDIUM'
         ELSE 'LOW'
       END
FROM Orders;

-- 5
SELECT od.UnitPrice * od.Quantity AS TotalPrice
FROM Orders AS o
JOIN [Order Details] AS od 
ON o.OrderID = od.OrderID
WHERE o.OrderID = 10250;

-- 6
SELECT CompanyName, 
       Phone + ', ' + Fax AS ContactDetails 
FROM Suppliers;