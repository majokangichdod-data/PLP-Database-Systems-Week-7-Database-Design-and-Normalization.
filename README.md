# PLP Week 7: Database Design and Normalization

## Project Overview
This project demonstrates database normalization using SQL. It covers First Normal Form (1NF) and Second Normal Form (2NF).

## Question 1: First Normal Form (1NF)
The original ProductDetail table contained multiple products in one cell.

To achieve 1NF:
- Created a new table called `ProductDetail_1NF`.
- Ensured each row contains only one product.
- Inserted all normalized product records.
- Used a composite primary key consisting of OrderID and Product.

## Question 2: Second Normal Form (2NF)
The original OrderDetails table had a partial dependency because CustomerName depended only on OrderID.

To achieve 2NF:
- Created an Orders table to store order information.
- Created an OrderItems table to store products and quantities.
- Defined primary keys and a foreign key.
- Inserted the normalized records.
- Used an INNER JOIN to display combined order information.

## Files Included
- `normalization.sql` – SQL statements for both questions.
- `README.md` – Project documentation.

## How to Run
1. Open the SQL file in a SQL database environment.
2. Execute the SQL statements.
3. Check the results using the SELECT statements.
4. Confirm that the normalized tables contain the expected records.

## Conclusion
Database normalization reduces data redundancy, improves data consistency, and establishes relationships between tables using primary and foreign keys.

