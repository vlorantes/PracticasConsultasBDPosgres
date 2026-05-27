-- 01. Insertar propietario
INSERT INTO users (name, email, password, created_at)
VALUES ('Roberto Dueñas', 'r.duenas@propietario.sv', 'hash_secure_123', NOW());

-- 02. Insertar alojamiento vinculado
INSERT INTO accomodations (name, address, description, image, created_at)
VALUES ('Villa Montaña', 'Km 45, Planes de Renderos', 'Clima fresco y vista a la ciudad', 'villa.jpg', NOW());

-- 03. Registrar huésped y reserva
INSERT INTO users (name, email, password, created_at)
VALUES ('Ana Martínez', 'ana.mtz@guest.com', 'guest_pass_456', NOW());

INSERT INTO bookings (booking, check_in_date, check_out_date, total_amount, status, accomodation_id, user_id, created_at)
VALUES ('BK-789', '2026-07-15', '2026-07-20', 350.00, 'pending', 1, (SELECT id FROM users WHERE email = 'ana.mtz@guest.com'), NOW());



-- 05. Filtrar alojamientos (asumiendo lógica de existencia en bookings o descripción)
SELECT * FROM accomodations WHERE description IS NOT NULL;

-- 06. Filtrar por nacionalidad (Simulado por dominio de email en este esquema)
SELECT * FROM users WHERE email LIKE '%.sv';

-- 07. Uso de BETWEEN para fechas de ingreso
SELECT * FROM bookings 
WHERE check_in_date BETWEEN '2026-01-01' AND '2026-12-31';

-- 08. Modificar precio de una reserva específica
UPDATE bookings SET total_amount = 500.00 WHERE booking = 'BK-789';

-- 09. Actualizar estado a confirmado
UPDATE bookings SET status = 'confirmed' WHERE booking = 'BK-789';






-- 10. DELETE WHERE ejemplo (borrar logs de fallos antiguos)
DELETE FROM failed_jobs WHERE failed_at < '2026-01-01';

-- 11. INNER JOIN simple
SELECT b.booking, u.name AS huesped 
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;


-- 12. INNER JOIN múltiple
SELECT b.booking, a.name AS alojamiento, u.name AS cliente
FROM bookings b
JOIN accomodations a ON b.accomodation_id = a.id
JOIN users u ON b.user_id = u.id;

-- 13. JOIN combinado (Muestra montos por reserva y usuario)
SELECT u.name, b.booking, b.total_amount
FROM users u
JOIN bookings b ON u.id = b.user_id;


-- 14. Alojamientos que no han recibido reservas aún
SELECT a.name 
FROM accomodations a
LEFT JOIN bookings b ON a.id = b.accomodation_id
WHERE b.id IS NULL;


-- 15. Usuarios que no tienen ninguna actividad de reserva
SELECT u.name 
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
WHERE b.id IS NULL;


-- 16. SUM de montos totales
SELECT SUM(total_amount) AS gran_total FROM bookings;


-- 17. AVG (Promedio de montos pagados por reserva)
SELECT AVG(total_amount) AS promedio_pago FROM bookings;


-- 18. COUNT + LIMIT (Alojamientos con más reservas)
SELECT accomodation_id, COUNT(*) as total 
FROM bookings 
GROUP BY accomodation_id 
ORDER BY total DESC LIMIT 3;


-- 19. GROUP BY + HAVING
SELECT user_id, COUNT(*) 
FROM bookings 
GROUP BY user_id 
HAVING COUNT(*) > 3;



-- 20. Subquery
SELECT name, description 
FROM accomodations 
WHERE id = (SELECT accomodation_id FROM bookings ORDER BY total_amount DESC LIMIT 1);