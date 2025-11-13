SELECT ProductID, SUM(Quantity)
FROM [Order Details]
WHERE ProductID < 3
GROUP BY ProductID;

