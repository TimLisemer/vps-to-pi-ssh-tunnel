#!/bin/bash

# Ensure SSH key has correct permissions
chmod 600 /root/.ssh/yakweide-tls-tunnel

# Start the SSH tunnel
bash -c "ssh -N \
    -i /root/.ssh/yakweide-tls-tunnel \
    -o ServerAliveInterval=60 \
    -o ExitOnForwardFailure=yes \
    -R 8123:localhost:8123 \
    -L 9001:localhost:9001 \
    root@142.132.234.128"