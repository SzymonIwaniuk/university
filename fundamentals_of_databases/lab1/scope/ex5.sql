-- 1
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20;

-- 2
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice >= 10
AND UnitPrice <= 20;

-- 3
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice < 10
OR UnitPrice > 20;

-- 4
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20 AND 30;

-- 5
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31';