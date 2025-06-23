-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Author Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY ,
    name VARCHAR(100) NOT NULL
);

-- Book Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY ,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    published_year INT
);

-- Many-to-Many Table between Books and Authors
CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Member Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Loan Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY ,
    member_id INT,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
 



