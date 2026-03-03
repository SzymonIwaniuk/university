-- Wybierz klientów, którzy byli obsługiwani wyłącznie przez jednego pracownika, podaj imię i nazwisko
-- tego pracownika.

SELECT DISTINCT c.CompanyName, MIN(e.FirstName), MAX(e.LastName)
FROM Customers c
JOIN Orders o
    ON o.CustomerID = c.CustomerID
JOIN Employees e
    ON e.EmployeeID = o.EmployeeID
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(DISTINCT e.EmployeeID) = 1

