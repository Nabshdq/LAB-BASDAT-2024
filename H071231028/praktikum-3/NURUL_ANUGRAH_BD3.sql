USE library;

#no1
INSERT INTO authors (nama, nationality)
VALUES ("Tere Liye", "Indonesian"),
 ("J.K Rowling", "British"),
("Andrea Hirata", '' );

INSERT INTO Books (Isbn, Title, Author_id, Published_Year, Genre, Copies_Available) VALUES 
('7040289780375', 'Ayah', 'Andrea Hirata', 2015, 'Fiction', 15),
('9780375704025', 'Bumi', 'Tere Liye', 2014, 'Fantasy', 5),
('8310371703024', 'Bulan', 'Tere Liye', 2015, 'Fantasy', 3),
('9780747532699', 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 1997, NULL, 10),
('7210301703022', 'The Running Grave', 'J.K. Rowling', 2016, 'Fiction', 11);

INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES ("John", "Doe", "John.doe@example.com", NULL, "2023-04-29", ''),
("Alice", "Johnson", "Alice.johnson@example.com", 1231231231, "2023-05-01", "Standar"),
("Bob", "Williams", "bob.williams@example.com", 3213214321, "2023-06-20", "Premium");

INSERT INTO borrowings (member_id, book_id, borrow_date, return_date)
VALUES(1, 4, "2023-07-10", "2023-07-10"), 
(3, 1, "2023-08-01", NULL),
(2, 5, "2023-09-06", "2023-09-09"), 
(2, 3, "2023-09-08", NULL),
(2, 2, "2023-09-10", NULL); 

#no2
UPDATE Books 
SET copies_available = 15-1
WHERE title = "Ayah";

UPDATE Books 
SET copies_available = 3-1
WHERE title = "Bulan";

UPDATE Books 
SET copies_available = 5-1
WHERE title = "Bumi";

#Bob Williams menghilangkan buku Premium ke Standar
UPDATE members
SET membership_type = 'Standar'
WHERE first_name = 'Bob';

#Alice Johnson menghilangkan buku Standar ke blank
UPDATE members 
SET membership_type = ''
WHERE first_name = 'Alice';

SELECT * FROM members ;
UPDATE members
SET membership_type = 'premium'
WHERE first_name = 'Bob';

UPDATE members 
SET membership_type = 'standar'
WHERE first_name = 'Alice';


SELECT * FROM books ;
UPDATE books
SET copies_available = '15'
WHERE title = 'Ayah';

UPDATE books
SET copies_available = '3'
WHERE title = 'bulan';

UPDATE books
SET copies_available = '5'
WHERE title = 'bumi';







SHOW TABLES;
DESCRIBE authors;
DESCRIBE books;
DESCRIBE members;
DESCRIBE borrowings;
DESCRIBE mahasiswa;
DESCRIBE dosen;
SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM borrowings;