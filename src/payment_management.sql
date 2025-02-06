-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Payment Management Queries

-- 1. Record a payment for a membership
UPDATE payments
SET amount = 50.00, payment_date = CURRENT_TIMESTAMP, payment_method = 'Credit Card', payment_type = 'Monthly membership fee'
WHERE member_id = 11;

-- 2. Calculate total revenue from membership fees for each month of the last year 
SELECT month, total_revenue
FROM (
    SELECT SUM(amount) total_revenue, CASE CAST(strftime('%m', payment_date) AS INTEGER)
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
    END month
    FROM payments
    WHERE strftime('%Y', payment_date) = '2024' --(This line can be removed to provide both 2024 and 2025 revenue, or changed to '2025' for this years revenue)
    GROUP BY month
    ORDER BY strftime('%Y%m%d', payment_date) 
    );

-- 3. Find all day pass purchases
SELECT payment_id, amount, payment_date, payment_method
FROM payments
WHERE payment_type = 'Day pass';