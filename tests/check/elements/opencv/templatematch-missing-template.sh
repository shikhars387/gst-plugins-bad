#!/bin/sh

# Test that templatematch produces an error if the requested template cannot be
# loaded.
#
# This test must be run from the check/ directory as it will be under
# `make check`.  We use $PWD below as uridecodebin requires an absolute path.

image="$PWD/../files/blue-circle.png"

GST_DEBUG=2 gst-launch \
    videotestsrc \
    ! ffmpegcolorspace \
    ! templatematch template="non-existent.png" method=1 2>&1 |
grep -q 'OpenCV failed to load template image'
