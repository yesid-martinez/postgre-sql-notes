DO $$
  DECLARE
    r record;
    pid_value integer;
  BEGIN
    DROP TABLE IF EXISTS pl2_result;
    CREATE TEMP TABLE pl2_result(supplier_name text, quantity integer, pid integer);

    pid_value := pg_backend_pid(); -- Current sesion PID
    
    FOR r IN(
      SELECT s.name, i.quantity FROM t_inventory_movements i
      JOIN m_warehouses w ON i.warehouse_id = w.id
      JOIN m_suppliers s ON i.supplier_id = s.id
      WHERE w.location_code = 'BOD-5'
      ORDER BY quantity DESC
      LIMIT 10
    )
    LOOP
      INSERT INTO pl2_result VALUES (r.name, r.quantity, pid_value);
    END LOOP;
END $$ LANGUAGE plpgsql;

SELECT * FROM pl2_result;


--> set-based (faster)
-- SELECT s.name, i.quantity 
-- FROM t_inventory_movements i
-- JOIN m_warehouses w ON i.warehouse_id = w.id
-- JOIN m_suppliers s ON i.supplier_id = s.id
-- WHERE w.location_code = 'BOD-5'
-- ORDER BY quantity DESC
-- LIMIT 10;
