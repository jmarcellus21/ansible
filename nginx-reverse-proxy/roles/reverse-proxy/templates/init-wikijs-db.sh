#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER {{wikijs_db_user}};
    CREATE DATABASE {{wikijs_db_name}};
    GRANT ALL PRIVILEGES ON DATABASE {{wikijs_db_name}} TO {{wikijs_db_user}};
    ALTER USER {{wikijs_db_user}} PASSWORD '{{wikijs_db_passwd}}';
EOSQL