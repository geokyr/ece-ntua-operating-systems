#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void doWrite(int fd, const char *buff, int len) {
        size_t idx = 0;
	ssize_t wcnt;

	do {
        	wcnt = write(fd, buff + idx, len - idx);
                        
		if (wcnt == -1) {
                        perror("Can't write to output file.");
                        exit(1);
                }

                idx += wcnt;
        } while (idx < len);
}

void write_file(int fd, const char *infile){
	int fd1 = open(infile , O_RDONLY);
	if (fd1 == -1) {
		perror("Can't open given output file.");
		exit(1);
        }

	char buff[1024];
	ssize_t rcnt;
	
	for(;;) {
		rcnt = read(fd1, buff, sizeof(buff) - 1);
		if (rcnt == 0) {
			break; 
		} else if (rcnt == -1){ 
			perror("Can't read given input file.");
			exit(1);
		}
		buff[rcnt] = '\0';
		doWrite(fd, buff, strlen(buff));
	}
	close(fd1);
}

int main(int argc, char **argv) {
	
	if( argc < 3 || argc > 4 ){
		printf("Usage: ./fconc infile1 infile2 [outfile (default:fconc.out)].");
		exit(1);
	}
	
	int fd, oflags, mode;
	oflags = O_CREAT | O_WRONLY | O_TRUNC;
        mode = S_IRUSR | S_IWUSR;

	if( argc == 3 ) {
		fd = open("fconc.out", oflags, mode);
		if (fd == -1) {
			perror("Can't open default output file.");
			exit(1);
		}	
	} else if( argc == 4 ) {
		fd = open(argv[3], oflags, mode);
		if (fd == -1) {
                        perror("Can't open given output file.");
                        exit(1);
                }
	}

	write_file(fd, argv[1]);
	write_file(fd, argv[2]);
	
 	close(fd);
	return 0;
}
