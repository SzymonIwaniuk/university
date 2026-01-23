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
ORDER BY wpc.country_count ASC, p.UnitPrice ASC

