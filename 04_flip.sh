#!/bin/bash

# vertical flip (up-down ↕️)
# -vf: video filter
ffmpeg -i input.mp4 -vf "vflip" output/output.mp4

# horizontal flip (mirror effect ↔️)
# -vf: video filter
ffmpeg -i input.mp4 -vf "hflip" output/output.mp4
