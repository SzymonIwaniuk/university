-- Dla każdej kategorii produktu podaj łączną liczbę zamówionych jednostek.

SELECT ct.CategoryName, ISNULL(SUM(od.Quantity), 0) AS total_qty
FROM Categories ct
JOIN Products p
    ON p.CategoryID = ct.CategoryID
LEFT JOIN [Order Details] od 
    ON od.ProductID = p.ProductID
GROUP BY ct.CategoryID, ct.CategoryName
