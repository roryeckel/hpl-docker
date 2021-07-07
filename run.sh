#!/bin/bash

cat /root/.ssh/authorized_keys
/usr/sbin/sshd -De
