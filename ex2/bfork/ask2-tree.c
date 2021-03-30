#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC  10

int main(int argc, char *argv[])
{
	struct tree_node *root;

	if (argc != 2) {
		fprintf(stderr, "Usage: %s <input_tree_file>\n\n", argv[0]);
		exit(1);
	}

	root = get_tree_from_file(argv[1]);
	print_tree(root);
	
	return 0;
}

pid_t fork_builder(struct tree_node *root) {
	pid_t pid;
	
	pid = fork();
	if (pid < 0) {
		fprintf(stderr, "fork error at %s", root->name);
		exit(1);
	}
	if (pid == 0) {
		change_pname(root->name);
		printf
		if(root->nr_children) {
			int i;
			pid_t pidi;
			int statusi[i];
			for (i = 0; i < root->nr_children; i++) {
				pidi = fork_builder(root->children + i);
				pidi = wait(&statusi[i]);
			}
		}
		else {
			sleep(SLEEP_PROC_SEC);
			exit(1);
		}

		return pid;
	}

	return pid;
}
