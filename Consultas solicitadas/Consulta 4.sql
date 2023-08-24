-- Cientes que deben regresar peliculas del 08 al 12 de diciembre en la tienda 2, muestres el nombre y descripcion de los titulos que rento.

-- Se modifico el registro de 4 campos ya que no habian registros de diciembre en la columna rental date en la tabla rental.
UPDATE rental SET return_date = '2021-12-08 15:16:03' WHERE rental_id IN (91, 93);
UPDATE rental SET return_date = '2021-12-10 15:16:03' WHERE rental_id IN (89, 90);

SELECT 
	CONCAT(c.first_name, ' ', c.last_name) AS nombre_cliente
    , s.store_id AS codigo_tienda
    , s.`name` AS nombre_tienda
    , f.title AS pelicula
    , f.description AS descripcion_pelicula
FROM
	rental r
INNER JOIN inventory i
	ON r.inventory_id = i.inventory_id
INNER JOIN store s
	ON i.store_id = s.store_id
INNER JOIN customer c
	ON r.customer_id = c.customer_id
INNER JOIN film f 
	ON i.film_id = f.film_id
WHERE
	s.store_id = 2
    AND return_date
 		BETWEEN '2021-12-08 00:00:00' AND '2021-12-12 00:00:00'; -- se usa el between para saber rango entre fechas