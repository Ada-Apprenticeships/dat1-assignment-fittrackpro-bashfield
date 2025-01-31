-- Initial SQLite setup
.open fittrackpro.db
.mode column 

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- User Management Queries
/*
-- 1. Retrieve all members
SELECT member_id, first_name, last_name, email, join_date
FROM members

-- 2. Update a member's contact information
UPDATE members
SET phone_number = '555-9876', email = 'emily.jones.updated@email.com'
WHERE member_id = 5

-- 3. Count total number of members
SELECT COUNT(*) total_members
FROM members

*/
-- 4. Find member with the most class registrations
--Output	A single row with columns:
-- TODO: Write a query to find the member with the most class registrations
SELECT m.member_id, m.first_name, m.last_name, c.attendance_status, COUNT(*) registration_count
FROM members m
INNER JOIN class_attendance c
ON m.member_id = c.member_id
--WHERE attendance_status = 'Registered'
WHERE ((SELECT MAX(attendance_status) FROM class_attendance) AND attendance_status = 'Registered')

/*
-- 5. Find member with the least class registrations
Output	A single row with columns:
member_id | first_name | last_name | registration_count
-- TODO: Write a query to find the member with the least class registrations
--SELECT *
--FROM members
--WHERE viewdate = (SELECT MAX(viewdate) FROM viewing)
/*

-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class
--SELECT
Calculate the percentage of members who have attended at least one class	
Output	A single value representing the percentage.

