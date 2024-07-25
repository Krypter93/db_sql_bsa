/* 3.Retrieve a list of all users along with their favorite movies as array of identifiers
Shape
ID
Username
Favorite movie IDs */

SELECT User.id, User.Username, GROUP_CONCAT(FavoriteMovies.movie_id) FROM User
INNER JOIN FavoriteMovies ON User.id = FavoriteMovies.user_id
INNER JOIN Movie ON FavoriteMovies.movie_id = Movie.id
GROUP BY User.id
ORDER BY User.id;