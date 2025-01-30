-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Equipment Management Queries

-- 1. Find equipment due for maintenance
-- TODO: Write a query to find equipment due for maintenance
Output	A result set with columns:
equipment_id | name | next_maintenance_date

-- 2. Count equipment types in stock
-- TODO: Write a query to count equipment types in stock
Output	A result set with columns:
equipment_type | count

-- 3. Calculate average age of equipment by type (in days)
-- TODO: Write a query to calculate average age of equipment by type (in days)
Output	A result set with columns:
equipment_type | avg_age_days