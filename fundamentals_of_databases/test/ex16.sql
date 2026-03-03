-- Zad.3. Wyświetl podsumowanie zamówień (całkowita cena + fracht) obsłużonych 
-- przez pracowników w lutym 1997 roku, uwzględnij wszystkich, nawet jeśli suma 
-- wyniosła 0.

SELECT e.FirstName, e.LastName, ISNULL(SUM(od.UnitPrice * od.Quantity + o.Freight), 0) AS total
FROM [Order Details] od
JOIN Orders o
    ON o.OrderID = od.OrderID
    AND o.OrderDate >=  '1997-02-01'
    AND o.OrderDate < '1997-03-01'
RIGHT JOIN Employees e
    ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
