DO $$ 
  DECLARE
  average numeric;
  BEGIN
    SELECT ROUND(AVG(price), 2) INTO average FROM logistics_products WHERE category = 'Hardware';

    DROP TABLE IF EXISTS pl3_result;
    CREATE TEMP TABLE pl3_result AS SELECT average;
END $$ LANGUAGE plpgsql;

SELECT * from pl3_result;
