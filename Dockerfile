FROM alpine:latest

# install openssh
RUN apk add --no-cache openssh

# copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
