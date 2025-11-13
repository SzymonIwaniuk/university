-- 1
SELECT CompanyName, Country
FROM Customers
WHERE Country IN ('Japan', 'Italy');

-- 2
SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE ShipCountry IN ('Argentina')
AND ShippedDate IS NULL;

