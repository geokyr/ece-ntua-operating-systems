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

pid_t p;

void forker(struct tree_node *root) {
	
	printf("Process (name: %s) with PID: %d is created \n", root->name, getpid());

	int status, i, dad, number, temp, numbers[root->nr_children];
	pid_t pid;

	int pfd[2];
	if (pipe(pfd) < 0) {
		perror("pipe");
		exit(1);
	}
	
	for(i = 0; i < root->nr_children; i++){
				
		pid = fork();

		if(pid < 0) {
			perror("forker: fork");
			exit(1);
		}
		else if(pid == 0){
			if((root->children + i)->children) {
				forker(root->children + i);
			}
			else {
				number = strtol(((root->children + i)->name), (char **)NULL, 10);
				printf("number: %d \n", number);
				if (write(pfd[1], &number, sizeof(number)) != sizeof(number)) {
					perror("write from pipe \n");
					exit(1);
				}
				exit(0);
			}
		}

		pid = wait(&status);
		explain_wait_status(pid, status);

		if (read(pfd[0], &temp, sizeof(temp)) != sizeof(temp)) {
			perror("read from pipe");
			exit(1);
		}
		printf("temp: %d \n", temp);
		numbers[i] = temp;
	}

	if(!strcmp(root->name, "+")) {
		dad = numbers[0] + numbers[1];
	}
	else if(!strcmp(root->name, "*")) {
		dad = numbers[0] * numbers[1];
	}

	if (write(pfd[1], &dad, sizeof(dad)) != sizeof(dad)) {
		perror("write from pipe");
		exit(1);
	}
	
	printf("Value: %d. \n", dad);

	if(getpid() == p) {
		printf("Final value: %d. \n", dad);
	}

	printf("PID: %d is exiting. \n", getpid());
	exit(0);		

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

	p = fork();

	if(p < 0) {
		perror("main: fork");
		exit(1);
	}
	if(p == 0) {
		forker(root);
		exit(0);
	}

	sleep(SLEEP_TREE_SEC);

	show_pstree(p);

	p = wait(&status);
	explain_wait_status(p, status);

	return 0;
}