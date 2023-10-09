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