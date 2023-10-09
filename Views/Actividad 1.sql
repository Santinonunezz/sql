CREATE VIEW peliculas_por_rating AS
SELECT
    rating,
    COUNT(*) AS cantidad_peliculas
FROM
    film
GROUP BY
    rating;
	
	SELECT
    rating,
    cantidad_peliculas
FROM
    peliculas_por_rating;