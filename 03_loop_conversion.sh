#!/bin/bash

# copy the input file for having multiple videos
cp input.mp4 input-1.mp4
cp input.mp4 input-2.mp4

# for multiple files using loop (current directory)
for f in *.mp4
do
    ffmpeg -hide_banner -loglevel info -i "$f" -c copy "output/${f%.mp4}.mkv"
done

# remove the copied files for keeping the working dir clean
rm input-1.mp4
rm input-2.mp4
