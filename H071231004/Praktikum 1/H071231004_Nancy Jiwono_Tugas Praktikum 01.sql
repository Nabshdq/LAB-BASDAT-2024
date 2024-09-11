-- nama: Nancy JIwono
-- nim: H071231004
-- tugas praktikum 01 

CREATE DATABASE library;

USE library;

CREATE TABLE authors (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR (100) NOT NULL 
)

CREATE TABLE books (
id INT PRIMARY KEY AUTO_INCREMENT,
isbn VARCHAR (13),
title VARCHAR (100) NOT NULL,
`author id` INT,
FOREIGN KEY (`author id`) REFERENCES authors (id)
);

CREATE TABLE members (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50),
last_name VARCHAR (50),
email VARCHAR (100) UNIQUE,
phone_number CHAR (10) NULL, 
join_date DATE,
membership_type VARCHAR (50) 
);

CREATE TABLE borrowings (
id INT PRIMARY KEY AUTO_INCREMENT,
member_id INT, 
book_id INT,
borrow_date DATE,
return_date DATE NULL 
);

ALTER TABLE authors 
MODIFY isbn VARCHAR(13) UNIQUE NOT NULL,
ADD nationality VARCHAR (50);
MODIFY nationality VARCHAR(50) NOT NULL;

ALTER TABLE books
ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL;
MODIFY isbn VARCHAR (13) UNIQUE NOT NULL,
MODIFY `author id` INT NOT NULL;


ALTER TABLE members
MODIFY first_name VARCHAR(50) NOT NULL,
MODIFY last_name VARCHAR (50) NOT NULL,
MODIFY email VARCHAR(100) UNIQUE NOT NULL,
MODIFY join_date DATE NOT NULL, 
MODIFY membership_type VARCHAR(50) NOT NULL;

ALTER TABLE borrowings
MODIFY member_id INT(11) NOT NULL,
MODIFY book_id INT(11) NOT NULL,
MODIFY borrow_date DATE NOT NULL;

DESCRIBE authors
DESCRIBE books
DESCRIBE members
DESCRIBE borrowings

SHOW TABLES 

DROP borrowings

CREATE TABLE tambah (
buku INT AUTO_INCREMENT,
kuda VARCHAR(20),
PRIMARY KEY (buku, kuda)
)

DESCRIBE tambah
