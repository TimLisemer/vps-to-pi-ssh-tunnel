FROM alpine:latest

# Install OpenSSH client
RUN apk add --no-cache openssh

WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT [ "sh", "/app/entrypoint.sh" ]