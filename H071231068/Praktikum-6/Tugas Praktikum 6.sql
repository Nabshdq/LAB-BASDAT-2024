-- nomor 1
SELECT c.customerName,  
CONCAT(e.firstName, ' ', e.lastName) AS 
salesRep,(c.creditLimit-sum(p.amount)) AS remainingCredit
FROM customers AS c
JOIN employees AS e 
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments AS p
ON p.customerNumber = c.customerNumber
GROUP BY c.customerName
HAVING remainingCredit > 0;

    
-- nomor 2
SELECT p.productName AS 'nama produk', GROUP_CONCAT(DISTINCT c.customerName) AS 'nama customer', COUNT(DISTINCT o.customerNumber) AS 'jumlah customer', SUM(od.quantityOrdered) AS 'total quantitas'
FROM products AS p
JOIN orderdetails AS od 
ON p.productCode = od.productCode
JOIN orders AS o 
ON od.orderNumber = o.orderNumber
JOIN customers AS c 
ON o.customerNumber = c.customerNumber
GROUP BY p.productName;


-- nomor 3
SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'employeeName', COUNT(c.customerNumber) AS 'jumlah customer'
FROM employees AS e
JOIN customers AS c 
ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY e.firstName, e.lastName
ORDER BY COUNT(c.customerNumber) DESC;

-- nomor 4
SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'nama karyawan', p.productName AS 'nama produk', SUM(od.quantityOrdered) AS 'jumlah pesanan'
FROM employees AS e
LEFT JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders AS o
ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
LEFT JOIN products AS p
ON od.productCode = p.productCode
JOIN offices AS OF
ON OF.officeCode = e.officeCode
WHERE OF.country = 'australia'
GROUP BY e.firstName, e.lastName, p.productName
ORDER BY `jumlah pesanan` DESC;



-- nomor 5
SELECT c.customerName, GROUP_CONCAT(DISTINCT p.productName) AS 'nama produk', COUNT(DISTINCT p.productCode) AS 'banyak jenis produk'
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
WHERE o.shippedDate IS NULL 
GROUP BY c.customerName;


