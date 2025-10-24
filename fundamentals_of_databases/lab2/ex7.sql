SELECT MAX(UnitPrice), MIN(UnitPrice), AVG(UnitPrice)
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%';
