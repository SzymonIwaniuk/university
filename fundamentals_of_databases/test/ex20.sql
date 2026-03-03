-- 1. Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii "Confections".

SELECT DISTINCT c.CompanyName, c.Phone
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN [Order Details] od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON p.ProductID = od.ProductID
JOIN Categories ct
    ON ct.CategoryID = p.CategoryID
WHERE ct.CategoryName LIKE '%Confections%'

