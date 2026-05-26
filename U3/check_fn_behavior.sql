DO $$
    DECLARE
        test_result text;
    BEGIN
        test_result := fn_evaluate_infraction_severity(130.00, 80);
        RAISE NOTICE 'Resultado: %', test_result;
END $$
LANGUAGE plpgsql;
