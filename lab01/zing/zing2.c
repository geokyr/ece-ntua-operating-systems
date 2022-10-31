#include <stdio.h>
#include <unistd.h>

void zing(void) {
	char *s = getlogin();
	printf("Welcome, %s\n", s);
}
