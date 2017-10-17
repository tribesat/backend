#!/usr/bin/env bash

set -e -o pipefail

echo "
    DROP DATABASE IF EXISTS tribesat;
" | psql -U postgres

# create the database
echo "
    CREATE DATABASE tribesat;
" | psql -U postgres
