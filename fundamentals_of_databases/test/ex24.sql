-- 2. Podaj nazwę, cenę jednostkową i adres dostawcy dla produktów z kategorii 
-- "Meat/Poultry" których cena jednostkowa jest pomiędzy 20, a 30

SELECT  p.ProductName, p.UnitPrice, o.ShipAddress
FROM Products p
JOIN Categories ct
    ON ct.CategoryID = p.CategoryID
JOIN [Order Details] od
    ON od.ProductID = p.ProductID
JOIN Orders o
    ON o.OrderID = od.OrderID
WHERE ct.CategoryName = 'Meat/Poultry' AND (p.UnitPrice > 20 AND p.UnitPrice < 30)