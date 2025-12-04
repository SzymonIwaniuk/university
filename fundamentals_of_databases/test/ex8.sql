-- Wybierz klientów, którzy w 1997 kupili przynajmniej 2 różne produkty z kategorii confections i wypisz
-- ile ich kupili.


SELECT c.CompanyName, SUM(DISTINCT p.ProductID)
FROM Customers c
LEFT JOIN Orders o
    ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] od
    ON o.OrderID = od.OrderID
INNER JOIN Products p 
    ON p.ProductID = od.ProductID
INNER JOIN Categories ct
    ON ct.CategoryID = p.CategoryID
WHERE ct.CategoryName = 'Confections'
    AND YEAR(o.OrderDate) = '1997'
GROUP BY c.CustomerID, c.CompanyName
HAVING (COUNT(DISTINCT p.ProductID)) >= 2