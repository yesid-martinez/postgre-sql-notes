INSERT INTO m_product_catalog (sku, product_name, category, unit_cost)
SELECT
    'SKU-' || i,
    'Specialized Product ' || i,
    (ARRAY['Electronics', 'Hardware', 'Home', 'Health'])[floor(random()*4 + 1)],
    (random()*500 + 10)::NUMERIC(12,2)
FROM generate_series(1, 1000) s(i);
