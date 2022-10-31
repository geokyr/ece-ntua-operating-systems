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
		//write to output file
        	wcnt = write(fd, buff + idx, len - idx);
                        
		if (wcnt == -1) {
                        perror("Can't write to output file.");
                        exit(1);
                }

                idx += wcnt;
        } while (idx < len);
}

void write_file(int fd, const char *infile){
	//open input file
	int fd1 = open(infile , O_RDONLY);
	if (fd1 == -1) {
		perror("Can't open given output file.");
		exit(1);
        }

	ssize_t rcnt;
	int buffsize = 1024;	

	for(;;) {
		//malloc buffsize characters
		char *buff = (char *)malloc(buffsize*sizeof(char));
        	if(!buff) {
                	perror("Failed to allocate memory.");
                	exit(1);
        	}
		
		//read at most buffsize-1 characters from input file
		rcnt = read(fd1, buff, buffsize-1);
		//if end of file is read
		if (rcnt == 0) {
			break; 
		} else if (rcnt == -1){ 
			perror("Can't read given input file.");
			exit(1);
		}
		
		//if less than buffsize-1 characters are read, realloc less memory
		if(rcnt+1 != buffsize) {
			buff = realloc(buff, rcnt*sizeof(char));

			if(!buff) {
				perror("Failed to reallocate memory.");
				exit(1);
			}
		}
		
		doWrite(fd, buff, strlen(buff));
		free(buff);
	}
	close(fd1);
}

int main(int argc, char **argv) {
	
	//check for valid number of arguments
	if( argc < 3 || argc > 4 ){
		printf("Usage: ./fconc infile1 infile2 [outfile (default:fconc.out)].");
		exit(1);
	}
	
	int fd, oflags, mode;
	oflags = O_CREAT | O_WRONLY | O_TRUNC;
        mode = S_IRUSR | S_IWUSR;

	//select output file depending on if its given
	char * outputFile = "fconc.out";
	if(argc == 4) {
		outputFile = argv[3];
	}

	//open output file
	fd = open(outputFile, oflags, mode);
	if (fd == -1) {
		perror("Can't open output file.");
		exit(1);
	}	

	write_file(fd, argv[1]);
	write_file(fd, argv[2]);
	
 	close(fd);
	return 0;
}
