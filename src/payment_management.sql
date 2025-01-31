-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Payment Management Queries
/*
-- 1. Record a payment for a membership
UPDATE payments
SET amount = 50.00, payment_date = CURRENT_TIMESTAMP, payment_method = 'Credit Card', payment_type = 'Monthly membership fee'
WHERE member_id = 11
*/

-- 2. Calculate total revenue from membership fees for each month of the last year
-- TODO: Write a query to calculate total revenue from membership fees for each month of the current year
SELECT month, total_revenue  
FROM payments

/*
-- 3. Find all day pass purchases
SELECT payment_id, amount, payment_date, payment_method
FROM payments
WHERE payment_type = 'Day pass'
*/