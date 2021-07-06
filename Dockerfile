FROM debian:buster-slim

# Install packages
RUN apt-get update && apt-get install -y build-essential libatlas-base-dev openmpi-bin openssh-server

# Copy HPL
RUN mkdir -p /usr/local/src/hpl
COPY hpl-2.3.tar.gz /usr/local/src/hpl
WORKDIR /usr/local/src/hpl
RUN tar xf hpl-2.3.tar.gz

# Make HPL
ARG DUMPMACHINE
WORKDIR /usr/local/src/hpl/hpl-2.3
COPY Make.docker /usr/local/src/hpl/hpl-2.3
RUN DUMPMACHINE=${DUMPMACHINE} && make arch=docker

# Setup SSH
RUN mkdir /var/run/sshd
EXPOSE 22

# Run
COPY run.sh /root
ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]