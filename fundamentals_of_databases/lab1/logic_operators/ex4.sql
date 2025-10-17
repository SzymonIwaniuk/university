-- 1
SELECT ProductID, ProductName, SupplierID, UnitPrice
FROM Products
WHERE Products.ProductName LIKE 'T%'
OR Products.ProductID = 46;

-- 2
SELECT ProductID, ProductName, SupplierID, UnitPrice
FROM Products
WHERE (Products.ProductName LIKE 'T%' OR
Products.ProductID = 46)
AND Products.UnitPrice > 16;

