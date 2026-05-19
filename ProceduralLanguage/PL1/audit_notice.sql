-- Bloque anónimo: Ejecutado sin nombre
DO $$
  DECLARE
    v_student text := 'Yesid Martinez';
    v_sku text;
  BEGIN
    -- Captura de bits: Se copia el dato de la tabla a la variable en RAM​
    SELECT name INTO v_sku FROM logistics_products WHERE id = 100;
    -- Binding

    -- Auditoría: Enviamos al log de la sesión​
    RAISE NOTICE 'Ingeniero: % | Operación: Captura ID 100 | Valor: %', v_student,
    v_sku;

    -- Guardamos en estructura de sesión​ para visualización
    DROP TABLE IF EXISTS vista_resultado;

    CREATE TEMP TABLE result_view AS 
      SELECT v_student AS author, v_sku AS sku;
END $$ LANGUAGE plpgsql;

SELECT * FROM result_view;
