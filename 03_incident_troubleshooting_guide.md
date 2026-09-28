# 🚨 Banking Application Support: Troubleshooting Log

## Incident 1: Failed Balance Calculation on New Accounts
- **Issue:** Web dashboard displaying `NULL` for newly registered clients without initial deposits.
- **Root Cause:** Standard `SUM(balance)` returning `NULL` due to missing records in `accounts`.
- **Resolution:** Updated core inquiry function to wrap aggregates in `COALESCE(SUM(balance), 0)`.

## Incident 2: Concurrent Transfer Transaction Failures
- **Issue:** Transfer procedure failing during peak hours.
- **Root Cause:** Unhandled exceptions when source account balances dropped below requested transfer amounts.
- **Resolution:** Implemented explicit balance validation checks and custom `RAISE EXCEPTION` handling inside `transfer_funds()`.
