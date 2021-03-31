#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "proc-common.h"

#define SLEEP_PROC_SEC  10
#define SLEEP_TREE_SEC  3

/*
 * Create this process tree:
 * A-+-B---D
 *   `-C
 */
void fork_procs(void)
{
	/*
	 * initial process is A.
	 */
	printf("A: Initiating...\n");
	change_pname("A");

	/* ... */

	pid_t pidB, pidC, pidD;
	int status;

	//child B
	pidB = fork();

	if(pidB < 0) {
		perror("fork_procs: forkB");
		exit(1);
	}
	if(pidB == 0) {
		printf("B: Initiating...\n");
		change_pname("B");

		//child D
		pidD = fork();

		if(pidD < 0) {
			perror("fork_procs: forkD");
			exit(1);
		}
		if(pidD == 0) {
			printf("D: Initiating...\n");
			change_pname("D");
			printf("D: Sleeping...\n");
			sleep(SLEEP_PROC_SEC);
			printf("D: Exiting...\n");
			exit(13);
		}

		printf("B: Waiting...\n");
		pidD = wait(&status);
		explain_wait_status(pidD, status);
		printf("B: Exiting...\n");
		exit(19);
	}

	//child C
	pidC = fork();

	if(pidC < 0) {
		perror("fork_procs: forkC");
		exit(1);
	}
	if(pidC == 0) {
		printf("C: Initiating...\n");
		change_pname("C");
		printf("C: Sleeping...\n");
		sleep(SLEEP_PROC_SEC);
		printf("C: Exiting...\n");
		exit(17);
	}

	printf("A: Waiting...\n");
	pidC = wait(&status);
	explain_wait_status(pidC, status);

	pidB = wait(&status);
	explain_wait_status(pidB, status);

	/* ... */

	printf("A: Exiting...\n");
	exit(16);
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
int main(void)
{
	pid_t pid;
	int status;

	/* Fork root of process tree */
	pid = fork();
	if (pid < 0) {
		perror("main: fork");
		exit(1);
	}
	if (pid == 0) {
		/* Child */
		fork_procs();
		exit(1);
	}

	/*
	 * Father
	 */
	/* for ask2-signals */
	/* wait_for_ready_children(1); */

	/* for ask2-{fork, tree} */
	sleep(SLEEP_TREE_SEC);

	/* Print the process tree root at pid */
	show_pstree(getpid());

	/* for ask2-signals */
	/* kill(pid, SIGCONT); */

	/* Wait for the root of the process tree to terminate */
	pid = wait(&status);
	explain_wait_status(pid, status);



	return 0;
}


/* 1. Exit message "terminated by a signal" then B, C, D exit as well but only
 * D produces exit message "terminated normally", since orphaned processes B, C 
 * are adopted by init (PID = 1) which performs the waiting system until the orphaned
 * processes terminate. Since return 0 is run after A being killed, before B, C, D 
 * exit, the program exits the prompt and exit messages for B, C, D are written on the
 * next line leaving the prompt running. One solution to this could be adding a 
 * sleep(SLEEP_PROC_SEC) before the return 0 command, so that exit messages for 
 * B, C, D are printed on the prompt before it exits.
 * 
 * 2. Processes ask2-fork (root), sh (child) and pstree (grandchild) also appear on the 
 * tree as a second branch with the first branch being the previous one (using pid instead 
 * of getpid()) with processes A, B, C, D. This is because the function system within
 * show_pstree uses fork to create a child process that executes the command created 
 * with sprintf (including pstree). 
 *
 * 3. Running out of memory, prevent fork bombs, not recycling PIDs (wrap) causing loss of 
 * current processes.
 */