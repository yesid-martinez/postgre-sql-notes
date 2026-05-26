CREATE OR REPLACE FUNCTION fn_evaluate_infraction_severity(
    -- Speed physically captured by the sensor
    p_detected_speed numeric,
    -- Legal limit
    p_road_limit integer
) RETURNS text AS
$$
  DECLARE
      -- Private variable to store the calculation in memory
      excess numeric;
  BEGIN
      -- Business logic: Calculate the physical difference between reality and the law
      excess := p_detected_speed - p_road_limit;

      -- System branching: The engine decides the legal category based on the detected excess
      IF excess <= 0 THEN
          RETURN 'NO INFRACTION';

      ELSIF excess > 0 AND v_excess <= 20 THEN
          RETURN 'MINOR INFRACTION';

      ELSIF excess > 20 AND v_excess <= 50 THEN
          RETURN 'SERIOUS INFRACTION';
      ELSE
          RETURN 'CRITICAL INFRACTION';
      END IF;
  END;
$$
SECURITY DEFINER -- The function runs with the permissions of the function's creator, not the user who calls it.
LANGUAGE plpgsql;
