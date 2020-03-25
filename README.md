# VideOverInternet

Private video streaming via RTMP protocol

### Installation

Producer side : `sudo apt-get install ffmpeg`
RTMP server side : https://github.com/arut/nginx-rtmp-module/wiki/Getting-started-with-nginx-rtmp

### URL

`rtmp://<rtmp_server_address>/myapp/mystream`

### Conversion

- Standard command : `ffmpeg -i input.mkv -map 0:0 -map 0:2 -map 0:5 -c:v copy -c:0 libmp3lame -b:0 128k -c:s copy output.mkv`
- Convert to VP9 & OPUS : `ffmpeg -i input.mkv -map 0:0 -map 0:2 -map 0:5 -c:v libvpx-vp9 -c:a opus -strict -2 -b:0 96k -c:s copy output.mkv`

### Stream

- Standard command : `ffmpeg -re -i file.mkv -c:v libx264 -c:a libmp3lame -ar 44100 -ac 1 -f flv rtmp://XXX.XXX.XX.X/myapp/mystream`
- Stream with VP9 & OPUS in a WEBM container : `ffmpeg -re -i file.mkv -c:v libvpx-vp9 -c:a opus -strict -2 -b:0 96k -f webm rtmp://XXX.XXX.XX.X/myapp/mystream`
- "Most optimised" streaming : `ffmpeg -re -i file.mkv -c:v libx264 -b:v 1600k -preset slow -b 1500k -c:a libmp3lame -ar 44100 -ac 2 -s 1280x720 -f flv rtmp://XXX.XXX.XX.X/myapp/mystream`
- Command to select the audio track : `ffmpeg -re -i file.mkv -c:v libx264 -b:v 1600k -preset slow -b 1500k -c:a libmp3lame -ar 44100 -ac 2 -s 1280x720 -vf subtitles=file.mkv -map 0:v:0 -map 0:a:1 -f flv rtmp://XXX.XXX.XX.X/myapp/mystream`

**NOTE**: if the EN track is the third track of the file but the second audio track, you need to set the `map` value to `0:a:1` because the counter starts at 0.

**NOTE 2**: remove `-vf subtitles=file.mkv` if your file does not have subtitles.

### TODO

- Select one particular subtitles track
