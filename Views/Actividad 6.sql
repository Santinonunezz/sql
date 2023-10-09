CREATE VIEW peliculas_sin_devolver AS
SELECT
    f.title AS titulo_pelicula,
    CONCAT(
        a.address,
        ', ',
        ci.city,
        ', ',
        co.country
    ) AS direccion,
    ci.city AS ciudad,
    co.country AS pais
FROM
    rental r
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
JOIN
    store s ON i.store_id = s.store_id
JOIN
    address a ON s.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
JOIN
    country co ON ci.country_id = co.country_id
WHERE
    r.return_date IS NULL;
SELECT
    titulo_pelicula,
    direccion,
    ciudad,
    pais
FROM
    peliculas_sin_devolver;