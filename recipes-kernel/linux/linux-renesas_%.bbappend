FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

BRANCH = "${@oe.utils.conditional("USE_SAFE_RENDERING", "1", "rcar-5.1.4.rc3/saferendering.rc9", "v5.10.41/rcar-5.1.4.2", d)}"
SRCREV = "${@oe.utils.conditional("USE_SAFE_RENDERING", "1", \
    "e2037726e5f6c3d6de6bc7d78b50ea9e2248a00d", \
    "452163c75612e4161099c0bf5178fd0cf60e2cad", d)}"

SRC_URI_append = " \
    file://0001-Merge-hihope-dtsi-from-RZ-Yocto.patch \
    file://0001-enable-sdhd3-ipmmu.patch \
    file://gpio.cfg \
    file://cryptocell.cfg \
"


# Install regulatory database firmware to rootfs
REGULATORY_DB = "https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/plain/regulatory.db?h=master-2019-06-03;md5sum=ce7cdefff7ba0223de999c9c18c2ff6f;downloadfilename=regulatory.db"
REGULATORY_DB_P7S = "https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/plain/regulatory.db.p7s?h=master-2019-06-03;md5sum=489924336479385e2c35c21d10eb3ca2;downloadfilename=regulatory.db.p7s"

# Install Bluetooth firmware to rootfs
BLUETOOTH_FW = " https://git.ti.com/cgit/wilink8-bt/ti-bt-firmware/plain/TIInit_11.8.32.bts;md5sum=665b7c25be21933acc30dda44cfcace6;downloadfilename=TIInit_11.8.32.bts"

SUPPORT_WIFIBT = " \
	${REGULATORY_DB} \
	${REGULATORY_DB_P7S} \
	${BLUETOOTH_FW} \
	file://wifi.cfg \
	file://bluetooth.cfg \
"
TEST_WIFIBT = "${@'1' if 'hihope_test_wifibt' in '${DISTRO_FEATURES}' else '0'}"
SRC_URI_append = " \
    ${@oe.utils.conditional("TEST_WIFIBT", "1", "${SUPPORT_WIFIBT}", "", d)} \
"


do_download_firmware_append () {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'hihope_test_wifibt', 'true', 'false', d)}; then
        install -d ${STAGING_KERNEL_DIR}/firmware
        install -m 755 ${WORKDIR}/regulatory* ${STAGING_KERNEL_DIR}/firmware
        install -d ${STAGING_KERNEL_DIR}/firmware/ti-connectivity
        install -m 755 ${WORKDIR}/TIInit_11.8.32.bts ${STAGING_KERNEL_DIR}/firmware/ti-connectivity
    fi
}

SUPPORT_AUDIO = " \
    file://0001-disable-pcm5102a.patch \
"

TEST_AUDIO = "${@'1' if 'hihope_test_audio' in '${DISTRO_FEATURES}' else '0'}"
SRC_URI_append = " \
    ${@oe.utils.conditional("TEST_AUDIO", "1", "${SUPPORT_AUDIO}", "", d)} \
"


SUPPORT_CAMERA = " \
	file://camera.cfg \
"

TEST_CAMERA = "${@'1' if 'hihope_test_camera' in '${DISTRO_FEATURES}' else '0'}"
SRC_URI_append = " \
    ${@oe.utils.conditional("TEST_CAMERA", "1", "${SUPPORT_CAMERA}", "", d)} \
"


SUPPORT_MSIOF = " \
	file://0001-enable-MSIOF0.patch\
	file://msiof.cfg \
"

TEST_MSIOF = "${@'1' if 'hihope_test_msiof' in '${DISTRO_FEATURES}' else '0'}"
SRC_URI_append = " \
    ${@oe.utils.conditional("TEST_MSIOF", "1", "${SUPPORT_MSIOF}", "", d)} \
"

SRC_URI_append = " \
    ${@oe.utils.conditional("USE_SAFE_RENDERING", "1", " file://0001-add-mfis-node.patch", "", d)} \
"

