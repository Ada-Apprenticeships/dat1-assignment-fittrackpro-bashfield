-- Initial SQLite setup
.open fittrackpro.db
.mode column 

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- User Management Queries

-- 1. Retrieve all members
SELECT member_id, first_name, last_name, email, join_date
FROM members;

-- 2. Update a member's contact information
UPDATE members
SET phone_number = '555-9876', email = 'emily.jones.updated@email.com'
WHERE member_id = 5;

-- 3. Count total number of members
SELECT COUNT(*) total_members
FROM members;

-- 4. Find member with the most class registrations
SELECT c.member_id, m.first_name, m.last_name, COUNT(c.attendance_status) registration_count
FROM class_attendance c
INNER JOIN members m
ON m.member_id = c.member_id
WHERE c.attendance_status = 'Registered'
GROUP BY c.member_id
ORDER BY registration_count DESC
LIMIT 1;

-- 5. Find member with the least class registrations
SELECT c.member_id, m.first_name, m.last_name, COUNT(c.attendance_status) registration_count
FROM class_attendance c
INNER JOIN members m
ON m.member_id = c.member_id
WHERE c.attendance_status = 'Registered'
GROUP BY c.member_id
ORDER BY registration_count ASC
LIMIT 1;

-- 6. Calculate the percentage of members who have attended at least one class
SELECT 100 * members_attended / total_members percentage
FROM (
    SELECT  
    (SELECT COUNT(member_id) FROM members) total_members, COUNT(DISTINCT c.member_id) members_attended
    FROM members m
    LEFT JOIN class_attendance c 
    ON m.member_id = c.member_id
    WHERE attendance_status = 'Attended'
    );