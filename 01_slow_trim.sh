#!/bin/bash

# trim exactly provided seconds from the beginning of the video
# pros: trim exactly provided seconds in my case 10 seconds
# cons: slow, takes a lot of time
# -ss 10: start the video at 10 seconds
ffmpeg -i input.mp4 -ss 10 slow_trim.mp4
