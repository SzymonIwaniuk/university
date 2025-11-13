SELECT TOP 5 OrderID, Quantity
FROM [Order Details]
ORDER BY Quantity DESC;

SELECT TOP 5 WITH TIES OrderID, Quantity
FROM [Order Details]
ORDER BY Quantity DESC;

