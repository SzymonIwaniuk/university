-- Czy byli klienci którzy nie dokonali zamówienia w 1997? Jeżeli tak to wyświetl ich dane adresowe.

SELECT c.CompanyName, c.Address
FROM Customers c
WHERE c.CustomerID NOT IN (
    SELECT o.CustomerID
    FROM Orders o
    WHERE YEAR(o.OrderDate) = 1997
)