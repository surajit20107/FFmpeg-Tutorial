#!/bin/bash

# Accurate trimming (slow)
# -ss after -i → precise seeking (frame-accurate)
# FFmpeg decodes from the beginning until it reaches 10s → slower
# Use when you need exact frame cuts
ffmpeg -i input.mp4 -ss 10 output/slow_trim.mp4


# Fast trimming (may be slightly inaccurate)
# -ss before decoding + -c copy → fast seek (keyframe-based)
# Skips decoding → much faster, but cut may not be exactly at 10s
# Good for quick trimming without re-encoding
ffmpeg -i input.mp4 -ss 10 -c copy output/fast_trim.mp4


# Take first N seconds (accurate, slow)
# -t 10 → output duration will be 10 seconds from start
# Re-encodes the file → slower but accurate
# -loglevel info → shows normal logs (can reduce to 'error' for cleaner output)
ffmpeg -loglevel info -i input.mp4 -t 10 output/slow_trim.mp4


# Take first N seconds (fast, no re-encode)
# -t 10 → limit output to 10 seconds
# -c copy → stream copy (no encoding, very fast)
# Note: output may end slightly off due to keyframe boundaries
ffmpeg -loglevel info -i input.mp4 -t 10 -c copy output/fast_trim.mp4


# Start from first N seconds and go till N seconds
# slow method
ffmpeg -loglevel info -i input.mp4 -ss 5 -t 15 output/slow_trim.mp4

# fast method
ffmpeg -loglevel info -i input.mp4 -ss 5 -t 15 -c copy output/fast_trim.mp4
