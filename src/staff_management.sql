-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Staff Management Queries
/*
-- 1. List all staff members by role
SELECT staff_id, first_name, last_name, position
FROM staff
ORDER BY position
*/ 
-- 2. Find trainers with one or more personal training session in the next 30 days
-- TODO: Write a query to find trainers with one or more personal training session in the next 30 days
SELECT s.staff_id trainer_id, s.first_name trainer_name, COUNT(p.session_id) session_count
FROM staff s
INNER JOIN personal_training_sessions p
ON s.staff_id = p.staff_id
WHERE p.session_date BETWEEN CURRENT_DATE AND CURRENT_DATE + 30
GROUP BY s.staff_id

--where session_date is in the next 30 days
--so between current date and current date + 30
--current date + 30
/*
----------  ------------  ----------  -------------
1           David         1           2            
2           Emma          2           1            
3           Frank         6           1            
6           Ivy           3           2            
7           Jack          7           1            
8           Karen         4           1    

1           David         9           2            
3           Frank         13          1            
6           Ivy           10          2            
7           Jack          14          1            
8           Karen         11          1 



