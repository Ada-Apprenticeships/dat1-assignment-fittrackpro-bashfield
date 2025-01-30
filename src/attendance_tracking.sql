-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
-- TODO: Write a query to record a member's gym visit
Location	Downtown Fitness (location_id 1)
Check-in time	Current date and time
Output	No result set. Affects 1 row in attendance table.


-- 2. Retrieve a member's attendance history
-- TODO: Write a query to retrieve a member's attendance history
Output	A result set with columns:
visit_date | check_in_time | check_out_time

-- 3. Find the busiest day of the week based on gym visits
-- TODO: Write a query to find the busiest day of the week based on gym visits
Output	A result set with columns:
day_of_week | visit_count

-- 4. Calculate the average daily attendance for each location
-- TODO: Write a query to calculate the average daily attendance for each location
Output	A result set with columns:
location_name | avg_daily_attendance