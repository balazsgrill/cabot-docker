FROM python:2.7-slim

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y git build-essential python-dev libsasl2-dev libldap2-dev libpq-dev
RUN pip install fabric
RUN git clone https://github.com/arachnys/cabot.git

WORKDIR cabot

RUN fab provision
RUN fab deploy

EXPOSE 5001
CMD python manage.py runserver 0.0.0.0:5001
