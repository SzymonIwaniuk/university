SELECT ProductID,
        ProductName,
        (
            SELECT MAX(UnitPrice)
            FROM [Order Details] od
            WHERE od.ProductID = p.ProductID
        ) AS max_product_price
FROM Products p;