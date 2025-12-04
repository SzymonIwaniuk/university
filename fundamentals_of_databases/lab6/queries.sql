SELECT (SELECT SUM(od.UnitPrice * od.Quantity)
        FROM [Order Details] od
        WHERE o.OrderID = od.OrderID) + o.Freight AS total
FROM Orders o
WHERE o.OrderID = 10250

SELECT (SELECT SUM(od.UnitPrice * od.Quantity)
        FROM [Order Details] od
        WHERE o.OrderID = od.OrderID) + o.Freight AS total
FROM Orders o

-- Dla każdego produktu podaj maksymalną wartość zakupu tego produktu

SELECT p.ProductName,
        (SELECT MAX(od.UnitPrice * od.Quantity)
        FROM [Order Details] od
        WHERE od.ProductID = p.ProductID)
FROM Products p


-- Dla każdego produktu podaj maksymalną wartość zakupu tego produktu w 1997 roku.

SELECT p.ProductName,
        (SELECT MAX(od.UnitPrice * od.Quantity)
        FROM [Order Details] od
        JOIN Orders o
            ON o.OrderID = od.OrderID
        WHERE od.ProductID = p.ProductID AND YEAR(o.OrderDate) = 1997
        )
FROM Products p


-- Dla każdego klienta podaj łączną wartość jego zamówień (bez opłaty za przesyłkę) z 1996 roku

SELECT c.CompanyName,
    ISNULL((SELECT SUM(od.UnitPrice * od.Quantity) 
    FROM [Order Details] od
    JOIN Orders o
        ON o.OrderID = od.OrderID
    WHERE o.CustomerID = c.CustomerID AND YEAR(o.OrderDate) = 1996
    GROUP BY CustomerID), 0)
FROM Customers c

-- Dla każdego klienta podaj łączną wartość jego zamówień (uwzględnij opłatę za przesyłkę) z 1996 roku

SELECT c.CompanyName,
    ISNULL((SELECT SUM(od.UnitPrice * od.Quantity + o.Freight) 
    FROM [Order Details] od
    JOIN Orders o
        ON o.OrderID = od.OrderID
    WHERE o.CustomerID = c.CustomerID AND YEAR(o.OrderDate) = 1996
    GROUP BY CustomerID), 0)
FROM Customers c

-- Dla każdego klienta podaj maksymalną wartość zamówienia złożonego przez tego klienta w 1997 roku

SELECT c.CompanyName,
    ISNULL((SELECT MAX(od.UnitPrice * od.Quantity + o.Freight) 
    FROM [Order Details] od
    JOIN Orders o
        ON o.OrderID = od.OrderID
    WHERE o.CustomerID = c.CustomerID AND YEAR(o.OrderDate) = 1997
    GROUP BY CustomerID), 0)
FROM Customers c


-- Czy są jacyś klienci, którzy nie złożyli żadnego zamówienia w 1997 roku, jeżeli tak, to pokaż ich dane adresowe

SELECT c.Address
FROM Customers c
WHERE NOT EXISTS (SELECT 1
        FROM Orders o
        WHERE c.CustomerID = o.CustomerID
        AND YEAR(o.OrderDate) = 1997
        )

-- Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika (przy obliczaniu wartości zamówień uwzględnij cenę za przesyłkę)


SELECT e.FirstName,
 e.LastName,
  ( SELECT SUM(od.UnitPrice * od.Quantity + o.Freight)
            FROM [Order Details] od
            JOIN Orders o
            ON od.OrderID = o.OrderID
            WHERE e.EmployeeID = o.EmployeeID
    )
FROM Employees e


-- Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o największej wartości) w 1997r, podaj imię i nazwisko takiego pracownika
SELECT TOP 1 e.FirstName,
 e.LastName,
  ( SELECT SUM(od.UnitPrice * od.Quantity + o.Freight)
            FROM [Order Details] od
            JOIN Orders o
            ON od.OrderID = o.OrderID
            WHERE e.EmployeeID = o.EmployeeID AND YEAR(o.OrderDate) = 1997
    ) AS total
FROM Employees e
ORDER BY total DESC

-- Ogranicz wynik z pkt 21 tylko do pracowników a) którzy mają podwładnych b) którzy nie mają podwładnych
SELECT e.FirstName,
 e.LastName,
  ( SELECT SUM(od.UnitPrice * od.Quantity + o.Freight)
            FROM [Order Details] od
            JOIN Orders o
            ON od.OrderID = o.OrderID
            WHERE e.EmployeeID = o.EmployeeID
    ),
    e.Title
FROM Employees e
WHERE e.Title != 'Sales Representative'

SELECT e.FirstName,
 e.LastName,
  ( SELECT SUM(od.UnitPrice * od.Quantity + o.Freight)
            FROM [Order Details] od
            JOIN Orders o
            ON od.OrderID = o.OrderID
            WHERE e.EmployeeID = o.EmployeeID
    ),
    e.Title
FROM Employees e
WHERE e.Title = 'Sales Representative'

-- Zmodyfikuj rozwiązania z pkt 23 tak aby dla pracowników pokazać jeszcze datę ostatnio obsłużonego zamówienia

SELECT e.FirstName,
 e.LastName,
  ( SELECT SUM(od.UnitPrice * od.Quantity + o.Freight)
            FROM [Order Details] od
            JOIN Orders o
            ON od.OrderID = o.OrderID
            WHERE e.EmployeeID = o.EmployeeID
    ),
    e.Title,
    MAX(o.OrderDate)
FROM Employees e
JOIN Orders o
    ON o.EmployeeID = e.EmployeeID
WHERE e.Title = 'Sales Representative'
GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.Title




