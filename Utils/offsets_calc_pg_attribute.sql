SELECT atttypid::regtype, attlen, attnum FROM pg_attribute WHERE attrelid = 'industrial_sensors'::regclass AND attname = 'time_stmp';
