/* Insert fake data into User table */
INSERT INTO User (Username, Firstname, Lastname, Email, Password)
VALUES 
('john_doe', 'John', 'Doe', 'john.doe@example.com', 'password123'),
('jane_smith', 'Jane', 'Smith', 'jane.smith@example.com', 'password456'),
('michael_brown', 'Michael', 'Brown', 'michael.brown@example.com', 'password789');

/* Insert fake data into File table */
INSERT INTO File (Filename, MIMEType, Keyfile, FileURL, user_id)
VALUES 
('avatar1.jpg', 'image/jpeg', 'avatar1_key', 'http://example.com/avatar1.jpg', 1),
('avatar2.jpg', 'image/jpeg', 'avatar2_key', 'http://example.com/avatar2.jpg', 2),
('avatar3.jpg', 'image/jpeg', 'avatar3_key', 'http://example.com/avatar3.jpg', 3);

/* Insert fake data into Movie table */
INSERT INTO Movie (Title, Description, Budget, Release_date, Duration, Country, Poster, Director)
VALUES 
('The Great Adventure', 'An epic adventure movie', 100000000, '2022-05-15', 120, 'http://example.com/poster1.jpg'),
('Mystery of the Lost City', 'A thrilling mystery movie', 75000000, '2023-07-20', 130, 'http://example.com/poster2.jpg'),
('Space Odyssey', 'A science fiction movie', 150000000, '2021-12-01', 140, 'http://example.com/poster3.jpg');

/* Insert fake data into Director table */
INSERT INTO Director (Firstname, Lastname, movie_id)
VALUES 
('John', 'Director', 1),
('Jane', 'Director', 2),
('Michael', 'Director', 3);

/* Insert fake data into Country table */
INSERT INTO Country (Country_name, movie_id)
VALUES 
('USA', 1),
('UK', 2),
('Canada', 3);


/* Insert fake data into Genres table */
INSERT INTO Genres (Genre_name)
VALUES 
('Adventure'),
('Mystery'),
('Science Fiction');

/* Insert fake data into Movie_Genres table */
INSERT INTO Movie_Genres (Movie_id, Genre_id)
VALUES 
(1, 1),
(2, 2),
(3, 3);

/* Insert fake data into Character table */
INSERT INTO `Character` (Name, Description, Role)
VALUES 
('John Hero', 'The main hero of the movie', 'leading'),
('Jane Sidekick', 'The hero\'s sidekick', 'supporting'),
('Background Extra', 'A background character', 'background');

/* Insert fake data into Actor table */
INSERT INTO Actor (Name, Lastname)
VALUES 
('Chris', 'Evans'),
('Scarlett', 'Johansson'),
('Robert', 'Downey Jr.');

/* Insert fake data into MovieCharacter table */
INSERT INTO MovieCharacter (Movie_id, Character_id)
VALUES 
(1, 1),
(2, 2),
(3, 3);

/* Insert fake data into CharacterActor table */
INSERT INTO CharacterActor (Character_id, Actor_id)
VALUES 
(1, 1),
(2, 2),
(3, 3);

/* Insert fake data into Person table */
INSERT INTO Person (actor_id, Biography, Date_of_birth, Gender, Home_country, main_image)
VALUES 
(1, 'An actor known for his heroic roles', '1981-06-13', 'Male', 'USA', 'http://example.com/actor1.jpg'),
(2, 'An actress known for her action roles', '1984-11-22', 'Female', 'USA', 'http://example.com/actor2.jpg'),
(3, 'An actor known for his charismatic roles', '1965-04-04', 'Male', 'USA', 'http://example.com/actor3.jpg');

/* Insert fake data into PersonImages table */
INSERT INTO PersonImages (person_id, image_url)
VALUES 
(1, 'http://example.com/actor1_image1.jpg'),
(2, 'http://example.com/actor2_image1.jpg'),
(3, 'http://example.com/actor3_image1.jpg');

/* Insert fake data into FavoriteMovies table */
INSERT INTO FavoriteMovies (user_id, movie_id)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 1);