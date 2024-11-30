DESCRIPTION = "Download and install the Big Buck Bunny movie"
LICENSE = "CLOSED"

SRC_URI = " \
	https://mirrors.kodi.tv/demo-files/BBB/bbb_sunflower_1080p_30fps_normal.mp4 \
	file://play_movie.sh \
"

SRC_URI[sha256sum] = "ae51005850b0ff757fe60c3dd7a12d754d3cd2397d87d939b55235e457f97658"


S = "${WORKDIR}"

do_install() {
    install -d ${D}/home/root
    install -m 0644 ${WORKDIR}/bbb_sunflower_1080p_30fps_normal.mp4 ${D}/home/root
    install -m 0755 ${WORKDIR}/play_movie.sh ${D}/home/root
}

FILES_${PN} += "/home/root/bbb_sunflower_1080p_30fps_normal.mp4"
FILES_${PN} += "/home/root/play_movie.sh "

PR = "r0"
