SELECT SUM((od.UnitPrice * od.Quantity - od.Discount))
FROM [Order Details] AS od
WHERE OrderID = 10250;
