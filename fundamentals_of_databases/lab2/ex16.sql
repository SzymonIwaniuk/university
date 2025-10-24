SELECT ProductID, OrderID, Quantity
FROM OrderHist

SELECT ProductID, SUM(Quantity) AS total_quantity
FROM OrderHist
GROUP BY ProductID
HAVING SUM(Quantity) >= 30;