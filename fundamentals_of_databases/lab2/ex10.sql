SELECT ProductID, Quantity
FROM OrderHist;

SELECT ProductID, 
       SUM(Quantity) AS total_quantity
FROM orderhist
GROUP BY ProductID;

-- Aggregation

