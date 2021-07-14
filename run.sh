#!/bin/bash

mkdir -p /root/.ssh/
chmod 0700 /root/.ssh/

touch /root/.ssh/authorized_keys
touch /root/.ssh/known_hosts
chmod 0600 /root/.ssh/*

ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ""
cat /root/.ssh/id_rsa.pub
echo "${AUTHORIZED_KEYS}" > /root/.ssh/authorized_keys
echo "${KNOWN_HOSTS}" > /root/.ssh/known_hosts

/usr/sbin/sshd -De
