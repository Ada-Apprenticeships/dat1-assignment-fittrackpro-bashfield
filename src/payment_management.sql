-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Payment Management Queries

-- 1. Record a payment for a membership
-- TODO: Write a query to record a payment for a membership
Task	Details
Insert a new payment record for member with ID 11	
Amount	$50.00
Payment date	Current date and time
Payment method	'Credit Card'
Payment type	'Monthly membership fee'
Output	No result set. Affects 1 row.

-- 2. Calculate total revenue from membership fees for each month of the last year
-- TODO: Write a query to calculate total revenue from membership fees for each month of the current year
Output	A result set with columns:
month | total_revenue  

-- 3. Find all day pass purchases
-- TODO: Write a query to find all day pass purchases
Output	A result set with columns:
payment_id | amount | payment_date | payment_method |