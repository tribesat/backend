#!/usr/bin/env python3.6
"""This module creates the database tables for tribesat
"""

import os
import psycopg2

DB_USER = os.environ.get("DB_USER", "postgres")
DB_NAME = os.environ.get("DB_NAME", "tribesat")

conn = psycopg2.connect("dbname={db_name} user={user}".format(db_name=DB_NAME, user=DB_USER))

cursor = conn.cursor()

cursor.execute("""
    CREATE TABLE temperature (
        id SERIAL PRIMARY KEY,
        timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        temperature DOUBLE PRECISION
    )
""")

conn.commit()

conn.close()

