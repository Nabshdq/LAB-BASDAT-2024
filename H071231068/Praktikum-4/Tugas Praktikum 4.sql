

-- nomor 1

SELECT customerNumber, customername, country, creditLimit FROM customers 
WHERE  
	(country = 'USA'  AND 
	creditLimit >= 50000 AND 
	creditLimit < 100000) OR 
	(country != 'USA'  AND 
	creditLimit >= 100000 AND 
	creditLimit <= 200000)
ORDER BY creditLimit DESC  ;
	
-- nomor 2

SELECT productCode, productName, quantityInStock, buyPrice FROM products
WHERE quantityInStock >=1000 AND  quantityInStock <= 2000 AND (buyPrice < 50 OR buyPrice > 150 ) AND productLine NOT LIKE 'Vintage%';

-- nomor 3


SELECT productCode, productName, MSRP FROM products
WHERE productLine LIKE '%Classic%' AND buyPrice > 50;

-- nomor 4

SELECT orderNumber, orderDate, STATUS, customerNumber FROM orders
WHERE orderNumber > 10250 AND STATUS NOT IN( 'Shipped','Cancelled') AND orderDate > '2004-01-01' AND orderDate < '2006-01-01';
-- nomor 5
SELECT *, (quantityOrdered * priceEach -(quantityOrdered * priceEach * 0.05)) AS discountedTotalPrice  FROM orderdetails
WHERE quantityOrdered > 50  AND priceEach > 100 AND productCode NOT LIKE 'S18_%'
ORDER BY discountedTotalPrice DESC ;





