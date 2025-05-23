# TP-Docker
This Dockerfile builds an environment for a Flask application with :
- uWSGI + Nginx to serve the web app.
- PostgreSQL installed locally in the container.
- A PostgreSQL database and user created at build time.

Potential problems:
- PostgreSQL will not survive a restart of the container, as it is initialised at build time (and not at startup).
- Using PostgreSQL in the same container as the web app is bad practice.
- The plaintext password in the image is not very secure.

In order to build the docker image:
- docker build . -t name_of_your_image
In order to run the docker image in a container
- docker run --name optional_name_container name_of_your_image
