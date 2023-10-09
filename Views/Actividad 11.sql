CREATE VIEW cantidad_actores_por_categoria AS
SELECT
    c.name AS categoria,
    MIN(actors_count) AS min_cantidad_actores,
    MAX(actors_count) AS max_cantidad_actores,
    AVG(actors_count) AS promedio_cantidad_actores
FROM
    (SELECT
        fc.category_id,
        COUNT(fa.actor_id) AS actors_count
    FROM
        film f
    JOIN
        film_category fc ON f.film_id = fc.film_id
    JOIN
        film_actor fa ON f.film_id = fa.film_id
    GROUP BY
        fc.category_id, f.film_id) AS categoria_actores
JOIN
    category c ON categoria_actores.category_id = c.category_id
GROUP BY
    c.name;
SELECT
    categoria,
    min_cantidad_actores,
    max_cantidad_actores,
    promedio_cantidad_actores
FROM
    cantidad_actores_por_categoria;