-- FitTrack Pro Database Schema

-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Deleting tables if they exist
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

-- Enable foreign key support
PRAGMA foreign_keys = ON; 

-- Creating locations table
CREATE TABLE locations (
    location_id INTEGER PRIMARY KEY,
    name VARCHAR(30) ,
    address VARCHAR(50),
    phone_number CHAR(8),
    email VARCHAR(30),
    opening_hours VARCHAR(11) --CHECK(opening_hours LIKE '%-%')
);

-- Creating members table
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    email VARCHAR(30),
    phone_number CHAR(8),
    date_of_birth VARCHAR(10),
    join_date VARCHAR(10),
    emergency_contact_name VARCHAR(30),
    emergency_contact_phone VARCHAR(8)
);

-- Creating staff table
CREATE TABLE staff (
    staff_id INTEGER PRIMARY KEY,
    first_name VARCHAR(15), 
    last_name VARCHAR(15),	
    email VARCHAR(40),	
    phone_number CHAR(8),	
    position VARCHAR(12),	--Trainer, Manager, Receptionist
    hire_date VARCHAR(10),	
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Creating equipment table
CREATE TABLE equipment (
    equipment_id INTEGER PRIMARY KEY,	
    name VARCHAR(15),	
    type VARCHAR(8),	--Cardio, Strength
    purchase_date VARCHAR(10),	
    last_maintenance_date VARCHAR(8),	
    next_maintenance_date VARCHAR(8),	
    location_id	INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Creating classes table
CREATE TABLE classes (
    class_id INTEGER PRIMARY KEY,
    name VARCHAR(15),
    description VARCHAR(50),
    capacity INTEGER,
    duration INTEGER,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Creating class_schedule table
CREATE TABLE class_schedule (
    schedule_id INTEGER PRIMARY KEY,
    class_id INTEGER,
    staff_id INTEGER,
    start_time CHAR(19),
    end_time CHAR(19),
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- Creating memberships table
CREATE TABLE memberships (
    membership_id INTEGER PRIMARY KEY ,	
    member_id INTEGER,	
    type VARCHAR(7),	--Basic, Premium
    start_date CHAR(10),	
    end_date CHAR(10),	
    status VARCHAR(8),	--Active, Inactive 
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Creating attendance table
CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY ,
    member_id INTEGER,
    location_id INTEGER,
    check_in_time CHAR(19),
    check_out_time CHAR(19),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Creating class_attendance table
CREATE TABLE class_attendance (
    class_attendance_id INTEGER PRIMARY KEY,	
    schedule_id INTEGER,
    member_id INTEGER,	
    attendance_status VARCHAR(10),	--Registered, Attended, Unattended
    FOREIGN KEY (schedule_id) REFERENCES class_schedule(schedule_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Creating payments table
CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY ,	
    member_id INTEGER,	
    amount DECIMAL,	
    payment_date CHAR(19),	
    payment_method VARCHAR(13),	--Credit Card, Bank Transfer, PayPal
    payment_type VARCHAR(22),	--Monthly membership fee, Day pass
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Creating personal_training_sessions table
CREATE TABLE personal_training_sessions (
    session_id INTEGER PRIMARY KEY ,
    member_id INTEGER,
    staff_id INTEGER,
    session_date CHAR(10),
    start_time CHAR(8),
    end_time CHAR(8),
    notes VARCHAR(50),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- Creating member_health_metrics table
CREATE TABLE member_health_metrics (
    metric_id INTEGER PRIMARY KEY ,
    member_id INTEGER,
    measurement_date CHAR(10),
    weight DECIMAL,
    body_fat_percentage DECIMAL,
    muscle_mass DECIMAL,
    bmi DECIMAL,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Creating equipment_maintenance_log table
CREATE TABLE equipment_maintenance_log (
    log_id INTEGER PRIMARY KEY ,
    equipment_id INTEGER,
    maintenance_date CHAR(10),
    description VARCHAR(50),
    staff_id INTEGER,
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
