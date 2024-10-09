-- 1. Mencari nama pelanggan, produk, dan deskripsi produk dengan nama produk yang mengandung "Titanic"
SELECT DISTINCT 
	c.customerName AS namaKustomer, 
   p.productName AS namaProduk, 
   pl.textDescription
FROM 
   customers AS c
JOIN 
   orders AS o ON o.customerNumber = c.customerNumber
JOIN 
   orderdetails AS od ON od.orderNumber = o.orderNumber
JOIN 
   products AS p ON p.productCode = od.productCode
JOIN 
   productlines AS pl ON pl.productLine = p.productLine
WHERE 
   p.productName LIKE '%Titanic%'
ORDER BY 
   c.customerName;

-- 2. Mencari produk "Ferrari" yang status pengirimannya "Shipped" antara 1 Oktober 2003 hingga 1 Oktober 2004
SELECT 
   c.customerName, 
   p.productName, 
   o.status, 
   o.shippedDate
FROM 
   customers AS c
JOIN 
   orders AS o ON o.customerNumber = c.customerNumber
JOIN 
   orderdetails AS od ON od.orderNumber = o.orderNumber
JOIN 
   products AS p ON p.productCode = od.productCode
WHERE 
   p.productName LIKE '%Ferrari%'
   AND o.status = 'Shipped'
   AND (o.shippedDate BETWEEN '2003-10-01' AND '2004-10-01')
ORDER BY 
   o.shippedDate DESC;

-- 3. Menampilkan supervisor dan karyawan yang melapor ke supervisor dengan employee number 1102
SELECT 
   CONCAT(s.firstName, ' ', s.lastName) AS supervisor, 
   CONCAT(e.firstName, ' ', e.lastName) AS karyawan
FROM 
   employees AS e
JOIN 
   employees AS s ON e.reportsTo = s.employeeNumber
WHERE 
   e.reportsTo = 1102
ORDER BY 
   e.firstName ASC;

-- 4a. Menampilkan pembayaran di bulan November, diurutkan berdasarkan jumlah
SELECT 
   c.customerName, 
   p.paymentDate, 
   CONCAT(e.firstName, ' ', e.lastName) AS employeeName, 
   p.amount
FROM 
   customers AS c
JOIN 
   payments AS p ON p.customerNumber = c.customerNumber
JOIN 
   employees AS e ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE 
   p.paymentDate LIKE '%-11-%'
ORDER BY 
   p.amount;

-- 4b. Menampilkan pembayaran terbesar di bulan November
SELECT 
   c.customerName, 
   p.paymentDate, 
   CONCAT(e.firstName, ' ', e.lastName) AS employeeName, 
   p.amount
FROM 
   customers AS c
JOIN 
   payments AS p ON p.customerNumber = c.customerNumber
JOIN 
   employees AS e ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE 
   p.paymentDate LIKE '%-11-%'
ORDER BY 
   p.amount DESC
LIMIT 1;

-- 4c. Menampilkan produk yang dipesan oleh pelanggan korporat yang melakukan pembayaran di bulan November
SELECT 
   c.customerName, 
   p.productName
FROM 
   customers AS c
JOIN 
   payments AS ps ON ps.customerNumber = c.customerNumber
JOIN 
   orders AS o ON o.customerNumber = c.customerNumber
JOIN 
   orderdetails AS od ON od.orderNumber = o.orderNumberc
JOIN 
   products AS p ON p.productCode = od.productCode
WHERE 
   c.customerName LIKE 'Corporate%' 
   AND ps.paymentDate LIKE '%-11-%';
   
   
SELECT
 	c.customerName,
 	o.orderNumber,
 	o.orderDate,
 	o.shippedDate,
 	p.productName,
 	od.quantityOrdered,
 	od.priceEach,
 	os.city AS salesRepCity,
 	e.firstName AS salesRepCity,
 	e.lastName AS salesRepCity
 	
FROM
	customers AS c
JOIN 
	orders AS o ON o.customerNumber = c.customerNumber
JOIN
	orderdetails AS od ON od.orderNumber = o.orderNumber
JOIN 
	products AS p ON p.productCode = od.productCode
JOIN
	employees AS e ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN 
	offices  AS os ON os.officeCode = e.officeCode
WHERE 
	p.productName LIKE '1%r'
	AND o.orderDate < '2004-12-25'
	AND od.quantityOrdered > 10
	AND c.city  = 'NYC'
	AND od.priceEach BETWEEN 20 and 100
	
	
ORDER BY 
	c.customerName ASC,
	o.orderDate DESC;
SELECT * FROM customers
	

 	
