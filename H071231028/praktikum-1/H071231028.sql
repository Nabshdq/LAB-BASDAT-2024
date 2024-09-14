CREATE DATABASE library;
USE library;

CREATE TABLE authors (
    id INT PRIMARY KEY auto_increment, 
    nama VARCHAR(100) NOT NULL
);


CREATE TABLE books (
    id INT PRIMARY KEY auto_increment,
    isbn CHAR(13),
    title VARCHAR(100) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id) 
);

ALTER TABLE authors 
ADD nationality VARCHAR(50);

ALTER TABLE books 
MODIFY isbn VARCHAR(13) UNIQUE;

CREATE TABLE members (
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number CHAR(10),
	join_date DATE NOT NULL,
	membership_type VARCHAR(50) NOT NULL 
);

ALTER TABLE books
MODIFY title VARCHAR(150) NOT NULL, 
MODIFY isbn VARCHAR(13) UNIQUE,
MODIFY author_id INT NOT NULL,
ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL;
ADD copies_available INT NOT NULL;

CREATE TABLE borrowings (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	member_id INT NOT NULL,
	book_id INT NOT NULL, 
	borrow_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY(member_id) REFERENCES members(id),
	FOREIGN KEY(book_id) REFERENCES books(id)
	

);

CREATE TABLE dosen (
	idn INT  AUTO_INCREMENT,
	nama VARCHAR (40) NOT NULL,
	nid CHAR (10) UNIQUE,
	PRIMARY KEY (idn, nid)
);

CREATE TABLE mahasiswa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nim CHAR (10) UNIQUE,
	nama VARCHAR (40) NOT NULL,
	pembimbing int (40),
	FOREIGN KEY (pembimbing) REFERENCES dosen (idn)
);



SHOW TABLES;
DESCRIBE authors;
DESCRIBE books;
DESCRIBE members;
DESCRIBE borrowings;
DESCRIBE mahasiswa;
DESCRIBE dosen;
