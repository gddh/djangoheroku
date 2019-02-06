# pull official base image
FROM python:3.7-alpine

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /usr/src/djangoheroku

# install psycopg2
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && pip install psycopg2 \
    && apk del build-deps

# install dependencies
ADD requirements.txt /usr/src/djangoheroku/requirements.txt
RUN pip install -r /usr/src/djangoheroku/requirements.txt

# copy project
COPY . /usr/src/djangoheroku
