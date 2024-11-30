DESCRIPTION = "Camera test application"
LICENSE = "CLOSED"

SRC_URI = " \
	file://view_camera.sh \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}/home/root
    install -m 0755 ${WORKDIR}/view_camera.sh ${D}/home/root
}

FILES_${PN} += "/home/root/view_camera.sh "
