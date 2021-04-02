#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

void fork_procs(struct tree_node *root)
{
	change_pname(root->name);
	printf("PID = %ld, name = %s is initializing\n", (long)getpid(), root->name);
	
	
	if(root->children) {
		pid_t pid[root->nr_children];
		int i;

		for(i = 0; i < root->nr_children; i++){
			pid[i] = fork();
	
			if(pid[i] < 0) {
				perror("forker: fork");
				exit(1);
			}
			if(pid[i] == 0){
				fork_procs(root->children + i);
			}
			
		}

		wait_for_ready_children(root->nr_children);
		raise(SIGSTOP);
		
		printf("PID = %ld, name = %s is awake\n", (long)getpid(), root->name);
		
		int status;
		for(i = 0; i < root->nr_children; i++){
			kill(pid[i], SIGCONT);
			pid[i] = wait(&status);
			explain_wait_status(pid[i], status);
		}
		exit(0);
	}

	else {

		raise(SIGSTOP);
				
		printf("PID = %ld, name = %s is awake\n", (long)getpid(), root->name);
		exit(0);
	}
}

/*
 * The initial process forks the root of the process tree,
 * waits for the process tree to be completely created,
 * then takes a photo of it using show_pstree().
 *
 * How to wait for the process tree to be ready?
 * In ask2-{fork, tree}:
 *      wait for a few seconds, hope for the best.
 * In ask2-signals:
 *      use wait_for_ready_children() to wait until
 *      the first process raises SIGSTOP.
 */

int main(int argc, char *argv[])
{
	pid_t p;
	int status;
	struct tree_node *root;

	if (argc < 2){
		fprintf(stderr, "Usage: %s <tree_file>\n", argv[0]);
		exit(1);
	}

	/* Read tree into memory */
	root = get_tree_from_file(argv[1]);
	/* Fork root of process tree */
	p = fork();
	if (p < 0) {
		perror("main: fork");
		exit(1);
	}
	if (p == 0) {
		/* Child */
		fork_procs(root);
		exit(1);
	}

	/*
	 * Father
	 */
	/* for ask2-signals */
	wait_for_ready_children(1);
	
	/* for ask2-{fork, tree} */
	/* sleep(SLEEP_TREE_SEC); */

	/* Print the process tree root at pid */
	show_pstree(p);
	
	/* for ask2-signals */
	kill(p, SIGCONT);

	/* Wait for the root of the process tree to terminate */
	p = wait(&status);
	explain_wait_status(p, status);

	return 0;
}

/* 
* 
*/