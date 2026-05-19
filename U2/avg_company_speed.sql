SELECT
    operators.company_name,
    SUM(traffic_telemetry.detected_speed)
FROM operators
JOIN traffic_telemetry ON traffic_telemetry.operator_id = operators.id
GROUP BY operators.company_name
-- REGEXP_REPLACE(string, pattern, replacement, flags)
-- [^0-9] Everything that is not a digit
-- g: global
ORDER BY CAST(REGEXP_REPLACE(operators.company_name, '[^0-9]', '', 'g') AS INTEGER);
