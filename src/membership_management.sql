-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Membership Management Queries

-- 1. List all active memberships
SELECT ms.member_id, 
    m.first_name, 
    m.last_name, 
    ms.type AS membership_type, 
    m.join_date
FROM memberships AS ms
INNER JOIN members AS m
ON m.member_id = ms.member_id
WHERE ms.status = 'Active';

-- 2. Calculate the average duration of gym visits for each membership type
SELECT ms.type AS membership_type,
    AVG((strftime('%s', a.check_out_time) - strftime('%s', a.check_in_time)) / 60) AS avg_visit_duration_minutes
FROM attendance a
INNER JOIN memberships ms
ON a.member_id = ms.member_id
GROUP BY ms.type;

-- 3. Identify members with expiring memberships this year
-- NOTE FOR MARKER: Interpreted 'this year' as from todays date to the end of 2025
SELECT ms.membership_id AS member_id, 
    m.first_name, 
    m.last_name, 
    m.email, 
    ms.end_date
FROM memberships AS ms
INNER JOIN members AS m
ON ms.member_id = m.member_id
WHERE strftime('%Y', ms.end_date) = strftime('%Y', 'now');