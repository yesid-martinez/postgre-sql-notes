CREATE TABLE industrial_sensors (
  id SERIAL PRIMARY KEY, -- Serial: Auto-incremental integer
  sensor_name TEXT,
  read_value FLOAT,
  time_stmp TIMESTAMP DEFAULT NOW() -- CURRENT_TIMESTAMP
);
