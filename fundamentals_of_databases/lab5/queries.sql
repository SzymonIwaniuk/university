SELECT p.ProductName, s.CompanyName
FROM Products p
INNER JOIN Suppliers s  
    ON s.SupplierID = p.SupplierID

SELECT c.CompanyName
FROM Customers c
JOIN Orders o
    ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= '1988-03-01'

SELECT c.CompanyName, o.OrderDate
FROM Customers c
JOIN Orders o
    ON o.CustomerID = c.CustomerID

SELECT c.CompanyName
FROM Customers c
LEFT JOIN Orders o
    ON o.CustomerID = c.CustomerID
WHERE o.OrderDate IS NULL


SELECT p.ProductName, p.UnitPrice, s.Address
FROM Products p
JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice > 20 AND p.UnitPrice < 30


SELECT p.ProductName, p.UnitsInStock
FROM Products p
JOIN Suppliers s
    ON s.SupplierID = p.SupplierID
WHERE s.CompanyName = 'Tokyo Traders'

SELECT c.Address
FROM Customers c
LEFT JOIN Orders o
    ON o.CustomerID = c.CustomerID
    AND o.OrderDate >= '1977-01-01' AND o.OrderDate < '1978-01-01'
WHERE o.OrderID IS NULL

SELECT s.CompanyName, s.Phone
FROM Suppliers s
LEFT JOIN Products p
    ON p.SupplierID = s.SupplierID
WHERE p.UnitsInStock = 0

SELECT o.OrderID, o.OrderDate, c.CompanyName, c.Phone
FROM Orders o
JOIN Customers c
    ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '1997-03-01' AND o.OrderDate < '1997-04-01'


SELECT s.CompanyName, sp.CompanyName
FROM Suppliers s
CROSS JOIN Shippers sp


SELECT od.ProductID
FROM [Order Details] od
JOIN Orders o
    ON o.OrderID = od.OrderID
WHERE o.OrderDate = '1996-07-08'


SELECT p.ProductName, p.UnitPrice, s.Address
FROM Products p
JOIN Suppliers s
    ON s.SupplierID = p.SupplierID
JOIN Categories c
    ON c.CategoryID = p.CategoryID
WHERE p.UnitPrice >= 20 AND p.UnitPrice <= 30 AND c.CategoryName = 'Meat/Poultry'

SELECT p.ProductName, p.UnitPrice, s.CompanyName
FROM Products p
JOIN Suppliers s
    ON s.SupplierID = p.SupplierID
JOIN Categories c
    ON c.CategoryID = p.CategoryID
WHERE c.CategoryName = 'Confections'


-- Dla każdego klienta podaj liczbę złożonych przez niego zamówień. Zbiór wynikowy powinien zawierać nazwę klienta oraz liczbę zamówień
SELECT c.CompanyName, SUM(o.OrderID)
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName

-- Dla każdego klienta podaj liczbę złożonych przez niego zamówień w marcu 1997 r.

SELECT c.CompanyName, COUNT(o.OrderID)
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '1997-03-01' AND o.OrderDate < '1997-04-01'
GROUP BY c.CompanyName


