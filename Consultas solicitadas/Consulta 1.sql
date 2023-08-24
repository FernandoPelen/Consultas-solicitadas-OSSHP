-- Cantidad de ciudades por país, ordenado de mayor a menor.
SELECT
	COUNT(*) AS cantidad_ciudades -- cuenta las ciudades
	, country AS pais
	, country.country_id As id_pais
FROM city
INNER JOIN country -- Inner Join funcion para unir dos tablas
	ON city.country_id = country.country_id
GROUP BY city.country_id -- agrupa los campos iguales con ayuda del COUNT 
ORDER BY cantidad_ciudades DESC; -- Ordena de forma descendente