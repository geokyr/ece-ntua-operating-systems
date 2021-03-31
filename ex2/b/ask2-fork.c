#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC  5
#define SLEEP_TREE_SEC  3

void forker(struct tree_node *root) {
	
	pid_t pid;
	
	change_pname(root->name);
	sleep(1);							//to delay new level from creating processes before all children from current level are made
	if(!root->children) {
		sleep(SLEEP_PROC_SEC);
		kill(getpid(), SIGSTOP);
	}

	else {
		for(int i = 0; i < root->nr_children; i++){
			pid = fork();
	
			if(pid < 0) {
				perror("forker: fork");
				exit(1);
			}
			if(pid == 0){
				forker(root->children + i);
			}
			printf("%s is initializing with PID: %ld and Parent PID: %ld \n", (root->children + i)->name, (long) pid, (long) getpid());
		}

		wait_for_ready_children(root->nr_children);
		kill(getpid(), SIGSTOP);
	}
}

int main(int argc, char *argv[])
{
	struct tree_node *root;

	if (argc != 2) {
		fprintf(stderr, "Usage: %s <input_tree_file>\n\n", argv[0]);
		exit(1);
	}

	root = get_tree_from_file(argv[1]);
	print_tree(root);


	pid_t p;

	p = fork();

	if(p < 0) {
		perror("main: fork");
		exit(1);
	}
	if(p == 0) {
		change_pname(root->name);
		forker(root);
		kill(getpid(), SIGSTOP);
	}
	
	printf("%s is initializing with PID: %ld and Parent PID: %ld \n", root->name, (long) p, (long) getpid());

	sleep(SLEEP_TREE_SEC);

	show_pstree(p);
	
	wait_for_ready_children(1);

	return 0;
}


/* 1. With sleep(1) included, initialization messages are printed by breadth, meaning that all processes 
* of current level (A) print the initialization message before the ones in the next level (B, C, D) and 
* the final initialization messages are the ones of the final level (E, F). 
* 
* Exit messages have a similar principle. More specifically, the first exit messages are printed from the 
* lowest level leaf processes (C, D), then the leafs of the higher level (E, F). Afterwards, B, the 
* father of E and F, exits through the wait_for_ready_children() function. Finally, A, whose all children
* processes are terminated, exits in a similar way.
*
* If sleep(1) is not included, the forks and kills(exits) still execute in a similar order, however, because
* of the fact that these calls are really close to each other, and that functions like forker are run in a
* parallel manner, the exact "breadth first" order is not followed, oppossed to above. Some messages can be
* swapped, as a forker function of a deeper level makes a fork earlier than the forking of the 2nd child in
* the previous level, etc.
*/