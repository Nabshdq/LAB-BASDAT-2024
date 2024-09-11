USE library;

ALTER TABLE authors
MODIFY nationality VARCHAR(50) NOT NULL;


ALTER TABLE books
MODIFY title VARCHAR(150) NOT NULL,
MODIFY isbn CHAR(13) NOT NULL UNIQUE,
ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL;

CREATE TABLE members(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone_number CHAR(10),
join_date DATE NOT NULL,
membership_type VARCHAR(50) NOT NULL
);

CREATE TABLE borrowings(
id INT PRIMARY KEY AUTO_INCREMENT,
member_id INT NOT NULL,
book_id INT NOT NULL,
borrow_date DATE NOT NULL,
return_date DATE,

FOREIGN KEY (member_id) REFERENCES members(id),
FOREIGN KEY (book_id) REFERENCES books(id)
);