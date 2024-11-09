-- TP 8

-- Nama  : Fariz Idham Ramdhani
-- NIM   : H071231066

-- Nomor 1

SELECT productName, TotalRevenue, Pendapatan FROM (
   (SELECT p.productName,
   SUM(od.priceEach * od.quantityOrdered) AS `TotalRevenue`,
   "Pendapatan Tinggi" AS `Pendapatan`
   FROM products AS p
   JOIN orderdetails AS od
   USING (productCode)
   JOIN orders AS o
   USING (orderNumber)
   WHERE MONTH(o.orderDate) = 9
   GROUP BY productCode
   ORDER BY `TotalRevenue` DESC
   LIMIT 5)
   UNION 
   (SELECT p.productName, SUM(od.priceEach * od.quantityOrdered) AS `TotalRevenue`,
   "Pendapatan Rendah" AS `Pendapatan`
   FROM products AS p
   JOIN orderdetails AS od
   USING (productCode)
   JOIN orders AS o
   USING (orderNumber)
   WHERE MONTH(o.orderDate) = 9
   GROUP BY productCode
   ORDER BY `TotalRevenue`
   LIMIT 5)
) AS tabel;


-- Nomor 2
SELECT productName FROM products
EXCEPT
SELECT productName FROM products
WHERE productCode IN (
   SELECT productCode FROM products
   JOIN orderdetails AS od
   USING (productCode)
   JOIN orders AS o
   USING (orderNumber)
   JOIN customers AS c
   USING (customerNumber)
   WHERE c.customerNumber IN (
      SELECT customerNumber FROM customers
      JOIN orders AS o
      USING (customerNumber)
      JOIN orderdetails AS od
      USING (orderNumber)
      JOIN products AS p
      USING (productCode)
      WHERE p.buyPrice > (
      SELECT AVG(buyPrice) FROM products)
      GROUP BY customerNumber
      INTERSECT
      SELECT customerNumber FROM customers
      JOIN orders AS o
      USING (customerNumber)
      GROUP BY customerNumber
      HAVING COUNT(o.orderNumber) > 10
      )
);

-- Nomor 3

SELECT customerName FROM customers AS c
JOIN payments AS py
USING (customerNumber)
GROUP BY customerNumber
HAVING SUM(py.amount) > (
   SELECT AVG(amount) * 2 FROM (
      SELECT SUM(amount) AS `amount` FROM payments
      GROUP BY customerNumber
   ) AS tabel
)
INTERSECT
SELECT customerName FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE p.productLine IN ("Planes", "Trains")
GROUP BY customerNumber
HAVING SUM(od.priceEach * od.quantityOrdered) > 20000;


-- Nomor 4
SELECT `Tanggal`, customerNumber, GROUP_CONCAT(riwayat SEPARATOR " dan ") AS "Riwayat" FROM (
   SELECT orderDate AS "Tanggal", customerNumber, "Memesan Barang" AS "Riwayat" FROM orders
   WHERE orderDate LIKE "2003-09-%"
   UNION
   SELECT paymentDate AS "Tanggal", customerNumber, "Membayar Pesanan" AS "Riwayat" FROM payments
   WHERE paymentDate LIKE "2003-09-%"
   ORDER BY customerNumber
) AS paymens
GROUP BY `Tanggal`;

-- Nomor 5
SELECT productCode FROM products
JOIN orderdetails AS od
USING (productCode)
WHERE od.priceEach > (
   SELECT AVG(priceEach) FROM orderdetails
   JOIN orders AS o
   WHERE o.orderDate BETWEEN '2001-01-01' AND '2004-03-31'
) AND od.quantityOrdered > 4 * 12 AND LEFT(productVendor, 1) IN ('a', 'i', 'u', 'e', 'o')
GROUP BY productCode
EXCEPT
SELECT productCode FROM products
JOIN orderdetails AS od
USING (productCode)
JOIN orders AS o
USING (orderNumber)
JOIN customers AS c
USING (customerNumber)
WHERE c.country IN ("Japan", "Germany", "Italy");

