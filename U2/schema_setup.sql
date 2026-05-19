DROP TABLE IF EXISTS traffic_telemetry;
DROP TABLE IF EXISTS roads;
DROP TABLE IF EXISTS operators;
DROP TABLE IF EXISTS sensor_models;

-- MASTER INFRASTRUCTURE (Strong Entities)
CREATE TABLE roads (
  id SERIAL PRIMARY KEY,
  road_name TEXT NOT NULL,
  speed_limit INTEGER
);

CREATE TABLE operators (
  id SERIAL PRIMARY KEY,
  company_name TEXT NOT NULL
);
  
CREATE TABLE sensor_models (
  id SERIAL PRIMARY KEY,
  technology TEXT NOT NULL
);

-- EVENT INFRASTRUCTURE (Weak Entity - 2 Million Rows)
CREATE TABLE traffic_telemetry (
  id BIGSERIAL PRIMARY KEY,
  road_id INTEGER REFERENCES roads(id),
  operator_id INTEGER REFERENCES operators(id),
  model_id INTEGER REFERENCES sensor_models(id),
  vehicle_plate TEXT NOT NULL,
  detected_speed NUMERIC(5,2),
  timestamp_recorded TIMESTAMP DEFAULT NOW()
);
