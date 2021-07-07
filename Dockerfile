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
COPY .ssh /root
RUN chmod 0700 /root/.ssh/
RUN chmod 0600 /root/.ssh/authorized_keys
RUN echo "AuthenticationMethods publickey" >> /etc/ssh/sshd_config
EXPOSE 22

# Run
ENTRYPOINT [ "/usr/sbin/sshd", "-De" ]

