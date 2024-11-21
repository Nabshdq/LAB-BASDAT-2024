create database FootballManagement;

use FootballManagement;


## NO 1
create table klub (
	id int auto_increment primary key,
    nama_klub varchar(50) not null,
    kota_asal varchar(20) not null
);

create table pemain (
	id int auto_increment primary key,
    nama_pemain varchar(50) not null,
    posisi varchar(20) not null,
    id_klub int,
    foreign key(id_klub) references klub(id) 
);

create table pertandingan (
	id int auto_increment primary key,
    id_klub_tuan_rumah int,
    id_klub_tamu int,
    tanggal_pertandingan DATE,
    skor_tuan_rumah int default 0,
    skor_tamu int default 0,
    foreign key(id_klub_tuan_rumah) references pemain(id_klub),
    foreign key(id_klub_tamu) references klub(id)
);

create index info_posisi on pemain(posisi);
create index info_kota_asal on klub(kota_asal);
create index IDX_nama_klub on klub(nama_klub);

EXPLAIN SELECT  * FROM klub
WHERE nama_klub = "persija"

INSERT INTO klub (nama_klub, kota_asal) VALUES
('persija','jakarta'),
('Arema FC', 'Malang'),
('persebaya', 'Surabaya');

INSERT INTO klub (nama_klub, kota_asal) VALUES
('PSM Makassar', 'Makassar'),
('Bali United', 'Bali');


desc klub;
desc pemain;


## NO 2
use classicmodels;

select c.customerName, c.country, round(sum(amount),2) `TotalPayment`, count(orderNumber) orderCount, max(p.paymentDate) LastPaymentDate,
case
	when sum(amount) > 100000 then 'VIP'
    when sum(amount) between 5000 and 100000 then 'Loyal'
    ELSE 'New'
    END AS STATUS
      
from customers c
left join payments p
using(customerNumber)
left join orders o
using(customerNumber)
group by c.customerNumber
order by customerName asc;


## NO 3
select customerNumber, customerName, sum(quantityOrdered) `total_quantity`,
case
	when sum(quantityOrdered) > (select avg(quantityOrdered) from orderdetails) then "Di Atas Rata-Rata"
    else "Di Bawah Rata-Rata"
    end as kategori_pembelian
from customers c
join orders o
using(customerNumber)
join orderdetails od
using(orderNumber)
group by customerNumber
order by total_quantity DESC;


## Soal Tambahan
START TRANSACTION;
SELECT @@autocommit;

SET autocommit = 0;

INSERT INTO pemain (nama_pemain, posisi, id_klub) VALUES
('Evan Dimas', 'Midfielder', 1),
('Riko Simanjuntak', 'Forward',1),
('Hanif Sjahbandi', 'Defender', 2),
('Makan Konate', 'Midfielder', 2),
('David da Silva', 'Forward', 3),
('Irfan Jaya', 'Forward', 4),
('Rizky Pellu', 'Midfielder',4),
('Ilija Spasojevic', 'Forward', 5),
('Andhika Wijaya', 'Defender',5);

SELECT * FROM pemain

INSERT INTO pertandingan (tanggal_pertandingan, id_klub_tuan_rumah, skor_tuan_rumah, skor_tamu, id_klub_tamu  ) VALUES
('2024-09-10', 1, 2, 1, 2),
('2024-09-12', 3, 1, 1, 4),
('2024-09-15', 4, 0, 3, 1),
('2024-09-20', 2, 1, 2, 5),
('2024-09-25', 4, 2, 0, 3);


COMMIT;

SELECT * FROM pertandingan




