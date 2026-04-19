#!/bin/bash

# mp4 to mkv
ffmpeg -i input.mp4 -c copy output/output.mkv

# mp4 to webm
# IMPORTANT: -c copy can cause error here
ffmpeg -i input.mp4 output/output.webm
# ro
ffmpeg -i input.mp4 -c:v libvpx-vp9 -c:a libopus output/output.webm
