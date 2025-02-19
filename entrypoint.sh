#!/bin/sh

echo "Setting correct permissions for SSH key..."
# Ensure SSH key has correct permissions
chmod 600 /root/.ssh/yakweide-tls-tunnel

echo "Starting the SSH tunnel..."
sh -c "dbclient -y -N \
    -i /root/.ssh/yakweide-tls-tunnel \
    -R 8123:10.0.0.2:8123 \
    -L 9001:10.0.0.2:9001 \
    root@142.132.234.128"

echo "SSH tunnel process has ended."
