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


-- 2. Retrieve a member's attendance history
SELECT SUBSTRING(check_in_time, 1 , 10) visit_date, SUBSTRING(check_in_time, 11, 18) check_in_time, SUBSTRING(check_out_time, 11, 18) check_out_time
FROM attendance
WHERE member_id = 5
*/

-- 3. Find the busiest day of the week based on gym visits
--Identify the busiest day of the week based on gym visits |   
-- TODO: Write a query to find the busiest day of the week based on gym visits
--Output	A result set with column
/*SELECT case cast (strftime('%w', '2022-01-01') as integer)
  when 0 then 'Sunday'
  when 1 then 'Monday'
  when 2 then 'Tuesday'
  when 3 then 'Wednesday'
  when 4 then 'Thursday'
  when 5 then 'Friday'
  else 'Saturday' end as weekday
--FROM memberships

--(SUBSTRING(check_in_time, 1, 10))--WEEKDAY(SUBSTRING(check_in_time, 1, 10)) /*day_of_week*/--, visit_count

--WHERE visit_count = MAX(visit_count)

--function to get weekday from check in time 
--group by weekday 
--GROUP
--count entries for each weekday 
--COUNT(*) or MAX()

SELECT date('weekday')
FROM memberships


/*
-- 4. Calculate the average daily attendance for each location
-- TODO: Write a query to calculate the average daily attendance for each location
--Calculate the average daily attendance for each location |  
--Output	A result set with columns
SELECT DISTINCT l.name location_name --, avg_daily_attendance
FROM attendance a ()
INNER JOIN locations l
ON l.location_id = a.location_id
-- 



--GROUP BY location_id

--AVG(rent) FROM propertyforrent