FROM alpine:3.11
RUN apk add --no-cache ffmpeg
COPY run.sh run.sh
ENTRYPOINT ["sh", "run.sh"]