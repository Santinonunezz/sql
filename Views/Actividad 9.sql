CREATE VIEW costo_alquiler_promedio_por_categoria AS
SELECT
    c.name AS categoria,
    AVG(f.rental_rate) AS costo_alquiler_promedio
FROM
    film f
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    c.name;
SELECT
    categoria,
    costo_alquiler_promedio
FROM
    costo_alquiler_promedio_por_categoria;