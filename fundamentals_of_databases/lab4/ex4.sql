SELECT p.ProductID,
        p.ProductName,
        (
            SELECT MAX(UnitPrice)
            FROM [Order Details] od
            JOIN Orders o ON o.OrderID = od.OrderID
            WHERE od.ProductID = p.ProductID
                AND o.OrderDate >= '01-01-1997'
                AND o.OrderDate < '01-01-1998'
        ) AS max_product_price
FROM Products p;