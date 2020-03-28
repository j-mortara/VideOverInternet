#!/bin/sh

video_file="/videos/$1"
server_url="rtmp://$SERVER_URL/myapp/mystream"

ffmpeg -re -i "$video_file" -c:v libx264 -c:a libmp3lame -ar 44100 -ac 1 -f flv $server_url