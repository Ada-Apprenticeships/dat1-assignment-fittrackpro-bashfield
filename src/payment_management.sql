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


-- 2. Calculate total revenue from membership fees for each month of the last year
-- TODO: Write a query to calculate total revenue from membership fees for each month of the current year
SELECT strftime('%m', payment_date) month,--, SUM(amount) total_revenue,
CASE
    WHEN '01' THEN 'January'
    WHEN '02' THEN 'February'
    WHEN '03' THEN 'March'
    WHEN '04' THEN 'April'
    WHEN '05' THEN 'May'
    WHEN '06' THEN 'June'
    WHEN '07' THEN 'July'
    WHEN '08' THEN 'August'
    WHEN '09' THEN 'September'
    WHEN '10' THEN 'October'
    WHEN '11' THEN 'November'
    WHEN '12' THEN 'December'
END AS month_name
FROM payments
GROUP BY month_name

*/
/*
SELECT m.month --,COUNT(t.created_date)
FROM (SELECT 1 AS month UNION ALL SELECT 2 UNION ALL SELECT 3
      UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
      UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
      UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12) m
LEFT JOIN transactions t ON MONTH(t.created_date) = m.month
GROUP BY m.month

/*
-- 3. Find all day pass purchases
SELECT payment_id, amount, payment_date, payment_method
FROM payments
WHERE payment_type = 'Day pass'
*/