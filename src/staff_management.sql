-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Staff Management Queries

-- 1. List all staff members by role
SELECT 
    staff_id, 
    first_name, 
    last_name, 
    position AS role
FROM staff
ORDER BY position;

-- 2. Find trainers with one or more personal training session in the next 30 days
SELECT 
    s.staff_id AS trainer_id, 
    s.first_name AS trainer_name, 
    COUNT(p.session_id) AS session_count
FROM staff AS s
JOIN personal_training_sessions AS p
ON s.staff_id = p.staff_id
WHERE p.session_date <= DATE('now', '+30 days')
GROUP BY s.staff_id;



