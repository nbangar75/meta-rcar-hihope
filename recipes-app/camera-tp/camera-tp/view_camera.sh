#!/bin/sh

modprobe -a mmngr mmngrbuf vspm_if uvcs_drv

media-ctl -d /dev/media0 -r
media-ctl -d /dev/media0 -l "'rcar_csi2 fea80000.csi2':1 -> 'VIN4 output':0 [1]"
media-ctl -d /dev/media0 -V "'rcar_csi2 fea80000.csi2':1 [fmt:UYVY8_2X8/1920x1080 field:none]"
media-ctl -d /dev/media0 -V "'ov5645 2-003c':0 [fmt:UYVY8_2X8/1920x1080 field:none]"

gst-launch-1.0 v4l2src device=/dev/video4 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! vspfilter ! video/x-raw,format=BGRA ! waylandsink
