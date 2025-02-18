FROM alpine:latest
WORKDIR /app
COPY entry.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
