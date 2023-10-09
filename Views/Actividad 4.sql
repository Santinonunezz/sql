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