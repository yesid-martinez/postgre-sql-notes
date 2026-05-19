INSERT INTO m_suppliers (name, city)
SELECT 
    'Supplier-' || i,
    (ARRAY['Bogota', 'Medellin', 'Cali', 'Barranquilla'])[floor(random()*4 + 1)]
FROM generate_series(1, 100) s(i);
