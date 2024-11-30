#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <err.h>
#include <unistd.h> 
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <errno.h>
#include "renesas_uioctl.h"

void uio_test(char *devfile)
{
	int value = 0;
	int status;
	int fd;

	fd = open(devfile, O_RDWR);
	if (fd < 0) {
		printf("open(%s) error! fd=%d errno=%d\n", devfile, fd, errno);
		return;
	}
	status = ioctl(fd, UIO_PDRV_GET_PWR, &value);
	printf("open(%s); ioctl(fd=%d, UIO_PDRV_GET_PWR) ret=%d value=%d\n", devfile, fd, status, value);
}

int main(int argc, char *argv[])
{
	uio_test("/dev/uio0");
	uio_test("/dev/uio1");

	return 0;
}
