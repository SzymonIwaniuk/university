SELECT SUM(UnitsInStock)
FROM Products
WHERE UnitPrice < 10
OR UnitPrice > 20;

