INSERT INTO industrial_sensors (sensor_name, read_value)

SELECT 
  'Sensor_' || n,
  -- || = String concatenation operator in Postgre

  random() * 100 -- Devuelve un número pseudoaleatorio 0 -> 1 de tipo double precision

  -- generate_series(inicio, fin, paso)
FROM generate_series(1, 100000) -- Crea una serie de números del 1 al 100,000
      t(n); -- Asigna un alias a la tabla generada (t) y a la columna de salida (n)
-- Genera filas on-the-fly (streaming - en RAM) 
-- Es una de las herramientas más potentes del motor para generar datos en memoria, sin necesidad de tablas físicas.
-- No ocupa espacio en el catálogo de la base de datos.
