DROP TABLE IF EXISTS logistics_products; 
-- IF EXISTS evita error si la tabla no está creada.
-- Es idempotente → Es posible ejecutar el script múltiples veces.
-- Al ejectutar se elimina la entrada en el catálogo.

CREATE TABLE logistics_products ( -- Definición de estructura física (heap)
  id SERIAL PRIMARY KEY, -- SERIAL: Entero autoincremental basado en secuencia
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  price NUMERIC(12, 2) CHECK (price > 0), -- Decimal exacto - CHECK constraint para validación
  stock INTEGER DEFAULT 0,
  metadata JSONB -- Tipo binario de JSON
);  
