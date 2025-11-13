-- 1
SELECT *
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

-- 2
SELECT FirstName, LastName, Title
FROM Employees
WHERE LastName LIKE '[B-L]%';

-- 3
SELECT FirstName, LastName, Title
FROM Employees
WHERE LastName LIKE 'B%' 
OR LastName LIKE 'L%';

-- 4
SELECT CategoryName
FROM Categories
WHERE Categories.Description LIKE '%,%';

-- 5
SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE '%Store%';

-- 6
SELECT CompanyName
FROM Customers
JOIN CustomerCustomerDemo AS ccd
ON Customers.CustomerID = ccd.CustomerID
JOIN CustomerDemographics AS cd
ON ccd.CustomerTypeID = cd.CustomerTypeID
WHERE cd.CustomerDesc LIKE '%restaurant%';


