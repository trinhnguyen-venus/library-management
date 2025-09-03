-- LIBRARY MANAGEMENT PROJECT

-- Create tables
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
	(return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),
    return_book_name VARCHAR(75),
    return_date DATE,
    return_book_isbn VARCHAR(20));

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
	(issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10),
    issued_book_name VARCHAR(75),
    issued_date DATE,
    issued_book_isbn VARCHAR(20),
    issued_emp_id VARCHAR(10));

DROP TABLE IF EXISTS members;
CREATE TABLE members
	(member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(25),
    member_address VARCHAR(75),
    reg_date DATE);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
	(emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(25),
    position VARCHAR(15),
    salary INT,
    branch_id VARCHAR(10));

DROP TABLE IF EXISTS branch;
CREATE TABLE branch
	(branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(55),
    contact_no VARCHAR(15));

DROP TABLE IF EXISTS books;
CREATE TABLE books
	(isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(75),
    category VARCHAR(20),
    rental_price FLOAT,
    status VARCHAR(20),
    author VARCHAR(55),
    publisher VARCHAR(55));

-- Foreign Keys
ALTER TABLE issued_status
ADD CONSTRAINT fk_books FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_members FOREIGN KEY (issued_member_id) REFERENCES members(member_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status FOREIGN KEY (issued_id) REFERENCES issued_status(issued_id);

-- Sample data insert: Members
INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES
	('C101','Alice Johnson','123 Main St','2021-05-15'),
	('C102','Bob Smith','456 Elm St','2021-06-20'),
	('C103','Carol Davis','789 Oak St','2021-07-10'),
	('C104','Dave Wilson','567 Pine St','2021-08-05'),
	('C105','Eve Brown','890 Maple St','2021-09-25'),
	('C106','Frank Thomas','234 Cedar St','2022-01-15'),
	('C107','Grace Taylor','345 Walnut St','2022-02-20'),
	('C108','Henry Anderson','456 Birch St','2022-03-10'),
	('C109','Ivy Martinez','567 Oak St','2022-04-05'),
	('C110','Jack Wilson','678 Pine St','2022-05-25');

-- Sample data insert: Books
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES
	('978-0-553-29698-2','The Catcher in the Rye','Classic',7.00,'yes','J.D. Salinger','Little, Brown and Company'),
	('978-0-330-25864-8','Animal Farm','Classic',5.50,'yes','George Orwell','Penguin Books'),
	('978-0-14-118776-1','One Hundred Years of Solitude','Literary Fiction',6.50,'yes','Gabriel Garcia Marquez','Penguin Books'),
	('978-0-525-47535-5','The Great Gatsby','Classic',8.00,'yes','F. Scott Fitzgerald','Scribner'),
	('978-0-141-44171-6','Jane Eyre','Classic',4.00,'yes','Charlotte Bronte','Penguin Classics'),
	('978-0-307-37840-1','The Alchemist','Fiction',2.50,'yes','Paulo Coelho','HarperOne'),
	('978-0-679-76489-8','Harry Potter and the Sorcerers Stone','Fantasy',7.00,'yes','J.K. Rowling','Scholastic'),
	('978-0-7432-4722-4','The Da Vinci Code','Mystery',8.00,'yes','Dan Brown','Doubleday'),
	('978-0-09-957807-9','A Game of Thrones','Fantasy',7.50,'yes','George R.R. Martin','Bantam'),
	('978-0-393-05081-8','A Peoples History of the United States','History',9.00,'yes','Howard Zinn','Harper Perennial');

-- Sample data insert: Branches
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no)
VALUES
	('B001','E109','123 Main St','+919099988676'),
	('B002','E109','456 Elm St','+919099988677'),
	('B003','E110','789 Oak St','+919099988678');

-- Sample data insert: Employees
INSERT INTO employees(emp_id, emp_name, position,salary, branch_id)
VALUES
	('E101','John Doe','Clerk',60000,'B001'),
	('E102','Jane Smith','Clerk',45000,'B002'),
	('E103','Mike Johnson','Librarian',55000,'B001'),
	('E104','Emily Davis','Assistant',40000,'B001'),
	('E105','Sarah Brown','Assistant',42000,'B003'),
	('E109','Michael Green','Manager',75000,'B001'),
	('E110','Laura White','Manager',76000,'B003');

-- Sample data insert: Issued Status
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id)
VALUES
	('IS101','C101','Animal Farm','2024-03-10','978-0-330-25864-8','E101'),
	('IS102','C102','The Great Gatsby','2024-03-11','978-0-525-47535-5','E102'),
	('IS103','C103','Jane Eyre','2024-03-12','978-0-141-44171-6','E103'),
	('IS104','C104','Harry Potter and the Sorcerers Stone','2024-03-13','978-0-679-76489-8','E104'),
	('IS105','C105','The Alchemist','2024-03-14','978-0-307-37840-1','E105'),
	('IS106','C106','The Da Vinci Code','2024-03-15','978-0-7432-4722-4','E101'),
	('IS107','C107','A Game of Thrones','2024-03-16','978-0-09-957807-9','E102'),
	('IS108','C108','The Catcher in the Rye','2024-03-17','978-0-553-29698-2','E103');

