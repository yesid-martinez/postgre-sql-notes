DO $$
    DECLARE
        searched_plate text;
    BEGIN
        SELECT vehicle_plate INTO searched_plate FROM traffic_telemetry LIMIT 1 OFFSET 1000001;

        RAISE NOTICE 'Plate number: %', searched_plate;
END $$
