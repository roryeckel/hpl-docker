FROM debian:buster-slim

# Install packages
RUN apt-get update && apt-get install -y build-essential libatlas-base-dev openmpi-bin openssh-server wget

# Copy HPL
RUN mkdir -p /usr/local/src/hpl
WORKDIR /usr/local/src/hpl
RUN wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz && tar xf hpl-2.3.tar.gz

# Make HPL
WORKDIR /usr/local/src/hpl/hpl-2.3
COPY Make.docker /usr/local/src/hpl/hpl-2.3
RUN export DUMPMACHINE=$(mpicc -dumpmachine) && make arch=docker
RUN rm /usr/local/src/hpl/hpl-2.3/bin/docker/HPL.dat

# Setup SSH
RUN mkdir /var/run/sshd
RUN echo "AuthenticationMethods publickey" >> /etc/ssh/sshd_config
RUN echo "Port 2222" >> /etc/ssh/sshd_config
EXPOSE 2222

# Run
#ENTRYPOINT [ "/usr/sbin/sshd", "-De" ]
COPY run.sh /root
ENTRYPOINT [ "bash", "/root/run.sh" ]
