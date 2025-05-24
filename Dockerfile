FROM tiangolo/uwsgi-nginx-flask:python3.6
WORKDIR /app
RUN apt update && apt install postgresql -y

COPY . .
RUN pip install -r requirements.txt
RUN cp entrypoint.sh /docker-entrypoint.sh


USER root
EXPOSE 5000
ENV FLASK_APP=app.py
RUN chmod 750 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

