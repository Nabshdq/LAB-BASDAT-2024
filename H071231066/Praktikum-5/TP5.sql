-- Nama  : Fariz Idham Ramdhani
-- NIM   : H071231066
-- SELALU SEMANGAT

-- Nomor 1

SELECT DISTINCT c.customerName `namaKustomer`,
p.productName `namaProduk`,
p.productDescription `textDescription`
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE p.productName LIKE "%Titanic%"
ORDER BY namaKustomer;

-- Nomor 2

SELECT c.customerName,
p.productName,
o.status,
o.shippedDate
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE (p.productName LIKE "%Ferrari%") AND (o.status = "Shipped") 
AND (o.shippedDate >= '2003-10-01' AND o.shippedDate <= '2004-10-01')
ORDER BY o.shippedDate desc;

-- Nomor 3

SELECT e.firstName AS "Supervisor",
e1.firstName AS "Karyawan"
FROM employees AS e
JOIN employees AS e1
ON e.employeeNumber = e1.reportsTo
WHERE e.firstName LIKE "Gerard"
ORDER BY e1.firstName;

-- namor 4 A
SELECT c.customerName, p.paymentDate, e.firstName, p.amount
FROM customers AS c
JOIN payments AS p
USING (customerNumber)
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE "%-11-%";

-- Nomor 4 B
SELECT c.customerName, p.paymentDate, e.firstName, p.amount
FROM customers AS c
JOIN payments AS p
USING (customerNumber)
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE "%-11-%"
ORDER BY p.amount DESC
LIMIT 1;

-- Nomor 4 C
SELECT c.customerName, p.productName
FROM customers AS c
JOIN orders AS o
JOIN payments AS pa
USING (customerNumber)
USING (customerNumber)
JOIN orderdetails AS od 
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE (c.customerName LIKE "Corporate Gift%") AND (pa.paymentDate LIKE "%-11-%");


-- Nomor 5

SELECT c.customerName, o.orderNumber, o.orderDate, o.shippedDate,
p.productName, od.quantityOrdered, od.priceEach,
office.city AS "officeCity",
e.firstName AS "salesRepFirstName",
e.lastName AS "salesRepLastName"
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS office
USING (officeCode)
WHERE (p.productName LIKE "2%o") AND (o.orderDate > '2003-03-01') AND (od.quantityOrdered > 15) AND 
(od.priceEach BETWEEN 50 AND 150)
AND c.city = "San Francisco"
ORDER BY c.customerName;
;



