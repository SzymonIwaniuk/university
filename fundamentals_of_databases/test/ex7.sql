-- Wybierz imię i nazwisko pracownika który w 1997 obsłużył zamówienia o największej wartości (wliczając
-- fracht), wypisz tą wartość

SELECT TOP 1 e.FirstName, e.LastName, SUM(od.UnitPrice * od.Quantity + o.Freight) AS total
FROM Employees e
JOIN Orders o
    ON o.EmployeeID = e.EmployeeID
    AND YEAR(o.OrderDate) = 1997
JOIN [Order Details] od
    ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY SUM(od.UnitPrice * od.Quantity + o.Freight) DESC

