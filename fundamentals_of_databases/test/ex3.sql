-- Dla kazdego pracownika (imie i nazwisko) podaj taczna wartosc zamówien obstuzonych przez tego pracownika (przy obliczaniu wartosci zamówien uwzglednij cene
-- za przesytke)

SELECT e.FirstName, e.LastName
         , SUM((od.UnitPrice * od.Quantity) * (1 - od.Discount) + o.Freight) AS TotalOrderValue
FROM Employees e
JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY e.FirstName, e.LastName

