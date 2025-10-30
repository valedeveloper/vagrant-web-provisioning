#!/usr/bin/env bash
set -e

# 1) Instalar PostgreSQL (si no está)
sudo apt-get update -y
sudo apt-get install -y postgresql postgresql-contrib

# 2) Asegurar servicio
sudo systemctl enable postgresql
sudo systemctl start postgresql

# 3) Crear rol si no existe
ROLE_EXISTS=$(sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='webuser'")
if [ "$ROLE_EXISTS" != "1" ]; then
  sudo -u postgres psql -c "CREATE ROLE webuser LOGIN PASSWORD 'webpass123';"
fi

# 4) Crear base de datos si no existe (NO dentro de DO/tx)
DB_EXISTS=$(sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='empresa'")
if [ "$DB_EXISTS" != "1" ]; then
  sudo -u postgres createdb -E UTF8 -O webuser empresa
fi

# 5) Crear tabla y seed si corresponde
sudo -u postgres psql -d empresa <<'SQL'
CREATE TABLE IF NOT EXISTS empleados (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  cargo  TEXT NOT NULL
);

INSERT INTO empleados (nombre, cargo)
SELECT * FROM (VALUES
  ('Ana Pérez', 'Desarrolladora'),
  ('Luis Gómez', 'Analista'),
  ('Carla Ruiz', 'QA')
) AS v(nombre, cargo)
WHERE NOT EXISTS (SELECT 1 FROM empleados);
SQL
