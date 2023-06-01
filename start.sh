#!/bin/sh

set -e

echo "run db migration"
echo "$DB_SOURCE"
/app/migrate -path /app/db/migration -database "$DB_SOURCE" -verbose up

echo "start the app"
exec "$@"