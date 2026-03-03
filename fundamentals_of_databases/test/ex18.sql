-- Pokaż nazwy produktów, kategorii 'Beverages' które nie były kupowane w okresie od
-- '1997.02.20' do '1997.02.25' Dla każdego takiego produktu podaj jego nazwę, nazwę
-- dostawcy (supplier), oraz nazwę kategorii. Zbiór wynikowy powinien zawierać nazwę
-- produktu, nazwę dostawcy oraz nazwę kategorii. (baza northwind)

SELECT DISTINCT p.ProductName, s.CompanyName, ct.CategoryName
FROM Products p
LEFT JOIN [Order Details] od
    ON od.ProductID = od.ProductID
LEFT JOIN Orders o
    ON o.OrderID = od.OrderID
JOIN Categories ct
    ON ct.CategoryID = p.CategoryID
JOIN Suppliers s
    ON s.SupplierID = p.SupplierID
WHERE o.OrderDate NOT BETWEEN '1997-02-20' AND '1997-02-25'
