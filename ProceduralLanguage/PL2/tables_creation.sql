DROP TABLE IF EXISTS m_product_catalog CASCADE;
DROP TABLE IF EXISTS m_warehouses CASCADE; -- Bodegas
DROP TABLE IF EXISTS m_suppliers CASCADE;
DROP TABLE IF EXISTS t_inventory_movements CASCADE;

-- TABLAS MAESTRAS (Información de referencia)
CREATE TABLE m_suppliers (
 id SERIAL PRIMARY KEY,
 name TEXT NOT NULL,
 city TEXT
);

CREATE TABLE m_warehouses (
 id SERIAL PRIMARY KEY,
 location_code TEXT NOT NULL UNIQUE,
 max_capacity INTEGER
);

CREATE TABLE m_product_catalog (
 id SERIAL PRIMARY KEY,
 sku TEXT NOT NULL UNIQUE,
 product_name TEXT,
 category TEXT,
 unit_cost NUMERIC(12, 2) -- Costo unitario
);

-- TABLA TRANSACCIONAL (El movimiento masivo)
CREATE TABLE t_inventory_movements (
 id SERIAL PRIMARY KEY,
 product_id INTEGER REFERENCES m_product_catalog(id),
 warehouse_id INTEGER REFERENCES m_warehouses(id),
 supplier_id INTEGER REFERENCES m_suppliers(id),
 quantity INTEGER CHECK (quantity > 0),
 movement_type TEXT CHECK (movement_type IN ('IN', 'OUT')),
 registration_date TIMESTAMP DEFAULT NOW()
);
