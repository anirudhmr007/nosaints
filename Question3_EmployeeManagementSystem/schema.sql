-- Schema for Question 3: Employee Management System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS employees (
    employee_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(50),
    contact_number VARCHAR(50),
    email VARCHAR(255),
    address TEXT,
    department VARCHAR(100),
    designation VARCHAR(100),
    date_of_joining VARCHAR(50),
    salary NUMERIC(12, 2)
);

-- Sample Data
INSERT INTO employees (name, age, gender, contact_number, email, address, department, designation, date_of_joining, salary)
VALUES 
('Alice Walker', 30, 'Female', '9876501234', 'alice@company.com', '789 Pine Street', 'Engineering', 'Senior Developer', '2023-01-15', 85000.00),
('Bob Martin', 38, 'Male', '9812345678', 'bob@company.com', '101 Cedar Lane', 'Finance', 'Financial Analyst', '2022-06-01', 72000.00);
