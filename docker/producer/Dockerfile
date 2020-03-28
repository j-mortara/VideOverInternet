FROM alpine:3.11
RUN apk add --no-cache ffmpeg
COPY run.sh run.sh
ENV SERVER_URL streaming_server
ENTRYPOINT ["sh", "run.sh"]