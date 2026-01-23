-- Wyswietl pracowników, którzy obstuzyli zamówienia o wartosci powyzej sredniej wartosci zamówien w firmie. 
-- Dla kazdego pracownika podaj imie i nazwisko, stanowisko, liczbe obstuzonych klientów, catkowita wartosó 
-- sprzedazy oraz srednia wartosó zamówienia w firmie. Wyniki posortuj malejaco wedtug wartosci sprzedazy.


SELECT 
    e.FirstName,
    e.LastName,
    e.Title, 
    (SELECT 
        COUNT(DISTINCT o.CustomerID)
    FROM 
        Orders o
    WHERE
        e.EmployeeID = o.EmployeeID
    ) AS clients,
    (SELECT
        SUM(od.UnitPrice * od.Quantity)
    FROM 
    [Order Details] od
    JOIN Orders o
        ON o.OrderID = od.OrderID
    WHERE e.EmployeeID = o.EmployeeID) AS total,
    (SELECT AVG(od.UnitPrice * od.Quantity)
    FROM [Order Details] od
    JOIN Orders o
        ON o.OrderID = od.OrderID
    WHERE e.EmployeeID = o.EmployeeID) as avg_for_employee
    
FROM Employees e
LEFT JOIN Orders o
    ON o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] od
    ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.Title
HAVING (
    SELECT AVG(od.UnitPrice * od.Quantity)
    FROM [Order Details] od
) <= SUM(od.UnitPrice * od.Quantity)
ORDER BY total