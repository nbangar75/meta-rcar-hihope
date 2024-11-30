DESCRIPTION = "UIO test application"
LICENSE = "CLOSED"

COMPATIBLE_MACHINE = "salvator-x"


SRC_URI = " \
    file://uiotest.c \
    file://renesas_uioctl.h \
"

S = "${WORKDIR}"

do_compile() {
    ${CC} ${LDFLAGS} uiotest.c -o uiotest
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 uiotest ${D}${bindir}
}
