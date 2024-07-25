/* Create database */ 
CREATE DATABASE MoviesDB;

/* Select database */
USE MoviesDB;

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

/* Add column Lastname to Actor table */
ALTER TABLE Actor ADD Lastname VARCHAR(100) NOT NULL;

/* Create Person Table */
CREATE TABLE Person (
    actor_id INT PRIMARY KEY NOT NULL,
    Biography LONGTEXT NOT NULL,
    Date_of_birth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Home_country VARCHAR(100) NOT NULL,
    main_image VARCHAR(100) NOT NULL,
    FOREIGN KEY (actor_id) REFERENCES Actor(id)
)

/* Create PersonImages Table */
CREATE TABLE PersonImages (
    image_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    person_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(actor_id)
)

/* Modify FileURL Column in File Table */
ALTER TABLE File MODIFY FileURL VARCHAR(255) NOT NULL;

/* Create Table FavoriteMovies */
CREATE TABLE FavoriteMovies (
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (movie_id) REFERENCES Movie(id)
)


/* Procedure to add createdAt and updatedAt columns to all tables */
DELIMITER //

CREATE PROCEDURE AddTimestampsToAllTables()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE tableName VARCHAR(255);
    DECLARE cur CURSOR FOR 
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = DATABASE() 
        AND table_type = 'BASE TABLE';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tableName;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Add createdAt and updatedAt columns
        SET @query = CONCAT('ALTER TABLE `', tableName, '` ',
                            'ADD COLUMN createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, ',
                            'ADD COLUMN updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;');
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

/* Execute the procedure */
CALL AddTimestampsToAllTables();

/* Modify Description column in Movie table */
ALTER TABLE Movie MODIFY Description TEXT NOT NULL;

/* Modify main_image column in Person table */
ALTER TABLE Person MODIFY main_image VARCHAR(255) NOT NULL;

