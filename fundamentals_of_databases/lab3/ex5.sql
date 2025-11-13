SELECT OrderID, SUM(Quantity * UnitPrice) AS Price, SUM(Quantity)
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 250;