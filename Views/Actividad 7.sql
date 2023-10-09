CREATE VIEW peliculas_entre_1_y_2_horas AS
SELECT
    f.title AS titulo_pelicula,
    c.name AS categoria,
    l.name AS idioma,
    f.rating,
    f.length AS duracion
FROM
    film f
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
JOIN
    language l ON f.language_id = l.language_id
WHERE
    f.length >= 60 AND f.length <= 120;
SELECT
    titulo_pelicula,
    categoria,
    idioma,
    rating,
    duracion
FROM
    peliculas_entre_1_y_2_horas;