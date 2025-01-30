-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support
PRAGMA foreign_key = ON;

-- Class Scheduling Queries

-- 1. List all classes with their instructors
-- TODO: Write a query to list all classes with their instructors
Output	A result set with columns:
class_id | class_name | instructor_name


-- 2. Find available classes for a specific date
-- TODO: Write a query to find available classes for a specific date
Output	A result set with columns:
class_id | name | start_time | end_time | available_spots

-- 3. Register a member for a class
-- TODO: Write a query to register a member for a class
Output	No result set. Affects 1 row in class_attendance table.

-- 4. Cancel a class registration
-- TODO: Write a query to cancel a class registration
Output	No result set. Affects 1 row in class_attendance table.

-- 5. List top 5 most popular classes
-- TODO: Write a query to list top 5 most popular classes
Output	A result set with columns:
class_id | class_name | registration_count

-- 6. Calculate average number of classes per member
-- TODO: Write a query to calculate average number of classes per member
Output	A single value representing the average number of classes per member.