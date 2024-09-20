-- soal 1
SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk', quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000
ORDER BY quantityInStock ASC

-- soal 2
SELECT orderNumber AS 'Nomor Pesanan', orderDate AS 'Tanggal Pesanan', STATUS, customerNumber AS 'Nomor Pelanggan'
FROM orders
WHERE status != 'shipped'
ORDER BY customerNumber ASC 

-- soal 3
SELECT employeeNumber AS 'Nomor Karyawan', firstName, lastName, email, jobTitle AS 'Jabatan'
FROM employees
WHERE jobTitle = 'sales Rep'
ORDER BY firstName
LIMIT 10


-- soal 4
SELECT productCode AS 'Kode Produk', productName AS'Nama Produk', productLine AS 'lini Produk', buyPrice AS  'Harga Beli' 
FROM products
ORDER BY buyPrice DESC
LIMIT 10 OFFSET 5

-- soal 5
SELECT distinct country, city
FROM customers
ORDER BY country, city ASC
