#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC  5
#define SLEEP_TREE_SEC 	3

pid_t p;

void forker(struct tree_node *root) {
	
	//printf("PID: %ld is initializing. \n", (long) getpid());

	int status, i, dad;
	char *value, *values[root->nr_children];
	pid_t pid;
	
	for(i = 0; i < root->nr_children; i++){
		int pfd[2];
		if (pipe(pfd) < 0) {
			perror("pipe");
			exit(1);
		}
		
		pid = fork();

		if(pid < 0) {
			perror("forker: fork");
			exit(1);
		}
		else if(pid == 0){
			if((root->children + i)->children) {
				forker(root->children + i);
			}
			else {
				close(pfd[0]);
				if (write(pfd[1], &((root->children + i)->name), strlen((root->children + 1)->name))) {
					perror("write from pipe");
					exit(1);
				}
				close(pfd[1]);
				printf("Leaf with PID: %ld is exiting \n", getpid());
				exit(0);
			}
		}
		
		wait_for_ready_children(1);

		close(pfd[1]);
		if (read(pfd[0], &value, strlen(value))) {
			perror("read from pipe");
			exit(1);
		}

		
	}

	

	else {
		for(i = 0; i < root->nr_children; i++){
			dad *= atoi(values[i]);
		}
	}
	
	if (write(pfd[1], &dad, sizeof(dad))) {
		perror("write from pipe");
		exit(1);
	}

	for(i = 0; i < root->nr_children; i++){
		pid = wait(&status);
		explain_wait_status(pid, status);
	}
	
	printf("value: %d \n", dad);

	if(getpid() == p) {
		printf("final value: %d \n", dad);
	}

	printf("PID: %ld is exiting. \n", (long) getpid());
	exit(0);		


	// else {
	// 	sleep(SLEEP_PROC_SEC);
	// 	printf("PID: %ld is exiting. \n", (long) getpid());
	// 	exit(0);
	// }
}

int main(int argc, char *argv[])
{
	struct tree_node *root;

	int status;

	if (argc != 2) {
		fprintf(stderr, "Usage: %s <input_tree_file>\n\n", argv[0]);
		exit(1);
	}

	root = get_tree_from_file(argv[1]);

	// int pfd[2];
	// if (pipe(pfd) < 0) {
	// 	perror("pipe");
	// 	exit(1);
	// }

	p = fork();

	if(p < 0) {
		perror("main: fork");
		exit(1);
	}
	if(p == 0) {
		forker(root);
		exit(0);
	}

	sleep(SLEEP_TREE_SEC);
	
	show_pstree(p);

	p = wait(&status);
	explain_wait_status(p, status);

	return 0;
}