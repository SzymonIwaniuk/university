SELECT OrderID, ProductID, SUM(Quantity) AS total_quantity
FROM [Order Details]
WHERE OrderID < 10250
GROUP BY OrderID, ProductID
WITH ROLLUP ORDER BY OrderID, ProductID;