SELECT s.ShipperID,
        s.CompanyName,
        SUM(o.Freight) AS TotalFreight
FROM Shippers AS s  
JOIN Orders AS o
    ON s.ShipperID = o.ShipVia
    WHERE o.ShippedDate >= '1996-01-01' AND o.ShippedDate < '1997-01-01'
GROUP BY s.ShipperID, s.CompanyName
ORDER BY TotalFreight DESC;