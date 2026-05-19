DO $$
  DECLARE
    v_student text := 'Yesid Martinez Gomez';
    v_pointer record; -- Generic pointer declaration
  BEGIN
    SELECT * INTO v_pointer FROM logistics_products WHERE id = 1234;
  
    RAISE NOTICE 'Auditoría: % | Acceso a SKU: %', v_student, v_pointer.name;
    
    DROP TABLE IF EXISTS visual_pointer;
    CREATE TEMP TABLE visual_pointer AS 
    SELECT v_student AS author, v_pointer.name AS sku, v_pointer.stock AS available;
END $$ LANGUAGE plpgsql;

SELECT * FROM visual_pointer;
