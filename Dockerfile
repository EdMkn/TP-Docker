FROM tiangolo/uwsgi-nginx-flask:python3.6
WORKDIR /app
RUN apt update && apt install postgresql -y

COPY . .
RUN pip install -r requirements.txt
RUN cp entrypoint.sh /docker-entrypoint.sh

USER postgres
RUN /etc/init.d/postgresql start &&\
psql --command "CREATE USER groupex with SUPERUSER PASSWORD 'groupeX';" &&\
createdb -O groupex groupex

USER root
EXPOSE 5000
ENV DBUSER=groupex
ENV DBPASS=groupex
ENV DBHOST=localhost
ENV DBNAME=groupex

ENV FLASK_APP=app.py
RUN chmod 750  /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
