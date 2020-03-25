#!/bin/sh

video_file="/videos/$1"

ffmpeg -re -i "$video_file" -c:v libx264 -c:a libmp3lame -ar 44100 -ac 1 -f flv rtmp://streaming_server/myapp/mystream