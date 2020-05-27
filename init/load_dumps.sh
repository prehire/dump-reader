#!/bin/bash
PG_USER=postgres
PG_PASS=password

set +e

for FILE in $(ls /var/db_dumps); do
    DB_NAME=${FILE%%.*}
    DB_NAME=${DB_NAME,,}
    PGPASSWORD=${PG_PASS} psql -U ${PG_USER} -c "DROP DATABASE IF EXISTS ${DB_NAME}"
    PGPASSWORD=${PG_PASS} psql -U ${PG_USER} -c "CREATE DATABASE ${DB_NAME}"
    DUMP_LOCATION="/var/db_dumps/${FILE}"
    PGPASSWORD=${PG_PASS} pg_restore -c --no-owner -d ${DB_NAME} ${DUMP_LOCATION} || true
    echo "FINISHED ${FILE}"
done