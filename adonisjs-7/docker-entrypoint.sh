#!/bin/sh
set -e

echo "Running migrations..."
node ace migration:run --force

echo "Starting application..."
exec node bin/server.js
