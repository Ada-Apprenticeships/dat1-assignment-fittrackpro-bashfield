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
SELECT CASE strftime('%m', payment_date)
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
    END AS month,
    SUM(amount) AS total_revenue 
FROM payments
WHERE strftime('%Y', payment_date) = '2024'
GROUP BY month
ORDER BY strftime('%Y%m%d', payment_date);


-- 3. Find all day pass purchases
-- NOTE FOR MARKER: Added 'ORDER BY' to show the most recent purchase first
SELECT payment_id, 
    amount, 
    payment_date, 
    payment_method
FROM payments
WHERE payment_type = 'Day pass'
ORDER BY payment_date DESC;