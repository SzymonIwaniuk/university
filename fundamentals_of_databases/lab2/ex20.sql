SELECT ProductID, OrderID, SUM(Quantity) AS total_quantity
FROM OrderHist
GROUP BY ProductID, OrderID
WITH ROLLUP ORDER BY  ProductID, OrderID;