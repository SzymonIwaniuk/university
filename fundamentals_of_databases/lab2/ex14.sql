SELECT SupplierID, SUM(UnitsOnOrder)
FROM Products
GROUP BY SupplierID;

