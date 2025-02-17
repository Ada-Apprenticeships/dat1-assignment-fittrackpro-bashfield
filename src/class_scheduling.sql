-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Class Scheduling Queries

-- 1. List all classes with their instructors
SELECT 
  cs.class_id, 
  c.name AS class_name, 
  s.first_name AS instructor_name
FROM class_schedule AS cs

JOIN classes AS c
ON c.class_id = cs.class_id

JOIN staff AS s
ON s.staff_id = cs.staff_id;

-- 2. Find available classes for a specific date
SELECT 
  c.class_id, 
  c.name, 
  cs.start_time, 
  cs.end_time, 
  (c.capacity - COUNT(ca.member_id)) AS available_spots
FROM class_schedule cs

INNER JOIN class_attendance ca
ON cs.schedule_id = ca.schedule_id

INNER JOIN classes c
ON c.class_id = cs.class_id

WHERE substr(cs.start_time, 1, 10) = '2025-02-01' AND attendance_status = 'Registered'
GROUP BY cs.schedule_id;

-- 3. Register a member for a class
INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
VALUES
(7, 11, 'Registered');

-- 4. Cancel a class registration
DELETE FROM class_attendance
WHERE member_id = 2 AND schedule_id = 7;

-- 5. List top 3 most popular classes
SELECT 
  cs.class_id, 
  c.name AS class_name, 
  COUNT(*) AS registration_count
FROM class_schedule cs

INNER JOIN class_attendance ca
ON ca.schedule_id = cs.schedule_id

INNER JOIN classes c
ON c.class_id = cs.class_id

WHERE ca.attendance_status = 'Registered'
GROUP BY class_name
ORDER BY registration_count
LIMIT 3;

-- 6. Calculate average number of classes per member
SELECT 
  AVG(count) AS average_classes_per_member
  FROM (
    SELECT COUNT(member_id) count
    FROM attendance
    GROUP BY member_id
  );