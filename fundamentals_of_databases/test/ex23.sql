-- Podaj ilu jest pracowników, którzy urodzili się pomiędzy latami 
-- 1953-54 lub 1955-57 lub 1959-62 i nie mieszkają ani w Londynie ani w Seattle.

SELECT COUNT(e.EmployeeID)
FROM Employees e
WHERE ((e.BirthDate BETWEEN '1953-01-01' AND '1954-12-31') 
    OR (e.BirthDate BETWEEN '1955-01-01' AND '1957-12-31')
    OR (e.BirthDate BETWEEN '1959-01-01' AND '1962-12-31')) 
    AND NOT (e.City = 'Seattle' AND e.City = 'London')
