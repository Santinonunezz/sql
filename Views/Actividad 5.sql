CREATE VIEW peliculas_distintas_por_local AS
SELECT
    CONCAT(
        a.address,
        ', ',
        ci.city,
        ', ',
        co.country
    ) AS direccion,
    COUNT(DISTINCT i.film_id) AS cantidad_peliculas_distintas
FROM
    inventory i
JOIN
    store s ON i.store_id = s.store_id
JOIN
    address a ON s.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
JOIN
    country co ON ci.country_id = co.country_id
GROUP BY
    a.address, ci.city, co.country
ORDER BY
    COUNT(DISTINCT i.film_id) DESC;
SELECT
    direccion,
    cantidad_peliculas_distintas
FROM
    peliculas_distintas_por_local;