CREATE DATABASE kampus;

USE kampus;

CREATE TABLE dosen(
id INT AUTO_INCREMENT,
nama VARCHAR(255) UNIQUE,
jenis_kelamin VARCHAR(20) NOT NULL,
PRIMARY KEY (id, nama)
);

CREATE TABLE mahasiswa(
id INT AUTO_INCREMENT,
kode INT,
nama VARCHAR(255) UNIQUE,
jenis_kelamin VARCHAR(20) NOT NULL,
kode_dosen INT,
FOREIGN KEY (kode_dosen) REFERENCES dosen(id),
PRIMARY KEY(id, kode)
);


SHOW TABLES;
DESCRIBE mahasiswa;
DESCRIBE dosen;