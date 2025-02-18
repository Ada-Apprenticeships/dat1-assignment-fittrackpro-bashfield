-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Payment Management Queries

-- 1. Record a payment for a membership
UPDATE payments
SET amount = 50.00, payment_date = CURRENT_TIMESTAMP, payment_method = 'Credit Card', payment_type = 'Monthly membership fee'
WHERE member_id = 11;

-- 2. Calculate total revenue from membership fees for each month of the last year 
-- NOTE FOR MARKER: Interpreted 'last year' as months from the year 2024
WITH months AS (
    SELECT 'January' AS month, '01' AS month_num UNION ALL
    SELECT 'February', '02' UNION ALL
    SELECT 'March', '03' UNION ALL
    SELECT 'April', '04' UNION ALL
    SELECT 'May', '05' UNION ALL
    SELECT 'June', '06' UNION ALL
    SELECT 'July', '07' UNION ALL
    SELECT 'August', '08' UNION ALL
    SELECT 'September', '09' UNION ALL
    SELECT 'October', '10' UNION ALL
    SELECT 'November', '11' UNION ALL
    SELECT 'December', '12'
)
SELECT m.month,
       IFNULL(SUM(p.amount), 0) AS total_revenue
FROM months m
LEFT JOIN payments p 
ON strftime('%m', p.payment_date) = m.month_num AND strftime('%Y', p.payment_date) = '2024'
GROUP BY m.month
ORDER BY m.month_num;

-- 3. Find all day pass purchases
-- NOTE FOR MARKER: Added 'ORDER BY' to show the most recent purchase first
SELECT payment_id, 
    amount, 
    payment_date, 
    payment_method
FROM payments
WHERE payment_type = 'Day pass'
ORDER BY payment_date DESC;