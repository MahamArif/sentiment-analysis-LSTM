FROM python:3.8-slim-buster

WORKDIR /app

RUN apt-get update && apt-get install -y git-lfs && git lfs install

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /model

COPY data.csv ./data.csv
COPY contractions.csv ./contractions.csv
COPY train.py ./train.py

CMD python -W ignore train.py