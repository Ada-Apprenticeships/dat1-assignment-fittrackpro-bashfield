-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Class Scheduling Queries
/*
-- 1. List all classes with their instructors
SELECT cs.class_id, c.name class_name, s.first_name instructor_name
FROM class_schedule cs
JOIN classes c
ON c.class_id = cs.class_id
JOIN staff s
ON s.staff_id = cs.staff_id


-- 2. Find available classes for a specific date
-- TODO: Write a query to find available classes for a specific date
--List classes available on '2025-02-01'	
SELECT c.class_id, c.name, /*strtime(*/--cs.start_time,/* 12, 19), strtime(*/cs.end_time,/* 12, 19), */c.capacity available_spots
--FROM class_schedule cs
--INNER JOIN classes c
--ON c.class_id = cs.class_id
--WHERE '2025-02-01'

/*
-- 3. Register a member for a class
INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
VALUES
(7, 11, 'Registered');

-- 4. Cancel a class registration
DELETE FROM class_attendance
WHERE member_id = 2 AND schedule_id = 7;

-- 5. List top 3 most popular classes
SELECT cs.class_id, c.name class_name, COUNT(*) registration_count
FROM class_schedule cs
INNER JOIN class_attendance ca
ON ca.schedule_id = cs.schedule_id
INNER JOIN classes c
ON c.class_id = cs.class_id
WHERE ca.attendance_status = 'Registered'
GROUP BY class_name
ORDER BY registration_count
LIMIT 3
*/
/*
-- 6. Calculate average number of classes per member
| Calculate the average number of classes per member |        
-- TODO: Write a query to calculate average number of classes per member
--Output	A single value representing the average number of classes per member.

SELECT member_id, COUNT(member_id)
FROM attendance
GROUP BY member_id
