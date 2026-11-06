-- Schema for Question 2: Library Management System
-- Optional: Spring Boot JPA will auto-create this table if ddl-auto=update

CREATE TABLE IF NOT EXISTS books (
    book_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255),
    isbn VARCHAR(100),
    edition VARCHAR(100),
    publication_year INT,
    category VARCHAR(100),
    available_copies INT DEFAULT 0
);

-- Sample Data
INSERT INTO books (title, author, publisher, isbn, edition, publication_year, category, available_copies)
VALUES 
('Clean Code', 'Robert C. Martin', 'Prentice Hall', '9780132350884', '1st Edition', 2008, 'Software Engineering', 5),
('Effective Java', 'Joshua Bloch', 'Addison-Wesley', '9780134685991', '3rd Edition', 2018, 'Programming', 8);