-- Sample data insert: Return Status
INSERT INTO return_status(return_id, issued_id, return_book_name, return_date, return_book_isbn)
VALUES
	('RS101','IS101','Animal Farm','2024-05-01','978-0-330-25864-8'),
	('RS102','IS102','The Great Gatsby','2024-05-03','978-0-525-47535-5'),
	('RS103','IS104','Harry Potter and the Sorcerers Stone','2024-05-05','978-0-679-76489-8'),
	('RS104','IS105','The Alchemist','2024-05-07','978-0-307-37840-1'),
	('RS105','IS106','The Da Vinci Code','2024-05-09','978-0-7432-4722-4');

-- ================ TASKS ================

-- Task 1: Create a new record in books table ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', '6.00', 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES 
	('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', '6.00', 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books;

-- Task 2: Update the address of an existing member
UPDATE members
SET member_address = '125 Main St'
WHERE member_id = 'C101';
SELECT * FROM members;

-- Task 3: Delete a record from the issued_status table where issued_id = 'IS121'
DELETE FROM issued_status
WHERE issued_id = 'IS121';

SELECT * FROM issued_status
WHERE issued_id = 'IS121';

-- Task 4: Retrieve all books issued by the employee with emp_id = 'E104'
SELECT emp_name, 
	position,
	issued_book_name,
	issued_date
FROM issued_status
	JOIN employees ON emp_id = issued_emp_id
WHERE issued_emp_id = 'E104';

-- Task 5: List members who have issued more than one book
SELECT issued_member_id,
	COUNT(*) AS total_book_issued,
	member_name
FROM issued_status
	JOIN members ON member_id = issued_member_id
GROUP BY issued_member_id, member_name
HAVING COUNT(*) >=2;

-- Task 6: Create a summary table (CTAS) showing each book and its total issued count
SELECT isbn,
	book_title,
	COUNT(issued_id) AS no_issued
INTO book_issued_cnt
FROM books
	JOIN issued_status ON isbn = issued_book_isbn
GROUP BY isbn, book_title;

SELECT * FROM book_issued_cnt;

-- Task 7: Retrieve all books in the 'Classic' category
SELECT * FROM books
WHERE category = 'Classic';

-- Task 8: Find total rental income by category
SELECT b.category,
       COUNT(ist.issued_id) AS no_books_issued,
       SUM(b.rental_price) AS total_rental_income
FROM books b
	JOIN issued_status ist ON b.isbn = ist.issued_book_isbn
GROUP BY b.category;

-- Task 9: List members who registered in the last 180 days
SELECT * FROM members
WHERE reg_date >= DATEADD(DAY, -180, GETDATE());

INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES 
	('C325', 'Sam', '145 Main St', '2025-07-01'),
	('C216', 'John', '222 Marie St', '2025-08-25');

-- Task 10: List employees with their manager's name and branch details
SELECT E1.emp_name,
	E1.position,
	manager_id,
	E2.emp_name AS manager_name,
	branch.*
FROM employees E1
	JOIN branch ON E1.branch_id = branch.branch_id
	JOIN employees E2 ON E2.emp_id = branch.manager_id;

-- Task 11: Create a new table containing books with rental_price greater than 7 USD
SELECT *
INTO books_price_greater_than_7
FROM books
WHERE rental_price > 7;

SELECT * FROM books_price_greater_than_7;

-- Task 12: Retrieve the list of books that have not been returned
SELECT DISTINCT issued_book_name
FROM issued_status ist
	LEFT JOIN return_status rst ON ist.issued_id = rst.issued_id
WHERE rst.return_id IS NULL;

-- Task 13: Find overdue books (>30 days)
SELECT ist.issued_id, ist.issued_book_name, m.member_name,
       DATEDIFF(DAY, ist.issued_date, rst.return_date) AS overdue_days
FROM issued_status ist
	JOIN members m ON m.member_id = ist.issued_member_id
	JOIN return_status rst ON rst.issued_id = ist.issued_id
WHERE DATEDIFF(DAY, ist.issued_date, rst.return_date) > 30;

-- Task 14: Update book status on return
UPDATE b
SET b.status = 'yes'
FROM books b
	JOIN issued_status ist ON ist.issued_book_isbn = b.isbn
	JOIN return_status rst ON rst.issued_id = ist.issued_id;

-- Task 15: Branch performance report
SELECT br.branch_id,
       COUNT(DISTINCT ist.issued_id) AS number_books_issued,
       COUNT(DISTINCT rst.return_id) AS number_books_returned,
       SUM(b.rental_price) AS total_revenue
INTO branch_reports
FROM employees e
	JOIN branch br ON br.branch_id = e.branch_id
	JOIN issued_status ist ON ist.issued_emp_id = e.emp_id
	JOIN books b ON b.isbn = ist.issued_book_isbn
	LEFT JOIN return_status rst ON rst.issued_id = ist.issued_id
GROUP BY br.branch_id;

SELECT * FROM branch_reports;

-- Task 16: Top 3 most issued books
SELECT TOP 3 ist.issued_book_name,
	COUNT(*) AS issued_count
FROM issued_status ist
GROUP BY ist.issued_book_name
ORDER BY issued_count DESC;
