SELECT 
	f.title AS nombre
	, rating
    , f.special_features AS caracteristicas_especiales
    FROM
    film f
    WHERE rating = 'PG-13'
	AND special_features = 'Commentaries,Behind the Scenes'
    ;
    SELECT * FROM film