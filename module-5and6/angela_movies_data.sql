-- Angela Vargas CSD430 5/6.2 Programming Assignment

CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

CREATE TABLE angela_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INT,
    rating DECIMAL(2,1),
    director VARCHAR(100)
);

INSERT INTO angela_movies_data (title, genre, release_year, rating, director) VALUES
('The Lord of the Rings: The Fellowship of the Ring', 'Fantasy', 2001, 8.8, 'Peter Jackson'),
('The Two Towers', 'Fantasy', 2002, 8.7, 'Peter Jackson'),
('The Return of the King', 'Fantasy', 2003, 9.0, 'Peter Jackson'),
('Inception', 'Sci-Fi', 2010, 8.8, 'Christopher Nolan'),
('Interstellar', 'Sci-Fi', 2014, 8.6, 'Christopher Nolan'),
('The Dark Knight', 'Action', 2008, 9.0, 'Christopher Nolan'),
('Titanic', 'Romance', 1997, 7.9, 'James Cameron'),
('Avatar', 'Sci-Fi', 2009, 7.8, 'James Cameron'),
('The Hobbit: An Unexpected Journey', 'Fantasy', 2012, 7.8, 'Peter Jackson'),
('The Matrix', 'Sci-Fi', 1999, 8.7, 'The Wachowskis');
