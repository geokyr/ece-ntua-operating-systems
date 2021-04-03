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

//int pida;

void forker(struct tree_node *root) {
	
	change_pname(root->name);
	printf("%s is initializing with PID: %ld  \n", root->name, (long) getpid());

	int pfd[2];
	if (pipe(pfd) < 0) {
		perror("pipe");
		exit(1);
	}

	if(root->children) {
		int status, i, value, dad, values[root->nr_children];
		pid_t pid;
		
		for(i = 0; i < root->nr_children; i++){
			pid = fork();

			if(pid < 0) {
				perror("forker: fork");
				exit(1);
			}
			else if(pid == 0){
				forker(root->children + i);
			}
			
			if (read(pfd[0], &value, sizeof(value))) {
				perror("read from pipe");
				exit(1);
			}
			values[i] = value;
		}

		if(root->name == '+'){
			for(i = 0; i < root->nr_children; i++){
				dad += values[i];
			}
		}

		else {
			for(i = 0; i < root->nr_children; i++){
				dad *= values[i];
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

		// if(getpid() == pida) {
		// 	printf("final value: %d \n", dad);
		// }

		printf("%s is exiting with PID: %ld  \n", root->name, (long) getpid());
		exit(0);		
	}
	
	else {
		int value = atoi(root->name);
		close(pfd[0]);

		if (write(pfd[1], &value, sizeof(value))) {
			perror("write from pipe");
			exit(1);
		}

		sleep(SLEEP_PROC_SEC);
		printf("%s is exiting with PID: %ld  \n", root->name, (long) getpid());
		exit(0);
	}
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

	pid_t p;
	
	int pfd[2];
	if (pipe(pfd) < 0) {
		perror("pipe");
		exit(1);
	}

	p = fork();

	if(p < 0) {
		perror("main: fork");
		exit(1);
	}
	if(p == 0) {
		forker(root);
		exit(0);
	}

	//pida = p;	

	sleep(SLEEP_TREE_SEC);
	
	show_pstree(p);

	p = wait(&status);
	explain_wait_status(p, status);

	return 0;
}


/* 1. Initialization messages are printed by breadth, meaning that all processes of current level (A) 
* print the initialization message before the ones in the next level (B, C, D) and the final initialization
* messages are the ones of the final level (E, F). 
* 
* Exit messages have a similar principle. More specifically, the first exit messages are printed from the 
* lowest level leaf processes (C, D), then the leafs of the higher level (E, F). Afterwards, B, the 
* father of E and F, exits through the wait_for_ready_children() function. Finally, A, whose all children
* processes are terminated, exits in a similar way.
*/