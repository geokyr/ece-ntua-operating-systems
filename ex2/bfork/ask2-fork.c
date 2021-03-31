#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC  10
#define SLEEP_TREE_SEC  3

void forker(struct tree_node *root) {
	
	pid_t pid;
	
	change_pname(root->name);

	if(root->children){
		
		for(int i = 0; i < root->nr_children; i++){
			pid = fork();
			
			if(pid < 0) {
				perror("forker: fork");
				exit(1);
			}
			if(pid == 0){
				forker(root->children + i);
			}
		}

		wait_for_ready_children(root->nr_children);
		kill(getpid(), SIGSTOP);
	}
	else {
		sleep(SLEEP_PROC_SEC);
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
	
	sleep(SLEEP_TREE_SEC);

	show_pstree(p);
	
	wait_for_ready_children(1);

	return 0;
}
