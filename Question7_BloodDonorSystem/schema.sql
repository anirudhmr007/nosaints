-- Schema for Question 7: Blood Donor Management System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS blood_donors (
    donor_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(50),
    blood_group VARCHAR(10) NOT NULL,
    contact_number VARCHAR(50),
    email VARCHAR(255),
    address TEXT,
    last_donation_date VARCHAR(50),
    health_status VARCHAR(50) NOT NULL
);

-- Sample Data
INSERT INTO blood_donors (name, age, gender, blood_group, contact_number, email, address, last_donation_date, health_status)
VALUES 
('Michael Scott', 42, 'Male', 'O+', '9876543211', 'michael@dunder.com', '1725 Slough Ave, Scranton', '2023-10-01', 'Fit'),
('Pam Beesly', 30, 'Female', 'A+', '9812345679', 'pam@dunder.com', '42 Maple Street, Scranton', '2024-02-15', 'Fit');
