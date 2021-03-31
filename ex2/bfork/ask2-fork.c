#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC  10

void fork_builder(struct tree_node *root) {
	pid_t pid;
	int status[root->nr_children];
	
	pid = fork();
	printf("root name %s, mypid %ld, childpid %ld\n", root->name, (long)getpid(), (long)pid);

	if (pid < 0) {
		fprintf(stderr, "fork error at %s", root->name);
		exit(1);
	}
	if (pid == 0) {
		change_pname(root->name);
		if(root->nr_children) {
			for (int i = 0; i < root->nr_children; i++) {
				fork_builder(root->children + i);
			}
		}
		else {
			//sleep(SLEEP_PROC_SEC);
			exit(1);
		}
	}
	else {
		for (int i = 0; i < root->nr_children; i++) {
			pid = wait(&status[i]);
		}
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
	fork_builder(root);
	
	return 0;
}
