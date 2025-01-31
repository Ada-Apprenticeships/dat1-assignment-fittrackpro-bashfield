-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Class Scheduling Queries

-- 1. List all classes with their instructors
-- TODO: Write a query to list all classes with their instructors
/*SELECT class_id, name class_name, instructor_name
FROM classes
INNER JOIN 
ON 

instructor name: 
staff name - staff id from staff, staff id, class id from class schedule, 
*/

/*
-- 2. Find available classes for a specific date
-- TODO: Write a query to find available classes for a specific date
List classes available on '2025-02-01'	
Output	A result set with columns:
SELECT class_id, name, start_time, end_time, available_spots

-- 3. Register a member for a class
| Register member with ID 11 for the Spin Class (class_id 3) on '2025-02-01' |    
INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
VALUES
(1, 4, 'Registered');

-- 4. Cancel a class registration
| Cancel the registration for member with ID 2 from the Scheduled Yoga Basics class (schedule_id 7)  |   
DELETE FROM class_attendance
WHERE member_id = 4 AND attendance_status = 1;
*/

-- 5. List top 3 most popular classes
-- TODO: Write a query to list top 3 most popular classes
| List the top 3 most popular classes by registration count |   
--Output	A result set with columns:
--TOP 5
SELECT class_id, name class_name, attendance_status registration_count
FROM classes
INNER JOIN class_attendance
ON 
ORDER BY registration_count

/*
-- 6. Calculate average number of classes per member
| Calculate the average number of classes per member |        
-- TODO: Write a query to calculate average number of classes per member
--Output	A single value representing the average number of classes per member.

SELECT AVG()
FROM 
SELECT *
FROM propertyforrent
WHERE rent > (SELECT AVG(rent) FROM propertyforrent);
