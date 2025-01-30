-- Initial SQLite setup
.open fittrackpro.db
--.mode column 
.mode box

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- User Management Queries

-- 1. Retrieve all members
SELECT member_id, first_name, last_name, email, join_date

FROM members


-- 2. Update a member's contact information
-- TODO: Write a query to update a member's contact information

Task	Details
Update the phone number and email for member with ID 5	
New phone number	'555-9876'
New email	emily.jones.updated@email.com
Output	No result set. Affects 1 row.

--SELECT 
--FROM members
--UPDATE?
--SET?

-- 3. Count total number of members
Output	A single value representing the total number of members.
/*SELECT COUNT(*) total_members
FROM members
*/

-- 4. Find member with the most class registrations
Output	A single row with columns:
member_id | first_name | last_name | registration_count
-- TODO: Write a query to find the member with the most class registrations
--SELECT 
--FROM

-- 5. Find member with the least class registrations
Output	A single row with columns:
member_id | first_name | last_name | registration_count
-- TODO: Write a query to find the member with the least class registrations
--SELECT *
--FROM members
--WHERE viewdate = (SELECT MAX(viewdate) FROM viewing)

-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class
--SELECT
Calculate the percentage of members who have attended at least one class	
Output	A single value representing the percentage.