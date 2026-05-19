# Database Configuration

El proyecto fue probado usando PostgreSQL con una configuración personalizada orientada a mejorar el rendimiento en consultas, ordenamientos y operaciones de mantenimiento.

### Hardware de referencia

- **RAM:** 16 GB

---

## `pg_hba.conf`

Configuración de autenticación local usando `scram-sha-256`.

```conf
# TYPE  DATABASE        USER            ADDRESS                 METHOD

local   all             all                                     scram-sha-256
host    all             all             127.0.0.1/32            scram-sha-256
host    all             all             ::1/128                 scram-sha-256

local   replication     all                                     peer
host    replication     all             127.0.0.1/32            scram-sha-256
host    replication     all             ::1/128                 scram-sha-256
```
> [!IMPORTANT]
> `scram-sha-256` reemplaza mecanismos antiguos como `md5` y proporciona una autenticación más robusta.

## `postgresql.conf`

```
- shared_buffers = 4GB
- work_mem = 16MB
- maintenance_work_mem = 512MB
```

> - shared_buffers:	Memoria principal usada por PostgreSQL como caché
> - work_mem:	Memoria usada por operaciones de SORT y HASH por consulta
> - Maintenance_work_mem: Memoria usada para VACUUM, CREATE INDEX y tareas de mantenimiento

## Verificación de configuración

> [!IMPORTANT]
> Verificar que los parámetros estén aplicados correctamente usando:

```
SHOW shared_buffers;

SHOW work_mem;

SHOW maintenance_work_mem;
```

> [!CAUTION]
> 1. Algunos cambios requieren reiniciar el servicio para aplicarse.
>
> 2. work_mem se aplica por operación y por conexión, por lo que valores excesivos pueden incrementar significativamente el consumo total de memoria.
