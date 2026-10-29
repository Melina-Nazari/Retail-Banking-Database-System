
**Retail Banking Database System**
A group database project developed for CPS 510 at Toronto Metropolitan University using Oracle SQL, SQL*Plus, and Unix shell scripting.

Purpose of the project
The goal of this project was to design and implement a relational database that represents the information a retail bank needs to manage. Rather than storing customer, account, employee, and transaction information in disconnected records, we designed related tables so banking data could be organized consistently and retrieved through SQL.

The project also demonstrates the progression from database design to implementation, data analysis, and command-line interaction. It is a learning project with sample banking records, not a production banking application.

What the system models
The database represents customers, bank branches, bank accounts, savings and chequing account details, employees, ATMs, and transactions. These concepts are connected using primary and foreign keys to represent relationships such as a customer owning an account, an employee working at a branch, or a transaction involving an account and possibly an ATM.

The schema consists of eight tables: branch, customer, accounts, savings_accounts, chequing_accounts, employee, atm, and transaction.

Why we wrote each part of the code
1. Database design and table creation 
We first designed an Enhanced Entity–Relationship (EER) diagram to identify the banking entities, their attributes, and how they relate to each other. We then translated that design into Oracle SQL CREATE TABLE statements.

Purpose: To build the database structure and use constraints such as primary keys, foreign keys, and required fields to help maintain consistent records.

Files: EER-Diagram.png, 01_schema.sql

2. Sample data and simple queries 
We inserted sample records into the banking tables and wrote introductory SQL queries to retrieve and filter information from them.

Purpose: To demonstrate that the database can store related banking records and answer basic questions using SQL, rather than requiring someone to inspect each table manually.

Files: 02_sample_data.sql, 03_simple_queries.sql

3. Advanced database queries
We developed seven advanced queries to answer more meaningful questions about the banking data. Examples include:

Identifying customers who have used an ATM, and those who have not, using EXISTS and NOT EXISTS
Finding ATMs with no recorded transactions using the MINUS set operation
Creating a combined customer and employee directory using UNION
Calculating employee wage statistics by employment type using COUNT, AVG, MIN, MAX, and GROUP BY
Calculating branch weekly payroll using joins, SUM, grouping, and HAVING
Summarizing transactions by type, including counts and transaction amounts
Purpose: To demonstrate how relational queries, set operations, and aggregation can turn stored data into useful banking reports.

File: 04_advanced_queries.sql

4. Unix shell menu
We created a text-based menu that allows a user to select database operations from the command line, including creating tables, inserting sample records, and running queries. A separate SQL script supports dropping the project tables when resetting the test database.

Purpose: To provide a simple interface for interacting with Oracle SQL without manually typing every command, and to practice integrating shell scripting with a database.

Files: menu.sh, 00_drop_tables.sql

Technologies and skills
Oracle SQL: Table creation, constraints, data insertion, joins, subqueries, set operations, and aggregate queries
SQL*Plus: Running SQL scripts against an Oracle database
Unix shell / Bash: Building a menu-driven command-line interface
EER modeling: Planning relational tables and their relationships
Repository files
All files are located in the main folder of this repository.

File	Role
README.md	Project explanation and setup instructions
EER-Diagram.png	Visual model of the database
01_schema.sql	Creates the eight database tables
02_sample_data.sql	Adds sample records
03_simple_queries.sql	Basic data retrieval queries
04_advanced_queries.sql	Seven advanced SQL queries
00_drop_tables.sql	Deletes project tables for a reset
menu.sh	Command-line database menu
How to run
Requirements: Access to an Oracle database and SQL*Plus. Run these scripts only in a dedicated test schema.

Clone or download the repository and open a terminal in its main folder.
Connect to your Oracle database through SQL*Plus.
Run the scripts in order:
@01_schema.sql
@02_sample_data.sql
@03_simple_queries.sql
@04_advanced_queries.sql
To use the shell menu, configure the SQLPLUS_CONNECT environment variable with your own SQL*Plus connection string, then run:

bash menu.sh
Important: 00_drop_tables.sql permanently drops the project tables. Do not run it against a database containing data you need to keep. Never commit real credentials to GitHub.
