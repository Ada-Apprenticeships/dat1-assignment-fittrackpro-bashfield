-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Equipment Management Queries

-- 1. Find equipment due for maintenance in the next 30 days
?????
SELECT equipment_id, name, next_maintenance_date
FROM equipment
WHERE next_maintenance_date = CURRENT_DATE 
ORDER BY next_maintenance_date

/*
-- 2. Count equipment types in stock
--CHECK IS IT: in stock?????
SELECT DISTINCT type equipment_type, COUNT(type) count
FROM equipment
GROUP BY type
*/

-- 3. Calculate average age of equipment by type (in days)
-- TODO: Write a query to calculate average age of equipment by type (in days)
SELECT type equipment_type, avg_age_days
FROM equipment
