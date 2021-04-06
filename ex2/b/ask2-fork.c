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

void forker(struct tree_node *root) {
	
	change_pname(root->name);
	printf("%s is initializing with PID: %ld  \n", root->name, (long) getpid());

	if(root->children) {
		int status;
		pid_t pid;
		int i;

		for(i = 0; i < root->nr_children; i++){
			pid = fork();

			if(pid < 0) {
				perror("forker: fork");
				exit(1);
			}
			else if(pid == 0){
				/* Child calls the function recursively*/
				forker(root->children + i);
			}
		}
		/* Parent waits for all its children */
		for(i = 0; i < root->nr_children; i++){
			pid = wait(&status);
			explain_wait_status(pid, status);
		}
		/* Then exit */
		exit(0);	
	}
	
	else {
		/* Leaves sleep for 5 seconds then exit */
		sleep(SLEEP_PROC_SEC);
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
	/* Fork root of process tree */
	p = fork();
	
	if(p < 0) {
		perror("main: fork");
		exit(1);
	}
	if(p == 0) {
		/* Root of given tree */
		forker(root);
		exit(0);
	}
	
	sleep(SLEEP_TREE_SEC);

	/* Print the process tree root at pid */	
	show_pstree(p);

	/* Wait for the root of the process tree to terminate */
	p = wait(&status);
	explain_wait_status(p, status);

	return 0;
}


/* 1. Processes are created by breadth, showcased by their PIDs, but initialization messages are not always
* printed by breadth, since its random depending on the order the kernel executes the processes. By breadth 
* means that all processes of current level (A) are created before the ones in the next level (B, C, D) and 
* the last ones created are the ones of the final level (E, F). 
* 
* Exit messages are printed starting from the leaves that get executed and exit first, followed by their parent
* processes and their parent's parent processes. More specifically, the first exit messages are printed from the
* leaf processes (in some cases C, D) that get executed first according to the initialization messages. Then
* follow the leaves that are executed after (in some cases E, F) and then their fathers, assuming they don't have
* any other active process and waiting for it to exit (B, the father of E and F) and then A, since B, C and D have
* exited).
*/