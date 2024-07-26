/* 5.Select detailed information about movies that meet criteria below

Criteria
Belong to a country with ID of 1.
Were released in 2022 or later.
Have a duration of more than 2 hours and 15 minutes.
Include at least one of the genres: Action or Drama.

Shape
ID
Title
Release date
Duration
Description
Poster (poster file information as JSON)
Director (director information as JSON)
ID
First name
Last name */

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
    ) AS Director
FROM 
    Movie 
INNER JOIN 
    Director ON Movie.id = Director.movie_id
INNER JOIN 
    Country ON Movie.id = Country.movie_id
INNER JOIN 
    Movie_Genres ON Movie.id = Movie_Genres.Movie_id
INNER JOIN 
    Genres ON Movie_Genres.Genre_id = Genres.id
WHERE 
    Country.id_country = 1 
    AND Movie.Release_date >= '2022-01-01' 
    AND Movie.Duration > 135 
    AND Genres.Genre_name IN ('Action', 'Drama')
GROUP BY 
    Movie.id, Movie.Title, Movie.Release_date, Movie.Duration, Movie.Description, Movie.Poster, Director.id_director, Director.Firstname, Director.Lastname;
