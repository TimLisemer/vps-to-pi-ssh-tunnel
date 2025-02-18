FROM alpine:latest

# Install OpenSSH client
RUN apk add --no-cache openssh

WORKDIR /app
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
