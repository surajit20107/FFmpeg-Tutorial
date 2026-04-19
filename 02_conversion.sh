#!/bin/bash

# mp4 to mkv
ffmpeg -i input.mp4 -c copy output/output.mkv

# mp4 to webm
# IMPORTANT: -c copy can cause error here
ffmpeg -i input.mp4 output/output.webm
# or
ffmpeg -i input.mp4 -c:v libvpx-vp9 -c:a libopus output/output.webm


# mp4 to mp3 (extract audio)
# IMPORTANT: -c copy can cause error here
ffmpeg -i input.mp4 output/output.mp3
