INSERT INTO logistics_products (name, category, price, stock, metadata)
SELECT 
  'SKU-' || n,
  
  -- Postgre inicia en 1 -> SELECT (ARRAY['A', 'B'])[1]; = A
  (ARRAY['Electronics', 'Home', 'Hardware', 'Automotive', 'Health'])[floor(random() * 5 + 1)],
  -- Crea array en memoria
  -- Genera num. randomico [1, 6) y convierte a entero (floor) [1, 5]
  -- Indexa el array: array[index] - Selecciona aleatoriamente una categoría.

  (random() * 1000 + 10)::NUMERIC(12,2),
  -- [10, 1010]

  floor(random() * 500),
  
  -- Función nativa de PostgreSQL; Retorna tipo JSONB 
  -- Espacio flexible (metadata)
  jsonb_build_object(
    'lot', floor(random() * 1000),
    'priority', floor(random() * 3)
  )
FROM generate_series(1, 100000) t(n); 
-- Llena las páginas físicas de 8KB secuencialmente
-- emitiendo una sola instrucción lógica al CPU
