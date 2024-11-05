

CREATE DATABASE IF NOT EXISTS book_inventory;

-- Use the database
USE book_inventory;


-- Create the Inventory table
CREATE TABLE IF NOT EXISTS Inventory (
   entry_id varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  author varchar(255) NOT NULL,
  genre varchar(50) DEFAULT NULL,
  publication_date varchar(50) DEFAULT NULL,
  isbn varchar(13) DEFAULT NULL,
  PRIMARY KEY (entry_id),
  UNIQUE KEY isbn (isbn)
);


  -- Insert sample data into the Inventory table
INSERT INTO Inventory (entry_id, title, author, genre, publication_date, isbn) VALUES
('1', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '1925-04-10', '9780743273565'),
('2', 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11', '9780061120084'),
('3', '1984', 'George Orwell', 'Dystopian', '1949-06-08', '9780451524935'),
('4', 'Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', '9781503290563'),
('5', 'Moby Dick', 'Herman Melville', 'Adventure', '1851-11-14', '9781503280786'),
('6', 'War and Peace', 'Leo Tolstoy', 'Historical', '1869-01-01', '9780199232765'),
('7', 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '1951-07-16', '9780316769488'),
('8', 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '1937-09-21', '9780547928227');
