FROM python:3.12.1-alpine3.18

LABEL maintainer="tuanhtr"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN pip install -r /tmp/requirements.txt &&\
    pip install -r /tmp/requirements.dev.txt &&\
    rm -rf /tmp &&\
    adduser -D -H django-user

USER django-user

