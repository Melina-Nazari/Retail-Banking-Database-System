-- Queries from CPS510 Assignment 4.1 group report.
-- Requires Oracle tables and sample data.

SELECT * FROM branch;
SELECT address FROM branch where branch_id = 100;
SELECT customer_id, name, phone, email FROM customer ORDER BY name;
SELECT name, birth_date FROM customer WHERE birth_date < DATE '1990-01-01';
SELECT * FROM accounts WHERE account_type = 'chequing';
SELECT * FROM accounts WHERE customer_id = 1;
SELECT * FROM savings_accounts;
SELECT * FROM chequing_accounts;
SELECT emp_id, name, employment_type, salary_wage FROM employee ORDER BY salary_wage DESC;
SELECT DISTINCT employment_type FROM employee;
SELECT * FROM atm WHERE branch_id = 101;
SELECT DISTINCT model_number FROM atm ORDER BY model_number;
SELECT * FROM transaction WHERE type = 'Withdrawal' ORDER BY trans_date;
SELECT type, COUNT(*) AS num_trans, SUM(amount) AS total_amount FROM transaction GROUP BY type ORDER BY total_amount DESC;
