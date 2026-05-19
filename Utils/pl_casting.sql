DO $$
  DECLARE
    var_a integer:= 15;
    var_b integer:= 2;
    var_c text:= '30';
    v_result_int integer;
    v_result_decimal float;
    v_result_integer integer;
  BEGIN
    -- Without Force decimal
    v_result_int := var_a / var_b;
    -- Forcing decimal
    v_result_decimal := var_a::float / var_b;

    -- v_result_integer := var_c / var_b; -- Operator does not exist: text / integer  
    v_result_integer := var_c::integer / var_b;
    -- v_result_integer := (var_a * 2) / var_b; -- It works properly

    DROP TABLE IF EXISTS result;
    CREATE TEMP TABLE result AS SELECT v_result_int AS fInt, v_result_decimal AS decimal, v_result_integer AS sInt;
END $$ LANGUAGE plpgsql;

SELECT * FROM result;
