FROM python:2.7-slim

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
        python-dev \
        libsasl2-dev \
        libldap2-dev \
        libpq-dev \
        git \
        npm && apt-get clean

RUN git clone https://github.com/arachnys/cabot.git

WORKDIR cabot

RUN npm install -g \
        --registry http://registry.npmjs.org/ \
        coffee-script \
        less@1.3

RUN ln -s `which nodejs` /usr/bin/node

RUN python setup.py install

CMD python manage.py runserver 0.0.0.0:5001
