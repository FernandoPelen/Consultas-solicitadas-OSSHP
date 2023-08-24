-- Nombre completo y direccion de los clientes que rentaron mas de 3 peliculas en los ultimos 3 años

-- Segú la revisión sobre la tabla de las rentas, la fecha del alquiler mas reciente era del 2006 por lo que el
-- resultado del query no devolvería resultados.
-- Por lo que se actualizaron los registro de dos cliente para ver resultados del query

UPDATE rental SET rental_date = '2021-10-14 15:16:03' WHERE rental_id IN (13941, 15413, 12709, 12616);
UPDATE rental SET rental_date = '2021-10-14 15:16:03' WHERE rental_id IN (1, 746);

SELECT
    CONCAT(cliente.first_name, ' ', cliente.last_name) AS Nombre -- une el contenido de 2 columnas en una
    , direccion.address AS Direccion
    , COUNT(*) AS Alquiler
FROM
	rental
INNER JOIN customer AS cliente
	ON rental.customer_id = cliente.customer_id
INNER JOIN address AS direccion
	ON cliente.address_id = direccion.address_id
WHERE
	rental_date
 		BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND NOW() -- funcion para poder saber ciertas fechas una entre otra con intervalo de 3 años
GROUP BY
	rental.customer_id
HAVING COUNT(*) > 3;