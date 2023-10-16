#!/bin/bash
set -e

flask db upgrade 
flask run -h 0.0.0.0 -p 5000

export DBUSER=groupeX
export DBPASS=groupeX
export DBHOST=groupeX
export DBNAME=groupeX
