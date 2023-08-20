# 2pass-encoding
This repository contains a Bash script that utilizes FFmpeg to perform optimized 2-pass video compression for Android with a bitrate of 100kbps, suitable for streaming platforms.

# Usage
1. Clone the repository or download the Bash script.
2. Compile FFmpeg with fdk-aac codec support. I have not included FFmpeg with fdk-aac codec support due to licensing issues. I recommend using the script available at https://github.com/markus-perl/ffmpeg-build-script.
3. Using this simple script is straightforward. Run the script by providing input and output file paths as arguments:
```
chmod +x 2pass.sh && ./2pass.sh input.mp4 output.mp4
```

# License
This project is licensed under the MIT License.

Feel free to use, modify, and distribute this script following the terms of the license.
