-- Znajdz dostawców, którzy dostarczaja produkty drozsze niz srednia cena produktów z ich kraju. Wyswietl nazwe dostawcy, kraj, nazwe produktu, cene produktu
-- oraz srednia cene produktów z tego kraju. Posortuj wedtug ceny produktu rosnaco.


SELECT s.CompanyName,
        s.Country,
        p.ProductName,
        p.UnitPrice,
        (SELECT AVG(p2.UnitPrice)
        FROM Products p2
        JOIN Suppliers s2 ON p2.SupplierID = s2.SupplierID
        WHERE s2.Country = s.Country
        ) AS avg_price
FROM Suppliers s
JOIN Products p
    ON s.SupplierID = p.SupplierID

WHERE p.UnitPrice > (SELECT AVG(p2.UnitPrice)
                    FROM Products p2
                    JOIN Suppliers s2 ON p2.SupplierID = s2.SupplierID
                    WHERE s2.Country = s.Country
                    )
ORDER BY UnitPrice ASC



