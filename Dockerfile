FROM alpine:latest
WORKDIR /app
COPY entry.sh .
RUN chmod +x entry.sh
ENTRYPOINT [ "./entrypoint.sh" ]
