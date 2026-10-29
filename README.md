# Retail Banking Database System

A collaborative CPS 510 database project at Toronto Metropolitan University (Fall 2026), modeling retail banking branches, customers, accounts, employees, ATMs, and transactions using Oracle SQL.

## Database design

![Enhanced ER diagram](diagrams/EER-Diagram.png)

The schema includes eight tables, with primary keys, foreign keys, defaults, and constraints.

## Features

- Relational schema and sample records (Assignments 3 and 4.1)
- Simple SQL filtering, sorting, and aggregation (Assignment 4.1)
- Seven advanced SQL queries covering `EXISTS`, `NOT EXISTS`, `MINUS`, `UNION`, joins, grouping, and statistics (Assignment 5)
- Bash command-line menu for schema setup, sample-data loading, and queries (Assignment 5)

## Files

- `diagrams/EER-Diagram.png` — Enhanced ER diagram
- `sql/01_schema.sql` — Create eight database tables
- `sql/02_sample_data.sql` — Insert example records
- `sql/03_simple_queries.sql` — Assignment 4.1 queries
- `sql/04_advanced_queries.sql` — Assignment 5 queries
- `sql/00_drop_tables.sql` — Destructive cleanup (use carefully)
- `scripts/menu.sh` — Command-line menu

## How to run

Requires access to an Oracle database and the `sqlplus` command-line client. Run scripts against a dedicated empty schema, not a database containing important records.

```bash
# Connect with SQL*Plus using your own Oracle account.
sqlplus /nolog
# In SQL*Plus: CONNECT your_user@your_database
# Then execute these in order:
@sql/01_schema.sql
@sql/02_sample_data.sql
@sql/03_simple_queries.sql
@sql/04_advanced_queries.sql
```

Alternatively, run `bash scripts/menu.sh` after setting the `SQLPLUS_CONNECT` environment variable to your own SQL*Plus connection string. Do not commit credentials or paste real passwords into public files.

## Notes

This is coursework completed as a group. The advanced SQL and shell menu were adapted from the submitted Assignment 5 report; two queries received syntax corrections. Scripts have **not** been independently executed or verified against Oracle in this package. Assignment 4.2 is not included because its source has not been provided. All records should be treated as sample data.
