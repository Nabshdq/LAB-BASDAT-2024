-- nomor 1
(SELECT p.productName, SUM(od.priceEach * od.quantityOrdered) AS total, 'Pendapat Tinggi' Pendapatan
FROM products AS p
JOIN orderdetails AS od
ON p.productCode = od.productCode
JOIN orders AS o
ON od.orderNumber = o.orderNumber
WHERE MONTH (o.orderDate) = 9
GROUP BY p.productCode
ORDER BY total DESC LIMIT 5)
UNION 
(SELECT p.productName, SUM(od.priceEach * od.quantityOrdered) AS total, 'Pendapat Rendah' Pendapatan
FROM products AS p
JOIN orderdetails AS od
ON p.productCode = od.productCode
JOIN orders AS o
ON od.orderNumber = o.orderNumber
WHERE MONTH (o.orderDate) = 9
GROUP BY p.productCode
ORDER BY total ASC LIMIT 5)

-- nomor 2
SELECT productName
FROM products
WHERE productCode NOT IN (
    SELECT od.productCode
    FROM orderdetails od
    JOIN orders o
	 ON od.orderNumber = o.orderNumber
    WHERE o.customerNumber IN (
        SELECT customerNumber
        FROM orders
        GROUP BY customerNumber
        HAVING COUNT(orderNumber) > 10
        INTERSECT
        SELECT o.customerNumber
        FROM orders o
        JOIN orderdetails od 
		  ON od.orderNumber = o.orderNumber
        WHERE od.productCode IN (
            SELECT productCode
            FROM orderdetails
            WHERE priceEach > (SELECT AVG(priceEach) FROM orderdetails)
        )
    )
);


-- nomor 3
SELECT c.customerName
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE c.customerNumber IN (
    SELECT o.customerNumber
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    JOIN products p ON od.productCode = p.productCode
    WHERE p.productLine = "Planes"
    GROUP BY o.customerNumber, p.productLine
    HAVING SUM(od.quantityOrdered * od.priceEach) > 20000
    INTERSECT
    SELECT o.customerNumber
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    JOIN products p ON od.productCode = p.productCode
    WHERE p.productLine = "Trains"
    GROUP BY o.customerNumber, p.productLine
    HAVING SUM(od.quantityOrdered * od.priceEach) > 20000
)
GROUP BY c.customerNumber
HAVING SUM(p.amount) > (SELECT AVG(amount) * 2 FROM payments);

-- nomor 4
SELECT Tanggal, customerNumber , GROUP_CONCAT(DISTINCT Riwayat1 SEPARATOR " Dan ") AS Riwayat
FROM (
    SELECT o.orderDate AS Tanggal, c.customerNumber, "Memesan Barang" AS Riwayat1
    FROM orders o
    JOIN customers c
    ON o.customerNumber = c.customerNumber
    WHERE o.orderDate LIKE ("2003-09-%")
    UNION
    SELECT p.paymentDate AS Tanggal, c.customerNumber, "Membayar Pesanan" AS Riwayat1
    FROM payments p
    JOIN customers c
    ON p.customerNumber = c.customerNumber
    WHERE p.paymentDate LIKE ("2003-09-%")
    ORDER BY customerNumber
) s
GROUP BY Tanggal;

-- nomor 5
SELECT p.productCode
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE od.quantityOrdered > 48
  AND LEFT(p.productVendor, 1) IN ("A", "I", "U", "E", "O")
  AND od.priceEach > (
    SELECT AVG(od.priceEach)
    FROM products p
    JOIN orderdetails od ON p.productCode = od.productCode
    JOIN orders o ON od.orderNumber = o.orderNumber
    WHERE o.orderDate BETWEEN "2001-01-01" AND "2004-03-31"
  )
GROUP BY p.productCode
EXCEPT
SELECT p.productCode
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.country IN ("Italy", "Japan", "Germany");
