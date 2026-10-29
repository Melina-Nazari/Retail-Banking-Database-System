-- Assignment 5: advanced Oracle SQL queries (reviewed for syntax; not executed against Oracle).
-- Customers who have used an ATM
SELECT c.customer_id, c.name, c.phone FROM customer c
WHERE EXISTS (SELECT 1 FROM accounts a JOIN transaction t ON t.account_id=a.account_id
 WHERE a.customer_id=c.customer_id AND t.atm_id IS NOT NULL) ORDER BY c.name;

-- Customers who have never used an ATM
SELECT c.customer_id, c.name, c.email FROM customer c
WHERE NOT EXISTS (SELECT 1 FROM accounts a JOIN transaction t ON t.account_id=a.account_id
 WHERE a.customer_id=c.customer_id AND t.atm_id IS NOT NULL) ORDER BY c.name;

-- Unused ATMs: corrected the incomplete predicate in the submitted MINUS query
SELECT m.atm_id, m.model_number, b.branch_id, b.address FROM atm m JOIN branch b ON m.branch_id=b.branch_id
MINUS
SELECT m.atm_id, m.model_number, b.branch_id, b.address
FROM atm m JOIN branch b ON m.branch_id=b.branch_id JOIN transaction t ON m.atm_id=t.atm_id;

-- Bank directory (customers and employees)
SELECT 'Customer' AS role, name, phone FROM customer
UNION
SELECT 'Employee' AS role, name, phone FROM employee
ORDER BY role, name;

-- Wage statistics by employment type
SELECT employment_type, COUNT(*) AS num_staff, AVG(salary_wage) AS avg_wage,
 MIN(salary_wage) AS min_wage, MAX(salary_wage) AS max_wage
FROM employee GROUP BY employment_type ORDER BY avg_wage DESC;

-- Branches with weekly payroll over 1000: corrected HAVING expression and GROUP BY
SELECT b.branch_id, b.address, COUNT(e.emp_id) AS num_staff,
 SUM(e.salary_wage*e.hours_worked) AS weekly_payroll
FROM branch b JOIN employee e ON b.branch_id=e.branch_id
GROUP BY b.branch_id, b.address
HAVING SUM(e.salary_wage*e.hours_worked)>1000 ORDER BY weekly_payroll DESC;

-- Transaction statistics
SELECT type, COUNT(*) AS num_trans, SUM(amount) AS total, AVG(amount) AS average,
 MIN(amount) AS smallest, MAX(amount) AS largest
FROM transaction GROUP BY type ORDER BY total DESC;
