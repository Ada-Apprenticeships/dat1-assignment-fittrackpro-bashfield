-- FitTrack Pro Database Schema

-- Initial SQLite setup
.open fittrackpro.db
.mode column

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS class_schedule;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS class_attendance;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS personal_training_sessions;
DROP TABLE IF EXISTS member_health_metrics;
DROP TABLE IF EXISTS equipment_maintenance_log;
DROP TABLE IF EXISTS table_name;


-- Enable foreign key support
PRAGMA foreign_keys = ON; 

-- Creating locations table
CREATE TABLE locations (
    location_id ,
    name ,
    address ,
    phone_number ,
    email ,
    opening_hours 
);

-- Creating members table
CREATE TABLE members (
    member_id ,
    first_name ,
    last_name ,
    email ,
    phone_number ,
    date_of_birth ,
    join_date ,
    emergency_contact_name ,
    emergency_contact_phone
);

-- Creating staff table
CREATE TABLE staff (
    staff_id ,
    first_name ,
    last_name ,	
    email ,	
    phone_number ,	
    position ,	--Trainer, Manager, Receptionist
    hire_date ,	
    location_id 	
);

-- Creating equipment table
CREATE TABLE equipment (
    equipment_id ,	
    name ,	
    type ,	--Cardio, Strength
    purchase_date ,	
    last_maintenance_date ,	
    next_maintenance_date ,	
    location_id	
);

-- Creating classes table
CREATE TABLE classes (
    class_id ,
    name ,
    description ,
    capacity ,
    duration ,
    location_id  
);

-- Creating class_schedule table
CREATE TABLE class_schedule (
    schedule_id ,
    class_id ,
    staff_id ,
    start_time ,
    end_time 
);

-- Creating memberships table
CREATE TABLE memberships (
    membership_id ,	
    member_id ,	
    type ,	
    start_date ,	
    end_date ,	
    status	--Active, Inactive 
);

-- Creating attendance table
CREATE TABLE attendance (
    attendance_id ,
    member_id ,
    location_id ,
    check_in_time ,
    check_out_time
);

-- Creating class_attendance table
CREATE TABLE class_attendance (
    class_attendance_id ,	
    schedule_id ,
    member_id ,	
    attendance_status	--Registered, Attended, Unattended
);

-- Creating payments table
CREATE TABLE payments (
    payment_id ,	
    member_id ,	
    amount ,	
    payment_date ,	
    payment_method ,	--Credit Card, Bank Transfer, PayPal
    payment_type	--Monthly membership fee, Day pass
);

-- Creating personal_training_sessions table
CREATE TABLE personal_training_sessions (
    session_id ,
    member_id ,
    staff_id ,
    session_date ,
    start_time ,
    end_time ,
    notes
);

-- Creating member_health_metrics table
CREATE TABLE member_health_metrics (
    metric_id ,
    member_id ,
    measurement_date ,
    weight ,
    body_fat_percentage ,
    muscle_mass ,
    bmi  
);

-- Creating equipment_maintenance_log table
CREATE TABLE equipment_maintenance_log (
    log_id ,
    equipment_id ,
    maintenance_date ,
    description ,
    staff_id
);


-- TODO: Create the following tables:
-- 1. locations
-- 2. members
-- 3. staff
-- 4. equipment
-- 5. classes
-- 6. class_schedule
-- 7. memberships
-- 8. attendance
-- 9. class_attendance
-- 10. payments
-- 11. personal_training_sessions
-- 12. member_health_metrics
-- 13. equipment_maintenance_log

-- After creating the tables, you can import the sample data using:
-- `.read data/sample_data.sql` in a sql file or `npm run import` in the terminal