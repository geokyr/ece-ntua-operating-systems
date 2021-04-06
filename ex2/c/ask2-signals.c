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

	/* Father */
	/* for ask2-signals */
	/* Waits for root process to be stopped by SIGSTOP */
	wait_for_ready_children(1);
	
	/* for ask2-{fork, tree} */
	/* sleep(SLEEP_TREE_SEC); */

	/* Print the process tree root at pid */
	show_pstree(p);
	
	/* for ask2-signals */
	/* Sends SIGCONT to root process */
	kill(p, SIGCONT);

	/* Wait for the root of the process tree to terminate */
	p = wait(&status);
	explain_wait_status(p, status);

	return 0;
}

/* 1. Using signals enables us to time our commands with a specific order of execution 
* without needing to estimate the time that or other processes need to execute commands,
* or waste seconds just to be sure the orders will not overlap or execute prematurely,
* as is the case with the use of sleep().
* 
* 2. We need the parent process to await for all its child processes to be stopped by a 
* signal SIGSTOP, before continuing with the rest of the code. This can't be tracked by
* the wait() function, since it can't identify when a child has been stopped. We can use
* the waitpid() function with the WUNTRACED flag, so we can get feedback if a child has 
* been stopped. This is, actually, the implementation of wait_for_ready_children() function
* and so it is deemed as necessary, or else a for loop for each child with waitpid() function 
* using the WUNTRACED flag can be used as a substitute, together with explain_wait_status().
* 
* If either of the 2 solutions is not present in the code, parent processes will not be able
* to identify when each of their children have been stopped and will continue with the execution
* of the rest of the program, meaning that show_pstree() might be called too soon, before all
* of the children processes are created and stopped so that there is a frozen frame of the tree
* with every process present.
*/