-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
INSERT INTO attendance (member_id, location_id, check_in_time, check_out_time)
VALUES
(7, 1, CURRENT_TIMESTAMP, NULL);


-- 2. Retrieve a member's attendance history
SELECT 
  strftime('%Y-%m-%d', check_in_time) AS visit_date, 
  strftime('%H:%M:%S', check_in_time) AS check_in_time, 
  strftime('%H:%M:%S', check_out_time) AS check_out_time
FROM attendance
WHERE member_id = 5;


-- 3. Find the busiest day of the week based on gym visits
-- NOTE FOR MARKER: CAST( -- AS integer)Interpreted outLIMIT has been included if output wanted is just the busiest day of the week, can be removed to show the visit counts for all the weekdays in order
/*
SELECT
  day_of_week, 
  COUNT(*) AS visit_count
  FROM (
  SELECT 
    CASE CAST(strftime('%w', check_in_time) AS integer)
      WHEN 0 THEN 'Sunday' --1
      WHEN 1 THEN 'Monday' --1
      WHEN 2 THEN 'Tuesday' --2
      WHEN 3 THEN 'Wednesday' --4
      WHEN 4 THEN 'Thursday'
      WHEN 5 THEN 'Friday' --4
      ELSE 'Saturday' --1
    END AS day_of_week
    FROM attendance
)
GROUP BY day_of_week;
--ORDER BY visit_count DESC;
--LIMIT 1; 
*/

SELECT day_of_week, COUNT(*) visit_count
  FROM (
    SELECT CASE CAST(strftime('%w', check_in_time) as integer)
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
  LIMIT 1;

-- 4. Calculate the average daily attendance for each location
SELECT 
  location_name, 
  AVG(count) AS avg_daily_attendance
FROM (
  SELECT 
    l.name AS location_name, 
    COUNT(a.location_id) AS count
  FROM attendance AS a
  INNER JOIN locations AS l
  ON l.location_id = a.location_id
  GROUP BY location_name
)
GROUP BY location_name;