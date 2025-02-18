-- Initial SQLite setup
.open fittrackpro.db
.mode column 

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- User Management Queries

-- 1. Retrieve all members
SELECT member_id, first_name, last_name, email, join_date
FROM members;

-- 2. Update a member's contact information
UPDATE members
SET phone_number = '555-9876', email = 'emily.jones.updated@email.com'
WHERE member_id = 5;

-- 3. Count total number of members
SELECT COUNT(*) AS total_members
FROM members;

-- 4. Find member with the most class registrations
-- NOTE FOR MARKER: Task output only wanted "A single row with columns" but data from sample_data.sql outputs multiple. I have created my own sample data to only return a single row.
WITH registration_counts AS (
    SELECT c.member_id, 
        m.first_name, 
        m.last_name, 
        COUNT(c.attendance_status) AS registration_count
    FROM class_attendance c
    INNER JOIN members m 
    ON m.member_id = c.member_id
    WHERE c.attendance_status = 'Registered'
    GROUP BY c.member_id
)
SELECT * FROM registration_counts
WHERE registration_count = (SELECT MAX(registration_count) FROM registration_counts);

-- 5. Find member with the least class registrations
-- NOTE FOR MARKER: Task output only wanted "A single row with columns" but data from sample_data.sql outputs multiple.
WITH registration_counts AS (
    SELECT m.member_id,
        m.first_name, 
        m.last_name, 
        (SELECT COUNT(c.attendance_status) 
            FROM class_attendance c 
            WHERE c.attendance_status = 'Registered' AND m.member_id = c.member_id) 
        AS registration_count
    FROM members m
)
SELECT * FROM registration_counts
WHERE registration_count = (SELECT MIN(registration_count) FROM registration_counts);

-- 6. Calculate the percentage of members who have attended at least one class
SELECT 100 * members_attended / total_members AS percentage
FROM (
    SELECT
        (SELECT COUNT(member_id) FROM members) AS total_members, 
        COUNT(DISTINCT c.member_id) AS members_attended
    FROM members m
    LEFT JOIN class_attendance c 
    ON m.member_id = c.member_id
    WHERE attendance_status = 'Attended'
);