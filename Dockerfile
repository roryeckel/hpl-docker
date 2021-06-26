FROM debian:buster-slim

ARG ARCH

RUN mkdir -p /usr/src/hpl
COPY hpl-2.3.tar.gz /usr/src/hpl

WORKDIR /usr/src/hpl

RUN tar xf hpl-2.3.tar.gz

