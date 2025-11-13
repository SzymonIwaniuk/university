SELECT OrderID, MAX(UnitPrice)
FROM [Order Details]
GROUP BY OrderID
ORDER BY MAX(UnitPrice) DESC;