-- Dla każdego przewoźnika podaj nazwę produktu z kategorii 'Seafood', który ten przewoził
-- najczęściej w kwietniu 1997. Podaj też informację ile razy dany przewoźnik przewoził ten
-- produkt (jeśli takich produktów jest więcej to wystarczy podać nazwę jednego z nich).
-- Zbiór wynikowy powinien zawierać nazwę przewoźnika, nazwę produktu, oraz informację
-- ile razy dany produkt był przewożony (baza northwind)

WITH with_rank AS (
SELECT s.CompanyName as cn, p.ProductName as pn, COUNT(od.OrderID) as ilosc,
ROW_NUMBER() OVER (PARTITION BY s.SupplierID ORDER BY COUNT(od.OrderID) DESC) as ranking
FROM Suppliers s
LEFT JOIN Products p
    ON p.SupplierID = s.SupplierID
LEFT JOIN [Order Details] od
    ON od.ProductID = p.ProductID
JOIN Categories ct
    ON ct.CategoryID = p.CategoryID
JOIN Orders o
    ON o.OrderID = od.OrderID
WHERE ct.CategoryName = 'Seafood'
    AND o.OrderDate >= '1997-04-01'
    AND o.OrderDate <  '1997-05-01'
GROUP BY s.SupplierID, s.CompanyName, p.ProductName)

SELECT cn, pn,ilosc FROM with_rank 
WHERE ranking = 1

