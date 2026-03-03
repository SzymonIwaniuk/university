SELECT
    OrderID, 
    Freight + 
    (SELECT SUM(Quantity * UnitPrice)
     FROM [Order Details] od
     WHERE od.OrderID = o.OrderID
     ) AS TotalPrice 
FROM Orders o
WHERE OrderID = 10250;
