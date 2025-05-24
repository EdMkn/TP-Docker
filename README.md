# TP-Docker
The docker-compose2.yml file (version 3.9) defines a Docker architecture with two separate Flask applications (app1 and app2) that use the same PostgreSQL database.

## Potential problems:
`depends_on` Does not guarantee that PostgreSQL is ready

To launch the setup:
- docker-compose up

