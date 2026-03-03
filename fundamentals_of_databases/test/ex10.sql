-- Podaj pozycje zamówień, których wartość po uwzględnieniu rabatu jest mniejsza od średniej wartości
-- pozycji wchodzących w skład danego zamówienia.

SELECT o.OrderID
FROM Orders o
WHERE (SELECT SUM(od.UnitPrice * od.Quantity - od.Discount)
        FROM [Order Details] od
        WHERE od.OrderID = o.OrderID
        ) < (SELECT AVG(od.UnitPrice)
            FROM [Order Details] od
            WHERE od.OrderID = o.OrderID
            )