-- Pelicula menos rentada por tienda
SELECT 
	f.title As Pelicula, f.rental_rate AS can_Rentas
    , COUNT(*) AS Total
    , i.film_id AS Id_Pelicula
    , s.store_id AS Id_tienda
    , s.`name` As Tienda
    FROM 
	film f 
    INNER JOIN inventory i 
		ON f.film_id = i.film_id
	INNER JOIN store s
		ON i.store_id = s.store_id
    WHERE 
        f.rental_rate = (SELECT MIN(rental_rate) FROM film) -- funcion MIN saca el valor minimo de la columna rental_rate
	GROUP BY 
		i.film_id
        , s.store_id;