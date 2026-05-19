DO $$ 
  DECLARE
    total bigint;
  BEGIN
    -- SELECT SUM(price * stock) INTO v_result FROM logistics_products GROUP BY category HAVING category = 'Automotive'; -- Menoso eficiente que WHERE directo. 
    SELECT SUM(price * stock) INTO total FROM logistics_products WHERE category = 'Automotive';
    
    DROP TABLE IF EXISTS result_view;
    CREATE TEMP TABLE result_view AS SELECT total;
END $$ LANGUAGE plpgsql;

SELECT * FROM result_view;
