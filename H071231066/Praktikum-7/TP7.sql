-- Nama : Fariz Idham Ramdhani
-- NIM  : H071231066

-- TP 7

-- Nomor 1
SELECT p.productcode,
p.productname,
p.buyprice FROM products AS p
WHERE p.buyprice > (
   SELECT AVG(buyprice) FROM products
   );
   
-- Nomor 2
SELECT o.orderNumber, 
o.orderDate FROM orders AS o
JOIN customers AS c
USING (customerNumber)
WHERE c.salesRepEmployeeNumber IN (
   SELECT e.employeeNumber
   FROM employees AS e
   JOIN offices AS ofc
   USING (officeCode)
   WHERE ofc.city LIKE "Tokyo"
);

-- Nomor 3

SELECT customerName,
   orderNumber,
   shippedDate,
   requiredDate,
   products,
   total_quantity_ordered,
   employeeName
FROM (
   SELECT c.customerName AS customerName,
   o.orderNumber AS orderNumber,
   o.shippedDate AS shippedDate,
   o.requiredDate AS requiredDate,
   GROUP_CONCAT(p.productName SEPARATOR ', ') AS products,
   SUM(od.quantityOrdered) AS total_quantity_ordered,
   CONCAT(e.firstName, ' ', e.lastName) AS employeeName
   FROM customers AS c
   JOIN orders AS o USING (customerNumber)
   JOIN orderdetails AS od USING (orderNumber)
   JOIN products AS p USING (productCode)
   JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
   GROUP BY c.customerName, o.orderNumber, o.shippedDate, o.requiredDate, e.firstName, e.lastName
) AS result
WHERE shippedDate > requiredDate;


-- Nomor 4

SELECT productName, productLine, total_quantity_ordered
FROM (
   SELECT p.productName AS productName,
   p.productLine AS productLine,
   SUM(od.quantityOrdered) AS total_quantity_ordered
   FROM products AS p
   JOIN orderdetails AS od
   USING (productCode)
   JOIN (
      SELECT p.productLine
      FROM products AS p
      GROUP BY (productLine)
      ORDER BY COUNT(p.productLine) DESC
      LIMIT 3
   ) AS tabelBaru
   USING (productLine)
   GROUP BY p.productCode
) AS result
ORDER BY total_quantity_ordered DESC;

-- Nomor 4 bentuk lain

SELECT p.productName, 
p.productLine, 
SUM(od.quantityOrdered) AS total_quantity_ordered
FROM products AS p
JOIN orderdetails AS od USING (productCode)
where p.productLine IN (SELECT productLine FROM (select productLine
   FROM products
   JOIN orderdetails od
   USING(productCode)
   GROUP BY productLine
   ORDER BY SUM(od.quantityOrdered) DESC
   LIMIT 3
) top3
)
GROUP BY p.productCode, p.productLine
ORDER BY p.productLine,total_quantity_ordered DESC;


SELECT p.productLine
FROM products AS p
GROUP BY (productLine)
ORDER BY COUNT(p.productLine) DESC
LIMIT 3;