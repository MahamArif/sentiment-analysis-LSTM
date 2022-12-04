FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /model

COPY data.csv ./data.csv
COPY contractions.csv ./contractions.csv
COPY train.py ./train.py

CMD python -W ignore train.py