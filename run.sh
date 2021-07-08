#!/bin/bash

mkdir -p /root/.ssh/
chmod 0700 /root/.ssh/

touch /root/.ssh/authorized_keys
touch /root/.ssh/known_hosts
chmod 0600 /root/.ssh/*

echo "${AUTHORIZED_KEYS}" > /root/.ssh/authorized_keys
echo "${KNOWN_HOSTS}" > /root/.ssh/known_hosts

/usr/sbin/sshd -De
