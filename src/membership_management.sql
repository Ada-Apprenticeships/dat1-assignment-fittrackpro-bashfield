-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Membership Management Queries

-- 1. List all active memberships
-- TODO: Write a query to list all active memberships
Output	A result set with columns:
member_id | first_name | last_name | membership_type | join_date

-- 2. Calculate the average duration of gym visits for each membership type
-- TODO: Write a query to calculate the average duration of gym visits for each membership type
Output	A result set with columns:
| Calculate the average duration of gym visits for each membership type |   
membership_type | avg_visit_duration_minutes

-- 3. Identify members with expiring memberships this year
| List members whose memberships will expire within the next year |     
-- TODO: Write a query to identify members with expiring memberships this year
Output	A result set with columns:
member_id | first_name | last_name | email | end_date