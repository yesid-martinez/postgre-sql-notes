-- El procesamiento ocurre íntegramente en el servidor, lo cual elimina la
-- latencia de red al evitar el transporte de grandes volúmenes de datos hacia el cliente.
DO $$
    DECLARE
        v_target_sku text := 'SKU-750';
        v_unit_cost numeric;
        v_total_units integer;
        v_total_amount numeric;
    BEGIN
        SELECT unit_cost INTO v_unit_cost FROM m_product_catalog WHERE sku = v_target_sku;
        
        SELECT SUM(quantity) INTO v_total_units FROM t_inventory_movements
            WHERE product_id = (
                SELECT id 
                FROM m_product_catalog 
                WHERE sku = v_target_sku
            );
            
        v_total_amount := v_unit_cost * v_total_units;

        DROP TABLE IF EXISTS financial_report;
        CREATE TEMP TABLE financial_report AS
        SELECT v_target_sku AS sku, v_total_amount AS total_investment;

        RAISE NOTICE 'Calculation completed for product %', v_target_sku;
END $$ LANGUAGE plpgsql;

SELECT * FROM financial_report;
