DO $$ 
  DECLARE
    products_result record;
    -- v_name text;
    -- v_stock integer;
  BEGIN
    DROP TABLE IF EXISTS pl2_result;
    CREATE TEMP TABLE pl2_result(product_name text, stock integer, category text);

    FOR products_result IN(
      SELECT name, stock, category FROM logistics_products WHERE category = 'Health' ORDER BY stock LIMIT 5
    )
    LOOP
      INSERT INTO pl2_result VALUES(products_result.name, products_result.stock, products_result.category);
    END LOOP;
END $$ LANGUAGE plpgsql;

SELECT * FROM pl2_result;
