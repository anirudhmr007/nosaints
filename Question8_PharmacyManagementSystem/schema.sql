-- Schema for Question 8: Pharmacy Management System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS medicines (
    medicine_id BIGSERIAL PRIMARY KEY,
    medicine_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    manufacturer VARCHAR(255),
    batch_number VARCHAR(100),
    price NUMERIC(10, 2) NOT NULL,
    quantity INT NOT NULL,
    manufacturing_date VARCHAR(50),
    expiry_date VARCHAR(50) NOT NULL,
    supplier_name VARCHAR(255)
);

-- Sample Data
INSERT INTO medicines (medicine_name, category, manufacturer, batch_number, price, quantity, manufacturing_date, expiry_date, supplier_name)
VALUES 
('Paracetamol 500mg', 'Analgesic', 'GSK Pharma', 'BCH-101', 5.50, 100, '2023-05-01', '2026-05-01', 'Global Health Meds'),
('Amoxicillin 250mg', 'Antibiotic', 'Pfizer', 'BCH-102', 12.00, 45, '2022-01-10', '2023-12-31', 'Direct Med Corp');
