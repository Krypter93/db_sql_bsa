/* 6.Select detailed information about a movie with ID of 1
Shape
ID
Title
Release date
Duration
Description
Poster (poster file information in JSON format)
Director (person information in JSON format)
ID
First name
Last name
Photo (primary photo file information in JSON format)
Actors (array of JSON objects)
ID
First name
Last name
Photo (primary photo file information in JSON format)
Genres (array of objects in JSON format)
ID
Name */

SELECT 
    Movie.id AS ID,
    Movie.Title AS Title,
    Movie.Release_date AS Release_date,
    Movie.Duration AS Duration,
    Movie.Description AS Description,
    JSON_OBJECT('url', Movie.Poster) AS Poster,
    JSON_OBJECT(
        'ID', Director.id_director,
        'First name', Director.Firstname,
        'Last name', Director.Lastname
    ) AS Director,
    JSON_ARRAYAGG(
        JSON_OBJECT(
        'ID', Actor.id,
        'First name', Actor.Firstname,
        'Last name', Actor.Lastname,
        'main photo', Person.main_image
        )
    ) AS Actors,
    JSON_ARRAYAGG(
        JSON_OBJECT(
        'ID', Genres.id,
        'Name', Genres.Genre_name
        )
    ) AS Genres
    FROM Movie
    INNER JOIN Director ON Movie.id = Director.movie_id
    INNER JOIN MovieCharacter ON Movie.id = MovieCharacter.Movie_id
    INNER JOIN `Character` ON MovieCharacter.Character_id = Character.id
    INNER JOIN CharacterActor ON Character.id = CharacterActor.Character_id
    INNER JOIN Actor ON CharacterActor.Actor_id = Actor.id
    INNER JOIN Person ON Actor.id = Person.actor_id
    INNER JOIN Movie_Genres ON Movie.id = Movie_Genres.Movie_id
    INNER JOIN Genres ON Movie_Genres.Genre_id = Genres.id
    WHERE Movie.id = 1
    GROUP BY Movie.id, Movie.Title, Movie.Release_date, Movie.Duration, Movie.Description, Movie.Poster, Director.id_director, Director.Firstname, Director.Lastname; 