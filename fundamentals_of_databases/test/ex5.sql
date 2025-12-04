-- Wybierz nazwy i numery telefonów klientów, którym w 1997 roku przesyłek nie dostarczała firma United
-- Package.

SELECT DISTINCT c.CompanyName, c.Phone
FROM Customers c
LEFT JOIN Orders o
    ON o.CustomerID = c.CustomerID
    AND o.OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
LEFT JOIN Shippers s
    ON o.ShipVia = s.ShipperID
    AND s.CompanyName != 'United Package'
WHERE s.ShipperID IS NULL;