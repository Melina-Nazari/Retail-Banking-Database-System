#!/usr/bin/env bash
set -u
# Provide Oracle connection through environment; never store passwords in Git.
if [[ -z "${SQLPLUS_CONNECT:-}" ]]; then
  echo 'Set SQLPLUS_CONNECT to an Oracle SQL*Plus connect string before running.' >&2
  exit 1
fi
cd "$(dirname "$0")/.." || exit 1
run_sql() { sqlplus -L "$SQLPLUS_CONNECT" @"$1"; }
while true; do
  printf '\nRetail Banking Database System\n1) Drop tables (deletes data)\n2) Create tables\n3) Populate tables\n4) Simple queries\n5) Advanced queries\nE) Exit\nChoose: '
  read -r choice || exit 0
  case "$choice" in
    1) printf 'Type DROP to confirm: '; read -r confirm; [[ "$confirm" == 'DROP' ]] && run_sql sql/00_drop_tables.sql ;;
    2) run_sql sql/01_schema.sql ;;
    3) run_sql sql/02_sample_data.sql ;;
    4) run_sql sql/03_simple_queries.sql ;;
    5) run_sql sql/04_advanced_queries.sql ;;
    E|e) exit 0 ;;
    *) echo 'Invalid option' ;;
  esac
done
