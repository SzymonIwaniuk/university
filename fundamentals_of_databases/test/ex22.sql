-- Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, średnią cenę wszystkich produktów w danej
-- kategorii oraz różnicę między ceną produktu, a średnią ceną wszystkich produktów danej kategorii.

WITH avg_category AS (
SELECT p2.CategoryID, AVG(p2.UnitPrice) AS avg_price
 FROM Products p2
 JOIN Categories ct2
    ON ct2.CategoryID = p2.CategoryID
GROUP BY p2.CategoryID
)
SELECT ct.CategoryName,
 p.ProductName,
 p.UnitPrice,
 ac.avg_price,
 p.UnitPrice - ac.avg_price AS price_diff
FROM Products p
JOIN Categories ct
    ON p.CategoryID = ct.CategoryID
JOIN avg_category ac
    ON p.CategoryID = ac.CategoryID