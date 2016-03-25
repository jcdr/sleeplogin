#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
	printf("OK\n");
	while (1) {
		sleep(UINT_MAX);
	}
	exit(0);
}
