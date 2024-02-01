# Python 3.11 based
FROM continuumio/miniconda3:23.10.0-1

RUN apt update \
    && apt install -y \
        git \
        build-essential \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN conda install --override-channels -c conda-forge -y 'gdal==3.8.3'

WORKDIR /app

COPY requirements.txt requirements.txt
COPY requirements.dev.txt requirements.dev.txt
RUN cat requirements*.txt > requirements.all.txt && pip install -r requirements.all.txt

COPY ./ ./
