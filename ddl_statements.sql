/* Create database */ 
CREATE DATABASE MoviesDB;

/* Create Table User */
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Username VARCHAR(100) UNIQUE NOT NULL,
    Firstname VARCHAR(100) NOT NULL,
    Lastname VARCHAR(100) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL, 
    Password VARCHAR(100)
    );

/* Create Table File */
CREATE TABLE File (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Filename VARCHAR(100) UNIQUE NOT NULL,
    MIMEType VARCHAR(100) NOT NULL,
    Keyfile VARCHAR(100) UNIQUE NOT NULL,
    FileURL VARCHAR(100) UNIQUE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

/* Create Table Movie */
CREATE TABLE Movie (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Budget DECIMAL(12,2) NOT NULL,
    Release_date DATE NOT NULL,
    Duration INT NOT NULL,
    Country VARCHAR(100) NOT NULL,
    Poster VARCHAR(100) NOT NULL
);

/* Add Director column to Movie table */
ALTER TABLE Movie ADD Director VARCHAR(100);

/* Create Table Genres */
CREATE TABLE Genres (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Genre_name VARCHAR(100) UNIQUE NOT NULL
)

Create Table Movie_Genres (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Movie_id INT NOT NULL,
    Genre_id INT NOT NULL,
    FOREIGN KEY (Movie_id) REFERENCES Movie(id),
    FOREIGN KEY (Genre_id) REFERENCES Genres(id)
)

/* Create Table Character */
CREATE TABLE `Character` (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    Role ENUM('leading', 'supporting', 'background') NOT NULL
)

/* Create Table Actor */
CREATE TABLE Actor (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL
)

/* Create Table MovieCharacter */
Create Table MovieCharacter (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Movie_id INT NOT NULL,
    Character_id INT NOT NULL,
    FOREIGN KEY (Movie_id) REFERENCES Movie(id),
    FOREIGN KEY (Character_id) REFERENCES `Character`(id)
)

/* Create Table CharacterActor */
CREATE TABLE CharacterActor (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Character_id INT NOT NULL,
    Actor_id INT NOT NULL,
    FOREIGN KEY (Character_id) REFERENCES `Character`(id),
    FOREIGN KEY (Actor_id) REFERENCES Actor(id)
)

