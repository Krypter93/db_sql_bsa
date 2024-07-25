/* 1. Select a list of actors along with the total budget of the movies they have appeared in
Shape
ID
First name
Last name
Total movies budget */

SELECT A.Firstname, A.Lastname, SUM(M.Budget) AS Total_budget
FROM `Character` AS C
INNER JOIN CharacterActor AS CA ON C.id = CA.Character_id
INNER JOIN Actor AS A ON CA.Actor_id = A.id
INNER JOIN MovieCharacter AS MC ON C.id = MC.Character_id
INNER JOIN Movie AS M ON MC.Movie_id = M.id
GROUP BY A.id;
