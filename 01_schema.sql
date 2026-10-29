-- Oracle SQL schema transcribed from CPS510 Assignment 3.
-- Execute on an empty schema. DROP statements omitted for safer first-time setup.
-- Not yet tested against an Oracle instance.

CREATE TABLE branch (
  branch_id NUMBER PRIMARY KEY,
  address VARCHAR2(50) DEFAULT '123 King Street' UNIQUE NOT NULL
);
CREATE TABLE customer (
  customer_id NUMBER PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  birth_date DATE NOT NULL,
  address VARCHAR2(100) NOT NULL,
  phone VARCHAR2(10) NOT NULL,
  sin VARCHAR2(9) UNIQUE NOT NULL,
  postal_code VARCHAR2(6) NOT NULL,
  email VARCHAR2(50)
);
CREATE TABLE accounts (
  account_id NUMBER PRIMARY KEY,
  date_opened DATE DEFAULT DATE '2026-01-01' NOT NULL,
  balance NUMBER(38,2) DEFAULT 0 NOT NULL,
  status VARCHAR2(8) DEFAULT 'Active' NOT NULL,
  account_type VARCHAR2(8) DEFAULT 'chequing' NOT NULL,
  customer_id NUMBER NOT NULL REFERENCES customer(customer_id)
);
CREATE TABLE savings_accounts (
  account_id NUMBER PRIMARY KEY,
  interest_rate NUMBER(4,3) CHECK (interest_rate BETWEEN 0.01 AND 1),
  CONSTRAINT savings_accounts_fk FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
CREATE TABLE chequing_accounts (
  account_id NUMBER PRIMARY KEY,
  overdraft_fee NUMBER DEFAULT 5 NOT NULL,
  CONSTRAINT chequing_accounts_fk FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
CREATE TABLE employee (
  emp_id NUMBER PRIMARY KEY,
  name VARCHAR2(100) NOT NULL,
  birth_date DATE NOT NULL,
  address VARCHAR2(200) NOT NULL,
  postal_code VARCHAR2(10) NOT NULL,
  phone VARCHAR2(20) NOT NULL,
  email VARCHAR2(100) NOT NULL,
  employment_type VARCHAR2(30) NOT NULL,
  salary_wage NUMBER(10,1) NOT NULL,
  hours_worked NUMBER(6,2) DEFAULT 0 NOT NULL,
  branch_id NUMBER NOT NULL,
  CONSTRAINT fk_employee_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
CREATE TABLE atm (
  atm_id NUMBER PRIMARY KEY,
  model_number VARCHAR2(50),
  balance NUMBER(12,2) DEFAULT 0,
  branch_id NUMBER NOT NULL,
  CONSTRAINT fk_atm_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
CREATE TABLE transaction (
  trans_id NUMBER PRIMARY KEY,
  amount NUMBER NOT NULL,
  type VARCHAR2(20) NOT NULL,
  trans_date DATE NOT NULL,
  description VARCHAR2(100),
  account_id NUMBER NOT NULL,
  atm_id NUMBER,
  CONSTRAINT transaction_account_fk FOREIGN KEY (account_id) REFERENCES accounts(account_id),
  CONSTRAINT transaction_atm_fk FOREIGN KEY (atm_id) REFERENCES atm(atm_id)
);
