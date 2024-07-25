/* 4.Select directors along with the average budget of the movies they have directed
Shape
Director ID
Director name (concatenation of first and last names)
Average budget */

SELECT Movie.Director, AVG(Movie.Budget) FROM Movie GROUP BY Movie.Director;