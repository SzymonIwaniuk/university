-- Zamówienia z Freight większym niż AVG danego roku.
SELECT o.OrderID, o.Freight
FROM Orders o
WHERE (SELECT AVG(o1.Freight)
        FROM Orders o1
        WHERE YEAR(o.OrderDate) = YEAR(o1.OrderDate)) < o.Freight

