#!/bin/bash
set -e

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL..."
until pg_isready -h "$DBHOST" -p 5432 -U "$DBUSER"; do
  sleep 1
done

echo "PostgreSQL is ready"

flask db upgrade 
flask run -h 0.0.0.0 -p 5000
