FROM debian:buster-slim

# Install packages
RUN apt-get update && apt-get install -y build-essential libatlas-base-dev openmpi-bin openssh-server

# Copy HPL
RUN mkdir -p /usr/local/src/hpl
WORKDIR /usr/local/src/hpl
RUN wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz && tar xf hpl-2.3.tar.gz

# Make HPL
WORKDIR /usr/local/src/hpl/hpl-2.3
COPY Make.docker /usr/local/src/hpl/hpl-2.3
RUN DUMPMACHINE=$(mpicc -dumpmachine) && make arch=docker

# Setup SSH
RUN mkdir /var/run/sshd
RUN echo "AuthenticationMethods publickey" >> /etc/ssh/sshd_config
EXPOSE 22

# Run
#ENTRYPOINT [ "/usr/sbin/sshd", "-De" ]
COPY run.sh /root
ENTRYPOINT [ "bash", "/root/run.sh" ]
