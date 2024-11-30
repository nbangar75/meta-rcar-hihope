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

void wdt_test(char *devfile)
{
	int fd;

	fd = open(devfile, O_RDWR);
	if (fd < 0) {
		printf("open(%s) error! fd=%d errno=%d\n", devfile, fd, errno);
		return;
	}
	printf("open(%s); fd=%d\n", devfile, fd);
}

int main(int argc, char *argv[])
{
	wdt_test("/dev/watchdog");

	return 0;
}
