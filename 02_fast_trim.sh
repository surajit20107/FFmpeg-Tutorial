#!/bin/bash

# trim nearly provided seconds from the beginning of the video. means it will trim near around 10 seconds not exactly
# pros: trim exactly provided seconds in my case 10 seconds
# cons: slow, takes a lot of time
# -c copy: copy the video and audio streams without re-encoding
# -ss 10: start the video at 10 seconds
ffmpeg -i ./input.mp4 -ss 10 -c copy fast_trim.mp4
