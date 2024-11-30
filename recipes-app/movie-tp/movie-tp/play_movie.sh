#!/bin/sh

modprobe -a mmngr mmngrbuf vspm_if uvcs_drv

gst-launch-1.0 filesrc location=bbb_sunflower_1080p_30fps_normal.mp4 ! qtdemux ! queue ! h264parse ! omxh264dec ! waylandsink