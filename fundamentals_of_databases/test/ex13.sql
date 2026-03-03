-- Podaj nazwe produktu dla którego osiągnieto minimalny, ale niezerowy zysk z produktu w 1996

SELECT TOP 1 p.ProductName
FROM Products p
JOIN [Order Details] od
    ON od.ProductID = p.ProductID
JOIN Orders o
    ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1996
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.UnitPrice * od.Quantity) != 0
ORDER BY SUM(od.UnitPrice * od.Quantity) ASC

