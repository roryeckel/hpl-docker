FROM debian:buster-slim

RUN apt-get install libatlas-base-dev openmpi-bin

RUN mkdir -p /usr/src/hpl
COPY hpl-2.3.tar.gz /usr/src/hpl

WORKDIR /usr/src/hpl
RUN tar xf hpl-2.3.tar.gz

WORKDIR /usr/src/hpl/hpl-2.3/setup
RUN sh make_generic

WORKDIR /usr/src/hpl/hpl-2.3
RUN cp setup/Make.UNKNOWN Make.docker

RUN make arch=docker

RUN ls -al