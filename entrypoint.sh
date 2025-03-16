#!/bin/sh

echo "Setting correct permissions for SSH key..."
chmod 600 /root/.ssh/yakweide-tls-tunnel

# Ensure cleanup happens if the script is killed
trap 'echo "Script interrupted, restarting..."; sleep 2; exec "$0"' INT TERM HUP

while true; do
    echo "Starting the SSH tunnel..."
    
    # Run dbclient in a subshell and capture its exit status
    (
        exec dbclient -y -N -i /root/.ssh/yakweide-tls-tunnel \
            -R *:8123:10.0.0.2:8123 \
            -L 0.0.0.0:9001:localhost:9001 \
            -L 0.0.0.0:8085:localhost:8085 \
            -L 0.0.0.0:8384:localhost:8384 \
            -L 0.0.0.0:22000:localhost:22000 \
            -L 0.0.0.0:21027:localhost:21027 \
            root@142.132.234.128
    )
    
    EXIT_CODE=$?
    echo "SSH tunnel process has ended with exit code $EXIT_CODE."

    # If the exit code indicates failure, sleep before restarting
    echo "Restarting in 5 seconds..."
    sleep 5
done
