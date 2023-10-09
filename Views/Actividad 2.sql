CREATE VIEW peliculas_por_categoria AS
SELECT
    fc.category_id,
    c.name AS categoria,
    COUNT(*) AS cantidad_peliculas
FROM
    film_category fc
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    fc.category_id, c.name;
SELECT
    category_id,
    categoria,
    cantidad_peliculas
FROM
    peliculas_por_categoria;