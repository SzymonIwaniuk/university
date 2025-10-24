SELECT OrderID,
       MAX(UnitPrice) AS Mini,
       MIN(UnitPrice) AS Maxi
FROM [Order Details]
GROUP BY OrderID;

