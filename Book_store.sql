CREATE DATABASE book_store;

USE book_store;



CREATE TABLE users(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
role_id INT,
FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE roles(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
manager VARCHAR(50),
librarian VARCHAR(50),
janitor VARCHAR(50),
administrator VARCHAR(50),
owner VARCHAR(50),
technical_support VARCHAR(50)
);

CREATE TABLE books (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
book_stock INT,
book_title VARCHAR (50),
book_author VARCHAR(50),
book_desc LONGTEXT,
publish_date DATE

);

CREATE TABLE book_track (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
checkout_id INT,
book_id INT,
checkout_status BOOLEAN,
FOREIGN KEY (checkout_id) REFERENCES users(id),
FOREIGN KEY (book_id) REFERENCES books(id)
);

--  track book inventory, the info on the books, check out status, etc.

ALTER TABLE users
ADD COLUMN Lib_id INT,
ADD COLUMN first_name VARCHAR(50),
ADD COLUMN last_name VARCHAR(50),
ADD COLUMN user_DOB DATE,
ADD COLUMN phone_num INT(10)UNSIGNED,
ADD COLUMN user_email VARCHAR (50),
ADD COLUMN user_created YEAR,
ADD COLUMN fine_track DECIMAL(4,2)
;



SELECT u.Lib_id, u.first_name, u.last_name, u.user_email, u.fine_track, b.book_title, b.book_author, b.book_desc, b.publish_date
FROM users u
INNER JOIN books b ON u.id =b.id;
