FROM ubuntu:bionic

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y build-essential libxml2-dev python3-dev python3-pip zlib1g-dev python3-requests python3-aiohttp && \
    python3 -m pip install --upgrade pip && \
    pip3 install cellxgene

ADD https://github.com/tvdbulck/cellxgene/blob/main/example-dataset/pbmc3k.h5ad /data/pbmc3k.h5ad

RUN echo "ls /data:"
RUN ls /data

#ENTRYPOINT ["cellxgene"]
ENTRYPOINT ["cellxgene", "launch", "--host", "0.0.0.0", "--port", "5005", "/data/pbmc3k.h5ad"]


