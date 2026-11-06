-- Schema for Question 4: Product Inventory Management System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS products (
    product_id BIGSERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    brand VARCHAR(100),
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INT NOT NULL,
    supplier_name VARCHAR(255),
    manufacturing_date VARCHAR(50),
    expiry_date VARCHAR(50)
);

-- Sample Data
INSERT INTO products (product_name, category, brand, description, price, quantity, supplier_name, manufacturing_date, expiry_date)
VALUES 
('Wireless Mouse', 'Electronics', 'Logitech', 'Ergonomic 2.4GHz optical mouse', 29.99, 50, 'TechSupply Inc', '2024-01-10', '2027-01-10'),
('Organic Green Tea', 'Beverages', 'Lipton', '100% natural green tea bags', 6.50, 120, 'PureHerbs Ltd', '2024-03-01', '2025-03-01');
