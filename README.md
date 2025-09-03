# 📚 Library Management Project (SQL)

This project simulates a **Library Management System** using SQL Server.  
It covers database setup, CRUD operations, reporting queries, and insights.

---

## 1) Database Setup

```sql
-- Create database (optional)
-- CREATE DATABASE library_db;
-- USE library_db;

-- Table: branch
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
  branch_id   VARCHAR(10) PRIMARY KEY,
  manager_id  VARCHAR(10),
  branch_address VARCHAR(30),
  contact_no  VARCHAR(15));

-- Table: employees
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  emp_id    VARCHAR(10) PRIMARY KEY,
  emp_name  VARCHAR(30),
  position  VARCHAR(30),
  salary    DECIMAL(10,2),
  branch_id VARCHAR(10),
  FOREIGN KEY (branch_id) REFERENCES branch(branch_id));

## 2) CRUD Operations

- **Create**: Inserted sample records into the `books` table.  
- **Read**: Retrieved and displayed data from various tables.  
- **Update**: Updated records in the `employees` table.  
- **Delete**: Removed records from the `members` table as needed.

### Task 1 – Create a New Book Record
```sql
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES ('978-1-60129-456-2','To Kill a Mockingbird','Classic', 6.00,'yes','Harper Lee','J.B. Lippincott & Co.');

SELECT * FROM books;

### Task 2 – Update an Existing Member's Address
```sql
UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';

### Task 3 – Delete a Record from the Issued Status Table
DELETE FROM issued_status
WHERE issued_id = 'IS121';






\## 🛠 How to Run

1\. Create a new database in SQL Server.  

2\. Run `LibraryProject.sql` step by step.  

3\. Inspect the results of each task.  



\## Example Insights

\- “Harry Potter” and “The Da Vinci Code” are among the most issued books.  

\- Branch reports show issued, returned, and total revenue per branch.  

\- Overdue book calculation using `DATEDIFF` identifies late returns.  



\## 👤 Author

Trinh Nguyen — ng.trinh3023@gmail.com

