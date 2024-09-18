-- 1. Buatlah sebuah database bernama ‘library’. Kemudian buat tabel-tabel berikut


CREATE DATABASE library

USE library

CREATE TABLE authors(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR (100) NOT NULL
)

CREATE TABLE books (
id INT PRIMARY KEY AUTO_INCREMENT,
isbn CHAR(13),
title VARCHAR(100) NOT NULL,
author_id INT,
FOREIGN KEY (author_id) REFERENCES authors(id)
)



-- 2. Tambahkan sebuah kolom pada tabel authors dengan nama ‘nationality’ dengan tipe data string dengan panjang maksimal 50 karakter.

ALTER TABLE authors
ADD nationality VARCHAR (50);

-- 3. Ubah kolom isbn pada books agar tidak terjadi duplikat data.

ALTER TABLE books
MODIFY isbn CHAR (13) UNIQUE

-- 4. Tampilkan semua tabel yang ada beserta strukturnya.

SHOW TABLES
DESCRIBE authors
DESCRIBE books

-- 5. 

CREATE TABLE members(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
emial VARCHAR (100) UNIQUE NOT NULL,
phone_number CHAR (10),
join_date DATE NOT NULL,
membership_type VARCHAR (50) NOT NULL
)

CREATE TABLE borrowings(
id INT PRIMARY KEY AUTO_INCREMENT,
member_id INT,
book_id INT,
borrow_date DATE NOT NULL,
retrun_date DATE,
FOREIGN KEY (member_id) REFERENCES members(id),
FOREIGN KEY (book_id) REFERENCES books(id)
)


ALTER TABLE books
ADD published_year YEAR
ADD gender VARCHAR (50)
ADD copies_available INT

CREATE TABLE mahasiswa(
id INT AUTO_INCREMENT,
nama VARCHAR (100),
nim CHAR (10),
PRIMARY KEY (id, nama)
)

DESCRIBE mahasiswa

