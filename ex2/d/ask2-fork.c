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

int pfds[50][2];

void forker(struct tree_node *root, int level) {
	
	change_pname(root->name);
	printf("Process (name: %s) with PID: %d is created.\n", root->name, getpid());

	int status, i, dad, number, temp, numbers[root->nr_children];
	pid_t pid;

	if(root->children) {
		
		int pfd[2];
		if (pipe(pfd) < 0) {
			perror("pipe\n");
			exit(1);
		}
		pfds[level + 1][0] = pfd[0];
		pfds[level + 1][1] = pfd[1];

		for(i = 0; i < root->nr_children; i++){
			pid = fork();

			if(pid < 0) {
				perror("forker: fork\n");
				exit(1);
			}
			else if(pid == 0){
				forker(root->children + i, level + 1);
			}

			if (read(pfds[level + 1][0], &temp, sizeof(temp)) != sizeof(temp)) {
				perror("read from pipe\n");
				exit(1);
			}
			numbers[i] = temp;

			if(i == 1) {
				close(pfds[level + 1][0]);
			}
		}

		for(i = 0; i < root->nr_children; i++){
			pid = wait(&status);
			explain_wait_status(pid, status);			
		}

		if (!strcmp(root->name, "+")) {
			dad = numbers[0] + numbers[1];
		}
		else if(!strcmp(root->name, "*")) {
			dad = numbers[0] * numbers[1];
		}

		if (write(pfds[level][1], &dad, sizeof(dad)) != sizeof(dad)) {
			perror("write from pipe\n");
			exit(1);
		}
		close(pfds[level][1]);

		exit(0);		
	}
	
	else {
		close(pfds[level][0]);
		number = atoi(root->name);
		if (write(pfds[level][1], &number, sizeof(number)) != sizeof(number)) {
			perror("write from pipe\n");
			exit(1);
		}
		close(pfds[level][1]);

		exit(0);
	}
}


int main(int argc, char *argv[])
{
	struct tree_node *root;

	pid_t p;
	int status, answer;

	if (argc != 2) {
		fprintf(stderr, "Usage: %s <input_tree_file>\n", argv[0]);
		exit(1);
	}

	root = get_tree_from_file(argv[1]);

	int pfd[2];
	if (pipe(pfd) < 0) {
		perror("pipe\n");
		exit(1);
	}
	pfds[0][0] = pfd[0];
	pfds[0][1] = pfd[1];

	p = fork();

	if(p < 0) {
		perror("main: fork\n");
		exit(1);
	}
	if(p == 0) {
		forker(root, 0);
		exit(0);
	}

	p = wait(&status);
	explain_wait_status(p, status);

	if (read(pfds[0][0], &answer, sizeof(answer)) != sizeof(answer)) {
		perror("read from pipe\n");
		exit(1);
	}
	printf("The final value of the expression tree is: %d.\n", answer);

	return 0;
}