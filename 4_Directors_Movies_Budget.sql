/* 4.Select directors along with the average budget of the movies they have directed
Shape
Director ID
Director name (concatenation of first and last names)
Average budget */

SELECT Director.id_director, CONCAT(Director.Firstname, " ", Director.Lastname) AS Director_name, AVG(Movie.Budget) AS Average_Budget FROM 
Director
INNER JOIN Movie ON Director.movie_id = Movie.id
GROUP BY Director.id_director;