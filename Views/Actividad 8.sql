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