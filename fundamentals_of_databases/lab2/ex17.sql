SELECT ProductID, SUM(Quantity)
FROM [Order Details] AS o
GROUP BY ProductID
HAVING SUM(Quantity) > 1200;