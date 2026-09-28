-- =======================================================
-- BANKING SUPPORT LAB: SCHEMA & PRODUCTION TROUBLESHOOTING
-- =======================================================

-- 1. Schema Definition
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    client_id VARCHAR(50),
    currency VARCHAR(10),
    balance NUMERIC(15,2)
);

CREATE TABLE transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id),
    amount NUMERIC(15,2),
    trans_date DATE,
    type VARCHAR(20),
    payload_json JSONB
);

-- 2. Support Scenario: Nested JSONB Parsing (Mobile App Device Audit)
-- Extracting iOS transactions originating from Baku
SELECT 
    transaction_id, 
    account_id,
    payload_json -> 'info' ->> 'device' AS device_type
FROM transactions
WHERE payload_json -> 'info' ->> 'city' = 'Baku'
  AND trans_date BETWEEN '2026-01-01' AND '2026-06-30';

-- 3. Support Scenario: Anti-Join Reconciliation
-- Identifying clients with high balances who do NOT hold EUR accounts
SELECT client_id, SUM(balance) AS total_balance 
FROM accounts
WHERE client_id NOT IN (
    SELECT DISTINCT client_id
    FROM accounts
    WHERE currency = 'EUR'
)
GROUP BY client_id
HAVING SUM(balance) > 5000;
