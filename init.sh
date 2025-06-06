#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER"  --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER adex1 WITH PASSWORD 'adex1';
	CREATE USER adex2 WITH PASSWORD 'adex2';
	GRANT ALL ON DATABASE adex TO adex1;
	ALTER SCHEMA public OWNER TO adex1;
	GRANT USAGE ON SCHEMA public TO adex2;
  	GRANT SELECT ON ALL TABLES IN SCHEMA public TO adex2;
EOSQL
	# Grant privileges must be applied after connecting to the DB
psql -v ON_ERROR_STOP=1 --username "adex1" --dbname "$POSTGRES_DB" <<-EOSQL
	ALTER DEFAULT PRIVILEGES FOR ROLE adex1 IN SCHEMA public GRANT SELECT ON TABLES TO adex2;
EOSQL