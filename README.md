# 🏦 PostgreSQL Banking Support & Operations Lab

A production-style database lab simulating core banking operations, application support troubleshooting, and transaction management under strict **ACID** properties.

---

## 📌 Repository Overview
This repository contains database scripts designed for **Banking Systems Support / Application Support** roles:

1. **`01_schema_and_support_queries.sql`**: Core schema, JSONB payload analysis for mobile/web transactions, anti-joins, and reconciliation queries.
2. **`02_procedures_and_functions.sql`**: Stored procedures for funds transfer, exception handling (`RAISE EXCEPTION`), and safe balance calculations using `COALESCE`.
3. **`03_database_incident_logs.md`**: Simulated support tickets and root-cause analysis (RCA) documentation.

---

## 🛠️ Key Technical Focus Areas
- **JSONB Querying:** Deep nested parsing (`->`, `->>`) for auditing payment channels.
- **Transaction Atomicity:** PL/pgSQL procedural control with rollback handling for insufficient funds.
- **Reconciliation:** Query optimization using `NOT IN` / `EXCEPT` to catch system discrepancies.
