#!/bin/sh

echo "setting correct permissions for ssh key..."
chmod 600 /root/.ssh/yakweide-tls-tunnel

echo "starting the ssh tunnel..."
dbclient -y -N \
    -i /root/.ssh/yakweide-tls-tunnel \
    -R 0.0.0.0:8123:10.0.0.2:8123 \
    -L 9001:10.0.0.2:9001 \
    root@142.132.234.128

echo "ssh tunnel process has ended."
