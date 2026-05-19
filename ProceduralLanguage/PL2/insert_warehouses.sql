INSERT INTO m_warehouses (location_code, max_capacity)
SELECT 
    'BOD-' || i,
    floor(random()*10000 + 5000)
FROM generate_series(1, 20) s(i);
