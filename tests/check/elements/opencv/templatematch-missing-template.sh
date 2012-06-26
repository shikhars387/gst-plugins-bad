#!/bin/sh

# Test that templatematch produces an error if the requested template cannot be
# loaded.

GST_DEBUG=2 gst-launch \
    videotestsrc \
    ! ffmpegcolorspace \
    ! templatematch template="non-existent.png" method=1 2>&1 |
grep -q 'OpenCV failed to load template image'
