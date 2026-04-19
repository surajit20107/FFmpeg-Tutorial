#!/bin/bash

# METHOD 1: Accurate trimming (slow)
# -ss after -i → precise seeking (frame-accurate)
# FFmpeg decodes from the beginning until it reaches 10s → slower
# Use when you need exact frame cuts
ffmpeg -i input.mp4 -ss 10 output/slow_trim.mp4


# METHOD 2: Fast trimming (may be slightly inaccurate)
# -ss before decoding + -c copy → fast seek (keyframe-based)
# Skips decoding → much faster, but cut may not be exactly at 10s
# Good for quick trimming without re-encoding
ffmpeg -ss 10 -i input.mp4 -c copy output/fast_trim.mp4


# METHOD 3: Take first N seconds (accurate, slow)
# -t 10 → output duration will be 10 seconds from start
# Re-encodes the file → slower but accurate
# -loglevel info → shows normal logs (can reduce to 'error' for cleaner output)
ffmpeg -i input.mp4 -t 10 -loglevel info output/slow_trim.mp4


# METHOD 4: Take first N seconds (fast, no re-encode)
# -t 10 → limit output to 10 seconds
# -c copy → stream copy (no encoding, very fast)
# Note: output may end slightly off due to keyframe boundaries
ffmpeg -i input.mp4 -t 10 -c copy -loglevel info output/fast_trim.mp4
