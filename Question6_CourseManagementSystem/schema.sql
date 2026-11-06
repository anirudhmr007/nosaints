-- Schema for Question 6: Course Management System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS courses (
    course_id BIGSERIAL PRIMARY KEY,
    course_code VARCHAR(50) NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    department VARCHAR(100),
    faculty_name VARCHAR(255),
    credits INT NOT NULL,
    semester VARCHAR(50),
    course_capacity INT NOT NULL,
    enrolled_students INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS course_registrations (
    id BIGSERIAL PRIMARY KEY,
    course_id BIGINT NOT NULL,
    student_roll_number VARCHAR(100) NOT NULL,
    student_name VARCHAR(255) NOT NULL
);

-- Sample Data
INSERT INTO courses (course_code, course_name, department, faculty_name, credits, semester, course_capacity, enrolled_students)
VALUES 
('CS201', 'Database Management Systems', 'Computer Science', 'Dr. Alan Turing', 4, 'Semester 3', 3, 1),
('CS202', 'Operating Systems', 'Computer Science', 'Prof. Dennis Ritchie', 4, 'Semester 3', 2, 2);

INSERT INTO course_registrations (course_id, student_roll_number, student_name)
VALUES 
(1, 'URK20CS001', 'John Doe'),
(2, 'URK20CS001', 'John Doe'),
(2, 'URK20CS002', 'Jane Smith');
