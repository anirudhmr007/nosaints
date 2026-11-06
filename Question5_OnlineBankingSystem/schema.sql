-- Schema for Question 5: Online Banking System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS bank_accounts (
    account_id BIGSERIAL PRIMARY KEY,
    account_number VARCHAR(100) UNIQUE NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(50),
    contact_number VARCHAR(50),
    email VARCHAR(255),
    address TEXT,
    account_type VARCHAR(100),
    account_balance NUMERIC(14, 2) DEFAULT 0.00
);

-- Sample Data
INSERT INTO bank_accounts (account_number, customer_name, age, gender, contact_number, email, address, account_type, account_balance)
VALUES 
('ACC1001', 'David Miller', 32, 'Male', '9876541230', 'david@gmail.com', '12 Wall Street, NY', 'Savings Account', 1500.00),
('ACC1002', 'Sarah Connor', 29, 'Female', '9812309876', 'sarah@gmail.com', '45 Sunset Blvd, LA', 'Current Account', 3200.50);
