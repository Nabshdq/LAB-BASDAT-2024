-- nama: nancy jiwono
-- nim : H071231004
-- tp02

-- nomor 01 
SELECT * FROM products;

SELECT productCode AS 'Kode Produk',
productName AS 'Nama Produk', 
quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000;
-- WHERE quantityInStock BETWEEN 5000 AND 6000;

-- nomor 02 
SELECT * FROM orders;

SELECT orderNumber AS 'Nomor Pesanan',
orderDate AS 'Tanggal Pesanan',
status, 
customerNumber AS 'Nomor Pelanggan'
FROM orders
WHERE STATUS != 'shipped';

-- nomor 03 
SELECT * FROM employees;

SELECT employeeNumber AS 'Nomor Karyawan',
firstName, lastName, email,
jobTitle AS 'Jabatan'
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName ASC
LIMIT 10;

-- nomor 4
SELECT * FROM products;

SELECT productCode AS 'Kode Produk', 
productName AS 'Nama Produk',
productLine AS 'Lini Produk',
buyPrice AS 'Harga Beli'
FROM products
ORDER BY buyPrice DESC
LIMIT 10 OFFSET 5;

-- nomor 05
SELECT * FROM customers;

SELECT DISTINCT country, city 
FROM customers
ORDER BY country, city;