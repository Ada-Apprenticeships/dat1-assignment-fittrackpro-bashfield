-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Personal Training Queries

-- 1. List all personal training sessions for a specific trainer
SELECT p.session_id, m.first_name member_name, p.session_date, p.start_time, p.end_time
FROM personal_training_sessions p
INNER JOIN members m
ON m.member_id = p.member_id
INNER JOIN staff s
ON s.staff_id = p.staff_id
WHERE s.first_name = 'Ivy' AND s.last_name ='Irwin';