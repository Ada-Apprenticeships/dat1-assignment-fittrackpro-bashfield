-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
INSERT INTO attendance (member_id, location_id, check_in_time, check_out_time)
VALUES
(7, 1, DATETIME('now', 'localtime'), NULL);


-- 2. Retrieve a member's attendance history
SELECT 
  strftime('%Y-%m-%d', check_in_time) AS visit_date, 
  strftime('%H:%M:%S', check_in_time) AS check_in_time, 
  strftime('%H:%M:%S', check_out_time) AS check_out_time
FROM attendance
WHERE member_id = 5;


-- 3. Find the busiest day of the week based on gym visits
WITH daily_visits AS (
  SELECT CASE CAST(strftime('%w', check_in_time) AS INTEGER)
      WHEN 0 THEN 'Sunday'
      WHEN 1 THEN 'Monday'
      WHEN 2 THEN 'Tuesday'
      WHEN 3 THEN 'Wednesday'
      WHEN 4 THEN 'Thursday'
      WHEN 5 THEN 'Friday'
      ELSE 'Saturday' 
    END AS day_of_week,
    COUNT(*) AS visit_count
  FROM attendance
  GROUP BY day_of_week
)
SELECT day_of_week, 
  visit_count
FROM daily_visits
WHERE visit_count = (SELECT MAX(visit_count) FROM daily_visits);


-- 4. Calculate the average daily attendance for each location
WITH daily_attendance AS (
  SELECT l.name AS location_name, 
    strftime('%Y-%m-%d', a.check_in_time) AS visit_date,
    COUNT(a.attendance_id) AS daily_visits
  FROM attendance AS a
  INNER JOIN locations AS l 
  ON l.location_id = a.location_id
  GROUP BY location_name, visit_date
)
SELECT location_name, 
  AVG(daily_visits) AS avg_daily_attendance
FROM daily_attendance
GROUP BY location_name;