#!/bin/bash

# Airflow needs a home. `~/airflow` is the default, but you can put it
# somewhere else if you prefer (optional)
export AIRFLOW_HOME=~/airflow

# Install Airflow using the constraints file
AIRFLOW_VERSION=2.5.1
PYTHON_VERSION="$(python3 --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
# For example: 3.7
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
# For example: https://raw.githubusercontent.com/apache/airflow/constraints-2.5.1/constraints-3.7.txt
pip install "apache-airflow[postgresql]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

#install library postgres to connect on sqlalchemy
pip install psycopg2-binary

#edit file airflow.cfg
sql_alchemy_conn = postgresql://airflow:airflow@localhost/airflow

#init database
airflow db init

#
# The Standalone command will initialise the database, make a user,
# and start all components for you.
airflow standalone

# Visit localhost:8080 in the browser and use the admin account details
# shown on the terminal to login.
# Enable the example_bash_operator dag in the home page
