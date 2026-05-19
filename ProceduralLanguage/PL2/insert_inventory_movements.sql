INSERT INTO t_inventory_movements (
    product_id,
    warehouse_id,
    supplier_id,
    quantity,
    movement_type
    -- Current date added by default
)
SELECT
    floor(random()*1000 + 1),
    floor(random()*20 + 1),
    floor(random()*100 + 1),
    floor(random()*100 + 1),
    (ARRAY['IN', 'OUT'])[floor(random()*2 + 1)]
FROM generate_series(1, 500000);
