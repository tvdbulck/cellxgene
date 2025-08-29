FROM ubuntu:bionic

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y build-essential libxml2-dev python3-dev python3-pip zlib1g-dev python3-requests python3-aiohttp && \
    python3 -m pip install --upgrade pip && \
    pip3 install cellxgene

WORKDIR /
RUN echo "pwd:"
RUN pwd

RUN echo "ls:"
RUN ls

RUN echo "ls /run:"
RUN ls /run

RUN echo "ls /mnt:"
RUN ls /mnt

RUN echo "ls /home:"
RUN ls /home

#ENTRYPOINT ["cellxgene"]

#COPY /example-dataset /data
ENTRYPOINT ["launch", "--host", "0.0.0.0", "--port", "5005", "--no-browser", "/example-dataset/pbmc3k.h5ad"]

#ENTRYPOINT ["launch", "--host 0.0.0.0", "--port 5005", "--no-browser", "/example-dataset/pbmc3k.h5ad"]

