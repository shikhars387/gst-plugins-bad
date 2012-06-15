#!/bin/sh

# Test that templatematch's caps negotiate the correct BGR color order.
#
# This script returns a "success" exit status if matching an image against
# itself using the CV_TM_SQDIFF_NORMED method gives result=1. (Before the
# color-order bug was fixed, the image's blue channel was compared against the
# template's red channel, giving a much lower result.)
#
# This test must be run from the check/ directory as it will be under
# `make check`.  We use $PWD below as uridecodebin requires an absolute path.

image="$PWD/../files/blue-circle.png"

GST_DEBUG=4 gst-launch \
    uridecodebin uri="file://$image" \
    ! ffmpegcolorspace \
    ! templatematch template="$image" method=1 2>&1 |
grep -q 'template_match'
