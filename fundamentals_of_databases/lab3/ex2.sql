SELECT TOP 10 OrderID,
        (UnitPrice * Quantity) AS OrderPrice
FROM [Order Details]
ORDER BY OrderPrice DESC;