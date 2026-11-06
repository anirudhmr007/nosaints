-- Schema for Question 1: Hospital Patient Registration System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS patients (
    patient_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(50),
    contact_number VARCHAR(50),
    email VARCHAR(255),
    address TEXT,
    blood_group VARCHAR(10)
);

-- Sample Data
INSERT INTO patients (name, age, gender, contact_number, email, address, blood_group)
VALUES 
('John Doe', 35, 'Male', '9876543210', 'john@example.com', '123 Baker Street, New York', 'O+'),
('Jane Smith', 28, 'Female', '9123456780', 'jane@example.com', '456 Elm Street, Boston', 'A+');
