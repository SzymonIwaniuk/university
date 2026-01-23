-- 1.    Znajdź dostawców i ich produkty spełniające warunki: cena produktu wyższa niż 
-- średnia w kategorii, produkt zamawiany przez klientów z więcej niż 5 krajów,
-- dostawca ma sprzedaż powyżej średniej dla wszystkich dostawców. Wyświetl nazwę dostawcy, kraj dostawcy, nazwę produktu, cenę, kategorię, średnią cenę w kategorii oraz liczbę krajów. Posortuj według liczby krajów i ceny rosnąco.

-- 2.    Znajdź produkty, których cena jest wyższa niż średnia cena wszystkich produktów.
-- Wyświetl nazwę produktu, kategorię, cenę oraz średnią cenę wszystkich produktów. Posortuj według ceny malejąco.

-- 3.    Dla każdego produktu podaj nazwę jego kategorii, nazwę produktu,
--  cenę, średnią cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu, a średnią ceną
-- wszystkich produktów danej kategorii


-- 1
WITH with_ct AS (
SELECT ct.CategoryID, AVG(p.UnitPrice) AS avg_ct_price
FROM Categories ct
    JOIN Products p
    ON p.CategoryID = ct.CategoryID
GROUP BY ct.CategoryID),

with_prod_cust AS (
SELECT p.ProductID, COUNT(DISTINCT c.Country) AS country_count
FROM Products p
JOIN [Order Details] od
    ON od.ProductID = p.ProductID
JOIN Orders o
    ON o.OrderID = od.OrderID
JOIN Customers c
    ON c.CustomerID = o.CustomerID
GROUP BY p.ProductID),

with_sup_sales AS (
SELECT s.SupplierID, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total
FROM Suppliers s
JOIN Products p 
    ON s.SupplierID = p.SupplierID
JOIN [Order Details] od 
    ON p.ProductID = od.ProductID
GROUP BY s.SupplierID),

avg_sup_sales AS (
    SELECT AVG(total) AS avg_sales
    FROM with_sup_sales)

SELECT s.CompanyName, s.Country, p.ProductName, p.UnitPrice, ct.CategoryName, wt.avg_ct_price, wpc.country_count
FROM Suppliers s
JOIN Products p 
    ON p.SupplierID = s.SupplierID
JOIN Categories ct 
    ON ct.CategoryID = p.CategoryID
JOIN with_ct wt 
    ON ct.CategoryID = wt.CategoryID
JOIN with_prod_cust wpc 
    ON p.ProductID = wpc.ProductID
JOIN with_sup_sales ss 
    ON s.SupplierID = ss.SupplierID
CROSS JOIN avg_sup_sales ass
WHERE p.UnitPrice > wt.avg_ct_price
    AND wpc.country_count > 5
    AND ss.total > ass.avg_sales
ORDER BY wpc.country_count ASC, p.UnitPrice ASC;


-- 2
WITH with_prod AS(
    SELECT AVG(UnitPrice) AS avg_price
    FROM Products)
SELECT p.ProductName,
    c.CategoryName,
    p.UnitPrice,
    wp.avg_price
FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
CROSS JOIN with_prod wp
WHERE p.UnitPrice > wp.avg_price
ORDER BY p.UnitPrice DESC;

-- 3
WITH with_ct AS (
    SELECT ct.CategoryID, AVG(p.UnitPrice) AS avg_ct_price
    FROM Categories ct
    JOIN Products p
        ON p.CategoryID = ct.CategoryID
    GROUP BY ct.CategoryID)

SELECT p.ProductName, ct.CategoryName, p.UnitPrice, wt.avg_ct_price, p.UnitPrice - wt.avg_ct_price AS diff
FROM Products p
JOIN Categories ct
    ON ct.CategoryID = p.CategoryID
JOIN with_ct wt
    ON wt.CategoryID = ct.CategoryID;