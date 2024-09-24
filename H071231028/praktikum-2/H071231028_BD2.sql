USE classicmodels;

#Nomor 1
SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk', quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000 
ORDER BY quantityInStock ASC;

#Nomor 2
SELECT orderNumber AS 'Nomor Pesanan', orderDate AS 'Tanggal Pesanan', STATUS, customerNumber AS 'Nomor Pelanggan'
FROM orders
WHERE STATUS != 'Shipped'
ORDER BY customerNumber ASC;

#Nomor 3
SELECT employeeNumber AS 'Nomor Karyawan', firstname, lastname, email, jobtitle AS 'Jabatan'
FROM employees
WHERE jobtitle = 'Sales Rep' 
ORDER BY firstname ASC
LIMIT 20;

#Nomor 4
SELECT productcode AS 'Kode Produk', productname AS 'Nama Produk', productLine as 'Lini Produk', buyPrice as 'Harga Beli'
FROM products
ORDER BY buyprice DESC
LIMIT 10 OFFSET 5;

#Nomor 5
SELECT DISTINCT country, city 
FROM customers
ORDER BY country, city ASC;

SELECT * FROM customers

SELECT customername AS 'nama customer', state AS  'Negara Bagian' , city AS 'kota' 
FROM customers
WHERE state = 'CA'
ORDER BY customername ASC;