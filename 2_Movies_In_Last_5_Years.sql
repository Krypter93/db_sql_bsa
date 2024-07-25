/* 2.Select movies released in the last 5 years with the number of actors who have appeared in each movie
Shape
ID
Title
Actors count */

SELECT Movie.id, Movie.Title, COUNT(Actor.id) AS Actors_count FROM Movie
INNER JOIN MovieCharacter ON Movie_id = Movie.id
INNER JOIN `Character` ON Character.id = MovieCharacter.Character_id
INNER JOIN CharacterActor ON Character.id = CharacterActor.Character_id
INNER JOIN Actor ON Actor.id = CharacterActor.Actor_id
WHERE Movie.Release_date > DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY Movie.id, Movie.Title;