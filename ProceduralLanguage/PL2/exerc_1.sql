SELECT
  SUM(p.unit_cost * i.quantity) AS total_acquisition_cost
FROM t_inventory_movements i
JOIN m_product_catalog p
  ON i.product_id = p.id
WHERE movement_type = 'IN'
  AND category = 'Electronics'; 
