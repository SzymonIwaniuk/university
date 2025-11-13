SELECT CustomerID, COUNT(OrderID), SUM(Freight)
FROM Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY CustomerID
HAVING COUNT(OrderID) > 8
ORDER BY SUM(Freight) DESC;

