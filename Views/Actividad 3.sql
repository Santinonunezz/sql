CREATE VIEW apariciones_actores AS
SELECT
    a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_nombre,
    COUNT(fa.actor_id) AS cantidad_apariciones
FROM
    actor a
JOIN
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY
    a.actor_id, actor_nombre
ORDER BY
    COUNT(fa.actor_id) DESC;
SELECT
    actor_id,
    actor_nombre,
    cantidad_apariciones
FROM
    apariciones_actores
LIMIT 10;