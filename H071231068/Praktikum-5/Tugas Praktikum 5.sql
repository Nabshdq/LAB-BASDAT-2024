-- nomor 1
SELECT DISTINCT c.customerName, p.productName, p.productDescription
FROM customers AS c
JOIN orders AS o
ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
ON od.orderNumber = o.orderNumber
JOIN products AS p
ON p.productCode = od.productCode
WHERE p.productName LIKE '%titanic%'
ORDER BY c.customerName ASC

-- nomor 2
SELECT c.customerName, p.productName, o.`status`, o.shippedDate
FROM customers AS c
JOIN orders AS o
ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
ON od.orderNumber = o.orderNumber
JOIN products AS p
ON p.productCode = od.productCode
WHERE 
	(p.productName LIKE '%ferrari%') AND
 	(o.`status` = 'shipped') AND 
	(o.shippedDate BETWEEN '2003-10-01' AND '2004-10-01')
ORDER BY o.shippedDate DESC 

-- nomor 3
SELECT s.firstname AS 'supervisor', k.firstName AS 'karyawan'
FROM employees AS s
JOIN employees AS k
ON k.reportsTo = s.employeenumber
WHERE s.firstname = 'gerard'
ORDER BY k.firstName ASC 


-- nomor 4
SELECT c.customerName, py.paymentDate, e.lastName, py.amount
FROM customers AS c
JOIN payments AS py
ON py.customerNumber = c.customerNumber
JOIN employees AS e
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE py.paymentDate LIKE '%-11-%'


SELECT c.customerName, py.paymentDate, e.lastName, py.amount
FROM customers AS c
JOIN payments AS py
ON py.customerNumber = c.customerNumber
JOIN employees AS e
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE py.paymentDate LIKE '%-11-%'
ORDER BY py.amount DESC LIMIT 1


SELECT c.customerName, p.productName
FROM customers AS c
JOIN orders AS o
ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
ON od.orderNumber = o.orderNumber
JOIN products AS p
ON p.productCode = od.productCode
WHERE c.customerName = 'Corporate Gift Ideas Co.'

-- soal tambahan
SELECT c.customerName, o.orderNumber, o.orderDate, o.shippedDate, p.productName, od.quantityOrdered, od.priceEach, OF.city, e.firstName, e.lastName 
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS OF
ON e.officeCode = OF.officeCode
WHERE p.productName LIKE '2%o' AND o.orderDate > '2003-03-01' AND od.quantityOrdered > 15 AND OF.city = 'San Francisco' AND od.priceEach BETWEEN 50 AND 150 
ORDER BY c.customerName ASC , o.orderDate DESC LIMIT 2
