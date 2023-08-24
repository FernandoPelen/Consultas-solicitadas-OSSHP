 -- Existencia de cada título por tienda, ordenada por rating
 
 -- Para comodidad del client se agrego la columna name a la tabla store
 ALTER TABLE `store` 
	ADD `name` varchar(128) NOT NULL;

-- Se agrego el nombre a cada tienda, quedando la tienda 1. Miraflores y tienda 2. Eskala
UPDATE store SET `name` = 'Miraflores' WHERE store_id = 1;
UPDATE store SET `name` = 'Eskala' WHERE store_id = 2;

SELECT
	 f.title AS Pelicula
	, s.`name` AS 'Nombre Tienda'
	, COUNT(*) AS Existencia
    , f.rating
FROM
	inventory
INNER JOIN film f
	ON inventory.film_id = f.film_id
INNER JOIN store s
	ON inventory.store_id = s.store_id
GROUP BY
	f.film_id
    , s.store_id
ORDER BY rating
;

