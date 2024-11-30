
# Installation for Wifi/Bluetooth packages
IMAGE_INSTALL_append = " \
    linux-firmware-ti-connectivity-license \
    linux-firmware-wl18xx \
    init-ifupdown \
    wlconf \
    init-wl18xx \
    iw \
    wpa-supplicant \
    kernel-module-wlcore-sdio \
    bt-fw \
    obexftp \
    bluez-alsa \
    audio-init \
"

IMAGE_INSTALL_append = " e2fsprogs"

IMAGE_INSTALL_append = " iperf3"

IMAGE_INSTALL_append = " spidev-test"

IMAGE_INSTALL_append = " linuxptp"

IMAGE_INSTALL_append = " uio-tp"

IMAGE_INSTALL_append = " wdt-tp"

IMAGE_INSTALL_append = " movie-tp"

IMAGE_INSTALL_append = " camera-tp"

IMAGE_INSTALL_append = " can-utils iproute2"

IMAGE_INSTALL_append = " linuxptp" 
