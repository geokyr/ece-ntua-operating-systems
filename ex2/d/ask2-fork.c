#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>

#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC  5
#define SLEEP_TREE_SEC 	3

void fork_procs(struct tree_node *root, int father[]) {
	
	change_pname(root->name);
	printf("Process (name: %s) with PID: %d is created.\n", root->name, getpid());

	int i, dad, number, temp;
	pid_t pid;

	/* Father processes with children */
	if(root->children) {
		
		int numbers[2];

		/* Create pipe between this process and its children */
		int child[2];
		if (pipe(child) < 0) {
			perror("pipe\n");
			exit(1);
		}

		/* Create children processes */
		for(i = 0; i < 2; i++){
			pid = fork();

			if(pid < 0) {
				perror("fork_procs: fork\n");
				exit(1);
			}
			else if(pid == 0){
				/* Child calls the function recursively with the file descriptors
				for child to parent communication */
				fork_procs(root->children + i, child);
			}
		}

		/* Father */
		for(int i = 0; i < 2; i++) {
			/* Awaits and eventually reads child's value from their pipe */
			if (read(child[0], &temp, sizeof(temp)) != sizeof(temp)) {
				perror("read from pipe\n");
				exit(1);
			}
				
			/* Stores the values of each child into an array for later calculations */
			numbers[i] = temp;
			
			/* If it has read both children's value it can close its read end */
			if(i == 1) {
				close(child[0]);
			}
		}

		/* Check if we should add or multiply children's values and calculate 
		value to be written on father's pipe*/
		if (!strcmp(root->name, "+")) {
			dad = numbers[0] + numbers[1];
		}
		else if(!strcmp(root->name, "*")) {
			dad = numbers[0] * numbers[1];
		}

		/* Write value on father's pipe */
		if (write(father[1], &dad, sizeof(dad)) != sizeof(dad)) {
			perror("write from pipe\n");
			exit(1);
		}
		/* Close the write end, since the value has been written */
		close(father[1]);
		/* Then exit */
		exit(0);		
	}
	
	else {
		/* Close father's pipe read end, since a leaf doesn't use it */
		close(father[0]);

		/* Convert char * to integer and write on father's pipe*/
		number = atoi(root->name);
		if (write(father[1], &number, sizeof(number)) != sizeof(number)) {
			perror("write from pipe\n");
			exit(1);
		}
		/* Close father's pipe write end, since the value has been written */
		close(father[1]);
		/* Then exit */
		exit(0);
	}
}

int main(int argc, char *argv[])
{
	struct tree_node *root;

	pid_t p;
	int answer;

	if (argc != 2) {
		fprintf(stderr, "Usage: %s <input_tree_file>\n", argv[0]);
		exit(1);
	}

	/* Read tree into memory */
	root = get_tree_from_file(argv[1]);

	/* Create pipe between ask2-fork(main) and root process */
	int child[2];
	if (pipe(child) < 0) {
		perror("pipe\n");
		exit(1);
	}
	
	/* Fork root of process tree */
	p = fork();

	if(p < 0) {
		perror("main: fork\n");
		exit(1);
	}
	if(p == 0) {
		/* Child */
		fork_procs(root, child);
		exit(0);
	}

	/* Father */
	/* Close write end, since it only reads the final answer */
	close(child[1]);

	/* Await and eventually read the final answer from the pipe and print it */
	if (read(child[0], &answer, sizeof(answer)) != sizeof(answer)) {
		perror("read from pipe\n");
		exit(1);
	}
	printf("The final value of the expression tree is: %d.\n", answer);

	return 0;
}


/* 1. We used 1 pipe per process with 1 array of file descriptors, that we
* pass down to children processes, so that they always have access to both their
* children's pipe file descriptors and father's pipe file descriptors.
* It works because when a process is forked, its child receives a copy of the 
* process' data, including a copy of its pipes and file descriptors. Therefore, 
* both children have access to the same pipe that enables them to write back to 
* their father process. We were able to make it work with only 1 pipe for both
* children processes, because the order of the father's reads do not affect the
* result of the calculation. Otherwise, a pipe for each child would be needed,
* to be able to manage the order of the reads.
* 
* If subtraction or division were present as operations, our code would not work,
* since these operations are not commutative, and the order of the father's reads
* matters.
* 
* 2. Since we have multiple processors, we can use more than one of them at a time
* to parallelly calculate the values of a tree. This way, the time it takes to
* evaluate the value of the expression is significantly decreased compared to 
* evaluating it with only a processor and sequentially, because more calculations
* are performed per time unit.
*/