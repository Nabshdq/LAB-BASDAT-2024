-- nomor 1

SELECT p.productCode, p.productName, p.buyPrice
FROM products AS p
WHERE p.buyPrice > ( SELECT AVG (buyPrice) FROM products);

-- nomor 2
SELECT o.orderNumber, o.orderDate
FROM orders AS o
JOIN customers AS c
ON o.customerNumber = c.customerNumber
WHERE c.salesRepEmployeeNumber IN (
		SELECT e.employeeNumber
		FROM employees AS e
		JOIN offices AS OF 
		ON e.officeCode = OF.officeCode
		WHERE OF.city = 'tokyo'
	);
	
-- nomor 3
SELECT 
    c.customerName,
    o.orderNumber,
    o.shippedDate,
    o.requiredDate,
    (SELECT GROUP_CONCAT(p.productName) 
     FROM products AS p
     JOIN orderdetails AS od2 ON p.productCode = od2.productCode
     WHERE od2.orderNumber = o.orderNumber
    ) AS productNames,
    SUM(od.quantityOrdered) AS total_quantity_ordered,
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName
FROM customers AS c
JOIN orders AS o
    ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
    ON o.orderNumber = od.orderNumber
JOIN employees AS e
    ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE o.shippedDate > o.requiredDate
GROUP BY o.orderNumber;

-- nomor3
SELECT c.customerName, 
		 o.orderNumber,
		 o.shippedDate, 
		 o.requiredDate, 
		 GROUP_CONCAT(p.productName SEPARATOR ', ') products, 
		 SUM(od.quantityOrdered) total_quantity_ordered, 
		 CONCAT(e.firstName, " ", e.lastName) employeeName
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
WHERE o.orderNumber IN (
	SELECT orderNumber FROM orders o2
	WHERE o2.shippedDate > o2.requiredDate
)
GROUP BY c.customerNumber, o.orderNumber

-- nomor 4
SELECT p.productName, 
       p.productLine, 
       SUM(od.quantityOrdered) AS total_quantity_ordered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
WHERE p.productLine IN (
    SELECT top_product_lines.productLine
    FROM (
        SELECT p.productLine
        FROM products p
        JOIN orderdetails od ON p.productCode = od.productCode
        GROUP BY p.productLine
        ORDER BY SUM(od.quantityOrdered) DESC
        LIMIT 3
    ) AS top_product_lines
)
GROUP BY p.productName, p.productLine
ORDER BY p.productLine, total_quantity_ordered DESC;

	
