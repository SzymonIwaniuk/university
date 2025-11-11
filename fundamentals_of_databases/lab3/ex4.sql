SELECT ProductID, SUM(Quantity)
FROM [Order Details]
GROUP BY ProductID
ORDER BY ProductID;
