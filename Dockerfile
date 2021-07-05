FROM debian:buster-slim

RUN apt-get update && apt-get install -y build-essential libatlas-base-dev openmpi-bin openssh-server

RUN mkdir -p /usr/local/src/hpl
COPY hpl-2.3.tar.gz /usr/local/src/hpl

WORKDIR /usr/local/src/hpl
RUN tar xf hpl-2.3.tar.gz

#WORKDIR /usr/local/src/hpl/hpl-2.3/setup
#RUN sh make_generic

WORKDIR /usr/local/src/hpl/hpl-2.3
COPY Make.docker /usr/local/src/hpl/hpl-2.3

RUN make arch=docker dumpmachine=$(mpicc -dumpmachine)

RUN ls -al
