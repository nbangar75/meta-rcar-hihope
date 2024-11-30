DESCRIPTION = "WDT test application"
LICENSE = "CLOSED"

COMPATIBLE_MACHINE = "salvator-x"


SRC_URI = " \
    file://wdttest.c \
"

S = "${WORKDIR}"

do_compile() {
    ${CC} ${LDFLAGS} wdttest.c -o wdttest
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 wdttest ${D}${bindir}
}
