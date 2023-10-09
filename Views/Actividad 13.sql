CREATE VIEW peliculas_pagos_mayor_100_dolares AS
SELECT
    f.title AS titulo_pelicula,
    SUM(p.amount) AS total_pagos_alquiler
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
JOIN
    payment p ON r.rental_id = p.rental_id
GROUP BY
    f.title
HAVING
    SUM(p.amount) > 100;
SELECT
    titulo_pelicula,
    total_pagos_alquiler
FROM
    peliculas_pagos_mayor_100_dolares;
