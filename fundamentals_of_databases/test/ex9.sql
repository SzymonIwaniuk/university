-- Podaj wszystkie zamówienia (numer zamówienia), dla których opłata za przesyłkę była większa od średniej
-- opłaty za przesyłkę zamówień złożonych w tym samym roku. Dla każdego wyświetl tę opłatę oraz średnią
-- opłatę za przesyłkę zamówień złożonych w tym samym roku.


SELECT o1.OrderID,
     o1.Freight,
     (SELECT AVG(o3.Freight)
    FROM Orders o3
    WHERE YEAR(o1.OrderDate) = YEAR(o3.OrderDate)) AS avg

FROM Orders o1
WHERE (SELECT AVG(o2.Freight)
        FROM Orders o2
        WHERE YEAR(o2.OrderDate) = YEAR(o1.OrderDate)
        ) < o1.Freight

        