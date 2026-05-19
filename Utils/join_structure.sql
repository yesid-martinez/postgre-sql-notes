SELECT * FROM t_inventory_movements
JOIN m_suppliers ON t_inventory_movements.supplier_id = m_suppliers.id LIMIT 10;

--> Output:
-- id (m_suppliers)

--> 't_inventory_movements' columns without id
-- product_id (t_inventory_movements)
-- warehouse_id (t_inventory_movements)
-- supplier_id (t_inventory_movements)
-- quantity (t_inventory_movements)
-- movement_type (t_inventory_movements)
-- registration_date (t_inventory_movements)

--> 'm_suppliers' columns
-- name (m_suppliers)
-- city (m_suppliers)
