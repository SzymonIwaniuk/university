-- Wyświetl klientów (nazwę, adres) wraz z informacją jaką kategorię produktów (nazwa) najczęściej zama
-- wiali w 1997 roku.


SELECT c.CompanyName,
 c.Address,
  (
    SELECT TOP 1 ct.CategoryName 
    FROM Orders o
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories ct ON p.CategoryID = ct.CategoryID
    WHERE o.CustomerID = c.CustomerID
        AND YEAR(o.OrderDate) = 1997
    GROUP BY ct.CategoryName
    ORDER BY COUNT(*) DESC
  ) AS category
FROM Customers c 