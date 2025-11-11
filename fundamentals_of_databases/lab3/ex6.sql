SELECT EmployeeID, COUNT(OrderID) AS Orders
FROM Orders
GROUP BY EmployeeID

