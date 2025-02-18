-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Personal Training Queries

-- 1. List all personal training sessions for a specific trainer
SELECT p.session_id, 
    (m.first_name||' '||m.last_name) AS member_name, 
    p.session_date, 
    p.start_time, 
    p.end_time
FROM personal_training_sessions AS p
INNER JOIN members AS m
ON m.member_id = p.member_id
INNER JOIN staff AS s
ON s.staff_id = p.staff_id
WHERE s.first_name = 'Ivy' AND s.last_name ='Irwin';