#!/usr/bin/env bash

# FYI - this will wipe out my.db

cd sql
sqlite3 ../my.db < test.sql

