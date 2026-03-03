-- Pokaż nazwy produktów, które nie były z kategorii ’Beverages’ i które nie były kupowane w okresie od
-- ’1997.02.20’ do ’1997.02.25’. Dla każdego takiego produktu podaj jego nazwę, nazwę dostawcy oraz nazwę
-- kategorii. Zbiór wyników powinien zawierać nazwę produktu, dostawcy i kategorii.


SELECT DISTINCT p.ProductName, c.CategoryName, s.CompanyName
FROM Products p 
JOIN Categories c
    ON p.CategoryID = c.CategoryID
    AND c.CategoryName != 'Beverages'
JOIN Suppliers s
    ON s.SupplierID = p.SupplierID
LEFT JOIN [Order Details] od
    ON p.ProductID = od.ProductID
LEFT JOIN Orders o
    ON od.OrderID = o.OrderID
    AND o.OrderDate BETWEEN '1997-02-20' AND '1997-02-25'
WHERE o.OrderDate IS NULL

