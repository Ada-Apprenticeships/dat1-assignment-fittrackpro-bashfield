-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
INSERT INTO attendance (member_id, location_id, check_in_time, check_out_time)
VALUES
(7, 1, CURRENT_TIMESTAMP , CURRENT_TIMESTAMP);

-- 2. Retrieve a member's attendance history
SELECT SUBSTRING(check_in_time, 1 , 10) visit_date, SUBSTRING(check_in_time, 11, 18) check_in_time, SUBSTRING(check_out_time, 11, 18) check_out_time
FROM attendance
WHERE member_id = 5;

-- 3. Find the busiest day of the week based on gym visits
SELECT day_of_week, COUNT(*) visit_count
  FROM (
    SELECT CASE CAST(strftime('%w', check_in_time) as integer) --visit_count
      WHEN 0 THEN 'Sunday'
      WHEN 1 THEN 'Monday'
      WHEN 2 THEN 'Tuesday'
      WHEN 3 THEN 'Wednesday'
      WHEN 4 THEN 'Thursday'
      WHEN 5 THEN 'Friday'
      ELSE 'Saturday' 
    END day_of_week
    FROM attendance
    )
  GROUP BY day_of_week
  ORDER BY visit_count DESC
  LIMIT 1; --Included if output wanted is just the busiest day of the week, can be removed to show the visit counts for all the weekdays in order

-- 4. Calculate the average daily attendance for each location
SELECT location_name, AVG(count) avg_daily_attendance
FROM (
  SELECT l.name location_name, COUNT(a.location_id) count
  FROM attendance a
  INNER JOIN locations l
  ON l.location_id = a.location_id
  GROUP BY location_name
  )
GROUP BY location_name;