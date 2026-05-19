DO $$
  DECLARE
    record_item record; 
    BEGIN
      DROP TABLE IF EXISTS report;
      CREATE TEMP TABLE report(id integer, product text, value numeric);

      FOR record_item IN (
        SELECT id, name, price FROM logistics_products 
        ORDER BY price DESC LIMIT 3
      ) 
      LOOP -- It's executed for each row
        -- record_item = Current row
        RAISE NOTICE 'Iteración: Procesando % | Precio: %', record_item.name, record_item.price;
        INSERT INTO report VALUES(record_item.id, record_item.name, record_item.price);
      END LOOP;
END $$ LANGUAGE plpgsql;

SELECT * FROM report;
