
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);


INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.digit+1), ',', -1)) AS Product
FROM ProductDetail
JOIN (
    SELECT 0 AS digit UNION ALL
    SELECT 1 UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4
) n
ON LENGTH(Products) - LENGTH(REPLACE(Products, ',', '')) >= n.digit
ORDER BY OrderID, Product;
