FROM python:3.8

RUN mkdir /app

COPY ./src app/src
COPY ./requirements.txt app/requirements.txt

WORKDIR app/
RUN pip install -U pip setuptools\
    && pip install -r requirements.txt

WORKDIR ./src
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 hello:app
