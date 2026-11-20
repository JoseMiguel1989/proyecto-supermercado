-- ==========================================
-- 0. KPI GENERALES (VERIFICACIÓN BASE)
-- Pregunta: ¿Cuáles son los ingresos totales, el número de ventas y el ticket promedio?
-- ==========================================
SELECT
    ROUND(SUM(total), 2) AS ingresos_totales,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(AVG(total), 2) AS ticket_promedio
FROM supermercado;


-- ==========================================
-- 1. DÓNDE: INGRESOS POR SUCURSAL Y CIUDAD
-- Pregunta: ¿Qué sucursal/ciudad genera mayores ingresos totales?
-- ==========================================
SELECT
    branch,
    city,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(SUM(total), 2) AS ingresos_totales,
    ROUND(AVG(total), 2) AS ticket_promedio
FROM supermercado
GROUP BY branch, city
ORDER BY ingresos_totales DESC;


-- ==========================================
-- 2. DÓNDE: INGRESOS POR SUCURSAL Y LÍNEA DE PRODUCTO
-- Pregunta: ¿Cómo se distribuyen los ingresos por sucursal y línea de producto?
-- ==========================================
SELECT
    branch,
    city,
    product_line,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(SUM(total), 2) AS ingresos_totales
FROM supermercado
GROUP BY branch, city, product_line
ORDER BY branch, ingresos_totales DESC;


-- ==========================================
-- 3. CUÁNDO: INGRESOS POR HORA
-- Pregunta: ¿En qué horas del día se concentran más ingresos?
-- ==========================================
SELECT
    hora,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(SUM(total), 2) AS ingresos_totales
FROM supermercado
GROUP BY hora
ORDER BY hora ASC;


-- ==========================================
-- 4. CUÁNDO: INGRESOS POR DÍA DE LA SEMANA
-- Pregunta: ¿Qué días de la semana generan más ingresos (ordenados de lunes a domingo)?
-- ==========================================
SELECT
    dia_semana,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(SUM(total), 2) AS ingresos_totales
FROM supermercado
GROUP BY dia_semana
ORDER BY CASE dia_semana
    WHEN 'Monday' THEN 1
    WHEN 'Tuesday' THEN 2
    WHEN 'Wednesday' THEN 3
    WHEN 'Thursday' THEN 4
    WHEN 'Friday' THEN 5
    WHEN 'Saturday' THEN 6
    WHEN 'Sunday' THEN 7
END;


-- ==========================================
-- 5. CUÁNDO: INGRESOS POR MES
-- Pregunta: ¿Cómo varían los ingresos entre los meses analizados (1 a 3)?
-- ==========================================
SELECT
    mes,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(SUM(total), 2) AS ingresos_totales
FROM supermercado
GROUP BY mes
ORDER BY mes ASC;


-- ==========================================
-- 6. QUIÉN: TICKET PROMEDIO Y SATISFACCIÓN POR TIPO DE CLIENTE
-- Pregunta: ¿Cambian el ticket promedio y la satisfacción entre Member y Normal?
-- ==========================================
SELECT
    customer_type,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(AVG(total), 2) AS ticket_promedio,
    ROUND(AVG(customer_satisfaction_rating), 2) AS satisfaccion_promedio
FROM supermercado
GROUP BY customer_type
ORDER BY ticket_promedio DESC;


-- ==========================================
-- 7. QUIÉN: TICKET PROMEDIO Y SATISFACCIÓN POR GÉNERO
-- Pregunta: ¿Cambian el ticket promedio y la satisfacción entre Female y Male?
-- ==========================================
SELECT
    gender,
    COUNT(invoice_id) AS numero_ventas,
    ROUND(AVG(total), 2) AS ticket_promedio,
    ROUND(AVG(customer_satisfaction_rating), 2) AS satisfaccion_promedio
FROM supermercado
GROUP BY gender
ORDER BY ticket_promedio DESC;