# TP-Docker
The docker-compose.yml file defines a multi-container environment for a Flask web application with a PostgreSQL database.

## Problems to be corrected
`depends_on` does not guarantee that PostgreSQL is ready to accept connections

To build the docker compose:
    sudo docker-compose up
    