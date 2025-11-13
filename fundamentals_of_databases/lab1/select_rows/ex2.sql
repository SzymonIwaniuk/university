-- 1
SELECT CompanyName, Address
FROM Customers
WHERE City = 'London';

-- 2
SELECT CompanyName, Address
FROM Customers
WHERE Country = 'France' OR Country = 'Spain';

-- 3
SELECT ProductName, UnitPrice
FROM Products
WHERE 20 < UnitPrice AND UnitPrice < 30;

-- 4
SELECT ProductName, UnitPrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Meat/Poultry';


-- 5
SELECT ProductName, UnitsInStock
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.CompanyName = 'Tokyo Traders';

-- 6
SELECT CompanyName
FROM Customers
JOIN CustomerCustomerDemo AS ccd 
ON Customers.CustomerID = ccd.CustomerID
JOIN CustomerDemographics AS cd
ON ccd.CustomerTypeID = cd.CustomerTypeID
WHERE cd.CustomerDesc LIKE '%restaurant%';

SELECT CustomerDesc
FROM CustomerDemographics;