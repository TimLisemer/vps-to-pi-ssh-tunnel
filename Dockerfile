FROM alpine:latest

# Set working directory
WORKDIR /app

# Install OpenSSH client
RUN apk add --no-cache openssh

# Copy the entrypoint script
COPY entrypoint.sh .

# Ensure the script has executable permissions
RUN chmod +x entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["sh", "./entrypoint.sh"]
