\# Library Management Project (SQL)



\## Introduction

This project simulates a \*\*Library Management System\*\* using SQL.  

It covers database schema design, data population, and practical SQL queries for day-to-day operations and reporting.



\##  Schema

\- \*\*Books\*\*: isbn, title, category, price, status, author, publisher  

\- \*\*Members\*\*: member details and registration date  

\- \*\*Employees\*\*: library staff and branch assignments  

\- \*\*Branch\*\*: branch info with manager reference  

\- \*\*Issued\_Status\*\*: records of issued books  

\- \*\*Return\_Status\*\*: records of returned books  



\## Key Tasks

\- Insert / Update / Delete operations (CRUD).  

\- JOIN queries to connect members, employees, and issued books.  

\- Aggregations: top 3 issued books, overdue books, and rental income by category.  

\- CTAS examples: branch performance report, book issue counts.  



\## 🛠 How to Run

1\. Create a new database in SQL Server.  

2\. Run `LibraryProject.sql` step by step.  

3\. Inspect the results of each task.  



\## 📊 Example Insights

\- “Harry Potter” and “The Da Vinci Code” are among the most issued books.  

\- Branch reports show issued, returned, and total revenue per branch.  

\- Overdue book calculation using `DATEDIFF` identifies late returns.  



\## 👤 Author

Trinh Nguyen — ng.trinh3023@gmail.com

