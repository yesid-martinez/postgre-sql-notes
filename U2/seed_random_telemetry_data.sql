INSERT INTO roads(road_name, speed_limit)
SELECT
  'Avenue-' || i,
  (ARRAY[30, 50, 60, 80])[floor(random()*4+1)]
FROM generate_series(1, 50) s(i);

INSERT INTO operators(company_name)
SELECT
  'Operator-' || i
FROM generate_series(1, 15) s(i);

INSERT INTO sensor_models (technology)
SELECT
  (ARRAY['LIDAR', 'LASER', 'HD-CAMERA'])[floor(random()*3+1)]
FROM generate_series(1, 30) s(i);

-- 2.000.000 entries 
INSERT INTO traffic_telemetry (
  road_id,
  operator_id,
  model_id,
  vehicle_plate,
  detected_speed
)
SELECT
  floor(random()*50 + 1),
  floor(random()*15 + 1),
  floor(random()*30 + 1),
  UPPER(substring(md5(random()::text), 1, 3)) || '-' || floor(random()*900+100),
  (random()*120 + 5)::NUMERIC(5,2)
FROM generate_series(1, 2000000) s(i);
