-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Attendance Tracking Queries
/*
-- 1. Record a member's gym visit
INSERT INTO attendance (member_id, location_id, check_in_time, check_out_time)
VALUES
(7, 1, CURRENT_TIMESTAMP , CURRENT_TIMESTAMP);
*/

-- 2. Retrieve a member's attendance history
--Get attendance history for member with ID 5 |                            |
SELECT /*visit_date,*/ check_in_time, check_out_time
FROM attendance
WHERE member_id = 5

/*
-- 3. Find the busiest day of the week based on gym visits
| Identify the busiest day of the week based on gym visits |   
-- TODO: Write a query to find the busiest day of the week based on gym visits
Output	A result set with columns:
day_of_week | visit_count

-- 4. Calculate the average daily attendance for each location
-- TODO: Write a query to calculate the average daily attendance for each location
| Calculate the average daily attendance for each location |  
Output	A result set with columns:
location_name | avg_daily_attendance