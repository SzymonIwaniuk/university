SELECT ProductID, 
       SUM(Quantity) AS total_quantity
FROM [Order Details]
GROUP BY ProductID;
