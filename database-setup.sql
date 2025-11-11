-- BookHub Database Setup Script
-- This script creates the database and table structure for the BookHub application

-- Create database
CREATE DATABASE IF NOT EXISTS bookstore;

-- Use the database
USE bookstore;

-- Create books table
-- Note: The application uses Hibernate with hbm2ddl.auto=update, 
-- so the table will be auto-created if it doesn't exist.
-- This script is provided for manual setup or reference.

CREATE TABLE IF NOT EXISTS books (
    book_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    INDEX idx_title (title),
    INDEX idx_author (author)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample data (optional)
-- Uncomment the following lines to insert sample books

-- INSERT INTO books (title, author, price) VALUES 
-- ('The Great Gatsby', 'F. Scott Fitzgerald', 12.99),
-- ('To Kill a Mockingbird', 'Harper Lee', 14.99),
-- ('1984', 'George Orwell', 13.99),
-- ('Pride and Prejudice', 'Jane Austen', 11.99),
-- ('The Catcher in the Rye', 'J.D. Salinger', 12.50);

-- Verify table creation
SHOW TABLES;
DESCRIBE books;
