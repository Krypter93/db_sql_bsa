/* Create database */ CREATE DATABASE MoviesDB;

/* Create Table User */
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Username VARCHAR(100) UNIQUE NOT NULL,
    Firstname VARCHAR(100) NOT NULL,
    Lastname VARCHAR(100) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL, 
    Password VARCHAR(100)
    );