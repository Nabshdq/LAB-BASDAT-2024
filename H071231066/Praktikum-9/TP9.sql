-- Tugas Praktikum 9
-- Nama : Fariz Idham Ramdhani
-- NIM  : H071231066

-- Nomor 1

CREATE DATABASE sepakbola;

USE sepakbola;

CREATE TABLE klub (
   id INT PRIMARY KEY AUTO_INCREMENT,
   nama_klub VARCHAR(50) NOT NULL,
   kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain (
   id INT PRIMARY KEY AUTO_INCREMENT,
   nama_pemain VARCHAR(50) NOT NULL,
   posisi VARCHAR(20) NOT NULL,
   id_klub INT,
   FOREIGN KEY (id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan (
   id INT PRIMARY KEY AUTO_INCREMENT,
   id_klub_tuan_rumah INT,
   FOREIGN KEY (id_klub_tuan_rumah) REFERENCES klub(id),
   id_klub_tamu INT,
   FOREIGN KEY (id_klub_tamu) REFERENCES klub(id),
   tanggal_pertandingan DATE NOT NULL,
   skor_tuan_rumah INT DEFAULT 0,
   skor_tamu INT DEFAULT 0
);


DESCRIBE klub;
DESCRIBE pemain;
DESCRIBE pertandingan;

CREATE INDEX idx_posisi ON pemain(posisi);

INSERT INTO klub (nama_klub, kota_asal) VALUES (
   "Persija", "Jakarta"
),
(
   "Arema FC", "Malang"
),
(
   "Persebaya", "Surabaya"
),
(
   "PSM Makassar", "Makassar"
),
(
   "Bali United", "Bali"
);


EXPLAIN SELECT * FROM klub
WHERE kota_asal = "Makassar";

CREATE INDEX idx_kota_asal ON klub(kota_asal);


-- Nomor 2
USE classicmodels;

SELECT c.customerName, c.country, SUM(p.amount) AS `TotalPayment`,
COUNT(o.orderNumber) AS `orderCount`,
MAX(p.paymentDate) AS `LastPaymentDate`,
CASE
WHEN SUM(p.amount) > 100000 THEN 'VIP'
WHEN SUM(p.amount) > 5000 THEN 'Loyal'
ELSE "New"
END AS 'Status'
FROM customers AS c
LEFT JOIN payments AS p
USING (customerNumber)
LEFT JOIN orders AS o
USING (customerNumber)
GROUP BY customerNumber
ORDER BY c.customerName;

SELECT c.customerNumber, c.customerName, SUM(od.quantityOrdered) AS `total_quantity`,
CASE 
WHEN SUM(od.quantityOrdered) > (
   SELECT AVG(quantityOrdered) FROM (
      SELECT SUM(quantityOrdered) FROM orderdetails
   ) AS `tabel`
) THEN 'di atas rata-rata'
ELSE 'di bawah rata-rata'
END AS 'kategori_pembelian'
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
GROUP BY c.customerNumber
ORDER BY `total_quantity` DESC;

-- Nomor 4 Tugas Tambahan :

USE sepakbola;

SELECT * FROM klub;
SELECT * FROM pemain;
SELECT * FROM pertandingan;

DELETE FROM pemain;
DELETE FROM klub;
DELETE FROM pertandingan;

ALTER TABLE klub AUTO_INCREMENT = 0;
ALTER TABLE pemain AUTO_INCREMENT = 0;
ALTER TABLE pertandingan AUTO_INCREMENT = 0;

INSERT INTO klub (nama_klub, kota_asal) VALUES 
('Persija', 'Jakarta'),
('Arema FC', 'Malang'),
('Persebaya', 'Surabaya'),
('PSM Makassar', 'Makassar'),
('Bali United', 'Bali');

INSERT INTO pemain (nama_pemain, posisi, id_klub) VALUES 
('Evan Dimas', 'Midfielder', 1),
('Riko Simanjuntak', 'Forward', 1),
('Hanif Sjahbandi', 'Defender', 2),
('Makan Konate', 'Midfielder', 2),
('Irfan Jaya', 'Forward', 3),
('Rizky Pellu', 'Midfielder', 4),
('Illija Spasejovic', 'Forward', 5),
('Andhika Wijaya', 'Defender', 5);

INSERT INTO pertandingan (tanggal_pertandingan, id_klub_tuan_rumah, skor_tuan_rumah, id_klub_tamu, skor_tamu)
VALUES
('2024-09-10', 1, 2, 2, 1),   
('2024-09-12', 3, 1, 4, 1),
('2024-09-15', 5, 0, 1, 3),
('2024-09-20', 2, 1, 5, 2),
('2024-09-25', 4, 2, 3, 0);

START TRANSACTION;
ROLLBACK;
COMMIT;

