FROM debian:buster-slim

RUN apt-get install libatlas-base-dev libmpich2-dev gfortran

RUN mkdir -p /usr/src/hpl
COPY hpl-2.3.tar.gz /usr/src/hpl

WORKDIR /usr/src/hpl

RUN tar xf hpl-2.3.tar.gz

CMD ls -al