--  Który produkt przyniósł najmniejszy (ale niezerowy) dochód w 1996 r.? Podaj nazwę takiego produktu
-- oraz wartość tego dochodu.


SELECT TOP 1 p.ProductName, SUM(od.UnitPrice * od.Quantity) 
FROM Products p
JOIN [Order Details] od
    ON p.ProductID = od.ProductID
JOIN Orders o
    ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1996
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.UnitPrice * od.Quantity) != 0 
ORDER BY SUM(od.UnitPrice * od.Quantity) ASC



