FROM debian:buster-slim

RUN apt-get install libatlas-base-dev openmpi-bin

RUN mkdir -p /usr/local/src/hpl
COPY hpl-2.3.tar.gz /usr/local/src/hpl

WORKDIR /usr/local/src/hpl
RUN tar xf hpl-2.3.tar.gz

WORKDIR /usr/local/src/hpl/hpl-2.3/setup
RUN sh make_generic

WORKDIR /usr/local/src/hpl/hpl-2.3
RUN cp setup/Make.UNKNOWN Make.docker

RUN make arch=docker

RUN ls -al
