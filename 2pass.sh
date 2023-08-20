#!/bin/bash

echo -e "\n ╭────────╮\n  starting\n   FFmpeg   \n ╰────────╯\n"
ffmpeg -y -i "$1" -fpsmax 25 -c:v libx264 -tune animation -preset medium -profile:v high -level 4.0 -b:v 100k -maxrate 400k -bufsize 800k -vf "scale=w=if(gte(iw\,ih)\,min(iw\,320)\,-2):h=if(lt(iw\,ih)\,min(ih\,320)\,-2)" -pass 1 -an -f mp4 /dev/null

echo -e "\n ╭──────╮\n  PASS 2  \n ╰──────╯\n"
ffmpeg -y -i "$1" -fpsmax 25 -c:v libx264 -tune animation -preset medium -profile:v high -level 4.0 -b:v 100k -maxrate 400k -bufsize 800k -vf "scale=w=if(gte(iw\,ih)\,min(iw\,320)\,-2):h=if(lt(iw\,ih)\,min(ih\,320)\,-2)" -pass 2 -map_metadata -1 -movflags +faststart -c:a libfdk_aac -profile:a aac_he_v2 -ac 2 -b:a 32k "$2"

# Checking if Android/Termux is being used, if yes then the file will be scanned into the media library
if [[ $(uname -o) == Android ]]; then
    am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d "file://$(realpath "$2")"
fi

# Deleting the two unnecessary files, ffmpeg2pass-0.log and ffmpeg2pass-0.log.mbtree
rm ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree
