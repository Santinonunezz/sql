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

/*Actividad 2*/

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

/*Actividad 3*/

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

/*Actividad 4*/

CREATE VIEW inventario_por_local AS
SELECT
    CONCAT(
        a.address,
        ', ',
        ci.city,
        ', ',
        co.country
    ) AS direccion,
    COUNT(i.inventory_id) AS cantidad_ejemplares
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
    COUNT(i.inventory_id) DESC;

SELECT
    direccion,
    cantidad_ejemplares
FROM
    inventario_por_local;

/*Actividad 5*/

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

/*Actividad 6*/

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

/*Actividad 7*/

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

/*Actividad 8*/

CREATE VIEW encargados_local AS
SELECT
    s.first_name AS nombre,
    s.last_name AS apellido,
    CONCAT(
        a.address,
        ', ',
        ci.city,
        ', ',
        co.country
    ) AS direccion
FROM
    staff s
JOIN
    store st ON s.store_id = st.manager_staff_id
JOIN
    address a ON st.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
JOIN
    country co ON ci.country_id = co.country_id;
SELECT
    nombre,
    apellido,
    direccion
FROM
    encargados_local;

/*Actividad 9*/

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

/*Actividad 10*/

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

/*Actividad 11*/

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
	
/*Actividad 12*/

CREATE VIEW alquileres_alabama_devil AS
SELECT
    r.rental_id,
    r.rental_date AS fecha_alquiler,
    r.return_date AS fecha_devolucion,
    f.rental_duration AS dias_alquiler,
    f.rental_rate AS costo_por_dia,
    f.rental_rate * f.rental_duration AS costo_total
FROM
    rental r
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
WHERE
    f.title = 'ALABAMA DEVIL';
SELECT
    rental_id,
    fecha_alquiler,
    fecha_devolucion,
    dias_alquiler,
    costo_por_dia,
    costo_total
FROM
    alquileres_alabama_devil
ORDER BY
    fecha_alquiler;
	
/*Actividad 13*/

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

