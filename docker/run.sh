#!/bin/bash

video_file="/videos/$1"

/usr/local/nginx/sbin/nginx &

ffmpeg -re -i "$video_file" -c:v libx264 -b:v 1600k -preset slow -b 1500k -c:a libmp3lame -ar 44100 -ac 2 -s 1280x720 -vf subtitles="$video_file" -map 0:v:0 -map 0:a:1 -f flv rtmp://localhost/myapp/mystream