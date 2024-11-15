-- 1
CREATE DATABASE sepakbola;
USE sepakbola;sepakbolasepakbola
CREATE TABLE klub (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nama_klub VARCHAR(50) NOT NULL,
    kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nama_pemain VARCHAR(50) NOT NULL,
    posisi VARCHAR(20) NOT NULL,
    id_klub INTEGER,
    FOREIGN KEY (id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_klub_tuan_rumah INTEGER,
    id_klub_tamu INTEGER,
    tanggal_pertandingan DATE NOT NULL,
    skor_tuan_rumah INTEGER DEFAULT 0,
    skor_tamu INTEGER DEFAULT 0,
    FOREIGN KEY (id_klub_tuan_rumah) REFERENCES klub(id),
    FOREIGN KEY (id_klub_tamu) REFERENCES klub(id)
);

CREATE INDEX idx_posisi ON pemain(posisi);
CREATE INDEX idx_kota_asal ON klub(kota_asal);

INSERT INTO klub (nama_klub, kota_asal) VALUES 
    ('Persija', 'Jakarta'),
    ('Arema FC', 'Malang'),
    ('Persebaya', 'Surabaya');
    
    

explain SELECT  * FROM klub WHERE kota_asal = 'jakarta';
-- 2 
SELECT c.customerName, c.country, SUM(p.amount) AS TotalPayment, 
COUNT(o.customerNumber) AS OrderCount, 
(SELECT MAX(p.paymentDate) 
FROM customers c
JOIN payments p USING(customerNumber)) AS LastPaymentDate,
case 
when SUM(p.amount) > 100000 then 'VIP'
when SUM(p.amount) BETWEEN 5000 AND 100000 then 'Loyal'
ELSE 'New'
END AS Status
FROM customers c
LEFT JOIN payments p USING(customerNumber)
LEFT JOIN orders o USING(customerNumber)
GROUP BY  c.customerName;

-- 3
SELECT c.customerNumber, c.customerName, SUM(od.quantityOrdered) AS total_quantity,
case 
when  SUM(od.quantityOrdered) > (SELECT AVG(total_quantity) 
FROM (SELECT sum(od.quantityOrdered) AS total_quantity 
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY c.customernumber) AS subquery) then 'dia atas rata-rata'
ELSE 'di bawah rata-rata'
END AS kategori_pembelian
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY c.customernumber, c.customername
ORDER BY total_quantity DESC;


SELECT @@autocommit;
SET autocommit =0;

START TRANSACTION ;
INSERT INTO klub(nama_klub,kota_asal) VALUES ('persija','jakarta');
INSERT INTO klub(nama_klub,kota_asal) VALUES ('arema fc','malang');
INSERT INTO klub(nama_klub,kota_asal) VALUES ('persebaya','surabaya');
INSERT INTO klub(nama_klub,kota_asal) VALUES ('psm makassar','makassar');
INSERT INTO klub(nama_klub,kota_asal) VALUES ('bali united','bali');

INSERT INTO pemain (nama_pemain,posisi,id_klub) VALUES 
('Evan Dimas', 'Midfielder', 1),     
    ('Riko Simanjuntak', 'Forward', 1),   
    ('Hanif Sjahbandi', 'Defender', 2),  
    ('Makan Konate', 'Midfielder', 2),   
    ('David da Silva', 'Forward', 3),     
    ('Irfan Jaya', 'Forward', 4),        
    ('Rizky Pellu', 'Midfielder', 4),     
    ('Ilija Spasojevic', 'Forward', 5),   
    ('Andhika Wijaya', 'Defender', 5);
    
INSERT INTO pertandingan (id_klub_tuan_rumah, id_klub_tamu, tanggal_pertandingan, skor_tuan_rumah, skor_tamu) 
VALUES
    ('2024-09-10', 1, 2, 2, 1),   
    ('2024-09-12', 3, 4, 1, 1),   
    ('2024-09-15', 5, 1, 0, 3),    
    ('2024-09-20', 2, 5, 1, 2),    
    ('2024-09-25', 4, 3, 2, 0);


COMMIT;
