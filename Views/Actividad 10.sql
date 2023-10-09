CREATE VIEW fechas_devolucion_peliculas AS
SELECT
    f.title AS titulo_pelicula,
    MIN(r.return_date) AS fecha_devolucion_minima,
    MAX(r.return_date) AS fecha_devolucion_maxima
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    f.title;
SELECT
    titulo_pelicula,
    fecha_devolucion_minima,
    fecha_devolucion_maxima
FROM
    fechas_devolucion_peliculas;