SELECT ProductID, OrderID, SUM(Quantity) AS total_quantity
FROM OrderHist
GROUP BY ProductID, OrderID
WITH CUBE ORDER BY ProductID, OrderID;